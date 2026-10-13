/*******************************************************************************
* File Name          : eeprom.c
* Author             : 本工程
* Description        : CH554 24C01~24C512 I2C EEPROM 编程器驱动
*                      - 软件 I2C 主机(位操作): SCL=P3.3, SDA=P3.4(准双向)
*                      - 型号表 24C01~24C512, 默认 24C32
*                      - 写: 自动分页 + 每页 ACK 轮询写周期(任意长度)
*                      - 读: 顺序读(任意长度, 调用方分块)
*                      注: 命令处理运行于主循环, 本模块不含中断服务。
*******************************************************************************/
#include <stdint.h>

#include <ch554.h>
#include <debug.h>                  /* mDelayuS: 写周期轮询用 */
#include <eeprom.h>

/* ==================== 软件 I2C 引脚(P3.3=SCL, P3.4=SDA) ==================== */
#define EE_SCL_MASK   0x08
#define EE_SDA_MASK   0x10
#define EE_SCL_H()    ( P3 |=  EE_SCL_MASK )
#define EE_SCL_L()    ( P3 &= ~EE_SCL_MASK )
#define EE_SDA_H()    ( P3 |=  EE_SDA_MASK )
#define EE_SDA_L()    ( P3 &= ~EE_SDA_MASK )
#define EE_SDA_IN()   ( ( P3 & EE_SDA_MASK ) ? 1 : 0 )

/* 半位周期延时(约 4~5us @24MHz, 对应 SCL 约 100~125kHz, 兼容各 24C 系列) */
static void ee_delay(void)
{
    volatile uint8_t n;
    for ( n = 0; n < 25; n++ ) ;
}

/* ==================== 型号表 ==================== */
typedef struct
{
    __code uint8_t *name;       /* 小写型号名 */
    uint16_t        maxAddr;    /* 容量-1(24C512=0xFFFF) */
    uint8_t         page;       /* 页写字节数 */
} EeTypeItem;

static __code EeTypeItem gEeTypes[] =
{
    { "24c01",  0x007F, 8   },
    { "24c02",  0x00FF, 8   },
    { "24c04",  0x01FF, 16  },
    { "24c08",  0x03FF, 16  },
    { "24c16",  0x07FF, 16  },
    { "24c32",  0x0FFF, 32  },   /* 默认型号 */
    { "24c64",  0x1FFF, 32  },
    { "24c128", 0x3FFF, 64  },
    { "24c256", 0x7FFF, 64  },
    { "24c512", 0xFFFF, 128 },
};
#define EE_TYPE_COUNT   (sizeof(gEeTypes) / sizeof(gEeTypes[0]))
#define EE_TYPE_DEFAULT 5           /* 24c32 */
#define EE_ADDR16_MIN   5           /* 型号索引 >=5(24C32+) 用 16 位字地址 */

static uint8_t gEeTypeIdx = EE_TYPE_DEFAULT;

/* ==================== 底层 I2C 位时序 ==================== */
static void ee_start(void)                              /* SCL 高时 SDA 1->0 */
{
    EE_SDA_H();
    EE_SCL_H();
    ee_delay();
    EE_SDA_L();
    ee_delay();
    EE_SCL_L();
}

static void ee_stop(void)                               /* SCL 高时 SDA 0->1 */
{
    EE_SDA_L();
    EE_SCL_H();
    ee_delay();
    EE_SDA_H();
    ee_delay();
}

static void ee_wbit(uint8_t bit)                        /* SCL 低时放 SDA, 上升沿锁存 */
{
    if ( bit ) EE_SDA_H(); else EE_SDA_L();
    ee_delay();
    EE_SCL_H();
    ee_delay();
    EE_SCL_L();
}

static uint8_t ee_rbit(void)                            /* SCL 高采样 SDA */
{
    uint8_t v;
    EE_SDA_H();                                         /* 释放 SDA(从机驱动) */
    ee_delay();
    EE_SCL_H();
    ee_delay();
    v = EE_SDA_IN();
    EE_SCL_L();
    return v;
}

/* 写 1 字节(MSB 先), 返回从机应答: 0=ACK, 1=NACK */
static uint8_t ee_wbyte(uint8_t d)
{
    uint8_t i, ack;
    for ( i = 8; i != 0; i-- )
    {
        ee_wbit( d & 0x80 );
        d <<= 1;
    }
    EE_SDA_H();                                         /* 释放 SDA 等从机 ACK */
    ee_delay();
    EE_SCL_H();
    ee_delay();
    ack = EE_SDA_IN();
    EE_SCL_L();
    return ack;                                         /* 1=NACK */
}

/* 读 1 字节(MSB 先); last: 1=最后 1 字节(发 NAK), 0=继续(发 ACK) */
static uint8_t ee_rbyte(uint8_t last)
{
    uint8_t i, d = 0;
    for ( i = 8; i != 0; i-- )
    {
        d = ( uint8_t )( d << 1 );
        if ( ee_rbit() ) d |= 0x01;
    }
    if ( last ) EE_SDA_H(); else EE_SDA_L();            /* ACK=0 / NAK=1 */
    ee_delay();
    EE_SCL_H();
    ee_delay();
    EE_SCL_L();
    return d;
}

/* ==================== 器件地址(含 24C04~16 的容量块选择位) ==================== */
static uint8_t ee_dev_addr_w(uint16_t addr)
{
    uint8_t dev = ( uint8_t )( 0xA0 | EE_A_CFG );
    switch ( gEeTypeIdx )
    {
    case 2:                                            /* 24c04: 地址 bit8 -> 器件 A0 位 */
        dev |= ( uint8_t )( ( addr >> 8 ) & 0x01 );
        break;
    case 3:                                            /* 24c08: 地址 bit9:8 -> A1:A0 */
        dev |= ( uint8_t )( ( addr >> 8 ) & 0x03 );
        break;
    case 4:                                            /* 24c16: 地址 bit10:8 -> A2:A0 */
        dev |= ( uint8_t )( ( addr >> 8 ) & 0x07 );
        break;
    default:                                           /* 24c01/02/32+: 无块位 */
        break;
    }
    return dev;
}

/* ==================== 对外接口 ==================== */
void EE_Init(void)
{
    /* P3.3/P3.4 设为准双向(读输入/写输出), 总线空闲置高 */
    P3_MOD_OC |= ( EE_SCL_MASK | EE_SDA_MASK );
    P3_DIR_PU &= ~( EE_SCL_MASK | EE_SDA_MASK );
    EE_SCL_H();
    EE_SDA_H();
    gEeTypeIdx = EE_TYPE_DEFAULT;
}

uint8_t EE_SetTypeByName(const uint8_t *name)
{
    uint8_t i, j;
    for ( i = 0; i < EE_TYPE_COUNT; i++ )
    {
        j = 0;
        while ( gEeTypes[i].name[j] != 0 )
        {
            uint8_t c = name[j];
            if ( c >= 'A' && c <= 'Z' ) c += 'a' - 'A';      /* 忽略大小写 */
            if ( c != gEeTypes[i].name[j] ) break;
            j++;
        }
        if ( gEeTypes[i].name[j] == 0 && name[j] == 0 )      /* 完全一致 */
        {
            gEeTypeIdx = i;
            return 0;
        }
    }
    return 1;                                               /* 未知型号 */
}

uint8_t EE_TypeIndex(void)      { return gEeTypeIdx; }
const __code uint8_t *EE_TypeName(void)   { return gEeTypes[gEeTypeIdx].name; }
uint16_t EE_TypeMaxAddr(void)   { return gEeTypes[gEeTypeIdx].maxAddr; }
uint32_t EE_TypeCapBytes(void)  { return ( ( uint32_t )gEeTypes[gEeTypeIdx].maxAddr + 1 ); }
uint8_t  EE_TypePage(void)      { return gEeTypes[gEeTypeIdx].page; }

/* 向器件写命令字节流并返回首个 NACK 位置; 返回 len 表示全部 ACK */
static uint8_t ee_send_bytes(const __xdata uint8_t *p, uint8_t n)
{
    uint8_t i;
    for ( i = 0; i < n; i++ )
    {
        if ( ee_wbyte( p[i] ) ) return i;               /* 遇 NACK 提前终止 */
    }
    return n;
}

/* 页写: 由 EE_Write 保证 addr 对齐到页首且 n<=页宽 */
static uint8_t ee_page_write(uint16_t addr, const __xdata uint8_t *data, uint8_t n)
{
    uint8_t dev, ack;
    uint16_t pollCnt;

    dev = ee_dev_addr_w( addr );
    ee_start();
    ack = ee_wbyte( dev );
    if ( gEeTypeIdx >= EE_ADDR16_MIN ) ack |= ee_wbyte( ( uint8_t )( addr >> 8 ) );
    ack |= ee_wbyte( ( uint8_t )addr );
    ack |= ee_send_bytes( data, n );
    ee_stop();
    if ( ack ) return EE_ERR_NOACK;                     /* 器件不存在/写保护? NACK */

    /* ACK 轮询等待内部写周期结束(典型 tWR<=5ms, 放宽到约 12ms) */
    for ( pollCnt = 0; pollCnt < 120; pollCnt++ )
    {
        ee_start();
        if ( ee_wbyte( dev ) == 0 )                     /* 收到 ACK: 写周期完成 */
        {
            ee_stop();
            return EE_ERR_OK;
        }
        ee_stop();
        mDelayuS( 100 );
    }
    return EE_ERR_TIMEOUT;
}

uint8_t EE_Write(uint16_t addr, const __xdata uint8_t *data, uint16_t len)
{
    uint8_t page, n;
    uint8_t err = EE_ERR_OK;

    /* 越界检查(用 32 位中间量避免地址回绕) */
    if ( ( ( uint32_t )addr + len ) > ( ( uint32_t )EE_TypeMaxAddr() + 1 ) )
        return EE_ERR_RANGE;
    if ( len == 0 ) return EE_ERR_OK;

    page = EE_TypePage();
    while ( len )
    {
        n = ( uint8_t )( page - ( addr % page ) );      /* 本页剩余字节 */
        if ( n > len ) n = ( uint8_t )len;
        err = ee_page_write( addr, data, n );
        if ( err ) return err;
        addr += n;
        data += n;
        len -= n;
    }
    return EE_ERR_OK;
}

uint8_t EE_Read(uint16_t addr, __xdata uint8_t *buf, uint8_t len)
{
    uint8_t dev, i;
    uint8_t ack = 0;

    if ( len == 0 ) return EE_ERR_OK;
    if ( ( ( uint32_t )addr + len ) > ( ( uint32_t )EE_TypeMaxAddr() + 1 ) )
        return EE_ERR_RANGE;

    dev = ee_dev_addr_w( addr );
    ee_start();
    ack = ee_wbyte( dev );                              /* 写地址: 器件地址 W + 字地址 */
    if ( gEeTypeIdx >= EE_ADDR16_MIN ) ack |= ee_wbyte( ( uint8_t )( addr >> 8 ) );
    ack |= ee_wbyte( ( uint8_t )addr );

    ee_start();                                         /* 重复起始: 切换读方向 */
    ack |= ee_wbyte( dev | 0x01 );
    if ( ack )
    {
        ee_stop();
        return EE_ERR_NOACK;
    }
    for ( i = 0; i < len; i++ )
    {
        buf[i] = ee_rbyte( i == ( uint8_t )( len - 1 ) );   /* 末字节 NAK */
    }
    ee_stop();
    return EE_ERR_OK;
}
