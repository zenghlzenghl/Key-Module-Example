#pragma once

/* 内置 Bootloader 入口地址(CH554 出厂引导区) */
#define BOOT_ADDR  0x3800

/* Bootloader 入口函数指针: 仅声明, 定义在唯一使用它的编译单元(usbapp.c),
   避免被多个 .c include 后重复定义。 */
extern void (* __data bootloader)(void);
