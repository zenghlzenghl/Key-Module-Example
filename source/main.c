#include <reg52.h>
#include "key.h"

/* ===================== 指示灯硬件定义 ===================== */
sbit LED0 = P2^0;
sbit LED1 = P2^1;
sbit LED2 = P2^2;

void timer0_init(void)
{
    /* 定时器0 初始化：模式1（16位），1ms @ 11.0592MHz */
    TMOD &= 0xF0;        /* 清 T0 控制位 */
    TMOD |= 0x01;        /* T0 模式1 */
    TH0 = 0xFC;
    TL0 = 0x66;
    ET0 = 1;             /* 允许 T0 中断 */
    EA  = 1;             /* 开总中断 */
    TR0 = 1;             /* 启动 T0 */
}
/* ===================== 定时器0：1ms 中断 ===================== */
void timer0_isr(void) interrupt 1
{
    /* 12T 模式，1ms @ 11.0592MHz：TH0=0xFC, TL0=0x66 */
    TH0 = 0xFC;
    TL0 = 0x66;
    key_timer_tick();   /* 按键节拍累加与扫描 */
}

/* ===================== 主循环消费事件示例 ===================== */
static void key_event_handler(unsigned char id, KeyEvent ev)
{
    switch (ev)
    {
        case KEY_EVENT_SHORT_PRESS:
            /* 示例：短按 KEY0 翻转 LED0 指示灯 */
            if (id == 0) LED0 = !LED0;
            break;
        case KEY_EVENT_LONG_PRESS:
            /* 示例：长按 KEY1 翻转 LED1 */
            if (id == 1) LED1 = !LED1;
            break;
        case KEY_EVENT_REPEAT:
            /* 示例：连续按 KEY2 翻转 LED2 示意 */
            if (id == 2) LED2 = !LED2;
            break;
        default:
            break;
    }
}

void main(void)
{
    KeyEventMsg msg;
    timer0_init();
    key_init();    
    P2 = 0xFF;           /* P2 口作指示灯输出，初始高 */

    while (1)
    {
        if (key_event_get(&msg))
        {
            key_event_handler(msg.key_id, msg.event);
        }
        /* 主循环可放其它非阻塞任务 */
    }
}