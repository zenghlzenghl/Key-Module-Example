TARGET = usb_device_cdc

# Out-of-tree build: all generated files go into the build/ directory.
THIS_DIR  := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
BUILD_DIR := $(THIS_DIR)build
SRC_DIR   := $(THIS_DIR)source
# 头文件(*.h)与源文件(*.c)同置于 source/, 编译时经同目录双引号规则解析

# Toolchain (add the SDCC bin directory to PATH)
CC       = sdcc
OBJCOPY  = sdobjcopy
PACK_HEX = packihx
WCHISP  ?= wchisptool -g -f

FREQ_SYS  ?= 24000000
XRAM_SIZE ?= 0x0300
XRAM_LOC  ?= 0x0100
CODE_SIZE ?= 0x3800

CFLAGS := -V -mmcs51 --model-small \
	--xram-size $(XRAM_SIZE) --xram-loc $(XRAM_LOC) \
	--code-size $(CODE_SIZE) \
	-I$(SRC_DIR) -DFREQ_SYS=$(FREQ_SYS) \
	$(EXTRA_FLAGS)

LFLAGS := $(CFLAGS)

# Source files: 工程自包含
#   source/main.c     应用层(主循环 + USB/TIMER0 中断服务, 向量表限制见 main.c)
#   source/usbcdc.c   USB-CDC 模块(端点/描述符/CDC 类请求/数据通路)
#   source/usbapp.c   USB 应用命令解析(快捷命令滑动匹配)
#   source/key.c      按键扫描模块(非阻塞状态机 + 事件驱动, P1.2 低电平有效)
#   source/debug.c    WCH 调试库(时钟/延时/printf)
# 其他未用到的外设驱动(adc/eeprom/i2c/pwm/remote/spi/touchkey)已移至 other_source/
SRC_C := $(SRC_DIR)/main.c $(SRC_DIR)/usbcdc.c $(SRC_DIR)/usbapp.c $(SRC_DIR)/key.c $(SRC_DIR)/debug.c
vpath %.c $(SRC_DIR)

# Object files live in the build directory
RELS := $(addprefix $(BUILD_DIR)/, $(notdir $(SRC_C:.c=.rel)))

# 头文件(*.h)是全部 .rel 的依赖: 任何 .h 变更都会触发全量重编
$(RELS): $(wildcard $(SRC_DIR)/*.h)

print-%  : ; @echo $* = $($*)

$(BUILD_DIR):
	@mkdir -p $@

$(BUILD_DIR)/%.rel: %.c | $(BUILD_DIR)
	cd $(BUILD_DIR) && $(CC) -c $(CFLAGS) $(abspath $<)

$(BUILD_DIR)/$(TARGET).ihx: $(RELS)
	cd $(BUILD_DIR) && $(CC) $(notdir $(RELS)) $(LFLAGS) -o $(TARGET).ihx

$(BUILD_DIR)/$(TARGET).hex: $(BUILD_DIR)/$(TARGET).ihx
	cd $(BUILD_DIR) && $(PACK_HEX) $(TARGET).ihx > $(TARGET).hex

$(BUILD_DIR)/$(TARGET).bin: $(BUILD_DIR)/$(TARGET).ihx
	cd $(BUILD_DIR) && $(OBJCOPY) -I ihex -O binary $(TARGET).ihx $(TARGET).bin

pre-flash:

flash: $(BUILD_DIR)/$(TARGET).bin pre-flash
	$(WCHISP) $(BUILD_DIR)/$(TARGET).bin

.DEFAULT_GOAL := all
all: $(BUILD_DIR)/$(TARGET).bin $(BUILD_DIR)/$(TARGET).hex

clean:
	rm -rf $(BUILD_DIR)/*