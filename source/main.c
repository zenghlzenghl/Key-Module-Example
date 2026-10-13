/********************************** (C) COPYRIGHT *******************************
* File Name          : main.c
* Author             : WCH
* Version            : V1.0
* Date               : 2017/03/01
* Description        : CH554 USB-CDC 命令口 + 按键扫描 应用层
*                      - main(): 时钟/LED/USB-CDC/TIMER0/KEY 初始化, 命令轮询
*                      - UsbCmd_Poll(): 纯 USB-CDC 命令轮询主循环(无 UART1 桥接)
*                      - 快捷命令("help"/"?"/"download"/"led_on"/"led_off")
*                        由 usbapp 模块处理(滑动匹配)
*                      - 按键事件通过 USB-CDC 打印到上位机
*                      - DeviceInterrupt: SDCC 的完整中断向量表只由"含 main() 的
*                        编译单元"生成(否则向量 0x0043 缺失, USB 无法枚举),
*                        故 USB ISR 必须定义于本文件; 处理主体已抽至 usbcdc
*                        模块(UsbCdc_DeviceInterrupt), 此处仅保留薄壳。
*******************************************************************************/
#include <stdint.h>
#include <stdio.h>

#include <ch554.h>
#include <ch554_usb.h>
#include <debug.h>
#include <usbcdc.h>
#include <usbapp.h>
#include <key.h>

/* ==================== 按键事件消息缓冲 ==================== */
__code uint8_t KeyShortPressMsg[] = "KEY: SHORT_PRESS\r\n";
__code uint8_t KeyLongPressMsg[]  = "KEY: LONG_PRESS\r\n";
__code uint8_t KeyRepeatMsg[]     = "KEY: REPEAT\r\n";

static void key_event_report(KeyEvent *event)
{
    uint8_t waitCnt;

    switch (*event)
    {
        case KEY_EVENT_SHORT_PRESS:
            for ( waitCnt = 0; waitCnt < 250 && !UsbCdc_TxReady(); waitCnt++ )
            {
                mDelaymS( 2 );
            }
            UsbCdc_TxSend( KeyShortPressMsg, sizeof(KeyShortPressMsg) - 1 );
            break;

        case KEY_EVENT_LONG_PRESS:
            for ( waitCnt = 0; waitCnt < 250 && !UsbCdc_TxReady(); waitCnt++ )
            {
                mDelaymS( 2 );
            }
            UsbCdc_TxSend( KeyLongPressMsg, sizeof(KeyLongPressMsg) - 1 );
            break;

        case KEY_EVENT_REPEAT:
            for ( waitCnt = 0; waitCnt < 250 && !UsbCdc_TxReady(); waitCnt++ )
            {
                mDelaymS( 2 );
            }
            UsbCdc_TxSend( KeyRepeatMsg, sizeof(KeyRepeatMsg) - 1 );
            break;

        default:
            break;
    }
}

/*******************************************************************************
* Function Name  : UsbCmd_Poll
* Description    : 纯 USB-CDC 命令轮询(永不返回)
*                  设备未枚举完成时仅空转; 枚举完成后:
*                   - USB 收到数据:
*                     逐字节喂 usbapp 滑动匹配: "help"/"?"/"download"/
*                     "led_on"/"led_off" 命中即执行(免回车)。
*                   - 检查按键事件并上报到 USB-CDC
*                  本设备为纯 USB-CDC 命令口, 不使用 UART1。
*******************************************************************************/
/*******************************************************************************
* Function Name  : UsbCmd_Poll()
* Description    : 纯 USB-CDC 命令轮询(永不返回)
*                  设备未枚举完成时仅空转; 枚举完成后:
*                   - USB 收到数据:
*                     逐字节喂 usbapp 滑动匹配: "help"/"?"/"download"/
*                     "led_on"/"led_off" 命中即执行(免回车)。
*                   - 检查按键事件并上报到 USB-CDC
*                  本设备为纯 USB-CDC 命令口, 不使用 UART1。
*******************************************************************************/
static void UsbCmd_Poll(void)
{
    KeyEventMsg key_msg;

    while(1)
    {
        if(!UsbCdc_IsConfigured())                                       /* 主机未枚举完成 */
        {
            continue;                                                    /* 空转 */
        }

        /* ---- USB(主机) 数据/命令 ---- */
        if(UsbCdc_RxBytes())                                             /* USB 端点收到数据 */
        {
            uint8_t usbByte = UsbCdc_RxRead();                           /* 读取1字节 */

            UsbApp_Feed( usbByte );                                      /* 快捷命令滑动匹配 */
            UsbCdc_RxDone();
        }

        /* ---- 按键事件轮询 ---- */
        if (key_event_get(&key_msg))
        {
            key_event_report(&key_msg.event);                            /* 上报按键事件到USB-CDC */
        }
    }
}

/*******************************************************************************
* Function Name  : main
* Description    : 初始化 + 命令轮询
*******************************************************************************/
void main(void)
{
    CfgFsys();                                                           /* CH554 时钟配置 */

    P3_MOD_OC &= ~0x01;                                                  /* P3.0 推挽输出(LED) */
    P3_DIR_PU |= 0x01;                                                   /* P3.0 方向为输出 */
    P3 &= ~0x01;                                                         /* P3.0 输出低电平, LED 熄灭 */

    mDelaymS(5);                                                         /* 等待内部晶振稳定, 必须添加 */

    /* 定时器0 初始化：1ms 中断 @ 24MHz (用于按键扫描) */
    /* CH554定时器时钟需要通过T2MOD寄存器明确配置! */
    T2MOD |= bT0_CLK;                                                    /* 设置Timer0时钟为Fsys/4(快速模式) */

    TMOD = (TMOD & 0xF0) | 0x01;                                         /* T0 模式1(16位定时器) */
    /* 精确校准(基于实测500次=512ms, 目标500ms):
       原计数值6096ticks→512ms, 目标: 6096×500/512≈5954ticks
       重载值 = 65536 - 5954 = 59582 = 0xE8FE */
    TH0 = 0xE8;                                                          /* 重载值高字节(微调后) */
    TL0 = 0xFE;                                                          /* 重载值低字节(微调后, ~1ms) */
    ET0 = 1;                                                             /* 允许T0中断 */
    TR0 = 1;                                                             /* 启动T0 */

    /* 纯 USB-CDC 命令口: 不使用 UART0/UART1(悬空 RXD 采样噪声会污染
       USB-CDC 上传通路)。命令回显全部经 USB 虚拟串口输出 */
    UsbCdc_Init();                                                       /* USB-CDC 模块初始化 */

    key_init();                                                          /* 按键模块初始化(含P1.2 GPIO配置) */

    EA = 1;                                                              /* 开启总中断 */

    mDelaymS(100);                                                        /* 等待USB枚举完成 */

    UsbCmd_Poll();                                                       /* 命令轮询(不返回) */
}

/*******************************************************************************
* Function Name  : Timer0Interrupt()
* Description    : T0 按键扫描定时器中断服务(1ms/tick)。
*                  SDCC 完整中断向量表只由"含 main() 的编译单元"生成,
*                  故 T0 ISR 亦须定义于本文件。
*******************************************************************************/
void Timer0Interrupt(void) __interrupt (INT_NO_TMR0)                     /* T0 中断服务 */
{
    key_timer_tick();                                                     /* 按键节拍累加与扫描 */

    /* 模式1(16位定时器)不会自动重载, 必须手动重新加载! */
    TH0 = 0xE8;                                                          /* 重载高字节 */
    TL0 = 0xFE;                                                          /* 重载低字节(~1ms, 微调后) */
}

/*******************************************************************************
* Function Name  : DeviceInterrupt()
* Description    : USB 中断服务薄壳: 向量表只由本文件(含 main())生成, 故 ISR
*                  必须定义于此; 实际处理主体见 usbcdc 模块
*                  (UsbCdc_DeviceInterrupt)。
*******************************************************************************/
void DeviceInterrupt(void) __interrupt (INT_NO_USB)                      /* USB 中断服务 */
{
    UsbCdc_DeviceInterrupt();
}