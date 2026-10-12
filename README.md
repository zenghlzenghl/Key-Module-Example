# Key Module 工程指南

## 1. 项目概述

本项目是一个基于 **8051 单片机** 的 **按键扫描模块**，采用 **非阻塞状态机** 设计，支持多种按键事件检测：

- ✅ 短按检测（释放时触发）
- ✅ 长按检测（1秒后触发一次）
- ✅ 连续按检测（长按后每300ms重复触发）

### 技术特点

| 特性 | 说明 |
|------|------|
| **架构** | 非阻塞状态机 + 事件驱动 |
| **扫描周期** | 10ms（基于1ms定时器中断） |
| **消抖时间** | 20ms |
| **长按阈值** | 1000ms |
| **连续按间隔** | 300ms |
| **事件机制** | 环形缓冲区（ISR写入，主循环读取） |
| **目标平台** | 8051单片机（AT89C52/STC89C52等）|
| **开发环境** | Keil C51 编译器 |

---

## 2. 项目结构

```
key/
├── source/                 # 源代码目录
│   ├── key.h              # 按键模块头文件（接口定义+配置参数）
│   ├── key.c              # 按键模块实现（状态机+事件缓冲）
│   └── main.c             # 主程序示例（定时器+事件处理）
├── output/                 # 编译输出目录
│   └── key.hex            # 烧录文件（HEX格式）
├── build.bat              # 构建脚本（编译+链接）
└── 工程指南.md             # 本文档
```

---

## 3. 核心模块详解

### 3.1 配置参数 ([key.h](source/key.h))

```c
#define KEY_NUM                4       // 按键数量
#define SCAN_TICK_DIV          10      // 每10ms扫描一次
#define DEBOUNCE_CNT           2       // 消抖：20ms (2×10ms)
#define LONG_PRESS_CNT         100     // 长按：1000ms (100×10ms)
#define REPEAT_INTERVAL_CNT    30      // 连续按间隔：300ms (30×10ms)
#define EVENT_BUF_SIZE         16      // 事件缓冲大小
```

**自定义建议：**
- 调整 `KEY_NUM` 以适配实际按键数量
- 根据硬件质量调整 `DEBOUNCE_CNT`（机械按键通常20-50ms）
- 根据交互需求调整 `LONG_PRESS_CNT` 和 `REPEAT_INTERVAL_CNT`

### 3.2 事件类型 ([key.h](source/key.h#L14-L19))

```c
typedef enum {
    KEY_EVENT_NONE = 0,        // 无事件
    KEY_EVENT_SHORT_PRESS,     // 短按（释放时产生）
    KEY_EVENT_LONG_PRESS,      // 长按（只产生一次）
    KEY_EVENT_REPEAT           // 连续按（长按后周期产生）
} KeyEvent;
```

### 3.3 数据结构 ([key.h](source/key.h#L21-L25))

```c
typedef struct {
    unsigned char key_id;      // 按键索引 (0 ~ KEY_NUM-1)
    KeyEvent      event;       // 事件类型
} KeyEventMsg;
```

### 3.4 对外接口 ([key.h](source/key.h#L30-L42))

#### ① 初始化函数
```c
void key_init(void);
```
- **功能**：清零所有按键状态机和事件缓冲
- **调用时机**：系统启动时调用一次

#### ② 定时器节拍函数
```c
void key_timer_tick(void);
```
- **功能**：在定时器中断中调用，累加节拍并执行扫描
- **调用频率**：每 **1ms** 调用一次
- **内部逻辑**：每累计10次（即10ms）扫描一次所有按键

#### ③ 事件获取函数
```c
unsigned char key_event_get(KeyEventMsg *out);
```
- **功能**：从环形缓冲区取出一个事件
- **返回值**：
  - `1`：成功取到事件，数据填入 `out`
  - `0`：缓冲区为空，无事件
- **调用位置**：主循环中轮询调用

---

## 4. 状态机设计 ([key.c](source/key.c))

### 4.1 状态转换图

```
                    ┌─────────────┐
                    │  IDLE（空闲） │
                    └──────┬──────┘
                           │ 检测到按下
                           ▼
               ┌───────────────────────┐
               │ DEBOUNCE_PRESS（消抖）  │◄──────┐
               └───────────┬───────────┘        │
                           │ 消抖完成且仍按下     │ 释放后重新按下
                           ▼                     │
               ┌───────────────────────┐        │
               │   PRESS（按下确认）     │───────┘
               └───────────┬───────────┘
                   ┌───────┴───────┐
                   │               │
            到时长按(1000ms)    检测到释放
                   │               │
                   ▼               ▼
    ┌─────────────────────┐  ┌────────────────────┐
    │  LONG_PRESS（长按）  │  │DEBOUNCE_RELEASE    │
    └──────────┬──────────┘  │ （释放消抖）        │
               │             └──────────┬─────────┘
     连续按间隔(300ms)                  │ 消抖完成
               │                       │
               ▼                       ▼
        产生REPEAT事件          产生SHORT_PRESS事件
               │                       │
               └───────────┬───────────┘
                           │ 检测到释放 / 消抖完成
                           ▼
                    ┌─────────────┐
                    │  IDLE（空闲）│
                    └─────────────┘
```

### 4.2 各状态说明

| 状态 | 触发条件 | 动作 | 产生事件 |
|------|---------|------|---------|
| **IDLE** | 初始状态/释放后 | 等待按下 | 无 |
| **DEBOUNCE_PRESS** | 检测到按下 | 消抖计数（20ms） | 无 |
| **PRESS** | 消抖确认按下 | 计时等待长按 | 无 |
| **DEBOUNCE_RELEASE** | 检测到释放 | 消抖计数（20ms） | **SHORT_PRESS**（若未长按）|
| **LONG_PRESS** | 按下超过1000ms | 周期计时 | **LONG_PRESS**（首次）/ **REPEAT**（后续）|

### 4.3 关键约束

1. **短按只在释放时产生**（且未触发过长按）
2. **长按只产生一次**（进入LONG_PRESS状态时）
3. **连续按只产生REPEAT事件**（不会重复产生LONG_PRESS）

---

## 5. 硬件连接 ([key.c](source/key.c#L8-L12))

### 当前配置（可修改）

```c
sbit KEY0 = P1^0;    // 按键0 → P1.0
sbit KEY1 = P1^1;    // 按键1 → P1.1
sbit KEY2 = P1^2;    // 按键2 → P1.2
sbit KEY3 = P1^3;    // 按键3 → P1.3
```

### 硬件要求

- **按键类型**：轻触开关（ tactile switch）
- **电平逻辑**：**低电平有效**（按下为0，释放为1）
- **上拉电阻**：
  - ✅ 可使用单片机内部上拉（默认）
  - ✅ 或外接 4.7KΩ~10KΩ 上拉电阻
- **电路参考**：

```
VCC ────┬───────── P1.x（MCU）
        │
       [R] 4.7KΩ（上拉，可选）
        │
       [KEY] 按键
        │
GND ────┴───────── GND
```

### 扩展按键方法

1. 修改 `KEY_NUM` 宏定义
2. 在 [key.c](source/key.c#L8-L12) 添加新的 `sbit` 定义
3. 在 [key_is_pressed()](source/key.c#L96-L107) 函数添加新的case分支

**示例（添加第5个按键）：**
```c
// key.h
#define KEY_NUM  5

// key.c
sbit KEY4 = P1^4;

static unsigned char key_is_pressed(unsigned char id)
{
    // ...原有代码...
    case 4: return (KEY4 == 0) ? 1 : 0;
    default: return 0;
}
```

---

## 6. 使用示例 ([main.c](source/main.c))

### 6.1 完整初始化流程

```c
#include <reg52.h>
#include "key.h"

void main(void)
{
    KeyEventMsg msg;
    
    // ① 初始化硬件定时器（1ms中断）
    timer0_init();
    
    // ② 初始化按键模块
    key_init();
    
    // ③ 主循环
    while (1)
    {
        // ④ 轮询获取事件
        if (key_event_get(&msg))
        {
            // ⑤ 处理事件
            handle_key_event(msg.key_id, msg.event);
        }
        
        // ⑥ 其他非阻塞任务...
    }
}
```

### 6.2 定时器配置（必须1ms中断）

```c
void timer0_init(void)
{
    TMOD &= 0xF0;    // 清除T0控制位
    TMOD |= 0x01;    // T0模式1（16位定时器）
    
    // 11.0592MHz, 12T模式, 1ms:
    TH0 = 0xFC;
    TL0 = 0x66;
    
    ET0 = 1;         // 允许T0中断
    EA  = 1;         // 开总中断
    TR0 = 1;         // 启动T0
}

void timer0_isr(void) interrupt 1
{
    TH0 = 0xFC;      // 重装初值
    TL0 = 0x66;
    
    key_timer_tick(); // ★ 必须调用此函数
}
```

### 6.3 事件处理示例

```c
void handle_key_event(unsigned char id, KeyEvent ev)
{
    switch (ev)
    {
        case KEY_EVENT_SHORT_PRESS:
            printf("KEY%d 短按\n", id);
            // 执行短按动作...
            break;
            
        case KEY_EVENT_LONG_PRESS:
            printf("KEY%d 长按\n", id);
            // 执行长按动作...
            break;
            
        case KEY_EVENT_REPEAT:
            printf("KEY%d 连续按\n", id);
            // 执行连续按动作（如音量调节）
            break;
    }
}
```

---

## 7. 构建与烧录

### 7.1 环境要求

- **操作系统**：Windows
- **编译器**：Keil C51（已配置路径：`E:\keil\C51\BIN\`）
- **烧录工具**：STC-ISP / USBASP 等（根据具体MCU型号）

### 7.2 构建命令

#### 完整构建
```bash
build.bat
```
**输出**：`output/key.hex`

#### 清理中间文件
```bash
build.bat clean
```
**保留**：仅保留 `.hex` 文件，删除 `.obj/.abs/.lst/.M51`

### 7.3 构建流程详解

[build.bat](build.bat) 脚本执行以下步骤：

1. **编译源文件**
   ```bash
   c51.exe source/main.c DEBUG OBJECT(output\main.obj) PRINT(source\main.lst)
   c51.exe source/key.c   DEBUG OBJECT(output\key.obj)   PRINT(source\key.lst)
   ```

2. **链接目标文件**
   ```bash
   bl51.exe output\main.obj,output\key.obj TO output\key.abs PRINT(output\key.M51)
   ```

3. **生成HEX文件**
   ```bash
   oh51.exe output\key.abs HEXFILE(output\key.hex)
   ```

### 7.4 修改编译器路径

如果Keil安装路径不同，请编辑 [build.bat](build.bat#L18-L21)：

```bat
set C51=你的路径\C51\BIN\c51.exe
set BL51=你的路径\C51\BIN\bl51.exe
set OH51=你的路径\C51\BIN\oh51.exe
set C51INC=你的路径\C51\INC;你的路径\C51\INC\Atmel;source
```

---

## 8. API 参考手册

### 8.1 函数列表

| 函数名 | 类型 | 参数 | 返回值 | 说明 |
|--------|------|------|--------|------|
| `key_init()` | 初始化 | void | void | 初始化按键模块 |
| `key_timer_tick()` | 中断服务 | void | void | 1ms定时器中断调用 |
| `key_event_get()` | 事件获取 | `KeyEventMsg *out` | `unsigned char` | 取出事件（1=成功，0=空）|

### 8.2 数据类型

#### KeyEvent（枚举）
```c
typedef enum {
    KEY_EVENT_NONE = 0,        // 无事件
    KEY_EVENT_SHORT_PRESS,     // 短按
    KEY_EVENT_LONG_PRESS,      // 长按
    KEY_EVENT_REPEAT           // 连续按
} KeyEvent;
```

#### KeyEventMsg（结构体）
```c
typedef struct {
    unsigned char key_id;      // 按键ID (0~KEY_NUM-1)
    KeyEvent      event;       // 事件类型
} KeyEventMsg;
```

### 8.3 使用模式总结

```
┌──────────────┐     1ms中断       ┌──────────────────┐
│  定时器中断    │ ──────────────► │  key_timer_tick() │
│  (timer0_isr) │                 │  (累加+扫描+入队)  │
└──────────────┘                  └────────┬─────────┘
                                           │ 写入
                                           ▼
                                   ┌─────────────┐
                                   │ 环形事件缓冲 │
                                   │ (volatile)  │
                                   └──────┬──────┘
                                          │ 读取
                                          ▼
┌──────────────┐     轮询调用     ┌──────────────────┐
│   主循环      │ ◄───────────── │  key_event_get()  │
│   (main)     │                 │  (出队+返回事件)   │
└──────────────┘                 └──────────────────┘
```

---

## 9. 注意事项与最佳实践

### ⚠️ 重要提醒

1. **定时器精度**
   - `key_timer_tick()` 必须 **精确每1ms调用一次**
   - 否则会导致消抖、长按时间不准

2. **中断安全**
   - 事件缓冲区使用了 `volatile` 关键字
   - `key_event_get()` 可在中断外安全调用
   - **禁止** 在中断内调用 `key_event_get()`

3. **主循环响应速度**
   - 主循环应在 **100ms 内** 至少调用一次 `key_event_get()`
   - 否则环形缓冲可能溢出丢失事件
   - 当前缓冲大小为16个事件（可通过 `EVENT_BUF_SIZE` 调整）

4. **按键数量限制**
   - 默认支持4个按键，最大理论值 **255**（受 `unsigned char` 限制）
   - 实际建议不超过 **16** 个（避免扫描耗时过长）

### ✅ 最佳实践

1. **模块化使用**
   - 将 `key.c` 和 `key.h` 作为独立模块移植到其他项目
   - 只需修改硬件定义部分（`sbit` 和 `key_is_pressed()`）

2. **事件驱动架构**
   - 采用"生产者-消费者"模式：ISR生产事件，主循环消费事件
   - 保持主循环简洁，避免阻塞操作

3. **调试技巧**
   - 通过LED或串口输出事件信息，验证按键响应
   - 示例代码已提供LED指示（见 [main.c](source/main.c#L49-L63)）

4. **性能优化**
   - 如需更快的响应，可减小 `SCAN_TICK_DIV`（如改为5，即5ms扫描）
   - 相应调整 `DEBOUNCE_CNT` 等时间参数保持不变

---

## 10. 常见问题排查

### Q1: 按键无反应
**可能原因：**
- ❌ 定时器未正确初始化或未启动
- ❌ `key_timer_tick()` 未在中断中调用
- ❌ 硬件接线错误（检查上拉电阻、IO口）
- ❌ 按键电平逻辑反了（高电平有效需修改 `key_is_pressed()`）

**解决方法：**
1. 用示波器/逻辑分析仪检查IO口电平变化
2. 在 `key_timer_tick()` 入口处翻转测试LED，确认中断正常

### Q2: 按键抖动严重（一次按下多次触发）
**可能原因：**
- ❌ `DEBOUNCE_CNT` 设置过小
- ❌ 按键质量差（接触不良）

**解决方法：**
- 增大 `DEBOUNCE_CNT`（如改为3~5，即30~50ms）
- 更换质量更好的按键
- 在硬件上加RC滤波电路（如0.1μF电容并联按键）

### Q3: 长按不触发或延迟很大
**可能原因：**
- ❌ `LONG_PRESS_CNT` 设置过大
- ❌ 定时器实际中断频率不是1ms

**解决方法：**
- 检查定时器初值计算是否正确（见6.2节）
- 用示波器测量中断周期
- 临时减小 `LONG_PRESS_CNT` 测试

### Q4: 连续按功能不需要
**解决方法：**
在事件处理函数中忽略 `KEY_EVENT_REPEAT` 即可：
```c
case KEY_EVENT_REPEAT:
    // 故意忽略，不做任何处理
    break;
```

### Q5: 如何支持矩阵键盘？
**当前模块仅支持独立按键**。如需矩阵键盘：
1. 修改 `key_is_pressed()` 实现行列扫描
2. 调整 `SCAN_TICK_DIV` 给扫描留足时间
3. 或考虑使用专用矩阵键盘扫描芯片（如TCA8418）

---

## 11. 移植指南

### 支持其他8051兼容MCU

本模块可轻松移植到任何8051内核单片机：

| 步骤 | 修改内容 | 文件 |
|------|---------|------|
| 1 | 修改按键IO口定义 | [key.c](source/key.c#L8-L12) |
| 2 | 调整定时器初值（如果晶振频率不同）| [main.c](source/main.c#L18-L22) |
| 3 | 根据需要调整 `KEY_NUM` | [key.h](source/key.h#L5) |

### 移植到其他平台（STM32/ESP32等）

核心算法（状态机+事件缓冲）是平台无关的，只需修改：

1. **硬件抽象层**：替换 `sbit` 定义为GPIO读写函数
2. **定时器驱动**：使用目标平台的定时器中断
3. **数据类型**：将 `unsigned char` 替换为 `uint8_t` 等

**预计工作量**：30分钟~1小时

---

## 12. 版本历史

| 版本 | 日期 | 说明 |
|------|------|------|
| v1.0 | 2026-10-12 | 初始版本，支持短按/长按/连续按 |

---

## 13. 许可证

本项目仅供学习和参考使用。

---

## 14. 联系方式

如有问题或建议，请提交Issue或联系开发者。

---

**文档最后更新**：2026-10-12