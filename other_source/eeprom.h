/*******************************************************************************
* File Name          : eeprom.h
* Author             : 本工程
* Description        : CH554 24C01~24C512 I2C EEPROM 编程器驱动接口
*                       - 软件 I2C(任意 GPIO 可移植), 本工程引脚:
*                           SCL = P3.3,  SDA = P3.4
*                       - 器件地址引脚 A0/A1/A2 默认接 GND(0), 见 EE_A_CFG
*                       - 支持 24C01/02/04/08/16/32/64/128/256/512,
*                         掉电默认 24C32(见 EE_TYPE_DEFAULT)
*                       - 写操作自动按页切分并在每页后 ACK 轮询写周期,
*                         任意长度/整片可编程
*******************************************************************************/
#ifndef __EEPROM_H__
#define __EEPROM_H__

#include <stdint.h>

/* 器件地址引脚 A2/A1/A0 配置(接 GND 为 0, 接 VCC 为 1):
   24C01/02/32/64/128/256/512 有效; 24C04/08/16 这些位被容量块选择占用, 置 0 */
#define EE_A_CFG           0x00

#define EE_ERR_OK          0x00    /* 成功 */
#define EE_ERR_RANGE       0x01    /* 地址/长度越界(超出当前型号容量) */
#define EE_ERR_NOACK       0x02    /* 器件无应答(未接线/器件地址引脚不对/型号不符) */
#define EE_ERR_TIMEOUT     0x03    /* 写周期等待超时 */

/* 初始化: 配置 I2C 引脚(准双向)并复位型号为默认值。
   在 main() 中调用一次即可(不依赖 USB)。 */
void    EE_Init(void);

/* 按名称设置型号(忽略大小写, 如 "24c128"/"24C32").
   name 为以 0 结尾的字符串(位于 xdata/code 均可, 逐字节读取).
   返回: 0=找到并设置, 1=未知型号 */
uint8_t EE_SetTypeByName(const uint8_t *name);

/* 当前型号信息(供上层输出/校验) */
uint8_t             EE_TypeIndex(void);      /* 0..9 */
const __code uint8_t *EE_TypeName(void);     /* 小写字符串, 如 "24c32" */
uint16_t            EE_TypeMaxAddr(void);    /* 容量-1(24C512=0xFFFF) */
uint32_t            EE_TypeCapBytes(void);   /* 容量字节数(24C512=65536) */
uint8_t             EE_TypePage(void);       /* 页写字节数 */

/* 写入 len 字节到 addr(任意长度, 内部自动按页切分 + 写周期轮询).
   data 须为 xdata 区连续缓冲(上层行命令的二进制暂存即 xdata).
   返回 EE_ERR_* */
uint8_t EE_Write(uint16_t addr, const __xdata uint8_t *data, uint16_t len);

/* 顺序读 len(1~128)字节(24C 内部地址自动递增).
   调用者负责分块循环并推进 addr; buf 须为 xdata 缓冲.
   返回 EE_ERR_* */
uint8_t EE_Read(uint16_t addr, __xdata uint8_t *buf, uint8_t len);

#endif /* __EEPROM_H__ */
