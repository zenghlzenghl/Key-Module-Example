#ifndef __KEY_H__
#define __KEY_H__

/* ===================== 配置参数 ===================== */
#define KEY_NUM                4       /* 按键数量 */
#define SCAN_TICK_DIV          10      /* 每 10ms 扫描一次（1ms 中断计数到 10） */
#define DEBOUNCE_CNT           2       /* 消抖：20ms */
#define LONG_PRESS_CNT         100     /* 长按：1000ms */
#define REPEAT_INTERVAL_CNT    30      /* 连续按间隔：300ms */

#define EVENT_BUF_SIZE         16      /* 事件环形缓冲大小 */

/* ===================== 事件类型 ===================== */
typedef enum 
{
    KEY_EVENT_NONE = 0,
    KEY_EVENT_SHORT_PRESS,   /* 短按（释放时产生） */
    KEY_EVENT_LONG_PRESS,    /* 长按（到时立即产生，只一次） */
    KEY_EVENT_REPEAT         /* 连续按（长按后周期产生） */
} KeyEvent;

/* 按键事件消息：标识哪个按键产生了什么事件 */
typedef struct 
{
    unsigned char key_id;    /* 按键索引 0~KEY_NUM-1 */
    KeyEvent      event;     /* 事件类型 */
} KeyEventMsg;

/* ===================== 对外接口 ===================== */

/* 按键模块初始化：清零状态机与事件缓冲 */
void key_init(void);

/* 定时器中断中调用：每 1ms 累加节拍，到 10ms 扫描一次所有按键，
   有事件则写入环形缓冲。全程非阻塞。 */
void key_timer_tick(void);

/* 主循环中调用：从环形缓冲取出一个事件。
   返回 1 表示取到事件并填入 out；返回 0 表示缓冲空。 */
unsigned char key_event_get(KeyEventMsg *out);

#endif /* __KEY_H__ */
