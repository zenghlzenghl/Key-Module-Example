;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module key
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UIF_BUS_RST
	.globl _UIF_DETECT
	.globl _UIF_TRANSFER
	.globl _UIF_SUSPEND
	.globl _UIF_HST_SOF
	.globl _UIF_FIFO_OV
	.globl _U_SIE_FREE
	.globl _U_TOG_OK
	.globl _U_IS_NAK
	.globl _ADC_CHAN0
	.globl _ADC_CHAN1
	.globl _CMP_CHAN
	.globl _ADC_START
	.globl _ADC_IF
	.globl _CMP_IF
	.globl _CMPO
	.globl _U1RI
	.globl _U1TI
	.globl _U1RB8
	.globl _U1TB8
	.globl _U1REN
	.globl _U1SMOD
	.globl _U1SM0
	.globl _S0_R_FIFO
	.globl _S0_T_FIFO
	.globl _S0_FREE
	.globl _S0_IF_BYTE
	.globl _S0_IF_FIRST
	.globl _S0_IF_OV
	.globl _S0_FST_ACT
	.globl _CP_RL2
	.globl _C_T2
	.globl _TR2
	.globl _EXEN2
	.globl _TCLK
	.globl _RCLK
	.globl _EXF2
	.globl _CAP1F
	.globl _TF2
	.globl _RI
	.globl _TI
	.globl _RB8
	.globl _TB8
	.globl _REN
	.globl _SM2
	.globl _SM1
	.globl _SM0
	.globl _IT0
	.globl _IE0
	.globl _IT1
	.globl _IE1
	.globl _TR0
	.globl _TF0
	.globl _TR1
	.globl _TF1
	.globl _RXD
	.globl _PWM1_
	.globl _TXD
	.globl _PWM2_
	.globl _AIN3
	.globl _VBUS1
	.globl _INT0
	.globl _TXD1_
	.globl _INT1
	.globl _T0
	.globl _RXD1_
	.globl _PWM2
	.globl _T1
	.globl _UDP
	.globl _UDM
	.globl _TIN0
	.globl _CAP1
	.globl _T2
	.globl _AIN0
	.globl _VBUS2
	.globl _TIN1
	.globl _CAP2
	.globl _T2EX
	.globl _RXD_
	.globl _TXD_
	.globl _AIN1
	.globl _UCC1
	.globl _TIN2
	.globl _SCS
	.globl _CAP1_
	.globl _T2_
	.globl _AIN2
	.globl _UCC2
	.globl _TIN3
	.globl _PWM1
	.globl _MOSI
	.globl _TIN4
	.globl _RXD1
	.globl _MISO
	.globl _TIN5
	.globl _TXD1
	.globl _SCK
	.globl _IE_SPI0
	.globl _IE_TKEY
	.globl _IE_USB
	.globl _IE_ADC
	.globl _IE_UART1
	.globl _IE_PWMX
	.globl _IE_GPIO
	.globl _IE_WDOG
	.globl _PX0
	.globl _PT0
	.globl _PX1
	.globl _PT1
	.globl _PS
	.globl _PT2
	.globl _PL_FLAG
	.globl _PH_FLAG
	.globl _EX0
	.globl _ET0
	.globl _EX1
	.globl _ET1
	.globl _ES
	.globl _ET2
	.globl _E_DIS
	.globl _EA
	.globl _P
	.globl _F1
	.globl _OV
	.globl _RS0
	.globl _RS1
	.globl _F0
	.globl _AC
	.globl _CY
	.globl _UEP1_DMA_H
	.globl _UEP1_DMA_L
	.globl _UEP1_DMA
	.globl _UEP0_DMA_H
	.globl _UEP0_DMA_L
	.globl _UEP0_DMA
	.globl _UEP2_3_MOD
	.globl _UEP4_1_MOD
	.globl _UEP3_DMA_H
	.globl _UEP3_DMA_L
	.globl _UEP3_DMA
	.globl _UEP2_DMA_H
	.globl _UEP2_DMA_L
	.globl _UEP2_DMA
	.globl _USB_DEV_AD
	.globl _USB_CTRL
	.globl _USB_INT_EN
	.globl _UEP4_T_LEN
	.globl _UEP4_CTRL
	.globl _UEP0_T_LEN
	.globl _UEP0_CTRL
	.globl _USB_RX_LEN
	.globl _USB_MIS_ST
	.globl _USB_INT_ST
	.globl _USB_INT_FG
	.globl _UEP3_T_LEN
	.globl _UEP3_CTRL
	.globl _UEP2_T_LEN
	.globl _UEP2_CTRL
	.globl _UEP1_T_LEN
	.globl _UEP1_CTRL
	.globl _UDEV_CTRL
	.globl _USB_C_CTRL
	.globl _TKEY_DATH
	.globl _TKEY_DATL
	.globl _TKEY_DAT
	.globl _TKEY_CTRL
	.globl _ADC_DATA
	.globl _ADC_CFG
	.globl _ADC_CTRL
	.globl _SBAUD1
	.globl _SBUF1
	.globl _SCON1
	.globl _SPI0_SETUP
	.globl _SPI0_CK_SE
	.globl _SPI0_CTRL
	.globl _SPI0_DATA
	.globl _SPI0_STAT
	.globl _PWM_CK_SE
	.globl _PWM_CTRL
	.globl _PWM_DATA1
	.globl _PWM_DATA2
	.globl _T2CAP1H
	.globl _T2CAP1L
	.globl _T2CAP1
	.globl _TH2
	.globl _TL2
	.globl _T2COUNT
	.globl _RCAP2H
	.globl _RCAP2L
	.globl _RCAP2
	.globl _T2MOD
	.globl _T2CON
	.globl _SBUF
	.globl _SCON
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _XBUS_AUX
	.globl _PIN_FUNC
	.globl _P3_DIR_PU
	.globl _P3_MOD_OC
	.globl _P3
	.globl _P2
	.globl _P1_DIR_PU
	.globl _P1_MOD_OC
	.globl _P1
	.globl _ROM_CTRL
	.globl _ROM_DATA_H
	.globl _ROM_DATA_L
	.globl _ROM_DATA
	.globl _ROM_ADDR_H
	.globl _ROM_ADDR_L
	.globl _ROM_ADDR
	.globl _GPIO_IE
	.globl _IP_EX
	.globl _IE_EX
	.globl _IP
	.globl _IE
	.globl _WDOG_COUNT
	.globl _RESET_KEEP
	.globl _WAKE_CTRL
	.globl _CLOCK_CFG
	.globl _PCON
	.globl _GLOBAL_CFG
	.globl _SAFE_MOD
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _key_init
	.globl _key_timer_tick
	.globl _key_event_get
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_SAFE_MOD	=	0x00a1
_GLOBAL_CFG	=	0x00b1
_PCON	=	0x0087
_CLOCK_CFG	=	0x00b9
_WAKE_CTRL	=	0x00a9
_RESET_KEEP	=	0x00fe
_WDOG_COUNT	=	0x00ff
_IE	=	0x00a8
_IP	=	0x00b8
_IE_EX	=	0x00e8
_IP_EX	=	0x00e9
_GPIO_IE	=	0x00c7
_ROM_ADDR	=	0x8584
_ROM_ADDR_L	=	0x0084
_ROM_ADDR_H	=	0x0085
_ROM_DATA	=	0x8f8e
_ROM_DATA_L	=	0x008e
_ROM_DATA_H	=	0x008f
_ROM_CTRL	=	0x0086
_P1	=	0x0090
_P1_MOD_OC	=	0x0092
_P1_DIR_PU	=	0x0093
_P2	=	0x00a0
_P3	=	0x00b0
_P3_MOD_OC	=	0x0096
_P3_DIR_PU	=	0x0097
_PIN_FUNC	=	0x00c6
_XBUS_AUX	=	0x00a2
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_SCON	=	0x0098
_SBUF	=	0x0099
_T2CON	=	0x00c8
_T2MOD	=	0x00c9
_RCAP2	=	0xcbca
_RCAP2L	=	0x00ca
_RCAP2H	=	0x00cb
_T2COUNT	=	0xcdcc
_TL2	=	0x00cc
_TH2	=	0x00cd
_T2CAP1	=	0xcfce
_T2CAP1L	=	0x00ce
_T2CAP1H	=	0x00cf
_PWM_DATA2	=	0x009b
_PWM_DATA1	=	0x009c
_PWM_CTRL	=	0x009d
_PWM_CK_SE	=	0x009e
_SPI0_STAT	=	0x00f8
_SPI0_DATA	=	0x00f9
_SPI0_CTRL	=	0x00fa
_SPI0_CK_SE	=	0x00fb
_SPI0_SETUP	=	0x00fc
_SCON1	=	0x00c0
_SBUF1	=	0x00c1
_SBAUD1	=	0x00c2
_ADC_CTRL	=	0x0080
_ADC_CFG	=	0x009a
_ADC_DATA	=	0x009f
_TKEY_CTRL	=	0x00c3
_TKEY_DAT	=	0xc5c4
_TKEY_DATL	=	0x00c4
_TKEY_DATH	=	0x00c5
_USB_C_CTRL	=	0x0091
_UDEV_CTRL	=	0x00d1
_UEP1_CTRL	=	0x00d2
_UEP1_T_LEN	=	0x00d3
_UEP2_CTRL	=	0x00d4
_UEP2_T_LEN	=	0x00d5
_UEP3_CTRL	=	0x00d6
_UEP3_T_LEN	=	0x00d7
_USB_INT_FG	=	0x00d8
_USB_INT_ST	=	0x00d9
_USB_MIS_ST	=	0x00da
_USB_RX_LEN	=	0x00db
_UEP0_CTRL	=	0x00dc
_UEP0_T_LEN	=	0x00dd
_UEP4_CTRL	=	0x00de
_UEP4_T_LEN	=	0x00df
_USB_INT_EN	=	0x00e1
_USB_CTRL	=	0x00e2
_USB_DEV_AD	=	0x00e3
_UEP2_DMA	=	0xe5e4
_UEP2_DMA_L	=	0x00e4
_UEP2_DMA_H	=	0x00e5
_UEP3_DMA	=	0xe7e6
_UEP3_DMA_L	=	0x00e6
_UEP3_DMA_H	=	0x00e7
_UEP4_1_MOD	=	0x00ea
_UEP2_3_MOD	=	0x00eb
_UEP0_DMA	=	0xedec
_UEP0_DMA_L	=	0x00ec
_UEP0_DMA_H	=	0x00ed
_UEP1_DMA	=	0xefee
_UEP1_DMA_L	=	0x00ee
_UEP1_DMA_H	=	0x00ef
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_CY	=	0x00d7
_AC	=	0x00d6
_F0	=	0x00d5
_RS1	=	0x00d4
_RS0	=	0x00d3
_OV	=	0x00d2
_F1	=	0x00d1
_P	=	0x00d0
_EA	=	0x00af
_E_DIS	=	0x00ae
_ET2	=	0x00ad
_ES	=	0x00ac
_ET1	=	0x00ab
_EX1	=	0x00aa
_ET0	=	0x00a9
_EX0	=	0x00a8
_PH_FLAG	=	0x00bf
_PL_FLAG	=	0x00be
_PT2	=	0x00bd
_PS	=	0x00bc
_PT1	=	0x00bb
_PX1	=	0x00ba
_PT0	=	0x00b9
_PX0	=	0x00b8
_IE_WDOG	=	0x00ef
_IE_GPIO	=	0x00ee
_IE_PWMX	=	0x00ed
_IE_UART1	=	0x00ec
_IE_ADC	=	0x00eb
_IE_USB	=	0x00ea
_IE_TKEY	=	0x00e9
_IE_SPI0	=	0x00e8
_SCK	=	0x0097
_TXD1	=	0x0097
_TIN5	=	0x0097
_MISO	=	0x0096
_RXD1	=	0x0096
_TIN4	=	0x0096
_MOSI	=	0x0095
_PWM1	=	0x0095
_TIN3	=	0x0095
_UCC2	=	0x0095
_AIN2	=	0x0095
_T2_	=	0x0094
_CAP1_	=	0x0094
_SCS	=	0x0094
_TIN2	=	0x0094
_UCC1	=	0x0094
_AIN1	=	0x0094
_TXD_	=	0x0093
_RXD_	=	0x0092
_T2EX	=	0x0091
_CAP2	=	0x0091
_TIN1	=	0x0091
_VBUS2	=	0x0091
_AIN0	=	0x0091
_T2	=	0x0090
_CAP1	=	0x0090
_TIN0	=	0x0090
_UDM	=	0x00b7
_UDP	=	0x00b6
_T1	=	0x00b5
_PWM2	=	0x00b4
_RXD1_	=	0x00b4
_T0	=	0x00b4
_INT1	=	0x00b3
_TXD1_	=	0x00b2
_INT0	=	0x00b2
_VBUS1	=	0x00b2
_AIN3	=	0x00b2
_PWM2_	=	0x00b1
_TXD	=	0x00b1
_PWM1_	=	0x00b0
_RXD	=	0x00b0
_TF1	=	0x008f
_TR1	=	0x008e
_TF0	=	0x008d
_TR0	=	0x008c
_IE1	=	0x008b
_IT1	=	0x008a
_IE0	=	0x0089
_IT0	=	0x0088
_SM0	=	0x009f
_SM1	=	0x009e
_SM2	=	0x009d
_REN	=	0x009c
_TB8	=	0x009b
_RB8	=	0x009a
_TI	=	0x0099
_RI	=	0x0098
_TF2	=	0x00cf
_CAP1F	=	0x00cf
_EXF2	=	0x00ce
_RCLK	=	0x00cd
_TCLK	=	0x00cc
_EXEN2	=	0x00cb
_TR2	=	0x00ca
_C_T2	=	0x00c9
_CP_RL2	=	0x00c8
_S0_FST_ACT	=	0x00ff
_S0_IF_OV	=	0x00fe
_S0_IF_FIRST	=	0x00fd
_S0_IF_BYTE	=	0x00fc
_S0_FREE	=	0x00fb
_S0_T_FIFO	=	0x00fa
_S0_R_FIFO	=	0x00f8
_U1SM0	=	0x00c7
_U1SMOD	=	0x00c5
_U1REN	=	0x00c4
_U1TB8	=	0x00c3
_U1RB8	=	0x00c2
_U1TI	=	0x00c1
_U1RI	=	0x00c0
_CMPO	=	0x0087
_CMP_IF	=	0x0086
_ADC_IF	=	0x0085
_ADC_START	=	0x0084
_CMP_CHAN	=	0x0083
_ADC_CHAN1	=	0x0081
_ADC_CHAN0	=	0x0080
_U_IS_NAK	=	0x00df
_U_TOG_OK	=	0x00de
_U_SIE_FREE	=	0x00dd
_UIF_FIFO_OV	=	0x00dc
_UIF_HST_SOF	=	0x00db
_UIF_SUSPEND	=	0x00da
_UIF_TRANSFER	=	0x00d9
_UIF_DETECT	=	0x00d8
_UIF_BUS_RST	=	0x00d8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_g_evt_wr:
	.ds 1
_g_evt_rd:
	.ds 1
_evt_push_PARM_2:
	.ds 1
_key_scan_one_k_65536_21:
	.ds 3
_key_scan_one_ev_65536_21:
	.ds 1
_key_timer_tick_ms_tick_65536_41:
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_g_keys:
	.ds 4
_g_evt_buf:
	.ds 32
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'key_timer_tick'
;------------------------------------------------------------
;ms_tick                   Allocated with name '_key_timer_tick_ms_tick_65536_41'
;i                         Allocated to registers r7 
;ev                        Allocated to registers r5 
;------------------------------------------------------------
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:184: static volatile uint16_t ms_tick = 0;
	clr	a
	mov	_key_timer_tick_ms_tick_65536_41,a
	mov	(_key_timer_tick_ms_tick_65536_41 + 1),a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:35: static volatile uint8_t g_evt_wr = 0;   /* 写指针 */
	mov	_g_evt_wr,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:36: static volatile uint8_t g_evt_rd = 0;   /* 读指针 */
	mov	_g_evt_rd,#0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'evt_push'
;------------------------------------------------------------
;ev                        Allocated with name '_evt_push_PARM_2'
;id                        Allocated to registers r7 
;next                      Allocated to registers r5 
;------------------------------------------------------------
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:38: static void evt_push(uint8_t id, KeyEvent ev)
;	-----------------------------------------
;	 function evt_push
;	-----------------------------------------
_evt_push:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r7,dpl
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:40: uint8_t next = (g_evt_wr + 1) % EVENT_BUF_SIZE;
	mov	r5,_g_evt_wr
	mov	r6,#0x00
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	mov	__modsint_PARM_2,#0x10
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r6
	push	ar7
	lcall	__modsint
	mov	r5,dpl
	pop	ar7
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:41: if (next != g_evt_rd)   /* 缓冲未满才写入 */
	mov	a,r5
	cjne	a,_g_evt_rd,00109$
	ret
00109$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:43: g_evt_buf[g_evt_wr].key_id = id;
	mov	a,_g_evt_wr
	mov	b,#0x02
	mul	ab
	add	a,#_g_evt_buf
	mov	dpl,a
	mov	a,#(_g_evt_buf >> 8)
	addc	a,b
	mov	dph,a
	mov	a,r7
	movx	@dptr,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:44: g_evt_buf[g_evt_wr].event  = ev;
	mov	a,_g_evt_wr
	mov	b,#0x02
	mul	ab
	add	a,#_g_evt_buf
	mov	r6,a
	mov	a,#(_g_evt_buf >> 8)
	addc	a,b
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	inc	dptr
	mov	a,_evt_push_PARM_2
	movx	@dptr,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:45: g_evt_wr = next;
	mov	_g_evt_wr,r5
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:47: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'evt_pop'
;------------------------------------------------------------
;out                       Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:49: static uint8_t evt_pop(KeyEventMsg *out)
;	-----------------------------------------
;	 function evt_pop
;	-----------------------------------------
_evt_pop:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:51: if (g_evt_rd == g_evt_wr) return 0;   /* 空 */
	mov	a,_g_evt_wr
	cjne	a,_g_evt_rd,00102$
	mov	dpl,#0x00
	ret
00102$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:52: *out = g_evt_buf[g_evt_rd];
	mov	a,_g_evt_rd
	mov	b,#0x02
	mul	ab
	add	a,#_g_evt_buf
	mov	r3,a
	mov	a,#(_g_evt_buf >> 8)
	addc	a,b
	mov	r4,a
	mov	___memcpy_PARM_2,r3
	mov	(___memcpy_PARM_2 + 1),r4
	mov	(___memcpy_PARM_2 + 2),#0x00
	mov	___memcpy_PARM_3,#0x02
	mov	(___memcpy_PARM_3 + 1),#0x00
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	___memcpy
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:53: g_evt_rd = (g_evt_rd + 1) % EVENT_BUF_SIZE;
	mov	r6,_g_evt_rd
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	inc	dptr
	mov	__modsint_PARM_2,#0x10
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r7
	lcall	__modsint
	mov	r6,dpl
	mov	_g_evt_rd,r6
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:54: return 1;
	mov	dpl,#0x01
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:55: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'key_is_pressed'
;------------------------------------------------------------
;id                        Allocated to registers r7 
;------------------------------------------------------------
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:58: static uint8_t key_is_pressed(uint8_t id)
;	-----------------------------------------
;	 function key_is_pressed
;	-----------------------------------------
_key_is_pressed:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:60: if (id == 0)
	mov	a,dpl
	jnz	00102$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:62: return (P1 & (1 << KEY0_PIN)) ? 0 : 1;  /* P1.2 低电平=按下 */
	mov	a,_P1
	jnb	acc.2,00105$
	mov	r6,#0x00
	mov	r7,#0x00
	sjmp	00106$
00105$:
	mov	r6,#0x01
	mov	r7,#0x00
00106$:
	mov	dpl,r6
	ret
00102$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:64: return 0;
	mov	dpl,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:65: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'key_scan_one'
;------------------------------------------------------------
;id                        Allocated to registers r7 
;k                         Allocated with name '_key_scan_one_k_65536_21'
;pressed                   Allocated to registers r7 
;ev                        Allocated with name '_key_scan_one_ev_65536_21'
;------------------------------------------------------------
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:68: static KeyEvent key_scan_one(uint8_t id)
;	-----------------------------------------
;	 function key_scan_one
;	-----------------------------------------
_key_scan_one:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:70: KeyCtrl *k = &g_keys[id];
	mov	a,dpl
	mov	r7,a
	mov	b,#0x04
	mul	ab
	add	a,#_g_keys
	mov	r5,a
	mov	a,#(_g_keys >> 8)
	addc	a,b
	mov	r6,a
	mov	_key_scan_one_k_65536_21,r5
	mov	(_key_scan_one_k_65536_21 + 1),r6
	mov	(_key_scan_one_k_65536_21 + 2),#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:71: uint8_t pressed = key_is_pressed(id);
	mov	dpl,r7
	lcall	_key_is_pressed
	mov	r7,dpl
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:72: KeyEvent ev = KEY_EVENT_NONE;
	mov	_key_scan_one_ev_65536_21,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:74: switch (k->state)
	mov	dpl,_key_scan_one_k_65536_21
	mov	dph,(_key_scan_one_k_65536_21 + 1)
	mov	b,(_key_scan_one_k_65536_21 + 2)
	lcall	__gptrget
	mov  r2,a
	add	a,#0xff - 0x04
	jnc	00178$
	ljmp	00130$
00178$:
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#00179$
	jmp	@a+dptr
00179$:
	ljmp	00101$
	ljmp	00104$
	ljmp	00110$
	ljmp	00116$
	ljmp	00124$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:76: case KEY_ST_IDLE:
00101$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:77: if (pressed)
	mov	a,r7
	jnz	00180$
	ljmp	00131$
00180$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:79: k->state = KEY_ST_DEBOUNCE_PRESS;
	mov	dpl,_key_scan_one_k_65536_21
	mov	dph,(_key_scan_one_k_65536_21 + 1)
	mov	b,(_key_scan_one_k_65536_21 + 2)
	mov	a,#0x01
	lcall	__gptrput
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:80: k->timer = 0;
	add	a,_key_scan_one_k_65536_21
	mov	r0,a
	clr	a
	addc	a,(_key_scan_one_k_65536_21 + 1)
	mov	r1,a
	mov	r2,(_key_scan_one_k_65536_21 + 2)
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:82: break;
	ljmp	00131$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:84: case KEY_ST_DEBOUNCE_PRESS:
00104$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:85: if (pressed)
	mov	a,r7
	jz	00108$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:87: if (++k->timer >= DEBOUNCE_CNT)
	mov	a,#0x01
	add	a,_key_scan_one_k_65536_21
	mov	r0,a
	clr	a
	addc	a,(_key_scan_one_k_65536_21 + 1)
	mov	r1,a
	mov	r2,(_key_scan_one_k_65536_21 + 2)
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	r3
	cjne	r3,#0x00,00182$
	inc	r6
00182$:
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	mov	a,r3
	lcall	__gptrput
	inc	dptr
	mov	a,r6
	lcall	__gptrput
	clr	c
	mov	a,r3
	subb	a,#0x02
	mov	a,r6
	subb	a,#0x00
	jnc	00183$
	ljmp	00131$
00183$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:89: k->state = KEY_ST_PRESS;
	mov	dpl,_key_scan_one_k_65536_21
	mov	dph,(_key_scan_one_k_65536_21 + 1)
	mov	b,(_key_scan_one_k_65536_21 + 2)
	mov	a,#0x02
	lcall	__gptrput
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:90: k->timer = 0;
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:91: k->long_triggered = 0;
	mov	a,#0x03
	add	a,_key_scan_one_k_65536_21
	mov	r4,a
	clr	a
	addc	a,(_key_scan_one_k_65536_21 + 1)
	mov	r5,a
	mov	r6,(_key_scan_one_k_65536_21 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	clr	a
	lcall	__gptrput
	ljmp	00131$
00108$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:96: k->state = KEY_ST_IDLE;
	mov	dpl,_key_scan_one_k_65536_21
	mov	dph,(_key_scan_one_k_65536_21 + 1)
	mov	b,(_key_scan_one_k_65536_21 + 2)
	clr	a
	lcall	__gptrput
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:97: k->timer = 0;
	inc	a
	add	a,_key_scan_one_k_65536_21
	mov	r4,a
	clr	a
	addc	a,(_key_scan_one_k_65536_21 + 1)
	mov	r5,a
	mov	r6,(_key_scan_one_k_65536_21 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:99: break;
	ljmp	00131$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:101: case KEY_ST_PRESS:
00110$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:102: if (pressed)
	mov	a,r7
	jz	00114$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:104: if (++k->timer >= LONG_PRESS_CNT)
	mov	a,#0x01
	add	a,_key_scan_one_k_65536_21
	mov	r4,a
	clr	a
	addc	a,(_key_scan_one_k_65536_21 + 1)
	mov	r5,a
	mov	r6,(_key_scan_one_k_65536_21 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	r2
	cjne	r2,#0x00,00185$
	inc	r3
00185$:
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r3
	lcall	__gptrput
	clr	c
	mov	a,r2
	subb	a,#0x64
	mov	a,r3
	subb	a,#0x00
	jnc	00186$
	ljmp	00131$
00186$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:106: ev = KEY_EVENT_LONG_PRESS;
	mov	_key_scan_one_ev_65536_21,#0x02
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:107: k->long_triggered = 1;     /* 只产生一次长按 */
	mov	a,#0x03
	add	a,_key_scan_one_k_65536_21
	mov	r1,a
	clr	a
	addc	a,(_key_scan_one_k_65536_21 + 1)
	mov	r2,a
	mov	r3,(_key_scan_one_k_65536_21 + 2)
	mov	dpl,r1
	mov	dph,r2
	mov	b,r3
	mov	a,#0x01
	lcall	__gptrput
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:108: k->state = KEY_ST_LONG_PRESS;
	mov	dpl,_key_scan_one_k_65536_21
	mov	dph,(_key_scan_one_k_65536_21 + 1)
	mov	b,(_key_scan_one_k_65536_21 + 2)
	mov	a,#0x04
	lcall	__gptrput
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:109: k->timer = 0;
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	ljmp	00131$
00114$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:114: k->state = KEY_ST_DEBOUNCE_RELEASE;
	mov	dpl,_key_scan_one_k_65536_21
	mov	dph,(_key_scan_one_k_65536_21 + 1)
	mov	b,(_key_scan_one_k_65536_21 + 2)
	mov	a,#0x03
	lcall	__gptrput
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:115: k->timer = 0;
	mov	a,#0x01
	add	a,_key_scan_one_k_65536_21
	mov	r4,a
	clr	a
	addc	a,(_key_scan_one_k_65536_21 + 1)
	mov	r5,a
	mov	r6,(_key_scan_one_k_65536_21 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:117: break;
	ljmp	00131$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:119: case KEY_ST_DEBOUNCE_RELEASE:
00116$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:120: if (!pressed)
	mov	a,r7
	jnz	00122$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:122: if (++k->timer >= DEBOUNCE_CNT)
	mov	a,#0x01
	add	a,_key_scan_one_k_65536_21
	mov	r4,a
	clr	a
	addc	a,(_key_scan_one_k_65536_21 + 1)
	mov	r5,a
	mov	r6,(_key_scan_one_k_65536_21 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	r2
	cjne	r2,#0x00,00188$
	inc	r3
00188$:
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r3
	lcall	__gptrput
	clr	c
	mov	a,r2
	subb	a,#0x02
	mov	a,r3
	subb	a,#0x00
	jnc	00189$
	ljmp	00131$
00189$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:124: if (!k->long_triggered)
	mov	a,#0x03
	add	a,_key_scan_one_k_65536_21
	mov	r1,a
	clr	a
	addc	a,(_key_scan_one_k_65536_21 + 1)
	mov	r2,a
	mov	r3,(_key_scan_one_k_65536_21 + 2)
	mov	dpl,r1
	mov	dph,r2
	mov	b,r3
	lcall	__gptrget
	jnz	00118$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:125: ev = KEY_EVENT_SHORT_PRESS;   /* 释放且未长按 -> 短按 */
	mov	_key_scan_one_ev_65536_21,#0x01
00118$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:126: k->state = KEY_ST_IDLE;
	mov	dpl,_key_scan_one_k_65536_21
	mov	dph,(_key_scan_one_k_65536_21 + 1)
	mov	b,(_key_scan_one_k_65536_21 + 2)
	clr	a
	lcall	__gptrput
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:127: k->timer = 0;
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	ljmp	00131$
00122$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:132: k->state = KEY_ST_PRESS;
	mov	dpl,_key_scan_one_k_65536_21
	mov	dph,(_key_scan_one_k_65536_21 + 1)
	mov	b,(_key_scan_one_k_65536_21 + 2)
	mov	a,#0x02
	lcall	__gptrput
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:133: k->timer = 0;
	dec	a
	add	a,_key_scan_one_k_65536_21
	mov	r4,a
	clr	a
	addc	a,(_key_scan_one_k_65536_21 + 1)
	mov	r5,a
	mov	r6,(_key_scan_one_k_65536_21 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:135: break;
	ljmp	00131$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:137: case KEY_ST_LONG_PRESS:
00124$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:138: if (pressed)
	mov	a,r7
	jz	00128$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:140: if (++k->timer >= REPEAT_INTERVAL_CNT)
	mov	a,#0x01
	add	a,_key_scan_one_k_65536_21
	mov	r5,a
	clr	a
	addc	a,(_key_scan_one_k_65536_21 + 1)
	mov	r6,a
	mov	r7,(_key_scan_one_k_65536_21 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	inc	r3
	cjne	r3,#0x00,00192$
	inc	r4
00192$:
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r3
	lcall	__gptrput
	inc	dptr
	mov	a,r4
	lcall	__gptrput
	clr	c
	mov	a,r3
	subb	a,#0x1e
	mov	a,r4
	subb	a,#0x00
	jnc	00193$
	ljmp	00131$
00193$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:142: ev = KEY_EVENT_REPEAT;            /* 连续按只产生 REPEAT */
	mov	_key_scan_one_ev_65536_21,#0x03
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:143: k->timer = 0;
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	sjmp	00131$
00128$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:148: k->state = KEY_ST_IDLE;
	mov	dpl,_key_scan_one_k_65536_21
	mov	dph,(_key_scan_one_k_65536_21 + 1)
	mov	b,(_key_scan_one_k_65536_21 + 2)
	clr	a
	lcall	__gptrput
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:149: k->timer = 0;
	inc	a
	add	a,_key_scan_one_k_65536_21
	mov	r5,a
	clr	a
	addc	a,(_key_scan_one_k_65536_21 + 1)
	mov	r6,a
	mov	r7,(_key_scan_one_k_65536_21 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:150: k->long_triggered = 0;
	mov	a,#0x03
	add	a,_key_scan_one_k_65536_21
	mov	r5,a
	clr	a
	addc	a,(_key_scan_one_k_65536_21 + 1)
	mov	r6,a
	mov	r7,(_key_scan_one_k_65536_21 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:152: break;
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:154: default:
	sjmp	00131$
00130$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:155: k->state = KEY_ST_IDLE;
	mov	dpl,_key_scan_one_k_65536_21
	mov	dph,(_key_scan_one_k_65536_21 + 1)
	mov	b,(_key_scan_one_k_65536_21 + 2)
	clr	a
	lcall	__gptrput
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:156: k->timer = 0;
	inc	a
	add	a,_key_scan_one_k_65536_21
	mov	r5,a
	clr	a
	addc	a,(_key_scan_one_k_65536_21 + 1)
	mov	r6,a
	mov	r7,(_key_scan_one_k_65536_21 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:158: }
00131$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:159: return ev;
	mov	dpl,_key_scan_one_ev_65536_21
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:160: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'key_init'
;------------------------------------------------------------
;i                         Allocated to registers r7 
;------------------------------------------------------------
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:164: void key_init(void)
;	-----------------------------------------
;	 function key_init
;	-----------------------------------------
_key_init:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:169: P1_MOD_OC &= ~(1 << KEY0_PIN);                              /* 推挽模式 */
	anl	_P1_MOD_OC,#0xfb
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:170: P1_DIR_PU |= (1 << KEY0_PIN);                               /* 使能内部上拉 */
	orl	_P1_DIR_PU,#0x04
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:172: for (i = 0; i < KEY_NUM; i++)
	mov	r7,#0x00
00102$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:174: g_keys[i].state = KEY_ST_IDLE;
	mov	a,r7
	mov	b,#0x04
	mul	ab
	mov	r5,a
	mov	r6,b
	add	a,#_g_keys
	mov	dpl,a
	mov	a,r6
	addc	a,#(_g_keys >> 8)
	mov	dph,a
	clr	a
	movx	@dptr,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:175: g_keys[i].timer = 0;
	mov	a,r5
	add	a,#_g_keys
	mov	r5,a
	mov	a,r6
	addc	a,#(_g_keys >> 8)
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:176: g_keys[i].long_triggered = 0;
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	inc	dptr
	inc	dptr
	movx	@dptr,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:172: for (i = 0; i < KEY_NUM; i++)
	inc	r7
	cjne	r7,#0x01,00115$
00115$:
	jc	00102$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:178: g_evt_wr = 0;
	mov	_g_evt_wr,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:179: g_evt_rd = 0;
	mov	_g_evt_rd,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:180: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'key_timer_tick'
;------------------------------------------------------------
;ms_tick                   Allocated with name '_key_timer_tick_ms_tick_65536_41'
;i                         Allocated to registers r7 
;ev                        Allocated to registers r5 
;------------------------------------------------------------
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:182: void key_timer_tick(void)
;	-----------------------------------------
;	 function key_timer_tick
;	-----------------------------------------
_key_timer_tick:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:186: if (++ms_tick >= SCAN_TICK_DIV)
	mov	a,#0x01
	add	a,_key_timer_tick_ms_tick_65536_41
	mov	r6,a
	clr	a
	addc	a,(_key_timer_tick_ms_tick_65536_41 + 1)
	mov	r7,a
	mov	_key_timer_tick_ms_tick_65536_41,r6
	mov	(_key_timer_tick_ms_tick_65536_41 + 1),r7
	clr	c
	mov	a,r6
	subb	a,#0x0a
	mov	a,r7
	subb	a,#0x00
	jc	00108$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:189: ms_tick = 0;
	clr	a
	mov	_key_timer_tick_ms_tick_65536_41,a
	mov	(_key_timer_tick_ms_tick_65536_41 + 1),a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:191: for (i = 0; i < KEY_NUM; i++)
	mov	r7,#0x00
00106$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:193: KeyEvent ev = key_scan_one(i);
	mov	dpl,r7
	push	ar7
	lcall	_key_scan_one
	mov	r6,dpl
	pop	ar7
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:194: if (ev != KEY_EVENT_NONE)
	mov	a,r6
	mov	r5,a
	jz	00107$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:195: evt_push(i, ev);
	mov	_evt_push_PARM_2,r5
	mov	dpl,r7
	push	ar7
	lcall	_evt_push
	pop	ar7
00107$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:191: for (i = 0; i < KEY_NUM; i++)
	inc	r7
	cjne	r7,#0x01,00125$
00125$:
	jc	00106$
00108$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:198: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'key_event_get'
;------------------------------------------------------------
;out                       Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:200: uint8_t key_event_get(KeyEventMsg *out)
;	-----------------------------------------
;	 function key_event_get
;	-----------------------------------------
_key_event_get:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:202: return evt_pop(out);
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:203: }
	ljmp	_evt_pop
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
