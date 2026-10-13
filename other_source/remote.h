/********************************** (C) COPYRIGHT *******************************
* File Name          : remote.h
* Author             : 本工程
* Version            : V1.0
* Description        : 红外(NEC 38k) + 无线(433M EV1527) 遥控解码模块接口
*                      - 硬件: 红外接收头(反相输出, 空闲高) OUT -> P1.5
*                              433M 接收模块(空闲低) DATA    -> P1.4
*                      - 采样: T0 定时中断(50us/tick) 电平沿检测入队(ISR 内
*                              仅记录电平跳变与宽度, 不做协议解析);
*                      - 解码: Remote_Poll() 于主循环消费队列, 流式/帧式
*                              解析 NEC 与 EV1527, 成功经 USB-CDC 主动上报
*                              一行(如 "ir a=1A c=2B" / "rf id=12345 k=3");
*                      - 查询: "rx" 命令打印最近一次解码结果(联调用)。
*                      注: T0 仅本模块使用; T0 中断服务(向量)须定义于含
*                      main() 的编译单元(SDCC 向量表限制), 处理主体为
*                      Remote_TimerTick(), 见 main.c。
*******************************************************************************/
#ifndef __REMOTE_H__
#define __REMOTE_H__

#include <stdint.h>

/* 初始化: 配置输入引脚 + 启动 T0 采样(50us/tick)。
   须在系统时钟确定、总中断已开(UsbCdc_Init 后 EA=1)之后调用。 */
void Remote_Init(void);

/* T0 中断处理主体(仅 main.c 的 T0 ISR 调用, 见 main.c)。 */
void Remote_TimerTick(void);

/* 主循环轮询: 消费采样队列, 运行 NEC/EV1527 解码, 成功即经 USB-CDC 上报。
   每次主循环迭代调用一次即可(内部无阻塞)。 */
void Remote_Poll(void);

/* "rx" 命令: 回发最近一次 IR/RF 解码结果(无则提示 none)。 */
void Remote_ReportStatus(void);

#endif /* __REMOTE_H__ */
