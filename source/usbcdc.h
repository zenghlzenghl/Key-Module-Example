/********************************** (C) COPYRIGHT *******************************
* File Name          : usbcdc.h
* Author             : WCH / 本工程
* Version            : V1.0
* Date               : 2017/03/01
* Description        : CH55x USB-CDC 设备模块接口(纯 CDC 命令口内核)
*                      描述符、端点缓冲、CDC 类请求处理等内部实现全部 static
*                      于 usbcdc.c, 本头仅暴露:
*                        - 初始化 / 状态 / 收发 API
*                        - 供 main.c USB 中断服务(ISR)调用的处理例程
*                      注: SDCC 的完整中断向量表只由"含 main() 的编译单元"生成,
*                      故 USB 的 ISR 必须定义于 main.c(原因说明见 source/main.c
*                      顶部注释), 本模块只提供其处理主体。
*                      本设备不使用 UART0/UART1。
*******************************************************************************/
#ifndef __USBCDC_H__
#define __USBCDC_H__

#include <stdint.h>

/* ==================== 中断处理例程(仅限 main.c 的 ISR 调用) ====================
   与中断上下文强相关, 请勿在其它地方调用。 */
void UsbCdc_DeviceInterrupt(void);      /* USB 中断处理主体, 由 DeviceInterrupt() 调用 */

/* ==================== 初始化 / 状态 ==================== */
/* USB 设备初始化: 设备模式 + 端点配置 + 中断使能 + 内部状态清零。
   须在时钟初始化完成后调用一次(其内部会置 EA=1)。 */
void    UsbCdc_Init(void);

/* 主机是否已完成 SET_CONFIGURATION(枚举成功)。返回 0/1。 */
uint8_t UsbCdc_IsConfigured(void);

/* ==================== 主机 -> 设备(CDC OUT / EP2) ==================== */
/* 当前已从主机收到、尚未取走的字节数(未处理完前不会接收下一包) */
uint8_t UsbCdc_RxBytes(void);

/* 取走 1 个字节(调用前须保证 UsbCdc_RxBytes() > 0) */
uint8_t UsbCdc_RxRead(void);

/* 每处理完 1 个字节后调用一次; 接收缓冲读空后内部自动重新应答 ACK */
void    UsbCdc_RxDone(void);

/* ==================== 设备 -> 主机(CDC IN / EP2) ==================== */
/* EP2 IN 是否空闲(上一次上传已完成, 可发起新上传)。返回 0/1。 */
uint8_t UsbCdc_TxReady(void);

/* 上传 len(1~64) 字节给主机。调用前应先保证 UsbCdc_TxReady();
   若端点忙则本次数据被丢弃。 */
void    UsbCdc_TxSend(const uint8_t *data, uint8_t len);

#endif /* __USBCDC_H__ */
