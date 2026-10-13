;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module usbcdc
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___memcpy
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
	.globl _UsbCdc_TxSend_PARM_2
	.globl _UsbCdc_Init
	.globl _UsbCdc_IsConfigured
	.globl _UsbCdc_RxBytes
	.globl _UsbCdc_RxRead
	.globl _UsbCdc_RxDone
	.globl _UsbCdc_TxReady
	.globl _UsbCdc_TxSend
	.globl _UsbCdc_DeviceInterrupt
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
_SetupLen:
	.ds 2
_SetupReq:
	.ds 1
_UsbConfig:
	.ds 1
_pDescr:
	.ds 3
_UsbCdc_TxSend_PARM_2:
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
_Config_Uart1_uart1_buad_65536_48:
	.ds 4
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
_UsbCdc_DeviceInterrupt_sloc0_1_0:
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_Ep0Buffer	=	0x0000
_Ep1Buffer	=	0x0040
_Ep2Buffer	=	0x0080
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_LineCoding:
	.ds 7
_USBByteCount:
	.ds 1
_USBBufOutPoint:
	.ds 1
_UpPoint2_Busy:
	.ds 1
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
;Allocation info for local variables in function 'Config_Uart1'
;------------------------------------------------------------
;cfg_uart                  Allocated to registers r5 r6 r7 
;uart1_buad                Allocated with name '_Config_Uart1_uart1_buad_65536_48'
;------------------------------------------------------------
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:100: static void Config_Uart1(uint8_t *cfg_uart)
;	-----------------------------------------
;	 function Config_Uart1
;	-----------------------------------------
_Config_Uart1:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:102: uint32_t uart1_buad = 0;
	clr	a
	mov	_Config_Uart1_uart1_buad_65536_48,a
	mov	(_Config_Uart1_uart1_buad_65536_48 + 1),a
	mov	(_Config_Uart1_uart1_buad_65536_48 + 2),a
	mov	(_Config_Uart1_uart1_buad_65536_48 + 3),a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:103: *((uint8_t *)&uart1_buad)     = cfg_uart[0];
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	mov	_Config_Uart1_uart1_buad_65536_48,r4
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:104: *((uint8_t *)&uart1_buad + 1) = cfg_uart[1];
	mov	a,#0x01
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r2,a
	mov	(_Config_Uart1_uart1_buad_65536_48 + 0x0001),r2
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:105: *((uint8_t *)&uart1_buad + 2) = cfg_uart[2];
	mov	a,#0x02
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r2,a
	mov	(_Config_Uart1_uart1_buad_65536_48 + 0x0002),r2
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:106: *((uint8_t *)&uart1_buad + 3) = cfg_uart[3];
	mov	a,#0x03
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	mov	(_Config_Uart1_uart1_buad_65536_48 + 0x0003),r5
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:108: (void)uart1_buad;
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:109: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UsbCdc_Init'
;------------------------------------------------------------
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:115: void UsbCdc_Init(void)
;	-----------------------------------------
;	 function UsbCdc_Init
;	-----------------------------------------
_UsbCdc_Init:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:118: USB_CTRL = 0x00;                                                     /* 清 USB 控制寄存器 */
	mov	_USB_CTRL,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:119: USB_CTRL &= ~bUC_HOST_MODE;                                          /* 选择设备模式 */
	anl	_USB_CTRL,#0x7f
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:120: USB_CTRL |=  bUC_DEV_PU_EN | bUC_INT_BUSY | bUC_DMA_EN;              /* 设备+内部上拉使能, 中断标志未清前自动NAK */
	orl	_USB_CTRL,#0x29
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:121: USB_DEV_AD = 0x00;                                                   /* 设备地址初始化 */
	mov	_USB_DEV_AD,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:122: USB_CTRL &= ~bUC_LOW_SPEED;                                          /* 全速 12M 模式(默认) */
	anl	_USB_CTRL,#0xbf
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:123: UDEV_CTRL &= ~bUD_LOW_SPEED;
	anl	_UDEV_CTRL,#0xfb
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:124: UDEV_CTRL = bUD_PD_DIS;                                              /* 禁止 DP/DM 下拉 */
	mov	_UDEV_CTRL,#0x80
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:125: UDEV_CTRL |= bUD_PORT_EN;                                            /* 使能物理端口 */
	orl	_UDEV_CTRL,#0x01
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:128: UEP1_DMA = (uint16_t) Ep1Buffer;                                     /* 端点1 发送地址 */
	mov	r6,#_Ep1Buffer
	mov	r7,#(_Ep1Buffer >> 8)
	mov	((_UEP1_DMA >> 0) & 0xFF),r6
	mov	((_UEP1_DMA >> 8) & 0xFF),r7
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:129: UEP2_DMA = (uint16_t) Ep2Buffer;                                     /* 端点2 IN/OUT 地址 */
	mov	r6,#_Ep2Buffer
	mov	r7,#(_Ep2Buffer >> 8)
	mov	((_UEP2_DMA >> 0) & 0xFF),r6
	mov	((_UEP2_DMA >> 8) & 0xFF),r7
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:130: UEP2_3_MOD = 0xCC;                                                   /* 端点2/3 单缓冲收发使能 */
	mov	_UEP2_3_MOD,#0xcc
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:131: UEP2_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;           /* EP2 自动翻转, IN=NAK, OUT=ACK */
	mov	_UEP2_CTRL,#0x12
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:132: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK;                           /* EP1 自动翻转, IN=NAK */
	mov	_UEP1_CTRL,#0x12
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:133: UEP0_DMA = (uint16_t) Ep0Buffer;                                     /* 端点0 数据地址 */
	mov	r6,#_Ep0Buffer
	mov	r7,#(_Ep0Buffer >> 8)
	mov	((_UEP0_DMA >> 0) & 0xFF),r6
	mov	((_UEP0_DMA >> 8) & 0xFF),r7
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:134: UEP4_1_MOD = 0X40;                                                   /* EP1 上传缓冲; EP0 单64字节收发 */
	mov	_UEP4_1_MOD,#0x40
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:135: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;                           /* 手动翻转, OUT=ACK, IN=NAK */
	mov	_UEP0_CTRL,#0x02
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:138: USB_INT_EN |= bUIE_SUSPEND;                                          /* 设备挂起中断 */
	orl	_USB_INT_EN,#0x04
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:139: USB_INT_EN |= bUIE_TRANSFER;                                         /* USB 传输完成中断 */
	orl	_USB_INT_EN,#0x02
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:140: USB_INT_EN |= bUIE_BUS_RST;                                          /* 总线复位中断 */
	orl	_USB_INT_EN,#0x01
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:141: USB_INT_FG |= 0x1F;                                                  /* 清中断标志 */
	orl	_USB_INT_FG,#0x1f
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:142: IE_USB = 1;                                                          /* 使能 USB 中断 */
;	assignBit
	setb	_IE_USB
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:145: UsbConfig = 0;
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:146: SetupReq = 0;
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:147: SetupLen = 0;
	clr	a
	mov	_UsbConfig,a
	mov	_SetupReq,a
	mov	_SetupLen,a
	mov	(_SetupLen + 1),a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:148: UEP0_T_LEN = 0;                                                      /* 预使用发送长度清零 */
;	1-genFromRTrack replaced	mov	_UEP0_T_LEN,#0x00
	mov	_UEP0_T_LEN,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:149: UEP1_T_LEN = 0;
;	1-genFromRTrack replaced	mov	_UEP1_T_LEN,#0x00
	mov	_UEP1_T_LEN,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:150: UEP2_T_LEN = 0;
;	1-genFromRTrack replaced	mov	_UEP2_T_LEN,#0x00
	mov	_UEP2_T_LEN,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:151: USBByteCount = 0;
	mov	dptr,#_USBByteCount
	movx	@dptr,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:152: USBBufOutPoint = 0;
	mov	dptr,#_USBBufOutPoint
	movx	@dptr,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:153: UpPoint2_Busy = 0;
	mov	dptr,#_UpPoint2_Busy
	movx	@dptr,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:155: EA = 1;                                                              /* 开总中断 */
;	assignBit
	setb	_EA
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:156: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UsbCdc_IsConfigured'
;------------------------------------------------------------
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:162: uint8_t UsbCdc_IsConfigured(void)
;	-----------------------------------------
;	 function UsbCdc_IsConfigured
;	-----------------------------------------
_UsbCdc_IsConfigured:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:164: return UsbConfig;
	mov	dpl,_UsbConfig
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:165: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UsbCdc_RxBytes'
;------------------------------------------------------------
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:171: uint8_t UsbCdc_RxBytes(void)
;	-----------------------------------------
;	 function UsbCdc_RxBytes
;	-----------------------------------------
_UsbCdc_RxBytes:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:173: return USBByteCount;
	mov	dptr,#_USBByteCount
	movx	a,@dptr
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:174: }
	mov	dpl,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UsbCdc_RxRead'
;------------------------------------------------------------
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:176: uint8_t UsbCdc_RxRead(void)
;	-----------------------------------------
;	 function UsbCdc_RxRead
;	-----------------------------------------
_UsbCdc_RxRead:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:178: return Ep2Buffer[USBBufOutPoint++];
	mov	dptr,#_USBBufOutPoint
	movx	a,@dptr
	mov	r7,a
	inc	a
	movx	@dptr,a
	mov	a,r7
	add	a,#_Ep2Buffer
	mov	dpl,a
	clr	a
	addc	a,#(_Ep2Buffer >> 8)
	mov	dph,a
	movx	a,@dptr
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:179: }
	mov	dpl,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UsbCdc_RxDone'
;------------------------------------------------------------
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:181: void UsbCdc_RxDone(void)
;	-----------------------------------------
;	 function UsbCdc_RxDone
;	-----------------------------------------
_UsbCdc_RxDone:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:183: if ( USBByteCount )
	mov	dptr,#_USBByteCount
	movx	a,@dptr
	jz	00105$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:185: USBByteCount--;
	mov	dptr,#_USBByteCount
	movx	a,@dptr
	dec	a
	movx	@dptr,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:186: if ( USBByteCount == 0 )                                         /* 本包处理完, 恢复接收 */
	movx	a,@dptr
	jnz	00105$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:188: UEP2_CTRL = UEP2_CTRL & ~ MASK_UEP_R_RES | UEP_R_RES_ACK;
	anl	_UEP2_CTRL,#0xf3
00105$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:191: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UsbCdc_TxReady'
;------------------------------------------------------------
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:197: uint8_t UsbCdc_TxReady(void)
;	-----------------------------------------
;	 function UsbCdc_TxReady
;	-----------------------------------------
_UsbCdc_TxReady:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:199: return ( UpPoint2_Busy == 0 );
	mov	dptr,#_UpPoint2_Busy
	movx	a,@dptr
	mov	r7,a
	clr	a
	cjne	r7,#0x00,00103$
	inc	a
00103$:
	mov	dpl,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:200: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UsbCdc_TxSend'
;------------------------------------------------------------
;len                       Allocated with name '_UsbCdc_TxSend_PARM_2'
;data                      Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:202: void UsbCdc_TxSend(const uint8_t *data, uint8_t len)
;	-----------------------------------------
;	 function UsbCdc_TxSend
;	-----------------------------------------
_UsbCdc_TxSend:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:204: if ( data == 0 || len == 0 )                                         /* 空包不处理 */
	mov	a,r5
	orl	a,r6
	jz	00101$
	mov	a,_UsbCdc_TxSend_PARM_2
	jnz	00102$
00101$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:206: return;
	ret
00102$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:208: if ( len > MAX_PACKET_SIZE )                                         /* 保险: 不超过端点缓冲半区 */
	mov	a,_UsbCdc_TxSend_PARM_2
	add	a,#0xff - 0x40
	jnc	00105$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:210: len = MAX_PACKET_SIZE;
	mov	_UsbCdc_TxSend_PARM_2,#0x40
00105$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:212: if ( UpPoint2_Busy )                                                 /* 上传忙, 丢弃(调用方应先查 TxReady) */
	mov	dptr,#_UpPoint2_Busy
	movx	a,@dptr
	jz	00107$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:214: return;
	ret
00107$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:216: memcpy( Ep2Buffer + MAX_PACKET_SIZE, data, len );                    /* 拷入 EP2 IN 缓冲半区 */
	mov	___memcpy_PARM_2,r5
	mov	(___memcpy_PARM_2 + 1),r6
	mov	(___memcpy_PARM_2 + 2),r7
	mov	___memcpy_PARM_3,_UsbCdc_TxSend_PARM_2
	mov	(___memcpy_PARM_3 + 1),#0x00
	mov	dptr,#(_Ep2Buffer + 0x0040)
	mov	b,#0x00
	lcall	___memcpy
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:217: UEP2_T_LEN = len;                                                    /* 预使用发送长度 */
	mov	_UEP2_T_LEN,_UsbCdc_TxSend_PARM_2
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:218: UEP2_CTRL = UEP2_CTRL & ~ MASK_UEP_T_RES | UEP_T_RES_ACK;            /* 应答 ACK, 启动上传 */
	anl	_UEP2_CTRL,#0xfc
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:219: UpPoint2_Busy = 1;
	mov	dptr,#_UpPoint2_Busy
	mov	a,#0x01
	movx	@dptr,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:220: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UsbCdc_DeviceInterrupt'
;------------------------------------------------------------
;len                       Allocated to registers r4 r5 
;------------------------------------------------------------
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:230: void UsbCdc_DeviceInterrupt(void)
;	-----------------------------------------
;	 function UsbCdc_DeviceInterrupt
;	-----------------------------------------
_UsbCdc_DeviceInterrupt:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:233: if(UIF_TRANSFER)                                                     /* USB 传输完成标志 */
	jb	_UIF_TRANSFER,00524$
	ljmp	00215$
00524$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:235: switch (USB_INT_ST & (MASK_UIS_TOKEN | MASK_UIS_ENDP))
	mov	a,#0x3f
	anl	a,_USB_INT_ST
	mov	r7,a
	mov	r6,a
	cjne	r6,#0x00,00525$
	ljmp	00206$
00525$:
	cjne	r7,#0x02,00526$
	sjmp	00103$
00526$:
	cjne	r7,#0x20,00527$
	ljmp	00201$
00527$:
	cjne	r7,#0x21,00528$
	sjmp	00101$
00528$:
	cjne	r7,#0x22,00529$
	sjmp	00102$
00529$:
	cjne	r7,#0x30,00530$
	sjmp	00106$
00530$:
	ljmp	00213$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:237: case UIS_TOKEN_IN | 1:                                           /* 端点1 中断上传完成 */
00101$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:238: UEP1_T_LEN = 0;
	mov	_UEP1_T_LEN,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:239: UEP1_CTRL = UEP1_CTRL & ~ MASK_UEP_T_RES | UEP_T_RES_NAK;    /* 默认应答 NAK */
	mov	a,#0xfc
	anl	a,_UEP1_CTRL
	orl	a,#0x02
	mov	_UEP1_CTRL,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:240: break;
	ljmp	00213$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:241: case UIS_TOKEN_IN | 2:                                           /* 端点2 批量上传完成 */
00102$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:243: UEP2_T_LEN = 0;                                              /* 预使用发送长度清零 */
	mov	_UEP2_T_LEN,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:244: UEP2_CTRL = UEP2_CTRL & ~ MASK_UEP_T_RES | UEP_T_RES_NAK;    /* 默认应答 NAK */
	mov	a,#0xfc
	anl	a,_UEP2_CTRL
	orl	a,#0x02
	mov	_UEP2_CTRL,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:245: UpPoint2_Busy = 0;                                           /* 清忙标志 */
	mov	dptr,#_UpPoint2_Busy
	clr	a
	movx	@dptr,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:247: break;
	ljmp	00213$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:248: case UIS_TOKEN_OUT | 2:                                          /* 端点2 批量下传(主机->设备) */
00103$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:249: if ( U_TOG_OK )                                              /* 不同步数据包丢弃 */
	jb	_U_TOG_OK,00531$
	ljmp	00213$
00531$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:251: USBByteCount = USB_RX_LEN;                               /* 记录本包长度 */
	mov	dptr,#_USBByteCount
	mov	a,_USB_RX_LEN
	movx	@dptr,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:252: USBBufOutPoint = 0;                                      /* 读指针复位 */
	mov	dptr,#_USBBufOutPoint
	clr	a
	movx	@dptr,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:253: UEP2_CTRL = UEP2_CTRL & ~ MASK_UEP_R_RES | UEP_R_RES_NAK;/* 收完一包先NAK, 主循环处理完再恢复ACK */
	mov	a,#0xf3
	anl	a,_UEP2_CTRL
	orl	a,#0x08
	mov	_UEP2_CTRL,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:255: break;
	ljmp	00213$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:256: case UIS_TOKEN_SETUP | 0:                                        /* SETUP 事务 */
00106$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:257: len = USB_RX_LEN;
	mov	r6,_USB_RX_LEN
	mov	r7,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:258: if(len == (sizeof(USB_SETUP_REQ)))
	cjne	r6,#0x08,00532$
	cjne	r7,#0x00,00532$
	sjmp	00533$
00532$:
	ljmp	00193$
00533$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:260: SetupLen = ((uint16_t)UsbSetupBuf->wLengthH<<8) | (UsbSetupBuf->wLengthL);
	mov	dptr,#(_Ep0Buffer + 0x0007)
	movx	a,@dptr
	mov	r6,a
	mov	r7,#0x00
	mov	dptr,#(_Ep0Buffer + 0x0006)
	movx	a,@dptr
	mov	r4,#0x00
	orl	a,r7
	mov	_SetupLen,a
	mov	a,r4
	orl	a,r6
	mov	(_SetupLen + 1),a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:261: len = 0;                                                 /* 默认成功并上传0长度 */
	mov	r6,#0x00
	mov	r7,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:262: SetupReq = UsbSetupBuf->bRequest;
	mov	dptr,#(_Ep0Buffer + 0x0001)
	movx	a,@dptr
	mov	_SetupReq,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:263: if ( ( UsbSetupBuf->bRequestType & USB_REQ_TYP_MASK ) != USB_REQ_TYP_STANDARD ) /* 非标准(类)请求 */
	mov	dptr,#_Ep0Buffer
	movx	a,@dptr
	mov	r5,a
	anl	a,#0x60
	jz	00190$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:265: switch( SetupReq )
	mov	a,#0x20
	cjne	a,_SetupReq,00535$
	ljmp	00194$
00535$:
	mov	a,#0x21
	cjne	a,_SetupReq,00536$
	sjmp	00107$
00536$:
	mov	a,#0x22
	cjne	a,_SetupReq,00537$
	ljmp	00194$
00537$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:267: case GET_LINE_CODING:                                /* 0x21 查询当前线路编码 */
	sjmp	00110$
00107$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:268: pDescr = LineCoding;
	mov	_pDescr,#_LineCoding
	mov	(_pDescr + 1),#(_LineCoding >> 8)
	mov	(_pDescr + 2),#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:270: len = SetupLen >= DEFAULT_ENDP0_SIZE ? DEFAULT_ENDP0_SIZE : SetupLen;
	mov	r4,_SetupLen
	mov	r5,(_SetupLen + 1)
	clr	c
	mov	a,r4
	subb	a,#0x08
	mov	a,r5
	subb	a,#0x00
	mov	_UsbCdc_DeviceInterrupt_sloc0_1_0,c
	jc	00228$
	mov	r4,#0x08
	mov	r5,#0x00
	sjmp	00229$
00228$:
	mov	r4,_SetupLen
	mov	r5,(_SetupLen + 1)
00229$:
	mov	ar6,r4
	mov	ar7,r5
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:271: memcpy(Ep0Buffer,pDescr,len);
	mov	___memcpy_PARM_2,_pDescr
	mov	(___memcpy_PARM_2 + 1),(_pDescr + 1)
	mov	(___memcpy_PARM_2 + 2),(_pDescr + 2)
	mov	___memcpy_PARM_3,r6
	mov	(___memcpy_PARM_3 + 1),r7
	mov	dptr,#_Ep0Buffer
	mov	b,#0x00
	push	ar7
	push	ar6
	lcall	___memcpy
	pop	ar6
	pop	ar7
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:272: SetupLen -= len;
	mov	a,_SetupLen
	clr	c
	subb	a,r6
	mov	_SetupLen,a
	mov	a,(_SetupLen + 1)
	subb	a,r7
	mov	(_SetupLen + 1),a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:273: pDescr += len;
	mov	a,r6
	add	a,_pDescr
	mov	_pDescr,a
	mov	a,r7
	addc	a,(_pDescr + 1)
	mov	(_pDescr + 1),a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:274: break;
	ljmp	00194$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:279: default:
00110$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:280: len = 0xFF;                                      /* 不支持的命令 */
	mov	r6,#0xff
	mov	r7,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:282: }
	ljmp	00194$
00190$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:286: switch(SetupReq)
	mov	a,_SetupReq
	add	a,#0xff - 0x0a
	jnc	00539$
	ljmp	00187$
00539$:
	mov	a,_SetupReq
	add	a,#(00540$-3-.)
	movc	a,@a+pc
	mov	dpl,a
	mov	a,_SetupReq
	add	a,#(00541$-3-.)
	movc	a,@a+pc
	mov	dph,a
	clr	a
	jmp	@a+dptr
00540$:
	.db	00183$
	.db	00135$
	.db	00187$
	.db	00156$
	.db	00187$
	.db	00129$
	.db	00112$
	.db	00187$
	.db	00130$
	.db	00133$
	.db	00194$
00541$:
	.db	00183$>>8
	.db	00135$>>8
	.db	00187$>>8
	.db	00156$>>8
	.db	00187$>>8
	.db	00129$>>8
	.db	00112$>>8
	.db	00187$>>8
	.db	00130$>>8
	.db	00133$>>8
	.db	00194$>>8
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:288: case USB_GET_DESCRIPTOR:
00112$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:289: switch(UsbSetupBuf->wValueH)
	mov	dptr,#(_Ep0Buffer + 0x0003)
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x01,00542$
	sjmp	00113$
00542$:
	cjne	r5,#0x02,00543$
	sjmp	00114$
00543$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:291: case 1:                                          /* 设备描述符 */
	cjne	r5,#0x03,00125$
	sjmp	00115$
00113$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:292: pDescr = DevDesc;
	mov	_pDescr,#_DevDesc
	mov	(_pDescr + 1),#(_DevDesc >> 8)
	mov	(_pDescr + 2),#0x80
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:293: len = sizeof(DevDesc);
	mov	r4,#0x12
	mov	r5,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:294: break;
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:295: case 2:                                          /* 配置描述符 */
	sjmp	00126$
00114$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:296: pDescr = CfgDesc;
	mov	_pDescr,#_CfgDesc
	mov	(_pDescr + 1),#(_CfgDesc >> 8)
	mov	(_pDescr + 2),#0x80
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:297: len = sizeof(CfgDesc);
	mov	r4,#0x43
	mov	r5,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:298: break;
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:299: case 3:                                          /* 字符串描述符 */
	sjmp	00126$
00115$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:300: if(UsbSetupBuf->wValueL == 0)
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	jnz	00123$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:302: pDescr = LangDes;
	mov	_pDescr,#_LangDes
	mov	(_pDescr + 1),#(_LangDes >> 8)
	mov	(_pDescr + 2),#0x80
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:303: len = sizeof(LangDes);
	mov	r4,#0x04
	mov	r5,#0x00
	sjmp	00126$
00123$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:305: else if(UsbSetupBuf->wValueL == 1)
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	r3,a
	cjne	r3,#0x01,00120$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:307: pDescr = Manuf_Des;
	mov	_pDescr,#_Manuf_Des
	mov	(_pDescr + 1),#(_Manuf_Des >> 8)
	mov	(_pDescr + 2),#0x80
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:308: len = sizeof(Manuf_Des);
	mov	r4,#0x0a
	mov	r5,#0x00
	sjmp	00126$
00120$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:310: else if(UsbSetupBuf->wValueL == 2)
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	r3,a
	cjne	r3,#0x02,00117$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:312: pDescr = Prod_Des;
	mov	_pDescr,#_Prod_Des
	mov	(_pDescr + 1),#(_Prod_Des >> 8)
	mov	(_pDescr + 2),#0x80
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:313: len = sizeof(Prod_Des);
	mov	r4,#0x14
	mov	r5,#0x00
	sjmp	00126$
00117$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:317: pDescr = SerDes;
	mov	_pDescr,#_SerDes
	mov	(_pDescr + 1),#(_SerDes >> 8)
	mov	(_pDescr + 2),#0x80
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:318: len = sizeof(SerDes);
	mov	r4,#0x14
	mov	r5,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:320: break;
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:321: default:
	sjmp	00126$
00125$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:322: len = 0xff;                                  /* 不支持的命令或错误 */
	mov	r4,#0xff
	mov	r5,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:324: }
00126$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:325: if ( SetupLen > len )
	clr	c
	mov	a,r4
	subb	a,_SetupLen
	mov	a,r5
	subb	a,(_SetupLen + 1)
	jnc	00128$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:327: SetupLen = len;                              /* 限制总长度 */
	mov	_SetupLen,r4
	mov	(_SetupLen + 1),r5
00128$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:329: len = SetupLen >= DEFAULT_ENDP0_SIZE ? DEFAULT_ENDP0_SIZE : SetupLen;
	mov	r4,_SetupLen
	mov	r5,(_SetupLen + 1)
	clr	c
	mov	a,r4
	subb	a,#0x08
	mov	a,r5
	subb	a,#0x00
	mov	_UsbCdc_DeviceInterrupt_sloc0_1_0,c
	jc	00230$
	mov	r4,#0x08
	mov	r5,#0x00
	sjmp	00231$
00230$:
	mov	r4,_SetupLen
	mov	r5,(_SetupLen + 1)
00231$:
	mov	ar6,r4
	mov	ar7,r5
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:330: memcpy(Ep0Buffer,pDescr,len);                     /* 装载上传数据 */
	mov	___memcpy_PARM_2,_pDescr
	mov	(___memcpy_PARM_2 + 1),(_pDescr + 1)
	mov	(___memcpy_PARM_2 + 2),(_pDescr + 2)
	mov	___memcpy_PARM_3,r6
	mov	(___memcpy_PARM_3 + 1),r7
	mov	dptr,#_Ep0Buffer
	mov	b,#0x00
	push	ar7
	push	ar6
	lcall	___memcpy
	pop	ar6
	pop	ar7
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:331: SetupLen -= len;
	mov	a,_SetupLen
	clr	c
	subb	a,r6
	mov	_SetupLen,a
	mov	a,(_SetupLen + 1)
	subb	a,r7
	mov	(_SetupLen + 1),a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:332: pDescr += len;
	mov	a,r6
	add	a,_pDescr
	mov	_pDescr,a
	mov	a,r7
	addc	a,(_pDescr + 1)
	mov	(_pDescr + 1),a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:333: break;
	ljmp	00194$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:334: case USB_SET_ADDRESS:
00129$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:335: SetupLen = UsbSetupBuf->wValueL;                  /* 暂存设备地址 */
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	r5,a
	mov	_SetupLen,r5
	mov	(_SetupLen + 1),#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:336: break;
	ljmp	00194$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:337: case USB_GET_CONFIGURATION:
00130$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:338: Ep0Buffer[0] = UsbConfig;
	mov	dptr,#_Ep0Buffer
	mov	a,_UsbConfig
	movx	@dptr,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:339: if ( SetupLen >= 1 )
	mov	r4,_SetupLen
	mov	r5,(_SetupLen + 1)
	clr	c
	mov	a,r4
	subb	a,#0x01
	mov	a,r5
	subb	a,#0x00
	jnc	00552$
	ljmp	00194$
00552$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:341: len = 1;
	mov	r6,#0x01
	mov	r7,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:343: break;
	ljmp	00194$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:344: case USB_SET_CONFIGURATION:
00133$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:345: UsbConfig = UsbSetupBuf->wValueL;
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	_UsbConfig,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:346: break;
	ljmp	00194$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:349: case USB_CLEAR_FEATURE:                               /* 清除特性 */
00135$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:350: if( ( UsbSetupBuf->bRequestType & 0x1F ) == USB_REQ_RECIP_DEVICE )
	mov	dptr,#_Ep0Buffer
	movx	a,@dptr
	anl	a,#0x1f
	jnz	00154$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:352: if( ( ( ( uint16_t )UsbSetupBuf->wValueH << 8 ) | UsbSetupBuf->wValueL ) == 0x01 )
	mov	dptr,#(_Ep0Buffer + 0x0003)
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	r3,a
	mov	r2,#0x00
	orl	ar5,a
	mov	a,r2
	orl	ar4,a
	cjne	r5,#0x01,00140$
	cjne	r4,#0x00,00140$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:354: if( CfgDesc[ 7 ] & 0x20 )
	mov	dptr,#(_CfgDesc + 0x0007)
	clr	a
	movc	a,@a+dptr
	mov	r5,a
	jnb	acc.5,00557$
	ljmp	00194$
00557$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:360: len = 0xFF;
	mov	r6,#0xff
	mov	r7,#0x00
	ljmp	00194$
00140$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:365: len = 0xFF;
	mov	r6,#0xff
	mov	r7,#0x00
	ljmp	00194$
00154$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:368: else if ( ( UsbSetupBuf->bRequestType & USB_REQ_RECIP_MASK ) == USB_REQ_RECIP_ENDP )
	mov	dptr,#_Ep0Buffer
	movx	a,@dptr
	mov	r5,a
	anl	ar5,#0x1f
	mov	r4,#0x00
	cjne	r5,#0x02,00151$
	cjne	r4,#0x00,00151$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:370: switch( UsbSetupBuf->wIndexL )
	mov	dptr,#(_Ep0Buffer + 0x0004)
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x01,00560$
	sjmp	00147$
00560$:
	cjne	r5,#0x02,00561$
	sjmp	00145$
00561$:
	cjne	r5,#0x03,00562$
	sjmp	00143$
00562$:
	cjne	r5,#0x81,00563$
	sjmp	00146$
00563$:
	cjne	r5,#0x82,00564$
	sjmp	00144$
00564$:
	cjne	r5,#0x83,00148$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:373: UEP3_CTRL = UEP3_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
	mov	a,#0xbc
	anl	a,_UEP3_CTRL
	orl	a,#0x02
	mov	_UEP3_CTRL,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:374: break;
	ljmp	00194$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:375: case 0x03:
00143$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:376: UEP3_CTRL = UEP3_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
	anl	_UEP3_CTRL,#0x73
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:377: break;
	ljmp	00194$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:378: case 0x82:
00144$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:379: UEP2_CTRL = UEP2_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
	mov	a,#0xbc
	anl	a,_UEP2_CTRL
	orl	a,#0x02
	mov	_UEP2_CTRL,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:380: break;
	ljmp	00194$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:381: case 0x02:
00145$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:382: UEP2_CTRL = UEP2_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
	anl	_UEP2_CTRL,#0x73
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:383: break;
	ljmp	00194$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:384: case 0x81:
00146$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:385: UEP1_CTRL = UEP1_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
	mov	a,#0xbc
	anl	a,_UEP1_CTRL
	orl	a,#0x02
	mov	_UEP1_CTRL,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:386: break;
	ljmp	00194$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:387: case 0x01:
00147$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:388: UEP1_CTRL = UEP1_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
	anl	_UEP1_CTRL,#0x73
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:389: break;
	ljmp	00194$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:390: default:
00148$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:391: len = 0xFF;
	mov	r6,#0xff
	mov	r7,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:393: }
	ljmp	00194$
00151$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:397: len = 0xFF;
	mov	r6,#0xff
	mov	r7,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:399: break;
	ljmp	00194$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:400: case USB_SET_FEATURE:                                 /* 设置特性 */
00156$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:401: if( ( UsbSetupBuf->bRequestType & 0x1F ) == USB_REQ_RECIP_DEVICE )
	mov	dptr,#_Ep0Buffer
	movx	a,@dptr
	anl	a,#0x1f
	jnz	00181$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:403: if( ( ( ( uint16_t )UsbSetupBuf->wValueH << 8 ) | UsbSetupBuf->wValueL ) == 0x01 )
	mov	dptr,#(_Ep0Buffer + 0x0003)
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	r3,a
	mov	r2,#0x00
	orl	ar5,a
	mov	a,r2
	orl	ar4,a
	cjne	r5,#0x01,00164$
	cjne	r4,#0x00,00164$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:405: if( CfgDesc[ 7 ] & 0x20 )
	mov	dptr,#(_CfgDesc + 0x0007)
	clr	a
	movc	a,@a+dptr
	mov	r5,a
	jnb	acc.5,00161$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:411: while ( XBUS_AUX & bUART0_TX )
00157$:
	mov	a,_XBUS_AUX
	jb	acc.7,00157$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:415: SAFE_MOD = 0x55;
	mov	_SAFE_MOD,#0x55
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:416: SAFE_MOD = 0xAA;
	mov	_SAFE_MOD,#0xaa
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:417: WAKE_CTRL = bWAK_BY_USB | bWAK_RXD0_LO | bWAK_RXD1_LO;
	mov	_WAKE_CTRL,#0xc1
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:418: PCON |= PD;                            /* 睡眠 */
	orl	_PCON,#0x02
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:419: SAFE_MOD = 0x55;
	mov	_SAFE_MOD,#0x55
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:420: SAFE_MOD = 0xAA;
	mov	_SAFE_MOD,#0xaa
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:421: WAKE_CTRL = 0x00;
	mov	_WAKE_CTRL,#0x00
	ljmp	00194$
00161$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:425: len = 0xFF;
	mov	r6,#0xff
	mov	r7,#0x00
	ljmp	00194$
00164$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:430: len = 0xFF;
	mov	r6,#0xff
	mov	r7,#0x00
	ljmp	00194$
00181$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:433: else if( ( UsbSetupBuf->bRequestType & 0x1F ) == USB_REQ_RECIP_ENDP )
	mov	dptr,#_Ep0Buffer
	movx	a,@dptr
	mov	r5,a
	anl	ar5,#0x1f
	mov	r4,#0x00
	cjne	r5,#0x02,00573$
	cjne	r4,#0x00,00573$
	sjmp	00574$
00573$:
	ljmp	00178$
00574$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:435: if( ( ( ( uint16_t )UsbSetupBuf->wValueH << 8 ) | UsbSetupBuf->wValueL ) == 0x00 )
	mov	dptr,#(_Ep0Buffer + 0x0003)
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	r3,a
	mov	r2,#0x00
	orl	ar5,a
	mov	a,r2
	orl	ar4,a
	mov	a,r5
	orl	a,r4
	jz	00575$
	ljmp	00175$
00575$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:437: switch( ( ( uint16_t )UsbSetupBuf->wIndexH << 8 ) | UsbSetupBuf->wIndexL )
	mov	dptr,#(_Ep0Buffer + 0x0005)
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	mov	dptr,#(_Ep0Buffer + 0x0004)
	movx	a,@dptr
	mov	r3,a
	mov	r2,#0x00
	orl	ar5,a
	mov	a,r2
	orl	ar4,a
	cjne	r5,#0x01,00576$
	cjne	r4,#0x00,00576$
	sjmp	00171$
00576$:
	cjne	r5,#0x02,00577$
	cjne	r4,#0x00,00577$
	sjmp	00169$
00577$:
	cjne	r5,#0x03,00578$
	cjne	r4,#0x00,00578$
	sjmp	00167$
00578$:
	cjne	r5,#0x81,00579$
	cjne	r4,#0x00,00579$
	sjmp	00170$
00579$:
	cjne	r5,#0x82,00580$
	cjne	r4,#0x00,00580$
	sjmp	00168$
00580$:
	cjne	r5,#0x83,00172$
	cjne	r4,#0x00,00172$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:440: UEP3_CTRL = UEP3_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;
	mov	a,#0xbf
	anl	a,_UEP3_CTRL
	orl	a,#0x03
	mov	_UEP3_CTRL,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:441: break;
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:442: case 0x03:
	sjmp	00194$
00167$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:443: UEP3_CTRL = UEP3_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;
	mov	a,#0x7f
	anl	a,_UEP3_CTRL
	orl	a,#0x0c
	mov	_UEP3_CTRL,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:444: break;
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:445: case 0x82:
	sjmp	00194$
00168$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:446: UEP2_CTRL = UEP2_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;
	mov	a,#0xbf
	anl	a,_UEP2_CTRL
	orl	a,#0x03
	mov	_UEP2_CTRL,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:447: break;
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:448: case 0x02:
	sjmp	00194$
00169$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:449: UEP2_CTRL = UEP2_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;
	mov	a,#0x7f
	anl	a,_UEP2_CTRL
	orl	a,#0x0c
	mov	_UEP2_CTRL,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:450: break;
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:451: case 0x81:
	sjmp	00194$
00170$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:452: UEP1_CTRL = UEP1_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;
	mov	a,#0xbf
	anl	a,_UEP1_CTRL
	orl	a,#0x03
	mov	_UEP1_CTRL,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:453: break;
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:454: case 0x01:
	sjmp	00194$
00171$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:455: UEP1_CTRL = UEP1_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;
	mov	a,#0x7f
	anl	a,_UEP1_CTRL
	orl	a,#0x0c
	mov	_UEP1_CTRL,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:456: default:
00172$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:457: len = 0xFF;
	mov	r6,#0xff
	mov	r7,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:459: }
	sjmp	00194$
00175$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:463: len = 0xFF;
	mov	r6,#0xff
	mov	r7,#0x00
	sjmp	00194$
00178$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:468: len = 0xFF;
	mov	r6,#0xff
	mov	r7,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:470: break;
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:471: case USB_GET_STATUS:
	sjmp	00194$
00183$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:472: Ep0Buffer[0] = 0x00;
	mov	dptr,#_Ep0Buffer
	clr	a
	movx	@dptr,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:473: Ep0Buffer[1] = 0x00;
	mov	dptr,#(_Ep0Buffer + 0x0001)
	movx	@dptr,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:474: if ( SetupLen >= 2 )
	mov	r4,_SetupLen
	mov	r5,(_SetupLen + 1)
	clr	c
	mov	a,r4
	subb	a,#0x02
	mov	a,r5
	subb	a,#0x00
	jc	00185$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:476: len = 2;
	mov	r6,#0x02
	mov	r7,#0x00
	sjmp	00194$
00185$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:480: len = SetupLen;
	mov	r6,_SetupLen
	mov	r7,(_SetupLen + 1)
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:482: break;
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:483: default:
	sjmp	00194$
00187$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:484: len = 0xff;
	mov	r6,#0xff
	mov	r7,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:486: }
	sjmp	00194$
00193$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:491: len = 0xff;                                              /* 包长度错误 */
	mov	r6,#0xff
	mov	r7,#0x00
00194$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:493: if(len == 0xff)
	mov	ar4,r6
	mov	ar5,r7
	cjne	r4,#0xff,00199$
	cjne	r5,#0x00,00199$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:495: SetupReq = 0xFF;
	mov	_SetupReq,#0xff
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:496: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_STALL | UEP_T_RES_STALL;/* STALL */
	mov	_UEP0_CTRL,#0xcf
	ljmp	00213$
00199$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:498: else if(len <= DEFAULT_ENDP0_SIZE)                           /* 上传数据或状态阶段返回0长度包 */
	clr	c
	mov	a,#0x08
	subb	a,r4
	clr	a
	subb	a,r5
	jc	00196$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:500: UEP0_T_LEN = len;
	mov	_UEP0_T_LEN,r6
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:501: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_ACK | UEP_T_RES_ACK;
	mov	_UEP0_CTRL,#0xc0
	ljmp	00213$
00196$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:505: UEP0_T_LEN = 0;                                          /* 预置0长度包, 防止主机提前进入状态阶段 */
	mov	_UEP0_T_LEN,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:506: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_ACK | UEP_T_RES_ACK;
	mov	_UEP0_CTRL,#0xc0
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:508: break;
	ljmp	00213$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:509: case UIS_TOKEN_IN | 0:                                           /* 端点0 IN */
00201$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:510: switch(SetupReq)
	mov	a,#0x05
	cjne	a,_SetupReq,00587$
	sjmp	00203$
00587$:
	mov	a,#0x06
	cjne	a,_SetupReq,00204$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:513: len = SetupLen >= DEFAULT_ENDP0_SIZE ? DEFAULT_ENDP0_SIZE : SetupLen;
	mov	r6,_SetupLen
	mov	r7,(_SetupLen + 1)
	clr	c
	mov	a,r6
	subb	a,#0x08
	mov	a,r7
	subb	a,#0x00
	mov	_UsbCdc_DeviceInterrupt_sloc0_1_0,c
	jc	00232$
	mov	r6,#0x08
	mov	r7,#0x00
	sjmp	00233$
00232$:
	mov	r6,_SetupLen
	mov	r7,(_SetupLen + 1)
00233$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:514: memcpy( Ep0Buffer, pDescr, len );                        /* 加载上传数据 */
	mov	___memcpy_PARM_2,_pDescr
	mov	(___memcpy_PARM_2 + 1),(_pDescr + 1)
	mov	(___memcpy_PARM_2 + 2),(_pDescr + 2)
	mov	___memcpy_PARM_3,r6
	mov	(___memcpy_PARM_3 + 1),r7
	mov	dptr,#_Ep0Buffer
	mov	b,#0x00
	push	ar7
	push	ar6
	lcall	___memcpy
	pop	ar6
	pop	ar7
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:515: SetupLen -= len;
	mov	a,_SetupLen
	clr	c
	subb	a,r6
	mov	_SetupLen,a
	mov	a,(_SetupLen + 1)
	subb	a,r7
	mov	(_SetupLen + 1),a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:516: pDescr += len;
	mov	a,r6
	add	a,_pDescr
	mov	_pDescr,a
	mov	a,r7
	addc	a,(_pDescr + 1)
	mov	(_pDescr + 1),a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:517: UEP0_T_LEN = len;
	mov	_UEP0_T_LEN,r6
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:518: UEP0_CTRL ^= bUEP_T_TOG;                                 /* 同步标志翻转 */
	xrl	_UEP0_CTRL,#0x40
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:519: break;
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:520: case USB_SET_ADDRESS:
	sjmp	00213$
00203$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:521: USB_DEV_AD = USB_DEV_AD & bUDA_GP_BIT | SetupLen;
	mov	a,_USB_DEV_AD
	anl	a,#0x80
	mov	r7,a
	mov	a,_SetupLen
	mov	r6,a
	orl	a,r7
	mov	_USB_DEV_AD,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:522: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
	mov	_UEP0_CTRL,#0x02
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:523: break;
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:524: default:
	sjmp	00213$
00204$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:525: UEP0_T_LEN = 0;                                          /* 状态阶段完成或强制0长度包结束控制传输 */
	mov	_UEP0_T_LEN,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:526: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
	mov	_UEP0_CTRL,#0x02
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:529: break;
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:530: case UIS_TOKEN_OUT | 0:                                          /* 端点0 OUT */
	sjmp	00213$
00206$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:531: if(SetupReq == SET_LINE_CODING)                              /* 设置串口属性 */
	mov	a,#0x20
	cjne	a,_SetupReq,00210$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:533: if( U_TOG_OK )
	jnb	_U_TOG_OK,00213$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:535: memcpy(LineCoding,UsbSetupBuf,USB_RX_LEN);
	mov	___memcpy_PARM_2,#_Ep0Buffer
	mov	(___memcpy_PARM_2 + 1),#(_Ep0Buffer >> 8)
	mov	(___memcpy_PARM_2 + 2),#0x00
	mov	___memcpy_PARM_3,_USB_RX_LEN
	mov	(___memcpy_PARM_3 + 1),#0x00
	mov	dptr,#_LineCoding
	mov	b,#0x00
	lcall	___memcpy
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:536: Config_Uart1(LineCoding);
	mov	dptr,#_LineCoding
	mov	b,#0x00
	lcall	_Config_Uart1
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:537: UEP0_T_LEN = 0;
	mov	_UEP0_T_LEN,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:538: UEP0_CTRL |= UEP_R_RES_ACK | UEP_T_RES_ACK;          /* 准备上传0包 */
	mov	_UEP0_CTRL,_UEP0_CTRL
	sjmp	00213$
00210$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:543: UEP0_T_LEN = 0;
	mov	_UEP0_T_LEN,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:544: UEP0_CTRL |= UEP_R_RES_ACK | UEP_T_RES_NAK;              /* 状态阶段, IN 响应 NAK */
	orl	_UEP0_CTRL,#0x02
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:549: }
00213$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:550: UIF_TRANSFER = 0;                                                /* 写0清空中断 */
;	assignBit
	clr	_UIF_TRANSFER
00215$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:552: if(UIF_BUS_RST)                                                      /* 设备模式 USB 总线复位中断 */
	jnb	_UIF_BUS_RST,00217$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:557: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
	mov	_UEP0_CTRL,#0x02
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:558: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK;
	mov	_UEP1_CTRL,#0x12
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:559: UEP2_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;
	mov	_UEP2_CTRL,#0x12
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:560: USB_DEV_AD = 0x00;
	mov	_USB_DEV_AD,#0x00
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:561: UIF_SUSPEND = 0;
;	assignBit
	clr	_UIF_SUSPEND
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:562: UIF_TRANSFER = 0;
;	assignBit
	clr	_UIF_TRANSFER
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:563: UIF_BUS_RST = 0;                                                 /* 清中断标志 */
;	assignBit
	clr	_UIF_BUS_RST
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:564: USBByteCount = 0;                                                /* USB 端点待处理字节数清零 */
	mov	dptr,#_USBByteCount
	clr	a
	movx	@dptr,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:565: USBBufOutPoint = 0;
	mov	dptr,#_USBBufOutPoint
	movx	@dptr,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:566: UsbConfig = 0;                                                   /* 清除配置值 */
;	1-genFromRTrack replaced	mov	_UsbConfig,#0x00
	mov	_UsbConfig,a
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:567: UpPoint2_Busy = 0;
	mov	dptr,#_UpPoint2_Busy
	movx	@dptr,a
00217$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:569: if (UIF_SUSPEND)                                                     /* USB 总线挂起/唤醒完成 */
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:571: UIF_SUSPEND = 0;
;	assignBit
	jbc	_UIF_SUSPEND,00595$
	sjmp	00224$
00595$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:572: if ( USB_MIS_ST & bUMS_SUSPEND )                                 /* 挂起 */
	mov	a,_USB_MIS_ST
	jnb	acc.2,00226$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:577: while ( XBUS_AUX & bUART0_TX )
00218$:
	mov	a,_XBUS_AUX
	jb	acc.7,00218$
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:581: SAFE_MOD = 0x55;
	mov	_SAFE_MOD,#0x55
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:582: SAFE_MOD = 0xAA;
	mov	_SAFE_MOD,#0xaa
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:583: WAKE_CTRL = bWAK_BY_USB | bWAK_RXD0_LO | bWAK_RXD1_LO;        /* USB 或 RXD0/1 有信号可唤醒 */
	mov	_WAKE_CTRL,#0xc1
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:584: PCON |= PD;                                                   /* 睡眠 */
	orl	_PCON,#0x02
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:585: SAFE_MOD = 0x55;
	mov	_SAFE_MOD,#0x55
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:586: SAFE_MOD = 0xAA;
	mov	_SAFE_MOD,#0xaa
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:587: WAKE_CTRL = 0x00;
	mov	_WAKE_CTRL,#0x00
	ret
00224$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:592: USB_INT_FG = 0xFF;                                               /* 清中断标志 */
	mov	_USB_INT_FG,#0xff
00226$:
;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:594: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
_DevDesc:
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x86	; 134
	.db #0x1a	; 26
	.db #0x22	; 34
	.db #0x57	; 87	'W'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
_CfgDesc:
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x32	; 50	'2'
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x24	; 36
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x24	; 36
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x81	; 129
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x82	; 130
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
_LangDes:
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x09	; 9
	.db #0x04	; 4
_SerDes:
	.db #0x14	; 20
	.db #0x03	; 3
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0x37	; 55	'7'
	.db #0x00	; 0
	.db #0x2d	; 45
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x2d	; 45
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x35	; 53	'5'
	.db #0x00	; 0
_Prod_Des:
	.db #0x14	; 20
	.db #0x03	; 3
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x35	; 53	'5'
	.db #0x00	; 0
	.db #0x35	; 53	'5'
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x00	; 0
	.db #0x5f	; 95
	.db #0x00	; 0
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x43	; 67	'C'
	.db #0x00	; 0
_Manuf_Des:
	.db #0x0a	; 10
	.db #0x03	; 3
	.db #0x5f	; 95
	.db #0x6c	; 108	'l'
	.db #0xcf	; 207
	.db #0x82	; 130
	.db #0x81	; 129
	.db #0x6c	; 108	'l'
	.db #0x52	; 82	'R'
	.db #0x60	; 96
	.area XINIT   (CODE)
__xinit__LineCoding:
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
__xinit__USBByteCount:
	.db #0x00	; 0
__xinit__USBBufOutPoint:
	.db #0x00	; 0
__xinit__UpPoint2_Busy:
	.db #0x00	; 0
	.area CABS    (ABS,CODE)
