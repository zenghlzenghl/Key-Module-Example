#include "key.h"
#include <reg52.h>

/* ===================== 按键硬件定义 ===================== */
/* 低电平表示按下；按实际电路调整 IO */
sbit KEY0 = P1^0;
sbit KEY1 = P1^1;
sbit KEY2 = P1^2;
sbit KEY3 = P1^3;

/* ===================== 状态机状态 ===================== */
typedef enum 
{
    KEY_ST_IDLE = 0,
    KEY_ST_DEBOUNCE_PRESS,
    KEY_ST_PRESS,
    KEY_ST_DEBOUNCE_RELEASE,
    KEY_ST_LONG_PRESS
} KeyState;

typedef struct 
{
    KeyState     state;
    unsigned int timer;
    unsigned char long_triggered;
} KeyCtrl;

static KeyCtrl g_keys[KEY_NUM];

/* ===================== 环形事件缓冲（ISR 写入，主循环读取） ===================== */
static volatile KeyEventMsg g_evt_buf[EVENT_BUF_SIZE];
static volatile unsigned char g_evt_wr = 0;   /* 写指针 */
static volatile unsigned char g_evt_rd = 0;   /* 读指针 */

static void evt_push(unsigned char id, KeyEvent ev)
{
    unsigned char next = (g_evt_wr + 1) % EVENT_BUF_SIZE;
    if (next != g_evt_rd)   /* 缓冲未满才写入 */
    {
        g_evt_buf[g_evt_wr].key_id = id;
        g_evt_buf[g_evt_wr].event  = ev;
        g_evt_wr = next;
    }
}

static unsigned char evt_pop(KeyEventMsg *out)
{
    if (g_evt_rd == g_evt_wr) return 0;   /* 空 */
    *out = g_evt_buf[g_evt_rd];
    g_evt_rd = (g_evt_rd + 1) % EVENT_BUF_SIZE;
    return 1;
}

/* ===================== 读取单个按键电平 ===================== */
static unsigned char key_is_pressed(unsigned char id)
{
    switch (id)
    {
        case 0: return (KEY0 == 0) ? 1 : 0;
        case 1: return (KEY1 == 0) ? 1 : 0;
        case 2: return (KEY2 == 0) ? 1 : 0;
        case 3: return (KEY3 == 0) ? 1 : 0;
        default: return 0;
    }
}

/* ===================== 单个按键扫描（非阻塞状态机） ===================== */
static KeyEvent key_scan_one(unsigned char id)
{
    KeyCtrl *k = &g_keys[id];
    unsigned char pressed = key_is_pressed(id);
    KeyEvent ev = KEY_EVENT_NONE;

    switch (k->state)
    {
        case KEY_ST_IDLE:
            if (pressed)
            {
                k->state = KEY_ST_DEBOUNCE_PRESS;
                k->timer = 0;
            }
            break;

        case KEY_ST_DEBOUNCE_PRESS:
            if (pressed)
            {
                if (++k->timer >= DEBOUNCE_CNT)
                {
                    k->state = KEY_ST_PRESS;
                    k->timer = 0;
                    k->long_triggered = 0;
                }
            }
            else
            {
                k->state = KEY_ST_IDLE;
                k->timer = 0;
            }
            break;

        case KEY_ST_PRESS:
            if (pressed)
            {
                if (++k->timer >= LONG_PRESS_CNT)
                {
                    ev = KEY_EVENT_LONG_PRESS;
                    k->long_triggered = 1;     /* 只产生一次长按 */
                    k->state = KEY_ST_LONG_PRESS;
                    k->timer = 0;
                }
            }
            else
            {
                k->state = KEY_ST_DEBOUNCE_RELEASE;
                k->timer = 0;
            }
            break;

        case KEY_ST_DEBOUNCE_RELEASE:
            if (!pressed)
            {
                if (++k->timer >= DEBOUNCE_CNT)
                {
                    if (!k->long_triggered)
                        ev = KEY_EVENT_SHORT_PRESS;   /* 约束1&2：释放且未长按 -> 短按 */
                    k->state = KEY_ST_IDLE;
                    k->timer = 0;
                }
            }
            else
            {
                k->state = KEY_ST_PRESS;
                k->timer = 0;
            }
            break;

        case KEY_ST_LONG_PRESS:
            if (pressed)
            {
                if (++k->timer >= REPEAT_INTERVAL_CNT)
                {
                    ev = KEY_EVENT_REPEAT;            /* 约束3：连续按只产生 REPEAT */
                    k->timer = 0;
                }
            }
            else
            {
                k->state = KEY_ST_IDLE;
                k->timer = 0;
                k->long_triggered = 0;
            }
            break;

        default:
            k->state = KEY_ST_IDLE;
            k->timer = 0;
            break;
    }
    return ev;
}

/* ===================== 对外接口实现 ===================== */

void key_init(void)
{
    unsigned char i;
    for (i = 0; i < KEY_NUM; i++)
    {
        g_keys[i].state = KEY_ST_IDLE;
        g_keys[i].timer = 0;
        g_keys[i].long_triggered = 0;
    }
    g_evt_wr = 0;
    g_evt_rd = 0;
}

void key_timer_tick(void)
{
    static volatile unsigned int ms_tick = 0;

    if (++ms_tick >= SCAN_TICK_DIV)
    {
        unsigned char i;
        ms_tick = 0;
        for (i = 0; i < KEY_NUM; i++)
        {
            KeyEvent ev = key_scan_one(i);
            if (ev != KEY_EVENT_NONE)
                evt_push(i, ev);
        }
    }
}

unsigned char key_event_get(KeyEventMsg *out)
{
    return evt_pop(out);
}
