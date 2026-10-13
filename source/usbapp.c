/********************************** (C) COPYRIGHT *******************************
* File Name          : usbapp.c
* Author             : WCH / 本工程
* Version            : V1.0
* Date               : 2017/03/01
* Description        : CH55x USB 应用层命令解析模块(自 main.c 抽取, 独立可扩展)
*                      - 无参数快捷命令: "help"/"?"(回发帮助横幅) / "download"
*                        (回复并跳入内置 Bootloader, 处理器执行后永不返回) /
*                        "led_on"/"led_off"(控制 P3.0 LED, 高电平点亮);
*                        对 USB-CDC 字节流做"滑动匹配"识别(免回车, UsbApp_Feed);
*                      - 命令处理器运行于主循环上下文, 勿在中断中调用本模块。
*******************************************************************************/
#include <stdint.h>
#include <string.h>                 /* memmove: 滑动窗口 */

#include <ch554.h>
#include <debug.h>                  /* mDelaymS */
#include <bootloader.h>
#include <usbcdc.h>
#include <usbapp.h>

/* Bootloader 入口函数指针(见 bootloader.h): 唯一定义点 */
void (* __data bootloader)(void) = (void (*)(void))BOOT_ADDR;

/* ==================== 无参数快捷命令表(滑动匹配) ====================
   每行格式: X("命令串", 处理器函数名); 命令最长不超过
   USBAPP_CMD_MAX_LEN(见 usbapp.h)。 */
#define USBAPP_CMD_TABLE(X)                  \
    X("help",     UsbApp_Help)               \
    X("?",        UsbApp_Help)               \
    X("download", UsbApp_HandleDownload)     \
    X("led_on",   UsbApp_LedOn)              \
    X("led_off",  UsbApp_LedOff)

#define USBAPP_CMD_PROTO(name, fn)  void fn(void);
USBAPP_CMD_TABLE(USBAPP_CMD_PROTO)

#define USBAPP_CMD_ITEM(name, fn)  { name, sizeof(name) - 1, fn },
__code UsbAppCmdItem UsbAppCmdTable[] =
{
    USBAPP_CMD_TABLE(USBAPP_CMD_ITEM)
};
#define USBAPP_CMD_COUNT  (sizeof(UsbAppCmdTable) / sizeof(UsbAppCmdItem))

/* ==================== 滑动匹配窗口(快捷命令用) ====================
   窗口放 xdata(命令流量小, 读写略慢无碍), 为内部 RAM(data/idata)减负 */
__xdata uint8_t UsbAppWin[USBAPP_CMD_MAX_LEN];
__xdata uint8_t UsbAppWinLen = 0;

/*******************************************************************************
* Function Name  : UsbApp_Reset
* Description    : 复位解析状态(清空窗口残留字节)
*******************************************************************************/
void UsbApp_Reset(void)
{
    UsbAppWinLen = 0;
}

/*******************************************************************************
* Function Name  : UsbApp_Feed
* Description    : 喂入 1 字节做滑动匹配(窗口尾部 == 命令即命中, 免回车).
* Return         : 0=普通数据  1=命中命令(处理器已执行)
*******************************************************************************/
uint8_t UsbApp_Feed(uint8_t byte)
{
    uint8_t i, j, k;

    if ( UsbAppWinLen < USBAPP_CMD_MAX_LEN )
    {
        UsbAppWin[UsbAppWinLen++] = byte;
    }
    else
    {
        memmove( &UsbAppWin[0], &UsbAppWin[1], USBAPP_CMD_MAX_LEN - 1 );
        UsbAppWin[USBAPP_CMD_MAX_LEN - 1] = byte;
    }
    for ( i = 0; i < USBAPP_CMD_COUNT; i++ )
    {
        if ( UsbAppWinLen >= UsbAppCmdTable[i].len )
        {
            k = UsbAppWinLen - UsbAppCmdTable[i].len;
            for ( j = 0; j < UsbAppCmdTable[i].len; j++ )
            {
                if ( UsbAppWin[k + j] != UsbAppCmdTable[i].cmd[j] )
                    break;
            }
            if ( j == UsbAppCmdTable[i].len )
            {
                UsbAppWinLen = 0;
                UsbAppCmdTable[i].handler();
                return 1;
            }
        }
    }
    return 0;
}

/*******************************************************************************
* Function Name  : UsbApp_HandleDownload
* Description    : "download": 回复主机 -> 干净关闭 USB 引擎 -> 跳内置 Bootloader。
*                  执行后永不返回。
*******************************************************************************/
__code uint8_t BootloaderMsg[] = "Enter bootloader\r\n";

void UsbApp_HandleDownload(void)
{
    uint8_t waitCnt;

    for ( waitCnt = 0; waitCnt < 250 && !UsbCdc_TxReady(); waitCnt++ )
    {
        mDelaymS( 2 );
    }
    UsbCdc_TxSend( BootloaderMsg, sizeof(BootloaderMsg) - 1 );
    for ( waitCnt = 0; waitCnt < 250 && !UsbCdc_TxReady(); waitCnt++ )
    {
        mDelaymS( 2 );
    }
    USB_INT_EN = 0;
    USB_CTRL = 0x06;
    mDelaymS( 100 );
    EA = 0;
    bootloader();
    while( 1 );
}

/* ==================== 通用回发(code 串): 等待 IN 空闲后发送 ==================== */
static void UsbApp_Reply(const __code uint8_t *msg, uint8_t len)
{
    uint8_t waitCnt;
    for ( waitCnt = 0; waitCnt < 250 && !UsbCdc_TxReady(); waitCnt++ )
    {
        mDelaymS( 2 );
    }
    UsbCdc_TxSend( msg, len );
}

/* ==================== 帮助横幅(分段, 每段<=64B 单包) ==================== */
__code uint8_t UsbHelp0[] = "CH552 USB-CDC Command Interface\r\n";
__code uint8_t UsbHelp1[] = "cmds: help ? download led_on led_off\r\n";

typedef struct { __code uint8_t *p; uint8_t n; } UsbHelpSeg;
#define HELP_SEG(name)  { name, sizeof(name) - 1 }
static __code UsbHelpSeg gHelpSegs[] =
{
    HELP_SEG(UsbHelp0),
    HELP_SEG(UsbHelp1),
};

void UsbApp_Help(void)
{
    uint8_t i;
    for ( i = 0; i < sizeof(gHelpSegs) / sizeof(gHelpSegs[0]); i++ )
    {
        UsbApp_Reply( gHelpSegs[i].p, gHelpSegs[i].n );
    }
}

/* ==================== LED 命令 ==================== */
__code uint8_t UsbAppLedOnMsg[]  = "LED ON\r\n";
__code uint8_t UsbAppLedOffMsg[] = "LED OFF\r\n";

void UsbApp_LedOn(void)
{
    P3 |= 0x01;
    UsbApp_Reply( UsbAppLedOnMsg, sizeof(UsbAppLedOnMsg) - 1 );
}

void UsbApp_LedOff(void)
{
    P3 &= ~0x01;
    UsbApp_Reply( UsbAppLedOffMsg, sizeof(UsbAppLedOffMsg) - 1 );
}