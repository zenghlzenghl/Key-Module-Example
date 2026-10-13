/********************************** (C) COPYRIGHT *******************************
* File Name          : usbapp.h
* Author             : WCH / 本工程
* Version            : V1.0
* Date               : 2017/03/01
* Description        : CH55x USB 应用层命令解析模块接口
*                      - 无参数快捷命令("help"/"?"/"download"/"led_on"/"led_off")
*                        用"滑动匹配"识别(免回车, 由 main 逐字节喂入 UsbApp_Feed);
*                      - 新增快捷命令: 在 usbapp.c 的 USBAPP_CMD_TABLE 追加一行;
*                      注: 本模块仅依赖 usbcdc 对外 API, 不含 USB/UART
*                      中断服务; 中断服务仍须留在 main.c(SDCC 向量表生成限制,
*                      见 main.c)。
*******************************************************************************/
#ifndef __USBAPP_H__
#define __USBAPP_H__

#include <stdint.h>

/* 命令匹配成功后的处理回调(无参数)。下载类命令可在内部执行后不再返回。 */
typedef void (*UsbAppCmdHandler)(void);

/* 命令表项 */
typedef struct
{
    __code uint8_t   *cmd;        /* 命令字节串(存放于 code 区, 无结束符) */
    uint8_t           len;        /* 命令长度, 由表宏用 sizeof 自动求出 */
    UsbAppCmdHandler  handler;    /* 命中回调 */
} UsbAppCmdItem;

/* 内部滑动窗口大小 = 允许的单条命令最大长度。
   新增命令长度不得超过此值, 否则需同步增大(注意 RAM 占用)。 */
#define USBAPP_CMD_MAX_LEN   16

/* ==================== 解析器接口 ==================== */
/* 复位解析状态(丢弃窗口内未匹配完的字节)。
   可选: USB 总线复位 / 重新枚举后调用; 未调用也不影响滑动命中。 */
void    UsbApp_Reset(void);

/* 喂入从 USB-CDC 收到的 1 字节, 做滑动匹配。
   返回 0: 该字节不构成任何命令, 属普通数据(调用者可丢弃或转发);
   返回 1: 该字节促成了某命令的完整匹配, 其处理器已被调用
           (处理器内部处理完毕; 若处理器不返回, 本函数也不会返回)。 */
uint8_t UsbApp_Feed(uint8_t byte);

#endif /* __USBAPP_H__ */