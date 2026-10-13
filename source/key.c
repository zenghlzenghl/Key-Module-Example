#include "key.h"
#include <ch554.h>
#include <usbcdc.h>

/* ===================== 按键硬件定义 =====================
 * 硬件连接: P1.2 --[按键]-- GND
 * - 未按: P1.2 = HIGH (内部上拉)
 * - 按下: P1.2 = LOW  (被按键拉到GND)
 *
 * 使用 CH554 寄存器直接操作(兼容SDCC, 不使用sbit)
 */
#define KEY0_PIN      2       /* P1.2 */

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
    uint16_t     timer;
    uint8_t      long_triggered;
} KeyCtrl;

static __xdata KeyCtrl g_keys[KEY_NUM];

/* ===================== 环形事件缓冲（ISR 写入，主循环读取） ==================== */
static volatile __xdata KeyEventMsg g_evt_buf[EVENT_BUF_SIZE];
static volatile uint8_t g_evt_wr = 0;   /* 写指针 */
static volatile uint8_t g_evt_rd = 0;   /* 读指针 */

static void evt_push(uint8_t id, KeyEvent ev)
{
    uint8_t next = (g_evt_wr + 1) % EVENT_BUF_SIZE;
    if (next != g_evt_rd)   /* 缓冲未满才写入 */
    {
        g_evt_buf[g_evt_wr].key_id = id;
        g_evt_buf[g_evt_wr].event  = ev;
        g_evt_wr = next;
    }
}

static uint8_t evt_pop(KeyEventMsg *out)
{
    if (g_evt_rd == g_evt_wr) return 0;   /* 空 */
    *out = g_evt_buf[g_evt_rd];
    g_evt_rd = (g_evt_rd + 1) % EVENT_BUF_SIZE;
    return 1;
}

/* ===================== 读取单个按键电平 ===================== */
static uint8_t key_is_pressed(uint8_t id)
{
    if (id == 0)
    {
        return (P1 & (1 << KEY0_PIN)) ? 0 : 1;  /* P1.2 低电平=按下 */
    }
    return 0;
}

/* ===================== 单个按键扫描（非阻塞状态机） ===================== */
static KeyEvent key_scan_one(uint8_t id)
{
    KeyCtrl *k = &g_keys[id];
    uint8_t pressed = key_is_pressed(id);
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
                        ev = KEY_EVENT_SHORT_PRESS;   /* 释放且未长按 -> 短按 */
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
                    ev = KEY_EVENT_REPEAT;            /* 连续按只产生 REPEAT */
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

/* ===================== 对外接口实现 ==================== */

void key_init(void)
{
    uint8_t i;

    /* 配置P1.2为准双向口模式(带内部上拉), 低电平有效 */
    P1_MOD_OC &= ~(1 << KEY0_PIN);                              /* 推挽模式 */
    P1_DIR_PU |= (1 << KEY0_PIN);                               /* 使能内部上拉 */

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
    static volatile uint16_t ms_tick = 0;

    if (++ms_tick >= SCAN_TICK_DIV)
    {
        uint8_t i;
        ms_tick = 0;

        for (i = 0; i < KEY_NUM; i++)
        {
            KeyEvent ev = key_scan_one(i);
            if (ev != KEY_EVENT_NONE)
                evt_push(i, ev);
        }
    }
}

uint8_t key_event_get(KeyEventMsg *out)
{
    return evt_pop(out);
}