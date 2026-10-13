# CH554 USB-CDC 按键控制项目

基于 CH554 微控制器的 USB-CDC 虚拟串口通信项目，支持 LED 控制和按键事件检测。

## 📋 功能特性

- **USB-CDC 虚拟串口**：通过 USB 实现串口通信，无需额外 USB-TTL 转换器
- **LED 控制**：通过命令控制 P3.0 引脚的 LED 亮灭
- **按键检测**：支持 P1.2 引脚按键的三种事件类型
  - 短按（SHORT_PRESS）
  - 长按（LONG_PRESS，约 1 秒）
  - 连续按（REPEAT，长按后每 300ms 触发一次）
- **精确时基**：基于 Timer0 的 1ms 中断，误差 < 2%
- **非阻塞架构**：按键采用状态机 + 事件驱动，不占用主循环

## 🔧 硬件要求

### 主控芯片
- **CH554** (或 CH552/CH550 兼容系列)
- 系统时钟：24 MHz（内部振荡器）

### 外部硬件
| 功能 | 引脚 | 说明 |
|------|------|------|
| **LED** | P3.0 | 低电平点亮，推挽输出 |
| **按键** | P1.2 | 低电平有效，内部上拉电阻 |
| **USB** | D+/D- | USB 2.0 Full Speed |

### 硬件连接示例
```
CH554                    外部电路
┌──────┐                ┌─────────┐
│      │    P3.0 ───────┤ LED ├─┤ GND │ (串联220Ω电阻)
│      │                └─────────┘
│  CH554│
│      │    P1.2 ───────┤ 按键 ├─┤ GND │
│      │                └─────────┘
│      │
│      │    D+  ─────── USB D+ (数据线)
│      │    D-  ─────── USB D- (数据线)
│      │    VCC ─────── USB 5V (供电)
│      │    GND ─────── USB GND
└──────┘
```

## 📦 编译环境

### 必需工具
- **SDCC** (Small Device C Compiler) for 8051
  - 下载地址：http://sdcc.sourceforge.net/
  - 推荐版本：SDCC 4.2.0 或更高

- **WCHISPTool** (烧录工具)
  - 下载地址：WCH 官网
  - 位于 `tools/WCHISPTool_CH54x-55x.zip`

### 编译步骤

#### 方法一：使用 Make（推荐）

```bash
# 进入项目目录
cd usb_device_cdc

# 编译（生成 build/usb_device_cdc.bin 和 .hex）
make all

# 清理编译产物
make clean

# 编译并烧录
make flash
```

#### 方法二：使用批处理脚本（Windows）

```bash
# 编译
.\build.bat

# 烧录
.\flash.bat
```

### 编译选项（Makefile）

```makefile
FREQ_SYS   ?= 24000000    # 系统频率 (Hz)
XRAM_SIZE  ?= 0x0300      # 外部 RAM 大小 (768 字节)
XRAM_LOC   ?= 0x0100      # 外部 RAM 起始地址
CODE_SIZE  ?= 0x3800      # 代码空间大小 (14 KB)
```

## 🚀 烧录方法

### 1. 进入引导模式

CH554 支持通过 USB 自动进入下载模式：

1. **断开 USB**
2. **按住按键**（可选，某些板子需要）
3. **连接 USB**
4. **松开按键**（如果按住了）
5. 设备会自动进入 ISP 下载模式

### 2. 使用 WCHISPTool 烧录

```bash
# Linux/macOS
wchisptool -g -f build/usb_device_cdc.bin

# Windows (使用提供的脚本)
.\flash.bat
```

### 3. 验证烧录

烧录成功后，设备会自动复位并运行用户程序。

## 💻 使用说明

### 1. 连接设备

1. 将 CH554 通过 USB 连接到电脑
2. 电脑会识别为 **USB Serial Device**（COM 端口）
3. 打开串口助手软件（如 PuTTY、Tera Term、SecureCRT 等）
4. 选择对应的 COM 端口，波特率可任意设置（USB-CDC 不受波特率限制）

### 2. USB-CDC 命令

设备支持以下命令（**无需回车，实时匹配**）：

| 命令 | 功能 | 示例输出 |
|------|------|----------|
| `help` | 显示帮助信息 | `USB-CDC CMD: help/?/download/led_on/led_off` |
| `?` | 同 `help` | 同上 |
| `led_on` | 点亮 LED | `LED ON` |
| `led_off` | 熄灭 LED | `LED OFF` |
| `download` | 进入 Bootloader 模式 | `Enter download mode...` |

**使用示例：**
```
# 在串口助手中直接输入（不需要按回车）:
led_on     → 立即执行，返回 "LED ON"
led_off    → 立即执行，返回 "LED OFF"
help       → 显示可用命令列表
```

### 3. 按键事件

按下 P1.2 引脚的按键后，设备会自动上报按键事件到 USB-CDC：

#### 事件类型

| 事件 | 触发条件 | 输出格式 | 典型应用 |
|------|----------|----------|----------|
| **SHORT_PRESS** | 按下时间 < 1 秒 | `KEY: SHORT_PRESS` | 单击、切换状态 |
| **LONG_PRESS** | 按下时间 ≥ 1 秒 | `KEY: LONG_PRESS` | 长按菜单、特殊功能 |
| **REPEAT** | 长按后每 300ms | `KEY: REPEAT` | 连续调节、快进 |

#### 时序图

```
时间轴:  0ms     1000ms   1300ms   1600ms   1900ms ...
         │        │        │        │        │
         ▼        ▼        ▼        ▼        ▼
按下 ─────────────────────────────────────────────
         │                 │        │        │
         │←── 1秒 ─────────┤←300ms→│←300ms→│
         │                 │        │        │
输出:    SHORT_PRESS(释放时) LONG_PRESS  REPEAT   REPEAT  ...
```

**实际输出示例：**
```
[14:15:50.123] KEY: SHORT_PRESS          ← 快速按一下
[14:15:50.754] KEY: LONG_PRESS           ← 按住1秒
[14:15:51.051] KEY: REPEAT              ← 继续按住
[14:15:51.349] KEY: REPEAT              ← 每300ms一次
[14:15:51.646] KEY: REPEAT
...
[14:15:52.100]                          ← 释放按键（无输出）
```

## 🏗️ 项目结构

```
usb_device_cdc/
├── README.md                  # 本文档
├── Makefile                   # Make 构建脚本
├── build.bat                  # Windows 编译脚本
├── flash.bat                  # Windows 烧录脚本
├── flash.ps1                  # PowerShell 烧录脚本
│
├── source/                    # 源代码目录（参与编译的文件）
│   ├── main.c                 # 主程序（初始化 + 主循环 + ISR）
│   ├── usbcdc.c               # USB-CDC 协议栈
│   ├── usbcdc.h               # USB-CDC 头文件
│   ├── usbapp.c               # 应用层命令解析
│   ├── usbapp.h               # 命令解析头文件
│   ├── key.c                  # 按键扫描模块
│   ├── key.h                  # 按键模块头文件
│   ├── debug.c                # 调试库（时钟配置、延时函数）
│   ├── debug.h                # 调试库头文件
│   ├── ch554.h                # CH554 寄存器定义
│   ├── ch554_usb.h            # USB 寄存器定义
│   ├── ch554_datatypes.h      # 数据类型定义
│   └── bootloader.h           # Bootloader 相关定义
│
├── other_source/              # 未使用的外设驱动（备用）
│   ├── adc.c / adc.h          # ADC 模数转换
│   ├── eeprom.c / eeprom.h    # EEPROM 存储
│   ├── i2c.c / i2c.h          # I2C 通信
│   ├── pwm.h                  # PWM 脉宽调制
│   ├── remote.c / remote.h    # 红外/无线遥控
│   ├── spi.c / spi.h          # SPI 通信
│   └── touchkey.c / touchkey.h # 触摸按键
│
├── build/                     # 编译输出目录
│   ├── usb_device_cdc.bin     # 二进制固件（用于烧录）
│   ├── usb_device_cdc.hex     # Intel HEX 格式
│   ├── usb_device_cdc.ihx     # SDCC 输出格式
│   └── *.rel, *.asm, *.lst   # 编译中间文件
│
└── tools/
    └── WCHISPTool_CH54x-55x.zip  # 烧录工具
```

## ⚙️ 技术细节

### Timer0 配置（关键！）

本项目使用 Timer0 实现 1ms 精确定时中断，用于按键扫描。**特别注意以下两点：**

#### 1. 定时器时钟源配置

CH554 的定时器时钟必须通过 `T2MOD` 寄存器明确配置：

```c
T2MOD |= bT0_CLK;  // 设置 Timer0 时钟为 Fsys/4 = 6MHz
```

**如果不配置，Timer0 会使用未知的默认时钟，导致时基严重偏差！**

#### 2. 模式1 手动重载

Timer0 使用模式1（16位定时器），**该模式不会自动重载计数器**，必须在 ISR 中手动重新加载：

```c
void Timer0Interrupt(void) __interrupt (INT_NO_TMR0)
{
    key_timer_tick();  // 按键扫描

    // 关键！必须手动重载，否则修改 TH0/TL0 无效！
    TH0 = 0xE8;
    TL0 = 0xFE;
}
```

**当前参数（精确校准后）：**

| 参数 | 值 | 说明 |
|------|-----|------|
| T2MOD | bT0_CLK = 1 | Timer0 时钟 = Fsys/4 = 6 MHz |
| TMOD | 模式1 | 16 位定时器 |
| TH0:TL0 | 0xE8FE | 重载值，计数值 = 5890 ticks |
| 实际周期 | ~0.98 ms | 误差 < 2% |
| 扫描周期 | ~9.8 ms | 10 次中断扫描一次按键 |

### 按键参数配置

在 `source/key.h` 中可以调整按键时序：

```c
#define SCAN_TICK_DIV          10      // 每 10ms 扫描一次（10 × 1ms）
#define DEBOUNCE_CNT           2       // 消抖：20ms
#define SHORT_PRESS_CNT        10      // 短按：<100ms
#define LONG_PRESS_CNT         100     // 长按：≥1000ms (1秒)
#define REPEAT_INTERVAL_CNT    30      // 连续按间隔：300ms
```

### 内存使用

CH554 资源有限，本项目优化了内存使用：

- **内部 RAM (IDATA)**：256 字节（堆栈、全局变量）
- **外部 RAM (XRAM)**：768 字节（USB 缓冲区、大数组）
- **Flash (CODE)**：~14 KB（程序代码）

**关键优化：**
- 将大型数组（如 USB 缓冲区、按键事件队列）放在 XRAM
- 使用 `__xdata` 关键字显式指定外部 RAM
- 避免在 ISR 中使用大量局部变量

## 🐛 常见问题

### Q1: 编译报错 "RAM overflow"

**原因：** 内部 RAM (256 字节) 超限。

**解决方案：**
1. 检查是否有大数组未放在 XRAM
2. 使用 `__xdata` 关键字将大数组移到外部 RAM
3. 减少全局变量数量

**示例：**
```c
// 错误：占用内部 RAM
uint8_t big_buffer[512];

// 正确：使用外部 RAM
__xdata uint8_t big_buffer[512];
```

### Q2: USB 无法枚举

**可能原因及解决方案：**

1. **USB 线缆问题**
   - 使用数据线（不仅是充电线）
   - 尝试更换 USB 线

2. **时钟未稳定**
   - 确保 `mDelaymS(5)` 在 USB 初始化前调用
   - 检查 `CfgFsys()` 是否正确配置

3. **驱动问题**
   - Windows 10+ 通常自动识别
   - 较旧系统可能需要安装 CDC 驱动

### Q3: 按键无响应

**检查项：**

1. **引脚冲突**
   - P3.6 不能用作按键（复用 USB D-）
   - 当前使用 P1.2，确保无冲突

2. **上拉电阻**
   - 代码中已启用内部上拉：`P1_DIR_PU |= 0x04`
   - 如果外部有强下拉，可能导致无法检测

3. **消抖时间**
   - 如果按键过于灵敏，增加 `DEBOUNCE_CNT`
   - 如果按键不灵敏，减少 `DEBOUNCE_CNT`

### Q4: 时基不准确

**如果发现按键时间不准：**

1. **确认 T2MOD 已配置**
   ```c
   T2MOD |= bT0_CLK;  // 必须有这行！
   ```

2. **确认 ISR 中有手动重载**
   ```c
   void Timer0Interrupt() {
       key_timer_tick();
       TH0 = 0xE8;  // 必须重载！
       TL0 = 0xFE;
   }
   ```

3. **微调 TH0/TL0 值**
   - 如果太慢：减小 TH0/TL0（减少计数值）
   - 如果太快：增大 TH0/TL0（增加计数值）

### Q5: 烧录失败

**解决方案：**

1. **重新进入 ISP 模式**
   - 断开 USB
   - 按住板载按键（如果有）
   - 重新连接 USB
   - 松开按键

2. **检查 WCHISPTool 版本**
   - 使用最新版本
   - 确认支持 CH554

3. **权限问题（Linux）**
   - 添加 udev 规则
   - 或使用 `sudo`

## 📝 修改历史

### v1.1.0 (当前版本)
- ✅ 修复 Timer0 时基问题（从 35 秒修正到 1 秒）
- ✅ 添加 T2MOD 时钟源配置
- ✅ 添加 ISR 手动重载机制
- ✅ 精确校准 TH0/TL0 参数（误差 < 2%）
- ✅ 移除 EEPROM 编程功能
- ✅ 移除 Remote 模块（红外/无线遥控）
- ✅ 按键引脚从 P3.6 改为 P1.2（避免与 USB D- 冲突）
- ✅ 清理所有调试代码

### v1.0.0 (初始版本)
- 基于 CH554 SDK 的 USB-CDC 示例
- 基本的 USB 通信功能
- LED 控制
- Bootloader 支持

## 📄 许可证

本项目基于 WCH 官方 SDK 修改，遵循原始许可证。

## 🙏 致谢

- [WCH](http://www.wch.cn/) - 提供 CH554 芯片和开发工具
- [SDCC](http://sdcc.sourceforge.net/) - 开源 8051 编译器
- 按键模块参考了社区开源实现

---

**如有问题或建议，欢迎提交 Issue！**