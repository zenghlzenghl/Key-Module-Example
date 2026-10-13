/********************************** (C) COPYRIGHT *******************************
* File Name          : remote.c
* Author             : 本工程
* Description        : 红外(NEC 38k) + 无线(433M EV1527) 遥控解码
*                      ===== 原理 =====
*                      T0(8bit 自动重载, 50us/tick) 中断里仅做"电平沿捕获":
*                      每 tick 采样 IR(P1.5)/RF(P1.4) 两脚, 电平翻转时把
*                      (电平, 持续us) 打包为 uint16 推入各自环形队列
*                      (bit15=电平, bit14..0=宽度us, 上限 32767us 饱和)。
*                      主循环 Remote_Poll() 消费队列:
*                       - NEC: 流式状态机(引导低 9ms -> 高 4.5/2.25ms ->
*                         32 位 LSB-first 数据位, 0=562us高 / 1=1687us高);
*                       - EV1527: 帧式(同步 31T 长段估 T, 24bit=20位地址
*                         +4 位按键, 每 bit 高低宽比 3:1 判 1 / 1:3 判 0,
*                         起点偏移/极性自动试配, 兼容常见 1527 变体)。
*                      成功解码即经 USB-CDC 主动上报一行; 查询命令 "rx"
*                      打印最近结果(见 usbapp.c)。
*                      ===== 资源约束 =====
*                      1) 内部 RAM 紧张(data 至 0x72 满, overlay 区 19B):
*                         函数"零/极少局部、零参数", 数据经模块级 __xdata
*                         工作区传递(中断树同), 避免撑爆 data/OSEG;
*                      2) ROM 紧张(CODE_SIZE 0x3800): 全部位收集用字节数组
*                         (免 32 位移位/乘除库), 区间校验用移位近似,
*                         使本模块不引入任何 mul/div 库代码。
*******************************************************************************/
#include <stdint.h>

#include <ch554.h>
#include <debug.h>                   /* mDelaymS: 上报等待用 */
#include <usbcdc.h>
#include <remote.h>

/* ==================== 输入引脚(可按硬件改) ====================
   P1.5: 红外接收头 OUT(38k 反相输出: 空闲高, 有载波拉低)
   P1.4: 433M 接收模块 DATA(超外差/超再生, 空闲低) */
#define RC_IR_BIT   0x20             /* P1.5 */
#define RC_RF_BIT   0x10             /* P1.4 */

/* ==================== T0 采样 ==================== */
#define RC_TICK_US   50u             /* 采样周期 us (T0 8bit 自动重载, Fsys/12) */
#define RC_SEG_MASK  0x7FFF          /* 段宽位掩码(0..32767us 饱和) */
#define RC_SEG_MSK_L 0x8000          /* 段电平位: 1=高 */

#define RC_SEG_US(s)  ((s) & RC_SEG_MASK)
#define RC_SEG_HI(s)  (((s) & RC_SEG_MSK_L) ? 1 : 0)

#define IRQ_N   32                   /* IR 队列(流式, ~4 段/ms) */
#define RFQ_N   56                   /* RF 队列(整帧 ~50 段) */

/* ---- 中断(写) / 主循环(读) 共享 ---- */
static volatile __xdata uint8_t   irWr, irRd;
static volatile __xdata uint8_t   rfWr, rfRd;
static volatile __xdata uint16_t  irWid, rfWid;   /* 当前同电平持续 us */
static volatile __xdata uint8_t   irLvl, rfLvl;
static volatile __xdata uint8_t   irOvf, rfOvf;
static __xdata uint16_t IrQ[IRQ_N];
static __xdata uint16_t RfQ[RFQ_N];

/* ---- ISR 零局部: 临时量(中断树, 不 overlay) ---- */
static __xdata uint8_t rIsrNow, rIsrNxt;

/*******************************************************************************
* Function Name  : Remote_TimerTick
* Description    : T0 50us 采样中断主体(仅 main.c 的 T0 ISR 调用)。
*                  电平不变仅累宽, 翻转则打包上一段入队(满则丢帧标记)。
*******************************************************************************/
void Remote_TimerTick(void)
{
    /* ---- IR 路 ---- */
    rIsrNow = ( P1 & RC_IR_BIT ) ? 1 : 0;
    if ( rIsrNow == irLvl )
    {
        if ( irWid < RC_SEG_MASK ) irWid += RC_TICK_US;
    }
    else
    {
        rIsrNxt = ( uint8_t )( irWr + 1 );
        if ( rIsrNxt >= IRQ_N ) rIsrNxt = 0;
        if ( rIsrNxt == irRd ) irOvf = 1;
        else
        {
            IrQ[irWr] = ( uint16_t )( ( irLvl ? RC_SEG_MSK_L : 0u ) | irWid );
            irWr = rIsrNxt;
        }
        irLvl = rIsrNow;
        irWid = RC_TICK_US;
    }

    /* ---- RF 路 ---- */
    rIsrNow = ( P1 & RC_RF_BIT ) ? 1 : 0;
    if ( rIsrNow == rfLvl )
    {
        if ( rfWid < RC_SEG_MASK ) rfWid += RC_TICK_US;
    }
    else
    {
        rIsrNxt = ( uint8_t )( rfWr + 1 );
        if ( rIsrNxt >= RFQ_N ) rIsrNxt = 0;
        if ( rIsrNxt == rfRd ) rfOvf = 1;
        else
        {
            RfQ[rfWr] = ( uint16_t )( ( rfLvl ? RC_SEG_MSK_L : 0u ) | rfWid );
            rfWr = rIsrNxt;
        }
        rfLvl = rIsrNow;
        rfWid = RC_TICK_US;
    }
}

/* ==================== 上报工具(USB-CDC, 主循环上下文) ==================== */
static __xdata uint8_t RcOutBuf[48];        /* 输出行(<64B 单包) */
static __xdata uint8_t rcOutLen;
static __xdata uint8_t rcOutP;
static __xdata uint8_t rcTxWait;

static void rc_tx(void)                     /* 发送 RcOutBuf[0..rcOutLen) */
{
    if ( !UsbCdc_IsConfigured() ) return;
    for ( rcTxWait = 0; rcTxWait < 10 && !UsbCdc_TxReady(); rcTxWait++ )
    {
        mDelaymS( 1 );                      /* 最多 ~10ms, 勿长阻塞主循环 */
    }
    if ( UsbCdc_TxReady() ) UsbCdc_TxSend( RcOutBuf, rcOutLen );
}

/* 半字节 -> hex 字符(单函数比宏展开省 ROM) */
static uint8_t rc_hex(uint8_t v)
{
    v &= 0x0F;
    if ( v < 10 ) return ( uint8_t )( v + '0' );
    return ( uint8_t )( v - 10 + 'A' );
}

/* ==================== IR: NEC 解码(流式状态机) ====================
   接收头输出空闲高。帧: [低 9ms 引导][高 4.5ms]
       数据帧: 32 位(LSB 先), 每 bit = [低 562us][高 562us(0)|1687us(1)]
       重复帧: 引导高 2.25ms(无数据); 单位 us, 容差从宽 */
#define NEC_LEAD_LO_MIN  7200u
#define NEC_LEAD_LO_MAX  10800u
#define NEC_REP_HI_MIN   1800u
#define NEC_REP_HI_MAX   2700u
#define NEC_DATA_HI_MIN  3600u
#define NEC_DATA_HI_MAX  5400u
#define NEC_BIT_LO_MIN   380u
#define NEC_BIT_LO_MAX   800u
#define NEC_BIT0_HI_MAX  1050u
#define NEC_BIT1_HI_MIN  1150u
#define NEC_BIT1_HI_MAX  2400u

#define NEC_ST_IDLE    0
#define NEC_ST_LEADHI  1
#define NEC_ST_BITLO   2
#define NEC_ST_BITHI   3

static __xdata uint8_t  necState = NEC_ST_IDLE;
static __xdata uint8_t  necBits;
static __xdata uint8_t  necByte[4];         /* 32 位码(LSB 先; [0]=地址 [2]=命令) */
static __xdata uint8_t  necLastA, necLastC;
static __xdata uint8_t  necHaveLast, necRepLast;
static __xdata uint16_t necSeg;             /* 当前段(喂入) */

static void nec_send_frame(void)
{
    necLastA = necByte[0];
    necLastC = necByte[2];
    necHaveLast = 1;
    necRepLast = 0;
    rcOutP = 0;
    RcOutBuf[rcOutP++] = 'i'; RcOutBuf[rcOutP++] = 'r';
    RcOutBuf[rcOutP++] = ' '; RcOutBuf[rcOutP++] = 'a'; RcOutBuf[rcOutP++] = '=';
    RcOutBuf[rcOutP++] = rc_hex( necLastA >> 4 );
    RcOutBuf[rcOutP++] = rc_hex( necLastA );
    RcOutBuf[rcOutP++] = ' '; RcOutBuf[rcOutP++] = 'c'; RcOutBuf[rcOutP++] = '=';
    RcOutBuf[rcOutP++] = rc_hex( necLastC >> 4 );
    RcOutBuf[rcOutP++] = rc_hex( necLastC );
    RcOutBuf[rcOutP++] = '\r'; RcOutBuf[rcOutP++] = '\n';
    rcOutLen = rcOutP;
    rc_tx();
}

static void nec_send_rep(void)
{
    static __code uint8_t repStr[] = "ir rep\r\n";
    uint8_t i;
    necRepLast = 1;
    rcOutLen = 0;
    for ( i = 0; i < sizeof( repStr ) - 1; i++ )
    {
        RcOutBuf[rcOutLen++] = repStr[i];
    }
    rc_tx();
}

static void nec_feed(void)
{
    uint8_t  hi = RC_SEG_HI( necSeg );
    uint16_t us = RC_SEG_US( necSeg );

    switch ( necState )
    {
    case NEC_ST_IDLE:                            /* 空闲: 找引导低 9ms */
        if ( !hi && us >= NEC_LEAD_LO_MIN && us <= NEC_LEAD_LO_MAX )
        {
            necBits = 0;
            necByte[0] = 0; necByte[1] = 0; necByte[2] = 0; necByte[3] = 0;
            necState = NEC_ST_LEADHI;
        }
        break;

    case NEC_ST_LEADHI:                          /* 引导后高: 2.25ms=重复 / 4.5ms=数据 */
        if ( hi )
        {
            if ( us >= NEC_REP_HI_MIN && us <= NEC_REP_HI_MAX )
            {
                nec_send_rep();
                necState = NEC_ST_IDLE;
            }
            else if ( us >= NEC_DATA_HI_MIN && us <= NEC_DATA_HI_MAX )
            {
                necState = NEC_ST_BITLO;
            }
            else necState = NEC_ST_IDLE;
        }
        else necState = NEC_ST_IDLE;
        break;

    case NEC_ST_BITLO:                           /* 位起始低段 ~562us */
        if ( !hi && us >= NEC_BIT_LO_MIN && us <= NEC_BIT_LO_MAX )
            necState = NEC_ST_BITHI;
        else
            necState = NEC_ST_IDLE;
        break;

    case NEC_ST_BITHI:                           /* 位判定: 高段宽度 */
        if ( hi )
        {
            if ( us >= NEC_BIT1_HI_MIN && us <= NEC_BIT1_HI_MAX )
            {
                necByte[necBits >> 3] |= ( uint8_t )( 1u << ( necBits & 7 ) );
            }
            else if ( us > NEC_BIT0_HI_MAX )     /* 高但宽度异常 */
            {
                necState = NEC_ST_IDLE;
                break;
            }
            necBits++;
            if ( necBits >= 32 )
            {
                nec_send_frame();
                necState = NEC_ST_IDLE;
            }
            else necState = NEC_ST_BITLO;
        }
        else necState = NEC_ST_IDLE;
        break;
    }
}

/* ==================== RF: EV1527 解码(帧式) ====================
   帧 = 同步 + 24 bit(地址 20 + 按键 4); 同步为超长电平(~31T, 7~15ms),
   数据段 1T~3T。 解码: 同步宽>>5 估 T(≈/32, 免除法库); 每 bit 两段:
   段宽∈[T/4,5T]、两段和∈[2T,5T] 过滤后按高:低比判位(高>=1.5低 为 1,
   低>=1.5高 为 0, 兼容 3T:1T/2T:1T 变体); 同步尾段位置与整帧极性未知,
   起点偏移 0/1 × 极性 0/1 组合试配。 全部校验用移位/加法, 无乘除库。 */
#define RF_SYNC_MIN_US  4200u
#define RF_T_MIN        230u
#define RF_T_MAX        700u
#define RF_BITS         24u

static __xdata uint16_t rfUnit;             /* 单位 T us */
static __xdata uint8_t  rfByte[3];          /* 24 位码(LSB 先: [0] 地址低8..) */
static __xdata uint8_t  rfLastB[3];         /* 最近地址 20bit */
static __xdata uint8_t  rfLastKey;
static __xdata uint8_t  rfHaveLast;
static __xdata uint16_t rfSegA, rfSegB;
static __xdata uint16_t rfHiW, rfLoW;
static __xdata uint16_t rfSum;
static __xdata uint16_t rfSyncSeg;
static __xdata uint8_t  rfSIdx, rfOff, rfInv;
static __xdata uint8_t  rfTotal, rfS, rfB, rfHiA;
static __xdata uint8_t  rfN, rfI, rfIdx;

static void rf_seg_fetch(void)              /* RfQ[rfRd+rfIdx] -> rfSegA */
{
    rfIdx = ( uint8_t )( rfRd + rfIdx );
    if ( rfIdx >= RFQ_N ) rfIdx = ( uint8_t )( rfIdx - RFQ_N );
    rfSegA = RfQ[rfIdx];
}

static void rf_try_decode(void)             /* 参数: rfSIdx/rfOff/rfInv/rfTotal */
{
    uint8_t bitSet;

    rfS = ( uint8_t )( rfSIdx + 1 + rfOff );
    if ( ( uint8_t )( rfS + 2 * RF_BITS ) > rfTotal )
    {
        rfN = 0;
        return;
    }
    for ( rfB = 0; rfB < RF_BITS; rfB++ )
    {
        rfIdx = ( uint8_t )( rfS + 2 * rfB );
        rf_seg_fetch();
        rfSegB = rfSegA;
        rfIdx = ( uint8_t )( rfS + 2 * rfB + 1 );
        rf_seg_fetch();
        rfSegA = rfSegB;                    /* segA=第一段 */
        rfHiA = RC_SEG_HI( rfSegA );
        rfSegA &= RC_SEG_MASK;
        rfSegB &= RC_SEG_MASK;

        /* 段宽范围 [T/4, 5T] */
        if ( rfSegA < ( uint16_t )( rfUnit >> 2 ) ||
             rfSegA > ( uint16_t )( ( rfUnit << 2 ) + rfUnit ) ||
             rfSegB < ( uint16_t )( rfUnit >> 2 ) ||
             rfSegB > ( uint16_t )( ( rfUnit << 2 ) + rfUnit ) )
        {
            rfN = 0;
            return;
        }
        /* 两段和 [2T, 5T] */
        rfSum = ( uint16_t )( rfSegA + rfSegB );
        if ( rfSum < ( uint16_t )( rfUnit << 1 ) ||
             rfSum > ( uint16_t )( ( rfUnit << 2 ) + rfUnit ) )
        {
            rfN = 0;
            return;
        }
        if ( rfHiA ) { rfHiW = rfSegA; rfLoW = rfSegB; }
        else         { rfHiW = rfSegB; rfLoW = rfSegA; }

        /* 高:低 >= 3:2 判 1; 高:低 <= 2:3 判 0 (比较化为加法/移位) */
        bitSet = 0;
        if ( rfHiW >= ( uint16_t )( rfLoW + ( rfLoW >> 1 ) ) ) bitSet = 1;
        else if ( rfLoW < ( uint16_t )( rfHiW + ( rfHiW >> 1 ) ) )
        {
            rfN = 0;                        /* 接近 1:1, 非 1527 数据 */
            return;
        }
        if ( rfInv ) bitSet = ( uint8_t )( 1 - bitSet );
        if ( bitSet ) rfByte[rfB >> 3] |= ( uint8_t )( 1u << ( rfB & 7 ) );
    }
    rfN = 1;
}

static void rf_send_frame(void)
{
    rfLastB[0] = rfByte[0];
    rfLastB[1] = rfByte[1];
    rfLastB[2] = rfByte[2];
    rfLastKey = ( uint8_t )( rfByte[2] >> 4 );
    rfHaveLast = 1;
    rcOutP = 0;
    RcOutBuf[rcOutP++] = 'r'; RcOutBuf[rcOutP++] = 'f';
    RcOutBuf[rcOutP++] = ' '; RcOutBuf[rcOutP++] = 'i'; RcOutBuf[rcOutP++] = 'd';
    RcOutBuf[rcOutP++] = '='; RcOutBuf[rcOutP++] = '0'; RcOutBuf[rcOutP++] = 'x';
    RcOutBuf[rcOutP++] = rc_hex( ( uint8_t )( rfByte[2] & 0x0F ) );
    RcOutBuf[rcOutP++] = rc_hex( ( uint8_t )( rfByte[1] >> 4 ) );
    RcOutBuf[rcOutP++] = rc_hex( rfByte[1] );
    RcOutBuf[rcOutP++] = rc_hex( ( uint8_t )( rfByte[0] >> 4 ) );
    RcOutBuf[rcOutP++] = rc_hex( rfByte[0] );
    RcOutBuf[rcOutP++] = ' '; RcOutBuf[rcOutP++] = 'k'; RcOutBuf[rcOutP++] = '=';
    RcOutBuf[rcOutP++] = rc_hex( rfLastKey );
    RcOutBuf[rcOutP++] = '\r'; RcOutBuf[rcOutP++] = '\n';
    rcOutLen = rcOutP;
    rc_tx();
}

static void rf_poll_window(void)            /* 找同步长段后组合试配 */
{
    if ( rfOvf )
    {
        rfRd = rfWr;
        rfOvf = 0;
        return;
    }
    rfN = ( uint8_t )( rfWr - rfRd );
    if ( rfN == 0 ) return;

    rfSIdx = 0xFF;
    rfSyncSeg = 0;
    for ( rfI = 0; rfI < rfN; rfI++ )
    {
        rfIdx = rfI;
        rf_seg_fetch();
        if ( RC_SEG_US( rfSegA ) > RF_SYNC_MIN_US )
        {
            rfSIdx = rfI;
            rfSyncSeg = rfSegA;
        }
    }
    if ( rfSIdx == 0xFF ) return;
    if ( ( uint8_t )( rfSIdx + 1 + 2 * RF_BITS ) > rfN ) return;

    rfUnit = ( uint16_t )( RC_SEG_US( rfSyncSeg ) >> 5 );   /* ~/32 */
    if ( rfUnit < RF_T_MIN || rfUnit > RF_T_MAX )
    {
        rfRd = rfWr;
        return;
    }
    rfTotal = rfN;
    for ( rfOff = 0; rfOff < 2; rfOff++ )
    {
        for ( rfInv = 0; rfInv < 2; rfInv++ )
        {
            rfByte[0] = 0; rfByte[1] = 0; rfByte[2] = 0;
            rf_try_decode();
            if ( rfN == 1 )
            {
                rf_send_frame();
                rfRd = rfWr;
                return;
            }
        }
    }
    rfRd = rfWr;                            /* 试配失败: 放弃本窗(连发下帧即来) */
}

/* ==================== 轮询入口(主循环每轮调用) ==================== */
void Remote_Poll(void)
{
    if ( irOvf )
    {
        irRd = irWr;
        irOvf = 0;
    }
    while ( irRd != irWr )
    {
        necSeg = IrQ[irRd];
        irRd++;
        if ( irRd >= IRQ_N ) irRd = 0;
        nec_feed();
    }

    rf_poll_window();
}

/*******************************************************************************
* Function Name  : Remote_ReportStatus
* Description    : "rx" 命令: 打印最近 IR/RF 解码结果(无则 none)
*******************************************************************************/
void Remote_ReportStatus(void)
{
    if ( necHaveLast )
    {
        rcOutP = 0;
        RcOutBuf[rcOutP++] = 'r'; RcOutBuf[rcOutP++] = 'x';
        RcOutBuf[rcOutP++] = ' ';
        RcOutBuf[rcOutP++] = 'i'; RcOutBuf[rcOutP++] = 'r'; RcOutBuf[rcOutP++] = ':';
        RcOutBuf[rcOutP++] = ' ';
        if ( necRepLast )
        {
            RcOutBuf[rcOutP++] = 'r'; RcOutBuf[rcOutP++] = 'e'; RcOutBuf[rcOutP++] = 'p';
        }
        else
        {
            RcOutBuf[rcOutP++] = 'a'; RcOutBuf[rcOutP++] = '='; RcOutBuf[rcOutP++] = '0';
            RcOutBuf[rcOutP++] = 'x';
            RcOutBuf[rcOutP++] = rc_hex( necLastA >> 4 );
            RcOutBuf[rcOutP++] = rc_hex( necLastA );
            RcOutBuf[rcOutP++] = ' '; RcOutBuf[rcOutP++] = 'c'; RcOutBuf[rcOutP++] = '=';
            RcOutBuf[rcOutP++] = '0'; RcOutBuf[rcOutP++] = 'x';
            RcOutBuf[rcOutP++] = rc_hex( necLastC >> 4 );
            RcOutBuf[rcOutP++] = rc_hex( necLastC );
        }
        RcOutBuf[rcOutP++] = '\r'; RcOutBuf[rcOutP++] = '\n';
        rcOutLen = rcOutP;
        rc_tx();
    }
    else
    {
        static __code uint8_t noneStr[] = "rx ir: none\r\n";
        uint8_t i;
        rcOutLen = 0;
        for ( i = 0; i < sizeof( noneStr ) - 1; i++ )
        {
            RcOutBuf[rcOutLen++] = noneStr[i];
        }
        rc_tx();
    }

    if ( rfHaveLast )
    {
        rcOutP = 0;
        RcOutBuf[rcOutP++] = 'r'; RcOutBuf[rcOutP++] = 'x';
        RcOutBuf[rcOutP++] = ' ';
        RcOutBuf[rcOutP++] = 'r'; RcOutBuf[rcOutP++] = 'f'; RcOutBuf[rcOutP++] = ':';
        RcOutBuf[rcOutP++] = ' ';
        RcOutBuf[rcOutP++] = 'i'; RcOutBuf[rcOutP++] = 'd'; RcOutBuf[rcOutP++] = '=';
        RcOutBuf[rcOutP++] = '0'; RcOutBuf[rcOutP++] = 'x';
        RcOutBuf[rcOutP++] = rc_hex( ( uint8_t )( rfLastB[2] & 0x0F ) );
        RcOutBuf[rcOutP++] = rc_hex( ( uint8_t )( rfLastB[1] >> 4 ) );
        RcOutBuf[rcOutP++] = rc_hex( rfLastB[1] );
        RcOutBuf[rcOutP++] = rc_hex( ( uint8_t )( rfLastB[0] >> 4 ) );
        RcOutBuf[rcOutP++] = rc_hex( rfLastB[0] );
        RcOutBuf[rcOutP++] = ' '; RcOutBuf[rcOutP++] = 'k'; RcOutBuf[rcOutP++] = '=';
        RcOutBuf[rcOutP++] = '0'; RcOutBuf[rcOutP++] = 'x';
        RcOutBuf[rcOutP++] = rc_hex( rfLastKey );
        RcOutBuf[rcOutP++] = '\r'; RcOutBuf[rcOutP++] = '\n';
        rcOutLen = rcOutP;
        rc_tx();
    }
    else
    {
        static __code uint8_t noneStr2[] = "rx rf: none\r\n";
        uint8_t i;
        rcOutLen = 0;
        for ( i = 0; i < sizeof( noneStr2 ) - 1; i++ )
        {
            RcOutBuf[rcOutLen++] = noneStr2[i];
        }
        rc_tx();
    }
}

/*******************************************************************************
* Function Name  : Remote_Init
* Description    : 输入引脚采用默认准双向(弱上拉)即可; 配置并启动 T0
*                  (8bit 自动重载, 50us tick)。 须在 UsbCdc_Init()(EA=1) 后调用。
*******************************************************************************/
void Remote_Init(void)
{
    irLvl = ( P1 & RC_IR_BIT ) ? 1 : 0;
    rfLvl = ( P1 & RC_RF_BIT ) ? 1 : 0;
    irWid = RC_TICK_US;
    rfWid = RC_TICK_US;

    TMOD = ( uint8_t )( TMOD & 0xF0 ) | 0x02;   /* T0: 8bit 自动重载 */
    TH0  = 0x9C;                                 /* 2MHz 时钟, 100tick = 50us */
    TL0  = 0x9C;
    TR0  = 1;
    ET0  = 1;
}
