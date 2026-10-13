/********************************** (C) COPYRIGHT *******************************
* File Name          : usbcdc.c
* Author             : WCH / 本工程
* Version            : V1.0
* Date               : 2017/03/01
* Description        : CH55x USB-CDC 设备模块(纯 CDC 命令口内核)
*                      自原 main.c 抽取并整理:
*                        - USB 设备/配置/端点/中断 初始化 (UsbCdc_Init)
*                        - USB 设备描述符、配置描述符、字符串描述符
*                        - CDC 类请求: SET/GET_LINE_CODING、SET_CONTROL_LINE_STATE
*                        - EP2(IN/OUT) 数据收发
*                        - USB 中断处理主体(UsbCdc_DeviceInterrupt):
*                          SDCC 的完整中断向量表只由"含 main() 的编译单元"生成
*                          (否则向量 0x0043 缺失, USB 无法枚举), 故 USB 中断
*                          服务 ISR 必须定义于 main.c; 本模块把处理主体做成
*                          普通函数供其调用, 模块内部状态全部 static, 经
*                          usbcdc.h 仅暴露 API 与处理例程。
*                      注: 本设备不使用 UART0/UART1(悬空 RXD 噪声曾污染上传
*                      通路), UART1 相关缓冲/中断/API 已全部移除。
*******************************************************************************/
#include <stdint.h>
#include <stdio.h>            /* DE_PRINTF 调试输出 */
#include <string.h>

#include <ch554.h>
#include <ch554_usb.h>
#include <usbcdc.h>

/* ==================== CDC 类请求与端点缓冲访问宏(模块内部) ==================== */
#define SET_LINE_CODING                0X20        /* 配置 DTE 速率/停止位/校验/数据位 */
#define GET_LINE_CODING                0X21        /* 主机查询当前线路编码 */
#define SET_CONTROL_LINE_STATE         0X22        /* RS-232/V.24 控制信号 */
#define UsbSetupBuf     ((PUSB_SETUP_REQ)Ep0Buffer)

/* ==================== USB 端点缓冲 (固定 XRAM 布局, 须为偶地址) ==================== */
static __xdata __at (0x0000) uint8_t  Ep0Buffer[DEFAULT_ENDP0_SIZE];  /* 端点0 OUT & IN 缓冲 */
static __xdata __at (0x0040) uint8_t  Ep1Buffer[DEFAULT_ENDP1_SIZE];  /* 端点1 上传缓冲(CDC 中断IN) */
static __xdata __at (0x0080) uint8_t  Ep2Buffer[2*MAX_PACKET_SIZE];   /* 端点2 IN & OUT 缓冲 */

/* ==================== USB / CDC 内部状态 ==================== */
static uint16_t SetupLen;
static uint8_t  SetupReq;
static uint8_t  UsbConfig;                                              /* 主机下发的配置值 */
static const uint8_t *pDescr;                                           /* 当前上传描述符指针 */

/* CDC 参数(初始波特率 57600, 1 停止位, 无校验, 8 数据位) */
static __xdata uint8_t LineCoding[7]={0x00,0xe1,0x00,0x00,0x00,0x00,0x08};

/* ==================== 设备描述符 ==================== */
static __code uint8_t DevDesc[] = {0x12,0x01,0x10,0x01,0x02,0x00,0x00,DEFAULT_ENDP0_SIZE,
                           0x86,0x1a,0x22,0x57,0x00,0x01,0x01,0x02,
                           0x03,0x01
                          };
static __code uint8_t CfgDesc[] ={
    0x09,0x02,0x43,0x00,0x02,0x01,0x00,0xa0,0x32,        /* 配置描述符(两个接口) */
// The following is the interface 0 (CDC interface) descriptor
    0x09,0x04,0x00,0x00,0x01,0x02,0x02,0x01,0x00,        /* CDC 接口描述符(一个端点) */
    // The following is the function descriptor
    0x05,0x24,0x00,0x10,0x01,                            /* 功能描述符(头) */
    0x05,0x24,0x01,0x00,0x00,                            /* 管理描述符(没有数据类接口) */
    0x04,0x24,0x02,0x02,                                 /* 支持 Set_Line_Coding 等 */
    0x05,0x24,0x06,0x00,0x01,                            /* CDC接口0; 数据接口1 */
    0x07,0x05,0x81,0x03,0x08,0x00,0xFF,                  /* 中断上传端点描述符 */
    // The following is the interface 1 (data interface) descriptor
    0x09,0x04,0x01,0x00,0x02,0x0a,0x00,0x00,0x00,        /* 数据接口描述符 */
    0x07,0x05,0x02,0x02,0x40,0x00,0x00,                  /* 端点2 OUT 描述符 */
    0x07,0x05,0x82,0x02,0x40,0x00,0x00,                  /* 端点2 IN 描述符 */
};
/* 字符串描述符 */
static unsigned char __code LangDes[]={0x04,0x03,0x09,0x04};                 /* 语言描述符 */
static unsigned char __code SerDes[]={                                      /* 序列号字符串描述符 */
    0x14,0x03,
    0x32,0x00,0x30,0x00,0x31,0x00,0x37,0x00,0x2D,0x00,
    0x32,0x00,0x2D,0x00,
    0x32,0x00,0x35,0x00
};
static unsigned char __code Prod_Des[]={                                    /* 产品字符串描述符 */
    0x14,0x03,
    0x43,0x00,0x48,0x00,0x35,0x00,0x35,0x00,0x34,0x00,0x5F,0x00,
    0x43,0x00,0x44,0x00,0x43,0x00,
};
static unsigned char __code Manuf_Des[]={
    0x0A,0x03,
    0x5F,0x6c,0xCF,0x82,0x81,0x6c,0x52,0x60,
};

/* ==================== EP2(CDC 数据端点)状态 ====================
   放 xdata: 内部 RAM(data/idata)紧张, 中断里访问略慢可接受 */
static volatile __xdata uint8_t USBByteCount = 0;       /* 本包已收到(待处理)字节数 */
static volatile __xdata uint8_t USBBufOutPoint = 0;     /* EP2 OUT 读取指针 */
static volatile __xdata uint8_t UpPoint2_Busy  = 0;     /* EP2 IN 上传忙标志 */

/*******************************************************************************
* Function Name  : Config_Uart1(uint8_t *cfg_uart)
* Description    : 按主机 SET_LINE_CODING 记录线路编码(波特率由 LineCoding
*                  前4字节给出)。本设备为纯 USB-CDC 命令口, 不使用 UART1,
*                  仅保留编码解析(兼容主机枚举期请求)。
* Input          : cfg_uart 线路编码(波特率4字节 + 停止位/校验/数据位)
*******************************************************************************/
static void Config_Uart1(uint8_t *cfg_uart)
{
    uint32_t uart1_buad = 0;
    *((uint8_t *)&uart1_buad)     = cfg_uart[0];
    *((uint8_t *)&uart1_buad + 1) = cfg_uart[1];
    *((uint8_t *)&uart1_buad + 2) = cfg_uart[2];
    *((uint8_t *)&uart1_buad + 3) = cfg_uart[3];
    /* 不使用 UART1: 不写 SBAUD1、不使能 IE_UART1(避免悬空 RXD 噪声入上传通路) */
    (void)uart1_buad;
}

/*******************************************************************************
* Function Name  : UsbCdc_Init()
* Description    : USB 设备模式 + 端点 + 中断初始化, 并清零内部状态
*******************************************************************************/
void UsbCdc_Init(void)
{
    /* ---- 设备模式配置 ---- */
    USB_CTRL = 0x00;                                                     /* 清 USB 控制寄存器 */
    USB_CTRL &= ~bUC_HOST_MODE;                                          /* 选择设备模式 */
    USB_CTRL |=  bUC_DEV_PU_EN | bUC_INT_BUSY | bUC_DMA_EN;              /* 设备+内部上拉使能, 中断标志未清前自动NAK */
    USB_DEV_AD = 0x00;                                                   /* 设备地址初始化 */
    USB_CTRL &= ~bUC_LOW_SPEED;                                          /* 全速 12M 模式(默认) */
    UDEV_CTRL &= ~bUD_LOW_SPEED;
    UDEV_CTRL = bUD_PD_DIS;                                              /* 禁止 DP/DM 下拉 */
    UDEV_CTRL |= bUD_PORT_EN;                                            /* 使能物理端口 */

    /* ---- 端点配置 ---- */
    UEP1_DMA = (uint16_t) Ep1Buffer;                                     /* 端点1 发送地址 */
    UEP2_DMA = (uint16_t) Ep2Buffer;                                     /* 端点2 IN/OUT 地址 */
    UEP2_3_MOD = 0xCC;                                                   /* 端点2/3 单缓冲收发使能 */
    UEP2_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;           /* EP2 自动翻转, IN=NAK, OUT=ACK */
    UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK;                           /* EP1 自动翻转, IN=NAK */
    UEP0_DMA = (uint16_t) Ep0Buffer;                                     /* 端点0 数据地址 */
    UEP4_1_MOD = 0X40;                                                   /* EP1 上传缓冲; EP0 单64字节收发 */
    UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;                           /* 手动翻转, OUT=ACK, IN=NAK */

    /* ---- 中断使能 ---- */
    USB_INT_EN |= bUIE_SUSPEND;                                          /* 设备挂起中断 */
    USB_INT_EN |= bUIE_TRANSFER;                                         /* USB 传输完成中断 */
    USB_INT_EN |= bUIE_BUS_RST;                                          /* 总线复位中断 */
    USB_INT_FG |= 0x1F;                                                  /* 清中断标志 */
    IE_USB = 1;                                                          /* 使能 USB 中断 */

    /* ---- 内部状态清零 ---- */
    UsbConfig = 0;
    SetupReq = 0;
    SetupLen = 0;
    UEP0_T_LEN = 0;                                                      /* 预使用发送长度清零 */
    UEP1_T_LEN = 0;
    UEP2_T_LEN = 0;
    USBByteCount = 0;
    USBBufOutPoint = 0;
    UpPoint2_Busy = 0;

    EA = 1;                                                              /* 开总中断 */
}

/*******************************************************************************
* Function Name  : UsbCdc_IsConfigured()
* Description    : 主机是否已完成 SET_CONFIGURATION
*******************************************************************************/
uint8_t UsbCdc_IsConfigured(void)
{
    return UsbConfig;
}

/*******************************************************************************
* Function Name  : UsbCdc_RxBytes() / UsbCdc_RxRead() / UsbCdc_RxDone()
* Description    : EP2 OUT(主机->设备) 数据读取
*******************************************************************************/
uint8_t UsbCdc_RxBytes(void)
{
    return USBByteCount;
}

uint8_t UsbCdc_RxRead(void)
{
    return Ep2Buffer[USBBufOutPoint++];
}

void UsbCdc_RxDone(void)
{
    if ( USBByteCount )
    {
        USBByteCount--;
        if ( USBByteCount == 0 )                                         /* 本包处理完, 恢复接收 */
        {
            UEP2_CTRL = UEP2_CTRL & ~ MASK_UEP_R_RES | UEP_R_RES_ACK;
        }
    }
}

/*******************************************************************************
* Function Name  : UsbCdc_TxReady() / UsbCdc_TxSend()
* Description    : EP2 IN(设备->主机) 数据上传
*******************************************************************************/
uint8_t UsbCdc_TxReady(void)
{
    return ( UpPoint2_Busy == 0 );
}

void UsbCdc_TxSend(const uint8_t *data, uint8_t len)
{
    if ( data == 0 || len == 0 )                                         /* 空包不处理 */
    {
        return;
    }
    if ( len > MAX_PACKET_SIZE )                                         /* 保险: 不超过端点缓冲半区 */
    {
        len = MAX_PACKET_SIZE;
    }
    if ( UpPoint2_Busy )                                                 /* 上传忙, 丢弃(调用方应先查 TxReady) */
    {
        return;
    }
    memcpy( Ep2Buffer + MAX_PACKET_SIZE, data, len );                    /* 拷入 EP2 IN 缓冲半区 */
    UEP2_T_LEN = len;                                                    /* 预使用发送长度 */
    UEP2_CTRL = UEP2_CTRL & ~ MASK_UEP_T_RES | UEP_T_RES_ACK;            /* 应答 ACK, 启动上传 */
    UpPoint2_Busy = 1;
}

/*******************************************************************************
* Function Name  : UsbCdc_DeviceInterrupt()
* Description    : USB 设备模式中断处理主体(原 DeviceInterrupt 函数体)。
*                  仅由 main.c 中定义的 USB 中断服务(DeviceInterrupt 薄壳)调用;
*                  ISR 必须定义于含 main() 的编译单元(SDCC 向量表限制), 见
*                  main.c 头部注释。本函数操作中断上下文相关寄存器/状态,
*                  请勿在其它地方调用。
*******************************************************************************/
void UsbCdc_DeviceInterrupt(void)
{
    uint16_t len;
    if(UIF_TRANSFER)                                                     /* USB 传输完成标志 */
    {
        switch (USB_INT_ST & (MASK_UIS_TOKEN | MASK_UIS_ENDP))
        {
        case UIS_TOKEN_IN | 1:                                           /* 端点1 中断上传完成 */
            UEP1_T_LEN = 0;
            UEP1_CTRL = UEP1_CTRL & ~ MASK_UEP_T_RES | UEP_T_RES_NAK;    /* 默认应答 NAK */
            break;
        case UIS_TOKEN_IN | 2:                                           /* 端点2 批量上传完成 */
        {
            UEP2_T_LEN = 0;                                              /* 预使用发送长度清零 */
            UEP2_CTRL = UEP2_CTRL & ~ MASK_UEP_T_RES | UEP_T_RES_NAK;    /* 默认应答 NAK */
            UpPoint2_Busy = 0;                                           /* 清忙标志 */
        }
            break;
        case UIS_TOKEN_OUT | 2:                                          /* 端点2 批量下传(主机->设备) */
            if ( U_TOG_OK )                                              /* 不同步数据包丢弃 */
            {
                USBByteCount = USB_RX_LEN;                               /* 记录本包长度 */
                USBBufOutPoint = 0;                                      /* 读指针复位 */
                UEP2_CTRL = UEP2_CTRL & ~ MASK_UEP_R_RES | UEP_R_RES_NAK;/* 收完一包先NAK, 主循环处理完再恢复ACK */
            }
            break;
        case UIS_TOKEN_SETUP | 0:                                        /* SETUP 事务 */
            len = USB_RX_LEN;
            if(len == (sizeof(USB_SETUP_REQ)))
            {
                SetupLen = ((uint16_t)UsbSetupBuf->wLengthH<<8) | (UsbSetupBuf->wLengthL);
                len = 0;                                                 /* 默认成功并上传0长度 */
                SetupReq = UsbSetupBuf->bRequest;
                if ( ( UsbSetupBuf->bRequestType & USB_REQ_TYP_MASK ) != USB_REQ_TYP_STANDARD ) /* 非标准(类)请求 */
                {
                    switch( SetupReq )
                    {
                    case GET_LINE_CODING:                                /* 0x21 查询当前线路编码 */
                        pDescr = LineCoding;
                        len = sizeof(LineCoding);
                        len = SetupLen >= DEFAULT_ENDP0_SIZE ? DEFAULT_ENDP0_SIZE : SetupLen;
                        memcpy(Ep0Buffer,pDescr,len);
                        SetupLen -= len;
                        pDescr += len;
                        break;
                    case SET_CONTROL_LINE_STATE:                         /* 0x22: 主机(重)打开串口(纯命令口无旁路, 仅应答) */
                        break;
                    case SET_LINE_CODING:                                /* 0x20 配置(数据在随后的OUT阶段) */
                        break;
                    default:
                        len = 0xFF;                                      /* 不支持的命令 */
                        break;
                    }
                }
                else                                                     /* 标准请求 */
                {
                    switch(SetupReq)
                    {
                    case USB_GET_DESCRIPTOR:
                        switch(UsbSetupBuf->wValueH)
                        {
                        case 1:                                          /* 设备描述符 */
                            pDescr = DevDesc;
                            len = sizeof(DevDesc);
                            break;
                        case 2:                                          /* 配置描述符 */
                            pDescr = CfgDesc;
                            len = sizeof(CfgDesc);
                            break;
                        case 3:                                          /* 字符串描述符 */
                            if(UsbSetupBuf->wValueL == 0)
                            {
                                pDescr = LangDes;
                                len = sizeof(LangDes);
                            }
                            else if(UsbSetupBuf->wValueL == 1)
                            {
                                pDescr = Manuf_Des;
                                len = sizeof(Manuf_Des);
                            }
                            else if(UsbSetupBuf->wValueL == 2)
                            {
                                pDescr = Prod_Des;
                                len = sizeof(Prod_Des);
                            }
                            else
                            {
                                pDescr = SerDes;
                                len = sizeof(SerDes);
                            }
                            break;
                        default:
                            len = 0xff;                                  /* 不支持的命令或错误 */
                            break;
                        }
                        if ( SetupLen > len )
                        {
                            SetupLen = len;                              /* 限制总长度 */
                        }
                        len = SetupLen >= DEFAULT_ENDP0_SIZE ? DEFAULT_ENDP0_SIZE : SetupLen;
                        memcpy(Ep0Buffer,pDescr,len);                     /* 装载上传数据 */
                        SetupLen -= len;
                        pDescr += len;
                        break;
                    case USB_SET_ADDRESS:
                        SetupLen = UsbSetupBuf->wValueL;                  /* 暂存设备地址 */
                        break;
                    case USB_GET_CONFIGURATION:
                        Ep0Buffer[0] = UsbConfig;
                        if ( SetupLen >= 1 )
                        {
                            len = 1;
                        }
                        break;
                    case USB_SET_CONFIGURATION:
                        UsbConfig = UsbSetupBuf->wValueL;
                        break;
                    case USB_GET_INTERFACE:
                        break;
                    case USB_CLEAR_FEATURE:                               /* 清除特性 */
                        if( ( UsbSetupBuf->bRequestType & 0x1F ) == USB_REQ_RECIP_DEVICE )
                        {
                            if( ( ( ( uint16_t )UsbSetupBuf->wValueH << 8 ) | UsbSetupBuf->wValueL ) == 0x01 )
                            {
                                if( CfgDesc[ 7 ] & 0x20 )
                                {
                                    /* 唤醒 */
                                }
                                else
                                {
                                    len = 0xFF;
                                }
                            }
                            else
                            {
                                len = 0xFF;
                            }
                        }
                        else if ( ( UsbSetupBuf->bRequestType & USB_REQ_RECIP_MASK ) == USB_REQ_RECIP_ENDP )
                        {
                            switch( UsbSetupBuf->wIndexL )
                            {
                            case 0x83:
                                UEP3_CTRL = UEP3_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
                                break;
                            case 0x03:
                                UEP3_CTRL = UEP3_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
                                break;
                            case 0x82:
                                UEP2_CTRL = UEP2_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
                                break;
                            case 0x02:
                                UEP2_CTRL = UEP2_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
                                break;
                            case 0x81:
                                UEP1_CTRL = UEP1_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
                                break;
                            case 0x01:
                                UEP1_CTRL = UEP1_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
                                break;
                            default:
                                len = 0xFF;
                                break;
                            }
                        }
                        else
                        {
                            len = 0xFF;
                        }
                        break;
                    case USB_SET_FEATURE:                                 /* 设置特性 */
                        if( ( UsbSetupBuf->bRequestType & 0x1F ) == USB_REQ_RECIP_DEVICE )
                        {
                            if( ( ( ( uint16_t )UsbSetupBuf->wValueH << 8 ) | UsbSetupBuf->wValueL ) == 0x01 )
                            {
                                if( CfgDesc[ 7 ] & 0x20 )
                                {
                                    /* 休眠 */
#ifdef DE_PRINTF
                                    printf( "suspend\n" );
#endif
                                    while ( XBUS_AUX & bUART0_TX )
                                    {
                                        ;
                                    }
                                    SAFE_MOD = 0x55;
                                    SAFE_MOD = 0xAA;
                                    WAKE_CTRL = bWAK_BY_USB | bWAK_RXD0_LO | bWAK_RXD1_LO;
                                    PCON |= PD;                            /* 睡眠 */
                                    SAFE_MOD = 0x55;
                                    SAFE_MOD = 0xAA;
                                    WAKE_CTRL = 0x00;
                                }
                                else
                                {
                                    len = 0xFF;
                                }
                            }
                            else
                            {
                                len = 0xFF;
                            }
                        }
                        else if( ( UsbSetupBuf->bRequestType & 0x1F ) == USB_REQ_RECIP_ENDP )
                        {
                            if( ( ( ( uint16_t )UsbSetupBuf->wValueH << 8 ) | UsbSetupBuf->wValueL ) == 0x00 )
                            {
                                switch( ( ( uint16_t )UsbSetupBuf->wIndexH << 8 ) | UsbSetupBuf->wIndexL )
                                {
                                case 0x83:
                                    UEP3_CTRL = UEP3_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;
                                    break;
                                case 0x03:
                                    UEP3_CTRL = UEP3_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;
                                    break;
                                case 0x82:
                                    UEP2_CTRL = UEP2_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;
                                    break;
                                case 0x02:
                                    UEP2_CTRL = UEP2_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;
                                    break;
                                case 0x81:
                                    UEP1_CTRL = UEP1_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;
                                    break;
                                case 0x01:
                                    UEP1_CTRL = UEP1_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;
                                default:
                                    len = 0xFF;
                                    break;
                                }
                            }
                            else
                            {
                                len = 0xFF;
                            }
                        }
                        else
                        {
                            len = 0xFF;
                        }
                        break;
                    case USB_GET_STATUS:
                        Ep0Buffer[0] = 0x00;
                        Ep0Buffer[1] = 0x00;
                        if ( SetupLen >= 2 )
                        {
                            len = 2;
                        }
                        else
                        {
                            len = SetupLen;
                        }
                        break;
                    default:
                        len = 0xff;
                        break;
                    }
                }
            }
            else
            {
                len = 0xff;                                              /* 包长度错误 */
            }
            if(len == 0xff)
            {
                SetupReq = 0xFF;
                UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_STALL | UEP_T_RES_STALL;/* STALL */
            }
            else if(len <= DEFAULT_ENDP0_SIZE)                           /* 上传数据或状态阶段返回0长度包 */
            {
                UEP0_T_LEN = len;
                UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_ACK | UEP_T_RES_ACK;
            }
            else
            {
                UEP0_T_LEN = 0;                                          /* 预置0长度包, 防止主机提前进入状态阶段 */
                UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_ACK | UEP_T_RES_ACK;
            }
            break;
        case UIS_TOKEN_IN | 0:                                           /* 端点0 IN */
            switch(SetupReq)
            {
            case USB_GET_DESCRIPTOR:
                len = SetupLen >= DEFAULT_ENDP0_SIZE ? DEFAULT_ENDP0_SIZE : SetupLen;
                memcpy( Ep0Buffer, pDescr, len );                        /* 加载上传数据 */
                SetupLen -= len;
                pDescr += len;
                UEP0_T_LEN = len;
                UEP0_CTRL ^= bUEP_T_TOG;                                 /* 同步标志翻转 */
                break;
            case USB_SET_ADDRESS:
                USB_DEV_AD = USB_DEV_AD & bUDA_GP_BIT | SetupLen;
                UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
                break;
            default:
                UEP0_T_LEN = 0;                                          /* 状态阶段完成或强制0长度包结束控制传输 */
                UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
                break;
            }
            break;
        case UIS_TOKEN_OUT | 0:                                          /* 端点0 OUT */
            if(SetupReq == SET_LINE_CODING)                              /* 设置串口属性 */
            {
                if( U_TOG_OK )
                {
                    memcpy(LineCoding,UsbSetupBuf,USB_RX_LEN);
                    Config_Uart1(LineCoding);
                    UEP0_T_LEN = 0;
                    UEP0_CTRL |= UEP_R_RES_ACK | UEP_T_RES_ACK;          /* 准备上传0包 */
                }
            }
            else
            {
                UEP0_T_LEN = 0;
                UEP0_CTRL |= UEP_R_RES_ACK | UEP_T_RES_NAK;              /* 状态阶段, IN 响应 NAK */
            }
            break;
        default:
            break;
        }
        UIF_TRANSFER = 0;                                                /* 写0清空中断 */
    }
    if(UIF_BUS_RST)                                                      /* 设备模式 USB 总线复位中断 */
    {
#ifdef DE_PRINTF
        printf( "reset\n" );
#endif
        UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
        UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK;
        UEP2_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;
        USB_DEV_AD = 0x00;
        UIF_SUSPEND = 0;
        UIF_TRANSFER = 0;
        UIF_BUS_RST = 0;                                                 /* 清中断标志 */
        USBByteCount = 0;                                                /* USB 端点待处理字节数清零 */
        USBBufOutPoint = 0;
        UsbConfig = 0;                                                   /* 清除配置值 */
        UpPoint2_Busy = 0;
    }
    if (UIF_SUSPEND)                                                     /* USB 总线挂起/唤醒完成 */
    {
        UIF_SUSPEND = 0;
        if ( USB_MIS_ST & bUMS_SUSPEND )                                 /* 挂起 */
        {
#ifdef DE_PRINTF
            printf( "suspend\n" );
#endif
            while ( XBUS_AUX & bUART0_TX )
            {
                ;
            }
            SAFE_MOD = 0x55;
            SAFE_MOD = 0xAA;
            WAKE_CTRL = bWAK_BY_USB | bWAK_RXD0_LO | bWAK_RXD1_LO;        /* USB 或 RXD0/1 有信号可唤醒 */
            PCON |= PD;                                                   /* 睡眠 */
            SAFE_MOD = 0x55;
            SAFE_MOD = 0xAA;
            WAKE_CTRL = 0x00;
        }
    }
    else                                                                 /* 意外中断 */
    {
        USB_INT_FG = 0xFF;                                               /* 清中断标志 */
    }
}
