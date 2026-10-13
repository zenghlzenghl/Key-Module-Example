                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module usbcdc
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl ___memcpy
                                     12 	.globl _UIF_BUS_RST
                                     13 	.globl _UIF_DETECT
                                     14 	.globl _UIF_TRANSFER
                                     15 	.globl _UIF_SUSPEND
                                     16 	.globl _UIF_HST_SOF
                                     17 	.globl _UIF_FIFO_OV
                                     18 	.globl _U_SIE_FREE
                                     19 	.globl _U_TOG_OK
                                     20 	.globl _U_IS_NAK
                                     21 	.globl _ADC_CHAN0
                                     22 	.globl _ADC_CHAN1
                                     23 	.globl _CMP_CHAN
                                     24 	.globl _ADC_START
                                     25 	.globl _ADC_IF
                                     26 	.globl _CMP_IF
                                     27 	.globl _CMPO
                                     28 	.globl _U1RI
                                     29 	.globl _U1TI
                                     30 	.globl _U1RB8
                                     31 	.globl _U1TB8
                                     32 	.globl _U1REN
                                     33 	.globl _U1SMOD
                                     34 	.globl _U1SM0
                                     35 	.globl _S0_R_FIFO
                                     36 	.globl _S0_T_FIFO
                                     37 	.globl _S0_FREE
                                     38 	.globl _S0_IF_BYTE
                                     39 	.globl _S0_IF_FIRST
                                     40 	.globl _S0_IF_OV
                                     41 	.globl _S0_FST_ACT
                                     42 	.globl _CP_RL2
                                     43 	.globl _C_T2
                                     44 	.globl _TR2
                                     45 	.globl _EXEN2
                                     46 	.globl _TCLK
                                     47 	.globl _RCLK
                                     48 	.globl _EXF2
                                     49 	.globl _CAP1F
                                     50 	.globl _TF2
                                     51 	.globl _RI
                                     52 	.globl _TI
                                     53 	.globl _RB8
                                     54 	.globl _TB8
                                     55 	.globl _REN
                                     56 	.globl _SM2
                                     57 	.globl _SM1
                                     58 	.globl _SM0
                                     59 	.globl _IT0
                                     60 	.globl _IE0
                                     61 	.globl _IT1
                                     62 	.globl _IE1
                                     63 	.globl _TR0
                                     64 	.globl _TF0
                                     65 	.globl _TR1
                                     66 	.globl _TF1
                                     67 	.globl _RXD
                                     68 	.globl _PWM1_
                                     69 	.globl _TXD
                                     70 	.globl _PWM2_
                                     71 	.globl _AIN3
                                     72 	.globl _VBUS1
                                     73 	.globl _INT0
                                     74 	.globl _TXD1_
                                     75 	.globl _INT1
                                     76 	.globl _T0
                                     77 	.globl _RXD1_
                                     78 	.globl _PWM2
                                     79 	.globl _T1
                                     80 	.globl _UDP
                                     81 	.globl _UDM
                                     82 	.globl _TIN0
                                     83 	.globl _CAP1
                                     84 	.globl _T2
                                     85 	.globl _AIN0
                                     86 	.globl _VBUS2
                                     87 	.globl _TIN1
                                     88 	.globl _CAP2
                                     89 	.globl _T2EX
                                     90 	.globl _RXD_
                                     91 	.globl _TXD_
                                     92 	.globl _AIN1
                                     93 	.globl _UCC1
                                     94 	.globl _TIN2
                                     95 	.globl _SCS
                                     96 	.globl _CAP1_
                                     97 	.globl _T2_
                                     98 	.globl _AIN2
                                     99 	.globl _UCC2
                                    100 	.globl _TIN3
                                    101 	.globl _PWM1
                                    102 	.globl _MOSI
                                    103 	.globl _TIN4
                                    104 	.globl _RXD1
                                    105 	.globl _MISO
                                    106 	.globl _TIN5
                                    107 	.globl _TXD1
                                    108 	.globl _SCK
                                    109 	.globl _IE_SPI0
                                    110 	.globl _IE_TKEY
                                    111 	.globl _IE_USB
                                    112 	.globl _IE_ADC
                                    113 	.globl _IE_UART1
                                    114 	.globl _IE_PWMX
                                    115 	.globl _IE_GPIO
                                    116 	.globl _IE_WDOG
                                    117 	.globl _PX0
                                    118 	.globl _PT0
                                    119 	.globl _PX1
                                    120 	.globl _PT1
                                    121 	.globl _PS
                                    122 	.globl _PT2
                                    123 	.globl _PL_FLAG
                                    124 	.globl _PH_FLAG
                                    125 	.globl _EX0
                                    126 	.globl _ET0
                                    127 	.globl _EX1
                                    128 	.globl _ET1
                                    129 	.globl _ES
                                    130 	.globl _ET2
                                    131 	.globl _E_DIS
                                    132 	.globl _EA
                                    133 	.globl _P
                                    134 	.globl _F1
                                    135 	.globl _OV
                                    136 	.globl _RS0
                                    137 	.globl _RS1
                                    138 	.globl _F0
                                    139 	.globl _AC
                                    140 	.globl _CY
                                    141 	.globl _UEP1_DMA_H
                                    142 	.globl _UEP1_DMA_L
                                    143 	.globl _UEP1_DMA
                                    144 	.globl _UEP0_DMA_H
                                    145 	.globl _UEP0_DMA_L
                                    146 	.globl _UEP0_DMA
                                    147 	.globl _UEP2_3_MOD
                                    148 	.globl _UEP4_1_MOD
                                    149 	.globl _UEP3_DMA_H
                                    150 	.globl _UEP3_DMA_L
                                    151 	.globl _UEP3_DMA
                                    152 	.globl _UEP2_DMA_H
                                    153 	.globl _UEP2_DMA_L
                                    154 	.globl _UEP2_DMA
                                    155 	.globl _USB_DEV_AD
                                    156 	.globl _USB_CTRL
                                    157 	.globl _USB_INT_EN
                                    158 	.globl _UEP4_T_LEN
                                    159 	.globl _UEP4_CTRL
                                    160 	.globl _UEP0_T_LEN
                                    161 	.globl _UEP0_CTRL
                                    162 	.globl _USB_RX_LEN
                                    163 	.globl _USB_MIS_ST
                                    164 	.globl _USB_INT_ST
                                    165 	.globl _USB_INT_FG
                                    166 	.globl _UEP3_T_LEN
                                    167 	.globl _UEP3_CTRL
                                    168 	.globl _UEP2_T_LEN
                                    169 	.globl _UEP2_CTRL
                                    170 	.globl _UEP1_T_LEN
                                    171 	.globl _UEP1_CTRL
                                    172 	.globl _UDEV_CTRL
                                    173 	.globl _USB_C_CTRL
                                    174 	.globl _TKEY_DATH
                                    175 	.globl _TKEY_DATL
                                    176 	.globl _TKEY_DAT
                                    177 	.globl _TKEY_CTRL
                                    178 	.globl _ADC_DATA
                                    179 	.globl _ADC_CFG
                                    180 	.globl _ADC_CTRL
                                    181 	.globl _SBAUD1
                                    182 	.globl _SBUF1
                                    183 	.globl _SCON1
                                    184 	.globl _SPI0_SETUP
                                    185 	.globl _SPI0_CK_SE
                                    186 	.globl _SPI0_CTRL
                                    187 	.globl _SPI0_DATA
                                    188 	.globl _SPI0_STAT
                                    189 	.globl _PWM_CK_SE
                                    190 	.globl _PWM_CTRL
                                    191 	.globl _PWM_DATA1
                                    192 	.globl _PWM_DATA2
                                    193 	.globl _T2CAP1H
                                    194 	.globl _T2CAP1L
                                    195 	.globl _T2CAP1
                                    196 	.globl _TH2
                                    197 	.globl _TL2
                                    198 	.globl _T2COUNT
                                    199 	.globl _RCAP2H
                                    200 	.globl _RCAP2L
                                    201 	.globl _RCAP2
                                    202 	.globl _T2MOD
                                    203 	.globl _T2CON
                                    204 	.globl _SBUF
                                    205 	.globl _SCON
                                    206 	.globl _TH1
                                    207 	.globl _TH0
                                    208 	.globl _TL1
                                    209 	.globl _TL0
                                    210 	.globl _TMOD
                                    211 	.globl _TCON
                                    212 	.globl _XBUS_AUX
                                    213 	.globl _PIN_FUNC
                                    214 	.globl _P3_DIR_PU
                                    215 	.globl _P3_MOD_OC
                                    216 	.globl _P3
                                    217 	.globl _P2
                                    218 	.globl _P1_DIR_PU
                                    219 	.globl _P1_MOD_OC
                                    220 	.globl _P1
                                    221 	.globl _ROM_CTRL
                                    222 	.globl _ROM_DATA_H
                                    223 	.globl _ROM_DATA_L
                                    224 	.globl _ROM_DATA
                                    225 	.globl _ROM_ADDR_H
                                    226 	.globl _ROM_ADDR_L
                                    227 	.globl _ROM_ADDR
                                    228 	.globl _GPIO_IE
                                    229 	.globl _IP_EX
                                    230 	.globl _IE_EX
                                    231 	.globl _IP
                                    232 	.globl _IE
                                    233 	.globl _WDOG_COUNT
                                    234 	.globl _RESET_KEEP
                                    235 	.globl _WAKE_CTRL
                                    236 	.globl _CLOCK_CFG
                                    237 	.globl _PCON
                                    238 	.globl _GLOBAL_CFG
                                    239 	.globl _SAFE_MOD
                                    240 	.globl _DPH
                                    241 	.globl _DPL
                                    242 	.globl _SP
                                    243 	.globl _B
                                    244 	.globl _ACC
                                    245 	.globl _PSW
                                    246 	.globl _UsbCdc_TxSend_PARM_2
                                    247 	.globl _UsbCdc_Init
                                    248 	.globl _UsbCdc_IsConfigured
                                    249 	.globl _UsbCdc_RxBytes
                                    250 	.globl _UsbCdc_RxRead
                                    251 	.globl _UsbCdc_RxDone
                                    252 	.globl _UsbCdc_TxReady
                                    253 	.globl _UsbCdc_TxSend
                                    254 	.globl _UsbCdc_DeviceInterrupt
                                    255 ;--------------------------------------------------------
                                    256 ; special function registers
                                    257 ;--------------------------------------------------------
                                    258 	.area RSEG    (ABS,DATA)
      000000                        259 	.org 0x0000
                           0000D0   260 _PSW	=	0x00d0
                           0000E0   261 _ACC	=	0x00e0
                           0000F0   262 _B	=	0x00f0
                           000081   263 _SP	=	0x0081
                           000082   264 _DPL	=	0x0082
                           000083   265 _DPH	=	0x0083
                           0000A1   266 _SAFE_MOD	=	0x00a1
                           0000B1   267 _GLOBAL_CFG	=	0x00b1
                           000087   268 _PCON	=	0x0087
                           0000B9   269 _CLOCK_CFG	=	0x00b9
                           0000A9   270 _WAKE_CTRL	=	0x00a9
                           0000FE   271 _RESET_KEEP	=	0x00fe
                           0000FF   272 _WDOG_COUNT	=	0x00ff
                           0000A8   273 _IE	=	0x00a8
                           0000B8   274 _IP	=	0x00b8
                           0000E8   275 _IE_EX	=	0x00e8
                           0000E9   276 _IP_EX	=	0x00e9
                           0000C7   277 _GPIO_IE	=	0x00c7
                           008584   278 _ROM_ADDR	=	0x8584
                           000084   279 _ROM_ADDR_L	=	0x0084
                           000085   280 _ROM_ADDR_H	=	0x0085
                           008F8E   281 _ROM_DATA	=	0x8f8e
                           00008E   282 _ROM_DATA_L	=	0x008e
                           00008F   283 _ROM_DATA_H	=	0x008f
                           000086   284 _ROM_CTRL	=	0x0086
                           000090   285 _P1	=	0x0090
                           000092   286 _P1_MOD_OC	=	0x0092
                           000093   287 _P1_DIR_PU	=	0x0093
                           0000A0   288 _P2	=	0x00a0
                           0000B0   289 _P3	=	0x00b0
                           000096   290 _P3_MOD_OC	=	0x0096
                           000097   291 _P3_DIR_PU	=	0x0097
                           0000C6   292 _PIN_FUNC	=	0x00c6
                           0000A2   293 _XBUS_AUX	=	0x00a2
                           000088   294 _TCON	=	0x0088
                           000089   295 _TMOD	=	0x0089
                           00008A   296 _TL0	=	0x008a
                           00008B   297 _TL1	=	0x008b
                           00008C   298 _TH0	=	0x008c
                           00008D   299 _TH1	=	0x008d
                           000098   300 _SCON	=	0x0098
                           000099   301 _SBUF	=	0x0099
                           0000C8   302 _T2CON	=	0x00c8
                           0000C9   303 _T2MOD	=	0x00c9
                           00CBCA   304 _RCAP2	=	0xcbca
                           0000CA   305 _RCAP2L	=	0x00ca
                           0000CB   306 _RCAP2H	=	0x00cb
                           00CDCC   307 _T2COUNT	=	0xcdcc
                           0000CC   308 _TL2	=	0x00cc
                           0000CD   309 _TH2	=	0x00cd
                           00CFCE   310 _T2CAP1	=	0xcfce
                           0000CE   311 _T2CAP1L	=	0x00ce
                           0000CF   312 _T2CAP1H	=	0x00cf
                           00009B   313 _PWM_DATA2	=	0x009b
                           00009C   314 _PWM_DATA1	=	0x009c
                           00009D   315 _PWM_CTRL	=	0x009d
                           00009E   316 _PWM_CK_SE	=	0x009e
                           0000F8   317 _SPI0_STAT	=	0x00f8
                           0000F9   318 _SPI0_DATA	=	0x00f9
                           0000FA   319 _SPI0_CTRL	=	0x00fa
                           0000FB   320 _SPI0_CK_SE	=	0x00fb
                           0000FC   321 _SPI0_SETUP	=	0x00fc
                           0000C0   322 _SCON1	=	0x00c0
                           0000C1   323 _SBUF1	=	0x00c1
                           0000C2   324 _SBAUD1	=	0x00c2
                           000080   325 _ADC_CTRL	=	0x0080
                           00009A   326 _ADC_CFG	=	0x009a
                           00009F   327 _ADC_DATA	=	0x009f
                           0000C3   328 _TKEY_CTRL	=	0x00c3
                           00C5C4   329 _TKEY_DAT	=	0xc5c4
                           0000C4   330 _TKEY_DATL	=	0x00c4
                           0000C5   331 _TKEY_DATH	=	0x00c5
                           000091   332 _USB_C_CTRL	=	0x0091
                           0000D1   333 _UDEV_CTRL	=	0x00d1
                           0000D2   334 _UEP1_CTRL	=	0x00d2
                           0000D3   335 _UEP1_T_LEN	=	0x00d3
                           0000D4   336 _UEP2_CTRL	=	0x00d4
                           0000D5   337 _UEP2_T_LEN	=	0x00d5
                           0000D6   338 _UEP3_CTRL	=	0x00d6
                           0000D7   339 _UEP3_T_LEN	=	0x00d7
                           0000D8   340 _USB_INT_FG	=	0x00d8
                           0000D9   341 _USB_INT_ST	=	0x00d9
                           0000DA   342 _USB_MIS_ST	=	0x00da
                           0000DB   343 _USB_RX_LEN	=	0x00db
                           0000DC   344 _UEP0_CTRL	=	0x00dc
                           0000DD   345 _UEP0_T_LEN	=	0x00dd
                           0000DE   346 _UEP4_CTRL	=	0x00de
                           0000DF   347 _UEP4_T_LEN	=	0x00df
                           0000E1   348 _USB_INT_EN	=	0x00e1
                           0000E2   349 _USB_CTRL	=	0x00e2
                           0000E3   350 _USB_DEV_AD	=	0x00e3
                           00E5E4   351 _UEP2_DMA	=	0xe5e4
                           0000E4   352 _UEP2_DMA_L	=	0x00e4
                           0000E5   353 _UEP2_DMA_H	=	0x00e5
                           00E7E6   354 _UEP3_DMA	=	0xe7e6
                           0000E6   355 _UEP3_DMA_L	=	0x00e6
                           0000E7   356 _UEP3_DMA_H	=	0x00e7
                           0000EA   357 _UEP4_1_MOD	=	0x00ea
                           0000EB   358 _UEP2_3_MOD	=	0x00eb
                           00EDEC   359 _UEP0_DMA	=	0xedec
                           0000EC   360 _UEP0_DMA_L	=	0x00ec
                           0000ED   361 _UEP0_DMA_H	=	0x00ed
                           00EFEE   362 _UEP1_DMA	=	0xefee
                           0000EE   363 _UEP1_DMA_L	=	0x00ee
                           0000EF   364 _UEP1_DMA_H	=	0x00ef
                                    365 ;--------------------------------------------------------
                                    366 ; special function bits
                                    367 ;--------------------------------------------------------
                                    368 	.area RSEG    (ABS,DATA)
      000000                        369 	.org 0x0000
                           0000D7   370 _CY	=	0x00d7
                           0000D6   371 _AC	=	0x00d6
                           0000D5   372 _F0	=	0x00d5
                           0000D4   373 _RS1	=	0x00d4
                           0000D3   374 _RS0	=	0x00d3
                           0000D2   375 _OV	=	0x00d2
                           0000D1   376 _F1	=	0x00d1
                           0000D0   377 _P	=	0x00d0
                           0000AF   378 _EA	=	0x00af
                           0000AE   379 _E_DIS	=	0x00ae
                           0000AD   380 _ET2	=	0x00ad
                           0000AC   381 _ES	=	0x00ac
                           0000AB   382 _ET1	=	0x00ab
                           0000AA   383 _EX1	=	0x00aa
                           0000A9   384 _ET0	=	0x00a9
                           0000A8   385 _EX0	=	0x00a8
                           0000BF   386 _PH_FLAG	=	0x00bf
                           0000BE   387 _PL_FLAG	=	0x00be
                           0000BD   388 _PT2	=	0x00bd
                           0000BC   389 _PS	=	0x00bc
                           0000BB   390 _PT1	=	0x00bb
                           0000BA   391 _PX1	=	0x00ba
                           0000B9   392 _PT0	=	0x00b9
                           0000B8   393 _PX0	=	0x00b8
                           0000EF   394 _IE_WDOG	=	0x00ef
                           0000EE   395 _IE_GPIO	=	0x00ee
                           0000ED   396 _IE_PWMX	=	0x00ed
                           0000EC   397 _IE_UART1	=	0x00ec
                           0000EB   398 _IE_ADC	=	0x00eb
                           0000EA   399 _IE_USB	=	0x00ea
                           0000E9   400 _IE_TKEY	=	0x00e9
                           0000E8   401 _IE_SPI0	=	0x00e8
                           000097   402 _SCK	=	0x0097
                           000097   403 _TXD1	=	0x0097
                           000097   404 _TIN5	=	0x0097
                           000096   405 _MISO	=	0x0096
                           000096   406 _RXD1	=	0x0096
                           000096   407 _TIN4	=	0x0096
                           000095   408 _MOSI	=	0x0095
                           000095   409 _PWM1	=	0x0095
                           000095   410 _TIN3	=	0x0095
                           000095   411 _UCC2	=	0x0095
                           000095   412 _AIN2	=	0x0095
                           000094   413 _T2_	=	0x0094
                           000094   414 _CAP1_	=	0x0094
                           000094   415 _SCS	=	0x0094
                           000094   416 _TIN2	=	0x0094
                           000094   417 _UCC1	=	0x0094
                           000094   418 _AIN1	=	0x0094
                           000093   419 _TXD_	=	0x0093
                           000092   420 _RXD_	=	0x0092
                           000091   421 _T2EX	=	0x0091
                           000091   422 _CAP2	=	0x0091
                           000091   423 _TIN1	=	0x0091
                           000091   424 _VBUS2	=	0x0091
                           000091   425 _AIN0	=	0x0091
                           000090   426 _T2	=	0x0090
                           000090   427 _CAP1	=	0x0090
                           000090   428 _TIN0	=	0x0090
                           0000B7   429 _UDM	=	0x00b7
                           0000B6   430 _UDP	=	0x00b6
                           0000B5   431 _T1	=	0x00b5
                           0000B4   432 _PWM2	=	0x00b4
                           0000B4   433 _RXD1_	=	0x00b4
                           0000B4   434 _T0	=	0x00b4
                           0000B3   435 _INT1	=	0x00b3
                           0000B2   436 _TXD1_	=	0x00b2
                           0000B2   437 _INT0	=	0x00b2
                           0000B2   438 _VBUS1	=	0x00b2
                           0000B2   439 _AIN3	=	0x00b2
                           0000B1   440 _PWM2_	=	0x00b1
                           0000B1   441 _TXD	=	0x00b1
                           0000B0   442 _PWM1_	=	0x00b0
                           0000B0   443 _RXD	=	0x00b0
                           00008F   444 _TF1	=	0x008f
                           00008E   445 _TR1	=	0x008e
                           00008D   446 _TF0	=	0x008d
                           00008C   447 _TR0	=	0x008c
                           00008B   448 _IE1	=	0x008b
                           00008A   449 _IT1	=	0x008a
                           000089   450 _IE0	=	0x0089
                           000088   451 _IT0	=	0x0088
                           00009F   452 _SM0	=	0x009f
                           00009E   453 _SM1	=	0x009e
                           00009D   454 _SM2	=	0x009d
                           00009C   455 _REN	=	0x009c
                           00009B   456 _TB8	=	0x009b
                           00009A   457 _RB8	=	0x009a
                           000099   458 _TI	=	0x0099
                           000098   459 _RI	=	0x0098
                           0000CF   460 _TF2	=	0x00cf
                           0000CF   461 _CAP1F	=	0x00cf
                           0000CE   462 _EXF2	=	0x00ce
                           0000CD   463 _RCLK	=	0x00cd
                           0000CC   464 _TCLK	=	0x00cc
                           0000CB   465 _EXEN2	=	0x00cb
                           0000CA   466 _TR2	=	0x00ca
                           0000C9   467 _C_T2	=	0x00c9
                           0000C8   468 _CP_RL2	=	0x00c8
                           0000FF   469 _S0_FST_ACT	=	0x00ff
                           0000FE   470 _S0_IF_OV	=	0x00fe
                           0000FD   471 _S0_IF_FIRST	=	0x00fd
                           0000FC   472 _S0_IF_BYTE	=	0x00fc
                           0000FB   473 _S0_FREE	=	0x00fb
                           0000FA   474 _S0_T_FIFO	=	0x00fa
                           0000F8   475 _S0_R_FIFO	=	0x00f8
                           0000C7   476 _U1SM0	=	0x00c7
                           0000C5   477 _U1SMOD	=	0x00c5
                           0000C4   478 _U1REN	=	0x00c4
                           0000C3   479 _U1TB8	=	0x00c3
                           0000C2   480 _U1RB8	=	0x00c2
                           0000C1   481 _U1TI	=	0x00c1
                           0000C0   482 _U1RI	=	0x00c0
                           000087   483 _CMPO	=	0x0087
                           000086   484 _CMP_IF	=	0x0086
                           000085   485 _ADC_IF	=	0x0085
                           000084   486 _ADC_START	=	0x0084
                           000083   487 _CMP_CHAN	=	0x0083
                           000081   488 _ADC_CHAN1	=	0x0081
                           000080   489 _ADC_CHAN0	=	0x0080
                           0000DF   490 _U_IS_NAK	=	0x00df
                           0000DE   491 _U_TOG_OK	=	0x00de
                           0000DD   492 _U_SIE_FREE	=	0x00dd
                           0000DC   493 _UIF_FIFO_OV	=	0x00dc
                           0000DB   494 _UIF_HST_SOF	=	0x00db
                           0000DA   495 _UIF_SUSPEND	=	0x00da
                           0000D9   496 _UIF_TRANSFER	=	0x00d9
                           0000D8   497 _UIF_DETECT	=	0x00d8
                           0000D8   498 _UIF_BUS_RST	=	0x00d8
                                    499 ;--------------------------------------------------------
                                    500 ; overlayable register banks
                                    501 ;--------------------------------------------------------
                                    502 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        503 	.ds 8
                                    504 ;--------------------------------------------------------
                                    505 ; internal ram data
                                    506 ;--------------------------------------------------------
                                    507 	.area DSEG    (DATA)
      00000A                        508 _SetupLen:
      00000A                        509 	.ds 2
      00000C                        510 _SetupReq:
      00000C                        511 	.ds 1
      00000D                        512 _UsbConfig:
      00000D                        513 	.ds 1
      00000E                        514 _pDescr:
      00000E                        515 	.ds 3
      000011                        516 _UsbCdc_TxSend_PARM_2:
      000011                        517 	.ds 1
                                    518 ;--------------------------------------------------------
                                    519 ; overlayable items in internal ram
                                    520 ;--------------------------------------------------------
                                    521 	.area	OSEG    (OVR,DATA)
      00002B                        522 _Config_Uart1_uart1_buad_65536_48:
      00002B                        523 	.ds 4
                                    524 ;--------------------------------------------------------
                                    525 ; indirectly addressable internal ram data
                                    526 ;--------------------------------------------------------
                                    527 	.area ISEG    (DATA)
                                    528 ;--------------------------------------------------------
                                    529 ; absolute internal ram data
                                    530 ;--------------------------------------------------------
                                    531 	.area IABS    (ABS,DATA)
                                    532 	.area IABS    (ABS,DATA)
                                    533 ;--------------------------------------------------------
                                    534 ; bit data
                                    535 ;--------------------------------------------------------
                                    536 	.area BSEG    (BIT)
      000000                        537 _UsbCdc_DeviceInterrupt_sloc0_1_0:
      000000                        538 	.ds 1
                                    539 ;--------------------------------------------------------
                                    540 ; paged external ram data
                                    541 ;--------------------------------------------------------
                                    542 	.area PSEG    (PAG,XDATA)
                                    543 ;--------------------------------------------------------
                                    544 ; external ram data
                                    545 ;--------------------------------------------------------
                                    546 	.area XSEG    (XDATA)
                           000000   547 _Ep0Buffer	=	0x0000
                           000040   548 _Ep1Buffer	=	0x0040
                           000080   549 _Ep2Buffer	=	0x0080
                                    550 ;--------------------------------------------------------
                                    551 ; absolute external ram data
                                    552 ;--------------------------------------------------------
                                    553 	.area XABS    (ABS,XDATA)
                                    554 ;--------------------------------------------------------
                                    555 ; external initialized ram data
                                    556 ;--------------------------------------------------------
                                    557 	.area XISEG   (XDATA)
      000134                        558 _LineCoding:
      000134                        559 	.ds 7
      00013B                        560 _USBByteCount:
      00013B                        561 	.ds 1
      00013C                        562 _USBBufOutPoint:
      00013C                        563 	.ds 1
      00013D                        564 _UpPoint2_Busy:
      00013D                        565 	.ds 1
                                    566 	.area HOME    (CODE)
                                    567 	.area GSINIT0 (CODE)
                                    568 	.area GSINIT1 (CODE)
                                    569 	.area GSINIT2 (CODE)
                                    570 	.area GSINIT3 (CODE)
                                    571 	.area GSINIT4 (CODE)
                                    572 	.area GSINIT5 (CODE)
                                    573 	.area GSINIT  (CODE)
                                    574 	.area GSFINAL (CODE)
                                    575 	.area CSEG    (CODE)
                                    576 ;--------------------------------------------------------
                                    577 ; global & static initialisations
                                    578 ;--------------------------------------------------------
                                    579 	.area HOME    (CODE)
                                    580 	.area GSINIT  (CODE)
                                    581 	.area GSFINAL (CODE)
                                    582 	.area GSINIT  (CODE)
                                    583 ;--------------------------------------------------------
                                    584 ; Home
                                    585 ;--------------------------------------------------------
                                    586 	.area HOME    (CODE)
                                    587 	.area HOME    (CODE)
                                    588 ;--------------------------------------------------------
                                    589 ; code
                                    590 ;--------------------------------------------------------
                                    591 	.area CSEG    (CODE)
                                    592 ;------------------------------------------------------------
                                    593 ;Allocation info for local variables in function 'Config_Uart1'
                                    594 ;------------------------------------------------------------
                                    595 ;cfg_uart                  Allocated to registers r5 r6 r7 
                                    596 ;uart1_buad                Allocated with name '_Config_Uart1_uart1_buad_65536_48'
                                    597 ;------------------------------------------------------------
                                    598 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:100: static void Config_Uart1(uint8_t *cfg_uart)
                                    599 ;	-----------------------------------------
                                    600 ;	 function Config_Uart1
                                    601 ;	-----------------------------------------
      00026A                        602 _Config_Uart1:
                           000007   603 	ar7 = 0x07
                           000006   604 	ar6 = 0x06
                           000005   605 	ar5 = 0x05
                           000004   606 	ar4 = 0x04
                           000003   607 	ar3 = 0x03
                           000002   608 	ar2 = 0x02
                           000001   609 	ar1 = 0x01
                           000000   610 	ar0 = 0x00
      00026A AD 82            [24]  611 	mov	r5,dpl
      00026C AE 83            [24]  612 	mov	r6,dph
      00026E AF F0            [24]  613 	mov	r7,b
                                    614 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:102: uint32_t uart1_buad = 0;
      000270 E4               [12]  615 	clr	a
      000271 F5 2B            [12]  616 	mov	_Config_Uart1_uart1_buad_65536_48,a
      000273 F5 2C            [12]  617 	mov	(_Config_Uart1_uart1_buad_65536_48 + 1),a
      000275 F5 2D            [12]  618 	mov	(_Config_Uart1_uart1_buad_65536_48 + 2),a
      000277 F5 2E            [12]  619 	mov	(_Config_Uart1_uart1_buad_65536_48 + 3),a
                                    620 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:103: *((uint8_t *)&uart1_buad)     = cfg_uart[0];
      000279 8D 82            [24]  621 	mov	dpl,r5
      00027B 8E 83            [24]  622 	mov	dph,r6
      00027D 8F F0            [24]  623 	mov	b,r7
      00027F 12 11 45         [24]  624 	lcall	__gptrget
      000282 FC               [12]  625 	mov	r4,a
      000283 8C 2B            [24]  626 	mov	_Config_Uart1_uart1_buad_65536_48,r4
                                    627 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:104: *((uint8_t *)&uart1_buad + 1) = cfg_uart[1];
      000285 74 01            [12]  628 	mov	a,#0x01
      000287 2D               [12]  629 	add	a,r5
      000288 FA               [12]  630 	mov	r2,a
      000289 E4               [12]  631 	clr	a
      00028A 3E               [12]  632 	addc	a,r6
      00028B FB               [12]  633 	mov	r3,a
      00028C 8F 04            [24]  634 	mov	ar4,r7
      00028E 8A 82            [24]  635 	mov	dpl,r2
      000290 8B 83            [24]  636 	mov	dph,r3
      000292 8C F0            [24]  637 	mov	b,r4
      000294 12 11 45         [24]  638 	lcall	__gptrget
      000297 FA               [12]  639 	mov	r2,a
      000298 8A 2C            [24]  640 	mov	(_Config_Uart1_uart1_buad_65536_48 + 0x0001),r2
                                    641 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:105: *((uint8_t *)&uart1_buad + 2) = cfg_uart[2];
      00029A 74 02            [12]  642 	mov	a,#0x02
      00029C 2D               [12]  643 	add	a,r5
      00029D FA               [12]  644 	mov	r2,a
      00029E E4               [12]  645 	clr	a
      00029F 3E               [12]  646 	addc	a,r6
      0002A0 FB               [12]  647 	mov	r3,a
      0002A1 8F 04            [24]  648 	mov	ar4,r7
      0002A3 8A 82            [24]  649 	mov	dpl,r2
      0002A5 8B 83            [24]  650 	mov	dph,r3
      0002A7 8C F0            [24]  651 	mov	b,r4
      0002A9 12 11 45         [24]  652 	lcall	__gptrget
      0002AC FA               [12]  653 	mov	r2,a
      0002AD 8A 2D            [24]  654 	mov	(_Config_Uart1_uart1_buad_65536_48 + 0x0002),r2
                                    655 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:106: *((uint8_t *)&uart1_buad + 3) = cfg_uart[3];
      0002AF 74 03            [12]  656 	mov	a,#0x03
      0002B1 2D               [12]  657 	add	a,r5
      0002B2 FD               [12]  658 	mov	r5,a
      0002B3 E4               [12]  659 	clr	a
      0002B4 3E               [12]  660 	addc	a,r6
      0002B5 FE               [12]  661 	mov	r6,a
      0002B6 8D 82            [24]  662 	mov	dpl,r5
      0002B8 8E 83            [24]  663 	mov	dph,r6
      0002BA 8F F0            [24]  664 	mov	b,r7
      0002BC 12 11 45         [24]  665 	lcall	__gptrget
      0002BF FD               [12]  666 	mov	r5,a
      0002C0 8D 2E            [24]  667 	mov	(_Config_Uart1_uart1_buad_65536_48 + 0x0003),r5
                                    668 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:108: (void)uart1_buad;
                                    669 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:109: }
      0002C2 22               [24]  670 	ret
                                    671 ;------------------------------------------------------------
                                    672 ;Allocation info for local variables in function 'UsbCdc_Init'
                                    673 ;------------------------------------------------------------
                                    674 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:115: void UsbCdc_Init(void)
                                    675 ;	-----------------------------------------
                                    676 ;	 function UsbCdc_Init
                                    677 ;	-----------------------------------------
      0002C3                        678 _UsbCdc_Init:
                                    679 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:118: USB_CTRL = 0x00;                                                     /* 清 USB 控制寄存器 */
      0002C3 75 E2 00         [24]  680 	mov	_USB_CTRL,#0x00
                                    681 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:119: USB_CTRL &= ~bUC_HOST_MODE;                                          /* 选择设备模式 */
      0002C6 53 E2 7F         [24]  682 	anl	_USB_CTRL,#0x7f
                                    683 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:120: USB_CTRL |=  bUC_DEV_PU_EN | bUC_INT_BUSY | bUC_DMA_EN;              /* 设备+内部上拉使能, 中断标志未清前自动NAK */
      0002C9 43 E2 29         [24]  684 	orl	_USB_CTRL,#0x29
                                    685 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:121: USB_DEV_AD = 0x00;                                                   /* 设备地址初始化 */
      0002CC 75 E3 00         [24]  686 	mov	_USB_DEV_AD,#0x00
                                    687 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:122: USB_CTRL &= ~bUC_LOW_SPEED;                                          /* 全速 12M 模式(默认) */
      0002CF 53 E2 BF         [24]  688 	anl	_USB_CTRL,#0xbf
                                    689 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:123: UDEV_CTRL &= ~bUD_LOW_SPEED;
      0002D2 53 D1 FB         [24]  690 	anl	_UDEV_CTRL,#0xfb
                                    691 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:124: UDEV_CTRL = bUD_PD_DIS;                                              /* 禁止 DP/DM 下拉 */
      0002D5 75 D1 80         [24]  692 	mov	_UDEV_CTRL,#0x80
                                    693 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:125: UDEV_CTRL |= bUD_PORT_EN;                                            /* 使能物理端口 */
      0002D8 43 D1 01         [24]  694 	orl	_UDEV_CTRL,#0x01
                                    695 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:128: UEP1_DMA = (uint16_t) Ep1Buffer;                                     /* 端点1 发送地址 */
      0002DB 7E 40            [12]  696 	mov	r6,#_Ep1Buffer
      0002DD 7F 00            [12]  697 	mov	r7,#(_Ep1Buffer >> 8)
      0002DF 8E EE            [24]  698 	mov	((_UEP1_DMA >> 0) & 0xFF),r6
      0002E1 8F EF            [24]  699 	mov	((_UEP1_DMA >> 8) & 0xFF),r7
                                    700 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:129: UEP2_DMA = (uint16_t) Ep2Buffer;                                     /* 端点2 IN/OUT 地址 */
      0002E3 7E 80            [12]  701 	mov	r6,#_Ep2Buffer
      0002E5 7F 00            [12]  702 	mov	r7,#(_Ep2Buffer >> 8)
      0002E7 8E E4            [24]  703 	mov	((_UEP2_DMA >> 0) & 0xFF),r6
      0002E9 8F E5            [24]  704 	mov	((_UEP2_DMA >> 8) & 0xFF),r7
                                    705 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:130: UEP2_3_MOD = 0xCC;                                                   /* 端点2/3 单缓冲收发使能 */
      0002EB 75 EB CC         [24]  706 	mov	_UEP2_3_MOD,#0xcc
                                    707 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:131: UEP2_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;           /* EP2 自动翻转, IN=NAK, OUT=ACK */
      0002EE 75 D4 12         [24]  708 	mov	_UEP2_CTRL,#0x12
                                    709 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:132: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK;                           /* EP1 自动翻转, IN=NAK */
      0002F1 75 D2 12         [24]  710 	mov	_UEP1_CTRL,#0x12
                                    711 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:133: UEP0_DMA = (uint16_t) Ep0Buffer;                                     /* 端点0 数据地址 */
      0002F4 7E 00            [12]  712 	mov	r6,#_Ep0Buffer
      0002F6 7F 00            [12]  713 	mov	r7,#(_Ep0Buffer >> 8)
      0002F8 8E EC            [24]  714 	mov	((_UEP0_DMA >> 0) & 0xFF),r6
      0002FA 8F ED            [24]  715 	mov	((_UEP0_DMA >> 8) & 0xFF),r7
                                    716 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:134: UEP4_1_MOD = 0X40;                                                   /* EP1 上传缓冲; EP0 单64字节收发 */
      0002FC 75 EA 40         [24]  717 	mov	_UEP4_1_MOD,#0x40
                                    718 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:135: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;                           /* 手动翻转, OUT=ACK, IN=NAK */
      0002FF 75 DC 02         [24]  719 	mov	_UEP0_CTRL,#0x02
                                    720 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:138: USB_INT_EN |= bUIE_SUSPEND;                                          /* 设备挂起中断 */
      000302 43 E1 04         [24]  721 	orl	_USB_INT_EN,#0x04
                                    722 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:139: USB_INT_EN |= bUIE_TRANSFER;                                         /* USB 传输完成中断 */
      000305 43 E1 02         [24]  723 	orl	_USB_INT_EN,#0x02
                                    724 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:140: USB_INT_EN |= bUIE_BUS_RST;                                          /* 总线复位中断 */
      000308 43 E1 01         [24]  725 	orl	_USB_INT_EN,#0x01
                                    726 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:141: USB_INT_FG |= 0x1F;                                                  /* 清中断标志 */
      00030B 43 D8 1F         [24]  727 	orl	_USB_INT_FG,#0x1f
                                    728 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:142: IE_USB = 1;                                                          /* 使能 USB 中断 */
                                    729 ;	assignBit
      00030E D2 EA            [12]  730 	setb	_IE_USB
                                    731 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:145: UsbConfig = 0;
                                    732 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:146: SetupReq = 0;
                                    733 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:147: SetupLen = 0;
      000310 E4               [12]  734 	clr	a
      000311 F5 0D            [12]  735 	mov	_UsbConfig,a
      000313 F5 0C            [12]  736 	mov	_SetupReq,a
      000315 F5 0A            [12]  737 	mov	_SetupLen,a
      000317 F5 0B            [12]  738 	mov	(_SetupLen + 1),a
                                    739 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:148: UEP0_T_LEN = 0;                                                      /* 预使用发送长度清零 */
                                    740 ;	1-genFromRTrack replaced	mov	_UEP0_T_LEN,#0x00
      000319 F5 DD            [12]  741 	mov	_UEP0_T_LEN,a
                                    742 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:149: UEP1_T_LEN = 0;
                                    743 ;	1-genFromRTrack replaced	mov	_UEP1_T_LEN,#0x00
      00031B F5 D3            [12]  744 	mov	_UEP1_T_LEN,a
                                    745 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:150: UEP2_T_LEN = 0;
                                    746 ;	1-genFromRTrack replaced	mov	_UEP2_T_LEN,#0x00
      00031D F5 D5            [12]  747 	mov	_UEP2_T_LEN,a
                                    748 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:151: USBByteCount = 0;
      00031F 90 01 3B         [24]  749 	mov	dptr,#_USBByteCount
      000322 F0               [24]  750 	movx	@dptr,a
                                    751 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:152: USBBufOutPoint = 0;
      000323 90 01 3C         [24]  752 	mov	dptr,#_USBBufOutPoint
      000326 F0               [24]  753 	movx	@dptr,a
                                    754 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:153: UpPoint2_Busy = 0;
      000327 90 01 3D         [24]  755 	mov	dptr,#_UpPoint2_Busy
      00032A F0               [24]  756 	movx	@dptr,a
                                    757 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:155: EA = 1;                                                              /* 开总中断 */
                                    758 ;	assignBit
      00032B D2 AF            [12]  759 	setb	_EA
                                    760 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:156: }
      00032D 22               [24]  761 	ret
                                    762 ;------------------------------------------------------------
                                    763 ;Allocation info for local variables in function 'UsbCdc_IsConfigured'
                                    764 ;------------------------------------------------------------
                                    765 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:162: uint8_t UsbCdc_IsConfigured(void)
                                    766 ;	-----------------------------------------
                                    767 ;	 function UsbCdc_IsConfigured
                                    768 ;	-----------------------------------------
      00032E                        769 _UsbCdc_IsConfigured:
                                    770 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:164: return UsbConfig;
      00032E 85 0D 82         [24]  771 	mov	dpl,_UsbConfig
                                    772 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:165: }
      000331 22               [24]  773 	ret
                                    774 ;------------------------------------------------------------
                                    775 ;Allocation info for local variables in function 'UsbCdc_RxBytes'
                                    776 ;------------------------------------------------------------
                                    777 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:171: uint8_t UsbCdc_RxBytes(void)
                                    778 ;	-----------------------------------------
                                    779 ;	 function UsbCdc_RxBytes
                                    780 ;	-----------------------------------------
      000332                        781 _UsbCdc_RxBytes:
                                    782 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:173: return USBByteCount;
      000332 90 01 3B         [24]  783 	mov	dptr,#_USBByteCount
      000335 E0               [24]  784 	movx	a,@dptr
                                    785 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:174: }
      000336 F5 82            [12]  786 	mov	dpl,a
      000338 22               [24]  787 	ret
                                    788 ;------------------------------------------------------------
                                    789 ;Allocation info for local variables in function 'UsbCdc_RxRead'
                                    790 ;------------------------------------------------------------
                                    791 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:176: uint8_t UsbCdc_RxRead(void)
                                    792 ;	-----------------------------------------
                                    793 ;	 function UsbCdc_RxRead
                                    794 ;	-----------------------------------------
      000339                        795 _UsbCdc_RxRead:
                                    796 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:178: return Ep2Buffer[USBBufOutPoint++];
      000339 90 01 3C         [24]  797 	mov	dptr,#_USBBufOutPoint
      00033C E0               [24]  798 	movx	a,@dptr
      00033D FF               [12]  799 	mov	r7,a
      00033E 04               [12]  800 	inc	a
      00033F F0               [24]  801 	movx	@dptr,a
      000340 EF               [12]  802 	mov	a,r7
      000341 24 80            [12]  803 	add	a,#_Ep2Buffer
      000343 F5 82            [12]  804 	mov	dpl,a
      000345 E4               [12]  805 	clr	a
      000346 34 00            [12]  806 	addc	a,#(_Ep2Buffer >> 8)
      000348 F5 83            [12]  807 	mov	dph,a
      00034A E0               [24]  808 	movx	a,@dptr
                                    809 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:179: }
      00034B F5 82            [12]  810 	mov	dpl,a
      00034D 22               [24]  811 	ret
                                    812 ;------------------------------------------------------------
                                    813 ;Allocation info for local variables in function 'UsbCdc_RxDone'
                                    814 ;------------------------------------------------------------
                                    815 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:181: void UsbCdc_RxDone(void)
                                    816 ;	-----------------------------------------
                                    817 ;	 function UsbCdc_RxDone
                                    818 ;	-----------------------------------------
      00034E                        819 _UsbCdc_RxDone:
                                    820 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:183: if ( USBByteCount )
      00034E 90 01 3B         [24]  821 	mov	dptr,#_USBByteCount
      000351 E0               [24]  822 	movx	a,@dptr
      000352 60 0C            [24]  823 	jz	00105$
                                    824 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:185: USBByteCount--;
      000354 90 01 3B         [24]  825 	mov	dptr,#_USBByteCount
      000357 E0               [24]  826 	movx	a,@dptr
      000358 14               [12]  827 	dec	a
      000359 F0               [24]  828 	movx	@dptr,a
                                    829 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:186: if ( USBByteCount == 0 )                                         /* 本包处理完, 恢复接收 */
      00035A E0               [24]  830 	movx	a,@dptr
      00035B 70 03            [24]  831 	jnz	00105$
                                    832 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:188: UEP2_CTRL = UEP2_CTRL & ~ MASK_UEP_R_RES | UEP_R_RES_ACK;
      00035D 53 D4 F3         [24]  833 	anl	_UEP2_CTRL,#0xf3
      000360                        834 00105$:
                                    835 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:191: }
      000360 22               [24]  836 	ret
                                    837 ;------------------------------------------------------------
                                    838 ;Allocation info for local variables in function 'UsbCdc_TxReady'
                                    839 ;------------------------------------------------------------
                                    840 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:197: uint8_t UsbCdc_TxReady(void)
                                    841 ;	-----------------------------------------
                                    842 ;	 function UsbCdc_TxReady
                                    843 ;	-----------------------------------------
      000361                        844 _UsbCdc_TxReady:
                                    845 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:199: return ( UpPoint2_Busy == 0 );
      000361 90 01 3D         [24]  846 	mov	dptr,#_UpPoint2_Busy
      000364 E0               [24]  847 	movx	a,@dptr
      000365 FF               [12]  848 	mov	r7,a
      000366 E4               [12]  849 	clr	a
      000367 BF 00 01         [24]  850 	cjne	r7,#0x00,00103$
      00036A 04               [12]  851 	inc	a
      00036B                        852 00103$:
      00036B F5 82            [12]  853 	mov	dpl,a
                                    854 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:200: }
      00036D 22               [24]  855 	ret
                                    856 ;------------------------------------------------------------
                                    857 ;Allocation info for local variables in function 'UsbCdc_TxSend'
                                    858 ;------------------------------------------------------------
                                    859 ;len                       Allocated with name '_UsbCdc_TxSend_PARM_2'
                                    860 ;data                      Allocated to registers r5 r6 r7 
                                    861 ;------------------------------------------------------------
                                    862 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:202: void UsbCdc_TxSend(const uint8_t *data, uint8_t len)
                                    863 ;	-----------------------------------------
                                    864 ;	 function UsbCdc_TxSend
                                    865 ;	-----------------------------------------
      00036E                        866 _UsbCdc_TxSend:
      00036E AD 82            [24]  867 	mov	r5,dpl
      000370 AE 83            [24]  868 	mov	r6,dph
      000372 AF F0            [24]  869 	mov	r7,b
                                    870 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:204: if ( data == 0 || len == 0 )                                         /* 空包不处理 */
      000374 ED               [12]  871 	mov	a,r5
      000375 4E               [12]  872 	orl	a,r6
      000376 60 04            [24]  873 	jz	00101$
      000378 E5 11            [12]  874 	mov	a,_UsbCdc_TxSend_PARM_2
      00037A 70 01            [24]  875 	jnz	00102$
      00037C                        876 00101$:
                                    877 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:206: return;
      00037C 22               [24]  878 	ret
      00037D                        879 00102$:
                                    880 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:208: if ( len > MAX_PACKET_SIZE )                                         /* 保险: 不超过端点缓冲半区 */
      00037D E5 11            [12]  881 	mov	a,_UsbCdc_TxSend_PARM_2
      00037F 24 BF            [12]  882 	add	a,#0xff - 0x40
      000381 50 03            [24]  883 	jnc	00105$
                                    884 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:210: len = MAX_PACKET_SIZE;
      000383 75 11 40         [24]  885 	mov	_UsbCdc_TxSend_PARM_2,#0x40
      000386                        886 00105$:
                                    887 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:212: if ( UpPoint2_Busy )                                                 /* 上传忙, 丢弃(调用方应先查 TxReady) */
      000386 90 01 3D         [24]  888 	mov	dptr,#_UpPoint2_Busy
      000389 E0               [24]  889 	movx	a,@dptr
      00038A 60 01            [24]  890 	jz	00107$
                                    891 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:214: return;
      00038C 22               [24]  892 	ret
      00038D                        893 00107$:
                                    894 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:216: memcpy( Ep2Buffer + MAX_PACKET_SIZE, data, len );                    /* 拷入 EP2 IN 缓冲半区 */
      00038D 8D 2B            [24]  895 	mov	___memcpy_PARM_2,r5
      00038F 8E 2C            [24]  896 	mov	(___memcpy_PARM_2 + 1),r6
      000391 8F 2D            [24]  897 	mov	(___memcpy_PARM_2 + 2),r7
      000393 85 11 2E         [24]  898 	mov	___memcpy_PARM_3,_UsbCdc_TxSend_PARM_2
      000396 75 2F 00         [24]  899 	mov	(___memcpy_PARM_3 + 1),#0x00
      000399 90 00 C0         [24]  900 	mov	dptr,#(_Ep2Buffer + 0x0040)
      00039C 75 F0 00         [24]  901 	mov	b,#0x00
      00039F 12 0F AC         [24]  902 	lcall	___memcpy
                                    903 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:217: UEP2_T_LEN = len;                                                    /* 预使用发送长度 */
      0003A2 85 11 D5         [24]  904 	mov	_UEP2_T_LEN,_UsbCdc_TxSend_PARM_2
                                    905 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:218: UEP2_CTRL = UEP2_CTRL & ~ MASK_UEP_T_RES | UEP_T_RES_ACK;            /* 应答 ACK, 启动上传 */
      0003A5 53 D4 FC         [24]  906 	anl	_UEP2_CTRL,#0xfc
                                    907 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:219: UpPoint2_Busy = 1;
      0003A8 90 01 3D         [24]  908 	mov	dptr,#_UpPoint2_Busy
      0003AB 74 01            [12]  909 	mov	a,#0x01
      0003AD F0               [24]  910 	movx	@dptr,a
                                    911 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:220: }
      0003AE 22               [24]  912 	ret
                                    913 ;------------------------------------------------------------
                                    914 ;Allocation info for local variables in function 'UsbCdc_DeviceInterrupt'
                                    915 ;------------------------------------------------------------
                                    916 ;len                       Allocated to registers r4 r5 
                                    917 ;------------------------------------------------------------
                                    918 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:230: void UsbCdc_DeviceInterrupt(void)
                                    919 ;	-----------------------------------------
                                    920 ;	 function UsbCdc_DeviceInterrupt
                                    921 ;	-----------------------------------------
      0003AF                        922 _UsbCdc_DeviceInterrupt:
                                    923 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:233: if(UIF_TRANSFER)                                                     /* USB 传输完成标志 */
      0003AF 20 D9 03         [24]  924 	jb	_UIF_TRANSFER,00524$
      0003B2 02 08 DD         [24]  925 	ljmp	00215$
      0003B5                        926 00524$:
                                    927 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:235: switch (USB_INT_ST & (MASK_UIS_TOKEN | MASK_UIS_ENDP))
      0003B5 74 3F            [12]  928 	mov	a,#0x3f
      0003B7 55 D9            [12]  929 	anl	a,_USB_INT_ST
      0003B9 FF               [12]  930 	mov	r7,a
      0003BA FE               [12]  931 	mov	r6,a
      0003BB BE 00 03         [24]  932 	cjne	r6,#0x00,00525$
      0003BE 02 08 A4         [24]  933 	ljmp	00206$
      0003C1                        934 00525$:
      0003C1 BF 02 02         [24]  935 	cjne	r7,#0x02,00526$
      0003C4 80 39            [24]  936 	sjmp	00103$
      0003C6                        937 00526$:
      0003C6 BF 20 03         [24]  938 	cjne	r7,#0x20,00527$
      0003C9 02 08 2D         [24]  939 	ljmp	00201$
      0003CC                        940 00527$:
      0003CC BF 21 02         [24]  941 	cjne	r7,#0x21,00528$
      0003CF 80 0D            [24]  942 	sjmp	00101$
      0003D1                        943 00528$:
      0003D1 BF 22 02         [24]  944 	cjne	r7,#0x22,00529$
      0003D4 80 16            [24]  945 	sjmp	00102$
      0003D6                        946 00529$:
      0003D6 BF 30 02         [24]  947 	cjne	r7,#0x30,00530$
      0003D9 80 40            [24]  948 	sjmp	00106$
      0003DB                        949 00530$:
      0003DB 02 08 DB         [24]  950 	ljmp	00213$
                                    951 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:237: case UIS_TOKEN_IN | 1:                                           /* 端点1 中断上传完成 */
      0003DE                        952 00101$:
                                    953 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:238: UEP1_T_LEN = 0;
      0003DE 75 D3 00         [24]  954 	mov	_UEP1_T_LEN,#0x00
                                    955 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:239: UEP1_CTRL = UEP1_CTRL & ~ MASK_UEP_T_RES | UEP_T_RES_NAK;    /* 默认应答 NAK */
      0003E1 74 FC            [12]  956 	mov	a,#0xfc
      0003E3 55 D2            [12]  957 	anl	a,_UEP1_CTRL
      0003E5 44 02            [12]  958 	orl	a,#0x02
      0003E7 F5 D2            [12]  959 	mov	_UEP1_CTRL,a
                                    960 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:240: break;
      0003E9 02 08 DB         [24]  961 	ljmp	00213$
                                    962 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:241: case UIS_TOKEN_IN | 2:                                           /* 端点2 批量上传完成 */
      0003EC                        963 00102$:
                                    964 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:243: UEP2_T_LEN = 0;                                              /* 预使用发送长度清零 */
      0003EC 75 D5 00         [24]  965 	mov	_UEP2_T_LEN,#0x00
                                    966 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:244: UEP2_CTRL = UEP2_CTRL & ~ MASK_UEP_T_RES | UEP_T_RES_NAK;    /* 默认应答 NAK */
      0003EF 74 FC            [12]  967 	mov	a,#0xfc
      0003F1 55 D4            [12]  968 	anl	a,_UEP2_CTRL
      0003F3 44 02            [12]  969 	orl	a,#0x02
      0003F5 F5 D4            [12]  970 	mov	_UEP2_CTRL,a
                                    971 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:245: UpPoint2_Busy = 0;                                           /* 清忙标志 */
      0003F7 90 01 3D         [24]  972 	mov	dptr,#_UpPoint2_Busy
      0003FA E4               [12]  973 	clr	a
      0003FB F0               [24]  974 	movx	@dptr,a
                                    975 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:247: break;
      0003FC 02 08 DB         [24]  976 	ljmp	00213$
                                    977 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:248: case UIS_TOKEN_OUT | 2:                                          /* 端点2 批量下传(主机->设备) */
      0003FF                        978 00103$:
                                    979 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:249: if ( U_TOG_OK )                                              /* 不同步数据包丢弃 */
      0003FF 20 DE 03         [24]  980 	jb	_U_TOG_OK,00531$
      000402 02 08 DB         [24]  981 	ljmp	00213$
      000405                        982 00531$:
                                    983 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:251: USBByteCount = USB_RX_LEN;                               /* 记录本包长度 */
      000405 90 01 3B         [24]  984 	mov	dptr,#_USBByteCount
      000408 E5 DB            [12]  985 	mov	a,_USB_RX_LEN
      00040A F0               [24]  986 	movx	@dptr,a
                                    987 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:252: USBBufOutPoint = 0;                                      /* 读指针复位 */
      00040B 90 01 3C         [24]  988 	mov	dptr,#_USBBufOutPoint
      00040E E4               [12]  989 	clr	a
      00040F F0               [24]  990 	movx	@dptr,a
                                    991 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:253: UEP2_CTRL = UEP2_CTRL & ~ MASK_UEP_R_RES | UEP_R_RES_NAK;/* 收完一包先NAK, 主循环处理完再恢复ACK */
      000410 74 F3            [12]  992 	mov	a,#0xf3
      000412 55 D4            [12]  993 	anl	a,_UEP2_CTRL
      000414 44 08            [12]  994 	orl	a,#0x08
      000416 F5 D4            [12]  995 	mov	_UEP2_CTRL,a
                                    996 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:255: break;
      000418 02 08 DB         [24]  997 	ljmp	00213$
                                    998 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:256: case UIS_TOKEN_SETUP | 0:                                        /* SETUP 事务 */
      00041B                        999 00106$:
                                   1000 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:257: len = USB_RX_LEN;
      00041B AE DB            [24] 1001 	mov	r6,_USB_RX_LEN
      00041D 7F 00            [12] 1002 	mov	r7,#0x00
                                   1003 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:258: if(len == (sizeof(USB_SETUP_REQ)))
      00041F BE 08 05         [24] 1004 	cjne	r6,#0x08,00532$
      000422 BF 00 02         [24] 1005 	cjne	r7,#0x00,00532$
      000425 80 03            [24] 1006 	sjmp	00533$
      000427                       1007 00532$:
      000427 02 07 FD         [24] 1008 	ljmp	00193$
      00042A                       1009 00533$:
                                   1010 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:260: SetupLen = ((uint16_t)UsbSetupBuf->wLengthH<<8) | (UsbSetupBuf->wLengthL);
      00042A 90 00 07         [24] 1011 	mov	dptr,#(_Ep0Buffer + 0x0007)
      00042D E0               [24] 1012 	movx	a,@dptr
      00042E FE               [12] 1013 	mov	r6,a
      00042F 7F 00            [12] 1014 	mov	r7,#0x00
      000431 90 00 06         [24] 1015 	mov	dptr,#(_Ep0Buffer + 0x0006)
      000434 E0               [24] 1016 	movx	a,@dptr
      000435 7C 00            [12] 1017 	mov	r4,#0x00
      000437 4F               [12] 1018 	orl	a,r7
      000438 F5 0A            [12] 1019 	mov	_SetupLen,a
      00043A EC               [12] 1020 	mov	a,r4
      00043B 4E               [12] 1021 	orl	a,r6
      00043C F5 0B            [12] 1022 	mov	(_SetupLen + 1),a
                                   1023 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:261: len = 0;                                                 /* 默认成功并上传0长度 */
      00043E 7E 00            [12] 1024 	mov	r6,#0x00
      000440 7F 00            [12] 1025 	mov	r7,#0x00
                                   1026 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:262: SetupReq = UsbSetupBuf->bRequest;
      000442 90 00 01         [24] 1027 	mov	dptr,#(_Ep0Buffer + 0x0001)
      000445 E0               [24] 1028 	movx	a,@dptr
      000446 F5 0C            [12] 1029 	mov	_SetupReq,a
                                   1030 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:263: if ( ( UsbSetupBuf->bRequestType & USB_REQ_TYP_MASK ) != USB_REQ_TYP_STANDARD ) /* 非标准(类)请求 */
      000448 90 00 00         [24] 1031 	mov	dptr,#_Ep0Buffer
      00044B E0               [24] 1032 	movx	a,@dptr
      00044C FD               [12] 1033 	mov	r5,a
      00044D 54 60            [12] 1034 	anl	a,#0x60
      00044F 60 7C            [24] 1035 	jz	00190$
                                   1036 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:265: switch( SetupReq )
      000451 74 20            [12] 1037 	mov	a,#0x20
      000453 B5 0C 03         [24] 1038 	cjne	a,_SetupReq,00535$
      000456 02 08 01         [24] 1039 	ljmp	00194$
      000459                       1040 00535$:
      000459 74 21            [12] 1041 	mov	a,#0x21
      00045B B5 0C 02         [24] 1042 	cjne	a,_SetupReq,00536$
      00045E 80 0A            [24] 1043 	sjmp	00107$
      000460                       1044 00536$:
      000460 74 22            [12] 1045 	mov	a,#0x22
      000462 B5 0C 03         [24] 1046 	cjne	a,_SetupReq,00537$
      000465 02 08 01         [24] 1047 	ljmp	00194$
      000468                       1048 00537$:
                                   1049 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:267: case GET_LINE_CODING:                                /* 0x21 查询当前线路编码 */
      000468 80 5C            [24] 1050 	sjmp	00110$
      00046A                       1051 00107$:
                                   1052 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:268: pDescr = LineCoding;
      00046A 75 0E 34         [24] 1053 	mov	_pDescr,#_LineCoding
      00046D 75 0F 01         [24] 1054 	mov	(_pDescr + 1),#(_LineCoding >> 8)
      000470 75 10 00         [24] 1055 	mov	(_pDescr + 2),#0x00
                                   1056 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:270: len = SetupLen >= DEFAULT_ENDP0_SIZE ? DEFAULT_ENDP0_SIZE : SetupLen;
      000473 AC 0A            [24] 1057 	mov	r4,_SetupLen
      000475 AD 0B            [24] 1058 	mov	r5,(_SetupLen + 1)
      000477 C3               [12] 1059 	clr	c
      000478 EC               [12] 1060 	mov	a,r4
      000479 94 08            [12] 1061 	subb	a,#0x08
      00047B ED               [12] 1062 	mov	a,r5
      00047C 94 00            [12] 1063 	subb	a,#0x00
      00047E 92 00            [24] 1064 	mov	_UsbCdc_DeviceInterrupt_sloc0_1_0,c
      000480 40 06            [24] 1065 	jc	00228$
      000482 7C 08            [12] 1066 	mov	r4,#0x08
      000484 7D 00            [12] 1067 	mov	r5,#0x00
      000486 80 04            [24] 1068 	sjmp	00229$
      000488                       1069 00228$:
      000488 AC 0A            [24] 1070 	mov	r4,_SetupLen
      00048A AD 0B            [24] 1071 	mov	r5,(_SetupLen + 1)
      00048C                       1072 00229$:
      00048C 8C 06            [24] 1073 	mov	ar6,r4
      00048E 8D 07            [24] 1074 	mov	ar7,r5
                                   1075 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:271: memcpy(Ep0Buffer,pDescr,len);
      000490 85 0E 2B         [24] 1076 	mov	___memcpy_PARM_2,_pDescr
      000493 85 0F 2C         [24] 1077 	mov	(___memcpy_PARM_2 + 1),(_pDescr + 1)
      000496 85 10 2D         [24] 1078 	mov	(___memcpy_PARM_2 + 2),(_pDescr + 2)
      000499 8E 2E            [24] 1079 	mov	___memcpy_PARM_3,r6
      00049B 8F 2F            [24] 1080 	mov	(___memcpy_PARM_3 + 1),r7
      00049D 90 00 00         [24] 1081 	mov	dptr,#_Ep0Buffer
      0004A0 75 F0 00         [24] 1082 	mov	b,#0x00
      0004A3 C0 07            [24] 1083 	push	ar7
      0004A5 C0 06            [24] 1084 	push	ar6
      0004A7 12 0F AC         [24] 1085 	lcall	___memcpy
      0004AA D0 06            [24] 1086 	pop	ar6
      0004AC D0 07            [24] 1087 	pop	ar7
                                   1088 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:272: SetupLen -= len;
      0004AE E5 0A            [12] 1089 	mov	a,_SetupLen
      0004B0 C3               [12] 1090 	clr	c
      0004B1 9E               [12] 1091 	subb	a,r6
      0004B2 F5 0A            [12] 1092 	mov	_SetupLen,a
      0004B4 E5 0B            [12] 1093 	mov	a,(_SetupLen + 1)
      0004B6 9F               [12] 1094 	subb	a,r7
      0004B7 F5 0B            [12] 1095 	mov	(_SetupLen + 1),a
                                   1096 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:273: pDescr += len;
      0004B9 EE               [12] 1097 	mov	a,r6
      0004BA 25 0E            [12] 1098 	add	a,_pDescr
      0004BC F5 0E            [12] 1099 	mov	_pDescr,a
      0004BE EF               [12] 1100 	mov	a,r7
      0004BF 35 0F            [12] 1101 	addc	a,(_pDescr + 1)
      0004C1 F5 0F            [12] 1102 	mov	(_pDescr + 1),a
                                   1103 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:274: break;
      0004C3 02 08 01         [24] 1104 	ljmp	00194$
                                   1105 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:279: default:
      0004C6                       1106 00110$:
                                   1107 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:280: len = 0xFF;                                      /* 不支持的命令 */
      0004C6 7E FF            [12] 1108 	mov	r6,#0xff
      0004C8 7F 00            [12] 1109 	mov	r7,#0x00
                                   1110 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:282: }
      0004CA 02 08 01         [24] 1111 	ljmp	00194$
      0004CD                       1112 00190$:
                                   1113 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:286: switch(SetupReq)
      0004CD E5 0C            [12] 1114 	mov	a,_SetupReq
      0004CF 24 F5            [12] 1115 	add	a,#0xff - 0x0a
      0004D1 50 03            [24] 1116 	jnc	00539$
      0004D3 02 07 F7         [24] 1117 	ljmp	00187$
      0004D6                       1118 00539$:
      0004D6 E5 0C            [12] 1119 	mov	a,_SetupReq
      0004D8 24 0B            [12] 1120 	add	a,#(00540$-3-.)
      0004DA 83               [24] 1121 	movc	a,@a+pc
      0004DB F5 82            [12] 1122 	mov	dpl,a
      0004DD E5 0C            [12] 1123 	mov	a,_SetupReq
      0004DF 24 0F            [12] 1124 	add	a,#(00541$-3-.)
      0004E1 83               [24] 1125 	movc	a,@a+pc
      0004E2 F5 83            [12] 1126 	mov	dph,a
      0004E4 E4               [12] 1127 	clr	a
      0004E5 73               [24] 1128 	jmp	@a+dptr
      0004E6                       1129 00540$:
      0004E6 D5                    1130 	.db	00183$
      0004E7 17                    1131 	.db	00135$
      0004E8 F7                    1132 	.db	00187$
      0004E9 C4                    1133 	.db	00156$
      0004EA F7                    1134 	.db	00187$
      0004EB E4                    1135 	.db	00129$
      0004EC FC                    1136 	.db	00112$
      0004ED F7                    1137 	.db	00187$
      0004EE F1                    1138 	.db	00130$
      0004EF 0E                    1139 	.db	00133$
      0004F0 01                    1140 	.db	00194$
      0004F1                       1141 00541$:
      0004F1 07                    1142 	.db	00183$>>8
      0004F2 06                    1143 	.db	00135$>>8
      0004F3 07                    1144 	.db	00187$>>8
      0004F4 06                    1145 	.db	00156$>>8
      0004F5 07                    1146 	.db	00187$>>8
      0004F6 05                    1147 	.db	00129$>>8
      0004F7 04                    1148 	.db	00112$>>8
      0004F8 07                    1149 	.db	00187$>>8
      0004F9 05                    1150 	.db	00130$>>8
      0004FA 06                    1151 	.db	00133$>>8
      0004FB 08                    1152 	.db	00194$>>8
                                   1153 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:288: case USB_GET_DESCRIPTOR:
      0004FC                       1154 00112$:
                                   1155 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:289: switch(UsbSetupBuf->wValueH)
      0004FC 90 00 03         [24] 1156 	mov	dptr,#(_Ep0Buffer + 0x0003)
      0004FF E0               [24] 1157 	movx	a,@dptr
      000500 FD               [12] 1158 	mov	r5,a
      000501 BD 01 02         [24] 1159 	cjne	r5,#0x01,00542$
      000504 80 0A            [24] 1160 	sjmp	00113$
      000506                       1161 00542$:
      000506 BD 02 02         [24] 1162 	cjne	r5,#0x02,00543$
      000509 80 14            [24] 1163 	sjmp	00114$
      00050B                       1164 00543$:
                                   1165 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:291: case 1:                                          /* 设备描述符 */
      00050B BD 03 72         [24] 1166 	cjne	r5,#0x03,00125$
      00050E 80 1E            [24] 1167 	sjmp	00115$
      000510                       1168 00113$:
                                   1169 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:292: pDescr = DevDesc;
      000510 75 0E CE         [24] 1170 	mov	_pDescr,#_DevDesc
      000513 75 0F 11         [24] 1171 	mov	(_pDescr + 1),#(_DevDesc >> 8)
      000516 75 10 80         [24] 1172 	mov	(_pDescr + 2),#0x80
                                   1173 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:293: len = sizeof(DevDesc);
      000519 7C 12            [12] 1174 	mov	r4,#0x12
      00051B 7D 00            [12] 1175 	mov	r5,#0x00
                                   1176 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:294: break;
                                   1177 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:295: case 2:                                          /* 配置描述符 */
      00051D 80 65            [24] 1178 	sjmp	00126$
      00051F                       1179 00114$:
                                   1180 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:296: pDescr = CfgDesc;
      00051F 75 0E E0         [24] 1181 	mov	_pDescr,#_CfgDesc
      000522 75 0F 11         [24] 1182 	mov	(_pDescr + 1),#(_CfgDesc >> 8)
      000525 75 10 80         [24] 1183 	mov	(_pDescr + 2),#0x80
                                   1184 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:297: len = sizeof(CfgDesc);
      000528 7C 43            [12] 1185 	mov	r4,#0x43
      00052A 7D 00            [12] 1186 	mov	r5,#0x00
                                   1187 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:298: break;
                                   1188 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:299: case 3:                                          /* 字符串描述符 */
      00052C 80 56            [24] 1189 	sjmp	00126$
      00052E                       1190 00115$:
                                   1191 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:300: if(UsbSetupBuf->wValueL == 0)
      00052E 90 00 02         [24] 1192 	mov	dptr,#(_Ep0Buffer + 0x0002)
      000531 E0               [24] 1193 	movx	a,@dptr
      000532 70 0F            [24] 1194 	jnz	00123$
                                   1195 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:302: pDescr = LangDes;
      000534 75 0E 23         [24] 1196 	mov	_pDescr,#_LangDes
      000537 75 0F 12         [24] 1197 	mov	(_pDescr + 1),#(_LangDes >> 8)
      00053A 75 10 80         [24] 1198 	mov	(_pDescr + 2),#0x80
                                   1199 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:303: len = sizeof(LangDes);
      00053D 7C 04            [12] 1200 	mov	r4,#0x04
      00053F 7D 00            [12] 1201 	mov	r5,#0x00
      000541 80 41            [24] 1202 	sjmp	00126$
      000543                       1203 00123$:
                                   1204 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:305: else if(UsbSetupBuf->wValueL == 1)
      000543 90 00 02         [24] 1205 	mov	dptr,#(_Ep0Buffer + 0x0002)
      000546 E0               [24] 1206 	movx	a,@dptr
      000547 FB               [12] 1207 	mov	r3,a
      000548 BB 01 0F         [24] 1208 	cjne	r3,#0x01,00120$
                                   1209 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:307: pDescr = Manuf_Des;
      00054B 75 0E 4F         [24] 1210 	mov	_pDescr,#_Manuf_Des
      00054E 75 0F 12         [24] 1211 	mov	(_pDescr + 1),#(_Manuf_Des >> 8)
      000551 75 10 80         [24] 1212 	mov	(_pDescr + 2),#0x80
                                   1213 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:308: len = sizeof(Manuf_Des);
      000554 7C 0A            [12] 1214 	mov	r4,#0x0a
      000556 7D 00            [12] 1215 	mov	r5,#0x00
      000558 80 2A            [24] 1216 	sjmp	00126$
      00055A                       1217 00120$:
                                   1218 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:310: else if(UsbSetupBuf->wValueL == 2)
      00055A 90 00 02         [24] 1219 	mov	dptr,#(_Ep0Buffer + 0x0002)
      00055D E0               [24] 1220 	movx	a,@dptr
      00055E FB               [12] 1221 	mov	r3,a
      00055F BB 02 0F         [24] 1222 	cjne	r3,#0x02,00117$
                                   1223 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:312: pDescr = Prod_Des;
      000562 75 0E 3B         [24] 1224 	mov	_pDescr,#_Prod_Des
      000565 75 0F 12         [24] 1225 	mov	(_pDescr + 1),#(_Prod_Des >> 8)
      000568 75 10 80         [24] 1226 	mov	(_pDescr + 2),#0x80
                                   1227 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:313: len = sizeof(Prod_Des);
      00056B 7C 14            [12] 1228 	mov	r4,#0x14
      00056D 7D 00            [12] 1229 	mov	r5,#0x00
      00056F 80 13            [24] 1230 	sjmp	00126$
      000571                       1231 00117$:
                                   1232 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:317: pDescr = SerDes;
      000571 75 0E 27         [24] 1233 	mov	_pDescr,#_SerDes
      000574 75 0F 12         [24] 1234 	mov	(_pDescr + 1),#(_SerDes >> 8)
      000577 75 10 80         [24] 1235 	mov	(_pDescr + 2),#0x80
                                   1236 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:318: len = sizeof(SerDes);
      00057A 7C 14            [12] 1237 	mov	r4,#0x14
      00057C 7D 00            [12] 1238 	mov	r5,#0x00
                                   1239 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:320: break;
                                   1240 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:321: default:
      00057E 80 04            [24] 1241 	sjmp	00126$
      000580                       1242 00125$:
                                   1243 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:322: len = 0xff;                                  /* 不支持的命令或错误 */
      000580 7C FF            [12] 1244 	mov	r4,#0xff
      000582 7D 00            [12] 1245 	mov	r5,#0x00
                                   1246 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:324: }
      000584                       1247 00126$:
                                   1248 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:325: if ( SetupLen > len )
      000584 C3               [12] 1249 	clr	c
      000585 EC               [12] 1250 	mov	a,r4
      000586 95 0A            [12] 1251 	subb	a,_SetupLen
      000588 ED               [12] 1252 	mov	a,r5
      000589 95 0B            [12] 1253 	subb	a,(_SetupLen + 1)
      00058B 50 04            [24] 1254 	jnc	00128$
                                   1255 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:327: SetupLen = len;                              /* 限制总长度 */
      00058D 8C 0A            [24] 1256 	mov	_SetupLen,r4
      00058F 8D 0B            [24] 1257 	mov	(_SetupLen + 1),r5
      000591                       1258 00128$:
                                   1259 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:329: len = SetupLen >= DEFAULT_ENDP0_SIZE ? DEFAULT_ENDP0_SIZE : SetupLen;
      000591 AC 0A            [24] 1260 	mov	r4,_SetupLen
      000593 AD 0B            [24] 1261 	mov	r5,(_SetupLen + 1)
      000595 C3               [12] 1262 	clr	c
      000596 EC               [12] 1263 	mov	a,r4
      000597 94 08            [12] 1264 	subb	a,#0x08
      000599 ED               [12] 1265 	mov	a,r5
      00059A 94 00            [12] 1266 	subb	a,#0x00
      00059C 92 00            [24] 1267 	mov	_UsbCdc_DeviceInterrupt_sloc0_1_0,c
      00059E 40 06            [24] 1268 	jc	00230$
      0005A0 7C 08            [12] 1269 	mov	r4,#0x08
      0005A2 7D 00            [12] 1270 	mov	r5,#0x00
      0005A4 80 04            [24] 1271 	sjmp	00231$
      0005A6                       1272 00230$:
      0005A6 AC 0A            [24] 1273 	mov	r4,_SetupLen
      0005A8 AD 0B            [24] 1274 	mov	r5,(_SetupLen + 1)
      0005AA                       1275 00231$:
      0005AA 8C 06            [24] 1276 	mov	ar6,r4
      0005AC 8D 07            [24] 1277 	mov	ar7,r5
                                   1278 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:330: memcpy(Ep0Buffer,pDescr,len);                     /* 装载上传数据 */
      0005AE 85 0E 2B         [24] 1279 	mov	___memcpy_PARM_2,_pDescr
      0005B1 85 0F 2C         [24] 1280 	mov	(___memcpy_PARM_2 + 1),(_pDescr + 1)
      0005B4 85 10 2D         [24] 1281 	mov	(___memcpy_PARM_2 + 2),(_pDescr + 2)
      0005B7 8E 2E            [24] 1282 	mov	___memcpy_PARM_3,r6
      0005B9 8F 2F            [24] 1283 	mov	(___memcpy_PARM_3 + 1),r7
      0005BB 90 00 00         [24] 1284 	mov	dptr,#_Ep0Buffer
      0005BE 75 F0 00         [24] 1285 	mov	b,#0x00
      0005C1 C0 07            [24] 1286 	push	ar7
      0005C3 C0 06            [24] 1287 	push	ar6
      0005C5 12 0F AC         [24] 1288 	lcall	___memcpy
      0005C8 D0 06            [24] 1289 	pop	ar6
      0005CA D0 07            [24] 1290 	pop	ar7
                                   1291 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:331: SetupLen -= len;
      0005CC E5 0A            [12] 1292 	mov	a,_SetupLen
      0005CE C3               [12] 1293 	clr	c
      0005CF 9E               [12] 1294 	subb	a,r6
      0005D0 F5 0A            [12] 1295 	mov	_SetupLen,a
      0005D2 E5 0B            [12] 1296 	mov	a,(_SetupLen + 1)
      0005D4 9F               [12] 1297 	subb	a,r7
      0005D5 F5 0B            [12] 1298 	mov	(_SetupLen + 1),a
                                   1299 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:332: pDescr += len;
      0005D7 EE               [12] 1300 	mov	a,r6
      0005D8 25 0E            [12] 1301 	add	a,_pDescr
      0005DA F5 0E            [12] 1302 	mov	_pDescr,a
      0005DC EF               [12] 1303 	mov	a,r7
      0005DD 35 0F            [12] 1304 	addc	a,(_pDescr + 1)
      0005DF F5 0F            [12] 1305 	mov	(_pDescr + 1),a
                                   1306 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:333: break;
      0005E1 02 08 01         [24] 1307 	ljmp	00194$
                                   1308 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:334: case USB_SET_ADDRESS:
      0005E4                       1309 00129$:
                                   1310 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:335: SetupLen = UsbSetupBuf->wValueL;                  /* 暂存设备地址 */
      0005E4 90 00 02         [24] 1311 	mov	dptr,#(_Ep0Buffer + 0x0002)
      0005E7 E0               [24] 1312 	movx	a,@dptr
      0005E8 FD               [12] 1313 	mov	r5,a
      0005E9 8D 0A            [24] 1314 	mov	_SetupLen,r5
      0005EB 75 0B 00         [24] 1315 	mov	(_SetupLen + 1),#0x00
                                   1316 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:336: break;
      0005EE 02 08 01         [24] 1317 	ljmp	00194$
                                   1318 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:337: case USB_GET_CONFIGURATION:
      0005F1                       1319 00130$:
                                   1320 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:338: Ep0Buffer[0] = UsbConfig;
      0005F1 90 00 00         [24] 1321 	mov	dptr,#_Ep0Buffer
      0005F4 E5 0D            [12] 1322 	mov	a,_UsbConfig
      0005F6 F0               [24] 1323 	movx	@dptr,a
                                   1324 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:339: if ( SetupLen >= 1 )
      0005F7 AC 0A            [24] 1325 	mov	r4,_SetupLen
      0005F9 AD 0B            [24] 1326 	mov	r5,(_SetupLen + 1)
      0005FB C3               [12] 1327 	clr	c
      0005FC EC               [12] 1328 	mov	a,r4
      0005FD 94 01            [12] 1329 	subb	a,#0x01
      0005FF ED               [12] 1330 	mov	a,r5
      000600 94 00            [12] 1331 	subb	a,#0x00
      000602 50 03            [24] 1332 	jnc	00552$
      000604 02 08 01         [24] 1333 	ljmp	00194$
      000607                       1334 00552$:
                                   1335 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:341: len = 1;
      000607 7E 01            [12] 1336 	mov	r6,#0x01
      000609 7F 00            [12] 1337 	mov	r7,#0x00
                                   1338 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:343: break;
      00060B 02 08 01         [24] 1339 	ljmp	00194$
                                   1340 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:344: case USB_SET_CONFIGURATION:
      00060E                       1341 00133$:
                                   1342 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:345: UsbConfig = UsbSetupBuf->wValueL;
      00060E 90 00 02         [24] 1343 	mov	dptr,#(_Ep0Buffer + 0x0002)
      000611 E0               [24] 1344 	movx	a,@dptr
      000612 F5 0D            [12] 1345 	mov	_UsbConfig,a
                                   1346 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:346: break;
      000614 02 08 01         [24] 1347 	ljmp	00194$
                                   1348 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:349: case USB_CLEAR_FEATURE:                               /* 清除特性 */
      000617                       1349 00135$:
                                   1350 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:350: if( ( UsbSetupBuf->bRequestType & 0x1F ) == USB_REQ_RECIP_DEVICE )
      000617 90 00 00         [24] 1351 	mov	dptr,#_Ep0Buffer
      00061A E0               [24] 1352 	movx	a,@dptr
      00061B 54 1F            [12] 1353 	anl	a,#0x1f
      00061D 70 33            [24] 1354 	jnz	00154$
                                   1355 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:352: if( ( ( ( uint16_t )UsbSetupBuf->wValueH << 8 ) | UsbSetupBuf->wValueL ) == 0x01 )
      00061F 90 00 03         [24] 1356 	mov	dptr,#(_Ep0Buffer + 0x0003)
      000622 E0               [24] 1357 	movx	a,@dptr
      000623 FC               [12] 1358 	mov	r4,a
      000624 7D 00            [12] 1359 	mov	r5,#0x00
      000626 90 00 02         [24] 1360 	mov	dptr,#(_Ep0Buffer + 0x0002)
      000629 E0               [24] 1361 	movx	a,@dptr
      00062A FB               [12] 1362 	mov	r3,a
      00062B 7A 00            [12] 1363 	mov	r2,#0x00
      00062D 42 05            [12] 1364 	orl	ar5,a
      00062F EA               [12] 1365 	mov	a,r2
      000630 42 04            [12] 1366 	orl	ar4,a
      000632 BD 01 16         [24] 1367 	cjne	r5,#0x01,00140$
      000635 BC 00 13         [24] 1368 	cjne	r4,#0x00,00140$
                                   1369 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:354: if( CfgDesc[ 7 ] & 0x20 )
      000638 90 11 E7         [24] 1370 	mov	dptr,#(_CfgDesc + 0x0007)
      00063B E4               [12] 1371 	clr	a
      00063C 93               [24] 1372 	movc	a,@a+dptr
      00063D FD               [12] 1373 	mov	r5,a
      00063E 30 E5 03         [24] 1374 	jnb	acc.5,00557$
      000641 02 08 01         [24] 1375 	ljmp	00194$
      000644                       1376 00557$:
                                   1377 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:360: len = 0xFF;
      000644 7E FF            [12] 1378 	mov	r6,#0xff
      000646 7F 00            [12] 1379 	mov	r7,#0x00
      000648 02 08 01         [24] 1380 	ljmp	00194$
      00064B                       1381 00140$:
                                   1382 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:365: len = 0xFF;
      00064B 7E FF            [12] 1383 	mov	r6,#0xff
      00064D 7F 00            [12] 1384 	mov	r7,#0x00
      00064F 02 08 01         [24] 1385 	ljmp	00194$
      000652                       1386 00154$:
                                   1387 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:368: else if ( ( UsbSetupBuf->bRequestType & USB_REQ_RECIP_MASK ) == USB_REQ_RECIP_ENDP )
      000652 90 00 00         [24] 1388 	mov	dptr,#_Ep0Buffer
      000655 E0               [24] 1389 	movx	a,@dptr
      000656 FD               [12] 1390 	mov	r5,a
      000657 53 05 1F         [24] 1391 	anl	ar5,#0x1f
      00065A 7C 00            [12] 1392 	mov	r4,#0x00
      00065C BD 02 5E         [24] 1393 	cjne	r5,#0x02,00151$
      00065F BC 00 5B         [24] 1394 	cjne	r4,#0x00,00151$
                                   1395 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:370: switch( UsbSetupBuf->wIndexL )
      000662 90 00 04         [24] 1396 	mov	dptr,#(_Ep0Buffer + 0x0004)
      000665 E0               [24] 1397 	movx	a,@dptr
      000666 FD               [12] 1398 	mov	r5,a
      000667 BD 01 02         [24] 1399 	cjne	r5,#0x01,00560$
      00066A 80 44            [24] 1400 	sjmp	00147$
      00066C                       1401 00560$:
      00066C BD 02 02         [24] 1402 	cjne	r5,#0x02,00561$
      00066F 80 2E            [24] 1403 	sjmp	00145$
      000671                       1404 00561$:
      000671 BD 03 02         [24] 1405 	cjne	r5,#0x03,00562$
      000674 80 18            [24] 1406 	sjmp	00143$
      000676                       1407 00562$:
      000676 BD 81 02         [24] 1408 	cjne	r5,#0x81,00563$
      000679 80 2A            [24] 1409 	sjmp	00146$
      00067B                       1410 00563$:
      00067B BD 82 02         [24] 1411 	cjne	r5,#0x82,00564$
      00067E 80 14            [24] 1412 	sjmp	00144$
      000680                       1413 00564$:
      000680 BD 83 33         [24] 1414 	cjne	r5,#0x83,00148$
                                   1415 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:373: UEP3_CTRL = UEP3_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
      000683 74 BC            [12] 1416 	mov	a,#0xbc
      000685 55 D6            [12] 1417 	anl	a,_UEP3_CTRL
      000687 44 02            [12] 1418 	orl	a,#0x02
      000689 F5 D6            [12] 1419 	mov	_UEP3_CTRL,a
                                   1420 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:374: break;
      00068B 02 08 01         [24] 1421 	ljmp	00194$
                                   1422 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:375: case 0x03:
      00068E                       1423 00143$:
                                   1424 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:376: UEP3_CTRL = UEP3_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
      00068E 53 D6 73         [24] 1425 	anl	_UEP3_CTRL,#0x73
                                   1426 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:377: break;
      000691 02 08 01         [24] 1427 	ljmp	00194$
                                   1428 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:378: case 0x82:
      000694                       1429 00144$:
                                   1430 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:379: UEP2_CTRL = UEP2_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
      000694 74 BC            [12] 1431 	mov	a,#0xbc
      000696 55 D4            [12] 1432 	anl	a,_UEP2_CTRL
      000698 44 02            [12] 1433 	orl	a,#0x02
      00069A F5 D4            [12] 1434 	mov	_UEP2_CTRL,a
                                   1435 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:380: break;
      00069C 02 08 01         [24] 1436 	ljmp	00194$
                                   1437 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:381: case 0x02:
      00069F                       1438 00145$:
                                   1439 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:382: UEP2_CTRL = UEP2_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
      00069F 53 D4 73         [24] 1440 	anl	_UEP2_CTRL,#0x73
                                   1441 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:383: break;
      0006A2 02 08 01         [24] 1442 	ljmp	00194$
                                   1443 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:384: case 0x81:
      0006A5                       1444 00146$:
                                   1445 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:385: UEP1_CTRL = UEP1_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
      0006A5 74 BC            [12] 1446 	mov	a,#0xbc
      0006A7 55 D2            [12] 1447 	anl	a,_UEP1_CTRL
      0006A9 44 02            [12] 1448 	orl	a,#0x02
      0006AB F5 D2            [12] 1449 	mov	_UEP1_CTRL,a
                                   1450 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:386: break;
      0006AD 02 08 01         [24] 1451 	ljmp	00194$
                                   1452 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:387: case 0x01:
      0006B0                       1453 00147$:
                                   1454 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:388: UEP1_CTRL = UEP1_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
      0006B0 53 D2 73         [24] 1455 	anl	_UEP1_CTRL,#0x73
                                   1456 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:389: break;
      0006B3 02 08 01         [24] 1457 	ljmp	00194$
                                   1458 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:390: default:
      0006B6                       1459 00148$:
                                   1460 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:391: len = 0xFF;
      0006B6 7E FF            [12] 1461 	mov	r6,#0xff
      0006B8 7F 00            [12] 1462 	mov	r7,#0x00
                                   1463 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:393: }
      0006BA 02 08 01         [24] 1464 	ljmp	00194$
      0006BD                       1465 00151$:
                                   1466 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:397: len = 0xFF;
      0006BD 7E FF            [12] 1467 	mov	r6,#0xff
      0006BF 7F 00            [12] 1468 	mov	r7,#0x00
                                   1469 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:399: break;
      0006C1 02 08 01         [24] 1470 	ljmp	00194$
                                   1471 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:400: case USB_SET_FEATURE:                                 /* 设置特性 */
      0006C4                       1472 00156$:
                                   1473 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:401: if( ( UsbSetupBuf->bRequestType & 0x1F ) == USB_REQ_RECIP_DEVICE )
      0006C4 90 00 00         [24] 1474 	mov	dptr,#_Ep0Buffer
      0006C7 E0               [24] 1475 	movx	a,@dptr
      0006C8 54 1F            [12] 1476 	anl	a,#0x1f
      0006CA 70 4D            [24] 1477 	jnz	00181$
                                   1478 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:403: if( ( ( ( uint16_t )UsbSetupBuf->wValueH << 8 ) | UsbSetupBuf->wValueL ) == 0x01 )
      0006CC 90 00 03         [24] 1479 	mov	dptr,#(_Ep0Buffer + 0x0003)
      0006CF E0               [24] 1480 	movx	a,@dptr
      0006D0 FC               [12] 1481 	mov	r4,a
      0006D1 7D 00            [12] 1482 	mov	r5,#0x00
      0006D3 90 00 02         [24] 1483 	mov	dptr,#(_Ep0Buffer + 0x0002)
      0006D6 E0               [24] 1484 	movx	a,@dptr
      0006D7 FB               [12] 1485 	mov	r3,a
      0006D8 7A 00            [12] 1486 	mov	r2,#0x00
      0006DA 42 05            [12] 1487 	orl	ar5,a
      0006DC EA               [12] 1488 	mov	a,r2
      0006DD 42 04            [12] 1489 	orl	ar4,a
      0006DF BD 01 30         [24] 1490 	cjne	r5,#0x01,00164$
      0006E2 BC 00 2D         [24] 1491 	cjne	r4,#0x00,00164$
                                   1492 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:405: if( CfgDesc[ 7 ] & 0x20 )
      0006E5 90 11 E7         [24] 1493 	mov	dptr,#(_CfgDesc + 0x0007)
      0006E8 E4               [12] 1494 	clr	a
      0006E9 93               [24] 1495 	movc	a,@a+dptr
      0006EA FD               [12] 1496 	mov	r5,a
      0006EB 30 E5 1D         [24] 1497 	jnb	acc.5,00161$
                                   1498 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:411: while ( XBUS_AUX & bUART0_TX )
      0006EE                       1499 00157$:
      0006EE E5 A2            [12] 1500 	mov	a,_XBUS_AUX
      0006F0 20 E7 FB         [24] 1501 	jb	acc.7,00157$
                                   1502 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:415: SAFE_MOD = 0x55;
      0006F3 75 A1 55         [24] 1503 	mov	_SAFE_MOD,#0x55
                                   1504 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:416: SAFE_MOD = 0xAA;
      0006F6 75 A1 AA         [24] 1505 	mov	_SAFE_MOD,#0xaa
                                   1506 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:417: WAKE_CTRL = bWAK_BY_USB | bWAK_RXD0_LO | bWAK_RXD1_LO;
      0006F9 75 A9 C1         [24] 1507 	mov	_WAKE_CTRL,#0xc1
                                   1508 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:418: PCON |= PD;                            /* 睡眠 */
      0006FC 43 87 02         [24] 1509 	orl	_PCON,#0x02
                                   1510 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:419: SAFE_MOD = 0x55;
      0006FF 75 A1 55         [24] 1511 	mov	_SAFE_MOD,#0x55
                                   1512 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:420: SAFE_MOD = 0xAA;
      000702 75 A1 AA         [24] 1513 	mov	_SAFE_MOD,#0xaa
                                   1514 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:421: WAKE_CTRL = 0x00;
      000705 75 A9 00         [24] 1515 	mov	_WAKE_CTRL,#0x00
      000708 02 08 01         [24] 1516 	ljmp	00194$
      00070B                       1517 00161$:
                                   1518 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:425: len = 0xFF;
      00070B 7E FF            [12] 1519 	mov	r6,#0xff
      00070D 7F 00            [12] 1520 	mov	r7,#0x00
      00070F 02 08 01         [24] 1521 	ljmp	00194$
      000712                       1522 00164$:
                                   1523 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:430: len = 0xFF;
      000712 7E FF            [12] 1524 	mov	r6,#0xff
      000714 7F 00            [12] 1525 	mov	r7,#0x00
      000716 02 08 01         [24] 1526 	ljmp	00194$
      000719                       1527 00181$:
                                   1528 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:433: else if( ( UsbSetupBuf->bRequestType & 0x1F ) == USB_REQ_RECIP_ENDP )
      000719 90 00 00         [24] 1529 	mov	dptr,#_Ep0Buffer
      00071C E0               [24] 1530 	movx	a,@dptr
      00071D FD               [12] 1531 	mov	r5,a
      00071E 53 05 1F         [24] 1532 	anl	ar5,#0x1f
      000721 7C 00            [12] 1533 	mov	r4,#0x00
      000723 BD 02 05         [24] 1534 	cjne	r5,#0x02,00573$
      000726 BC 00 02         [24] 1535 	cjne	r4,#0x00,00573$
      000729 80 03            [24] 1536 	sjmp	00574$
      00072B                       1537 00573$:
      00072B 02 07 CF         [24] 1538 	ljmp	00178$
      00072E                       1539 00574$:
                                   1540 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:435: if( ( ( ( uint16_t )UsbSetupBuf->wValueH << 8 ) | UsbSetupBuf->wValueL ) == 0x00 )
      00072E 90 00 03         [24] 1541 	mov	dptr,#(_Ep0Buffer + 0x0003)
      000731 E0               [24] 1542 	movx	a,@dptr
      000732 FC               [12] 1543 	mov	r4,a
      000733 7D 00            [12] 1544 	mov	r5,#0x00
      000735 90 00 02         [24] 1545 	mov	dptr,#(_Ep0Buffer + 0x0002)
      000738 E0               [24] 1546 	movx	a,@dptr
      000739 FB               [12] 1547 	mov	r3,a
      00073A 7A 00            [12] 1548 	mov	r2,#0x00
      00073C 42 05            [12] 1549 	orl	ar5,a
      00073E EA               [12] 1550 	mov	a,r2
      00073F 42 04            [12] 1551 	orl	ar4,a
      000741 ED               [12] 1552 	mov	a,r5
      000742 4C               [12] 1553 	orl	a,r4
      000743 60 03            [24] 1554 	jz	00575$
      000745 02 07 C9         [24] 1555 	ljmp	00175$
      000748                       1556 00575$:
                                   1557 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:437: switch( ( ( uint16_t )UsbSetupBuf->wIndexH << 8 ) | UsbSetupBuf->wIndexL )
      000748 90 00 05         [24] 1558 	mov	dptr,#(_Ep0Buffer + 0x0005)
      00074B E0               [24] 1559 	movx	a,@dptr
      00074C FC               [12] 1560 	mov	r4,a
      00074D 7D 00            [12] 1561 	mov	r5,#0x00
      00074F 90 00 04         [24] 1562 	mov	dptr,#(_Ep0Buffer + 0x0004)
      000752 E0               [24] 1563 	movx	a,@dptr
      000753 FB               [12] 1564 	mov	r3,a
      000754 7A 00            [12] 1565 	mov	r2,#0x00
      000756 42 05            [12] 1566 	orl	ar5,a
      000758 EA               [12] 1567 	mov	a,r2
      000759 42 04            [12] 1568 	orl	ar4,a
      00075B BD 01 05         [24] 1569 	cjne	r5,#0x01,00576$
      00075E BC 00 02         [24] 1570 	cjne	r4,#0x00,00576$
      000761 80 58            [24] 1571 	sjmp	00171$
      000763                       1572 00576$:
      000763 BD 02 05         [24] 1573 	cjne	r5,#0x02,00577$
      000766 BC 00 02         [24] 1574 	cjne	r4,#0x00,00577$
      000769 80 3C            [24] 1575 	sjmp	00169$
      00076B                       1576 00577$:
      00076B BD 03 05         [24] 1577 	cjne	r5,#0x03,00578$
      00076E BC 00 02         [24] 1578 	cjne	r4,#0x00,00578$
      000771 80 20            [24] 1579 	sjmp	00167$
      000773                       1580 00578$:
      000773 BD 81 05         [24] 1581 	cjne	r5,#0x81,00579$
      000776 BC 00 02         [24] 1582 	cjne	r4,#0x00,00579$
      000779 80 36            [24] 1583 	sjmp	00170$
      00077B                       1584 00579$:
      00077B BD 82 05         [24] 1585 	cjne	r5,#0x82,00580$
      00077E BC 00 02         [24] 1586 	cjne	r4,#0x00,00580$
      000781 80 1A            [24] 1587 	sjmp	00168$
      000783                       1588 00580$:
      000783 BD 83 3D         [24] 1589 	cjne	r5,#0x83,00172$
      000786 BC 00 3A         [24] 1590 	cjne	r4,#0x00,00172$
                                   1591 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:440: UEP3_CTRL = UEP3_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;
      000789 74 BF            [12] 1592 	mov	a,#0xbf
      00078B 55 D6            [12] 1593 	anl	a,_UEP3_CTRL
      00078D 44 03            [12] 1594 	orl	a,#0x03
      00078F F5 D6            [12] 1595 	mov	_UEP3_CTRL,a
                                   1596 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:441: break;
                                   1597 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:442: case 0x03:
      000791 80 6E            [24] 1598 	sjmp	00194$
      000793                       1599 00167$:
                                   1600 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:443: UEP3_CTRL = UEP3_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;
      000793 74 7F            [12] 1601 	mov	a,#0x7f
      000795 55 D6            [12] 1602 	anl	a,_UEP3_CTRL
      000797 44 0C            [12] 1603 	orl	a,#0x0c
      000799 F5 D6            [12] 1604 	mov	_UEP3_CTRL,a
                                   1605 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:444: break;
                                   1606 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:445: case 0x82:
      00079B 80 64            [24] 1607 	sjmp	00194$
      00079D                       1608 00168$:
                                   1609 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:446: UEP2_CTRL = UEP2_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;
      00079D 74 BF            [12] 1610 	mov	a,#0xbf
      00079F 55 D4            [12] 1611 	anl	a,_UEP2_CTRL
      0007A1 44 03            [12] 1612 	orl	a,#0x03
      0007A3 F5 D4            [12] 1613 	mov	_UEP2_CTRL,a
                                   1614 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:447: break;
                                   1615 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:448: case 0x02:
      0007A5 80 5A            [24] 1616 	sjmp	00194$
      0007A7                       1617 00169$:
                                   1618 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:449: UEP2_CTRL = UEP2_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;
      0007A7 74 7F            [12] 1619 	mov	a,#0x7f
      0007A9 55 D4            [12] 1620 	anl	a,_UEP2_CTRL
      0007AB 44 0C            [12] 1621 	orl	a,#0x0c
      0007AD F5 D4            [12] 1622 	mov	_UEP2_CTRL,a
                                   1623 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:450: break;
                                   1624 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:451: case 0x81:
      0007AF 80 50            [24] 1625 	sjmp	00194$
      0007B1                       1626 00170$:
                                   1627 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:452: UEP1_CTRL = UEP1_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;
      0007B1 74 BF            [12] 1628 	mov	a,#0xbf
      0007B3 55 D2            [12] 1629 	anl	a,_UEP1_CTRL
      0007B5 44 03            [12] 1630 	orl	a,#0x03
      0007B7 F5 D2            [12] 1631 	mov	_UEP1_CTRL,a
                                   1632 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:453: break;
                                   1633 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:454: case 0x01:
      0007B9 80 46            [24] 1634 	sjmp	00194$
      0007BB                       1635 00171$:
                                   1636 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:455: UEP1_CTRL = UEP1_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;
      0007BB 74 7F            [12] 1637 	mov	a,#0x7f
      0007BD 55 D2            [12] 1638 	anl	a,_UEP1_CTRL
      0007BF 44 0C            [12] 1639 	orl	a,#0x0c
      0007C1 F5 D2            [12] 1640 	mov	_UEP1_CTRL,a
                                   1641 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:456: default:
      0007C3                       1642 00172$:
                                   1643 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:457: len = 0xFF;
      0007C3 7E FF            [12] 1644 	mov	r6,#0xff
      0007C5 7F 00            [12] 1645 	mov	r7,#0x00
                                   1646 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:459: }
      0007C7 80 38            [24] 1647 	sjmp	00194$
      0007C9                       1648 00175$:
                                   1649 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:463: len = 0xFF;
      0007C9 7E FF            [12] 1650 	mov	r6,#0xff
      0007CB 7F 00            [12] 1651 	mov	r7,#0x00
      0007CD 80 32            [24] 1652 	sjmp	00194$
      0007CF                       1653 00178$:
                                   1654 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:468: len = 0xFF;
      0007CF 7E FF            [12] 1655 	mov	r6,#0xff
      0007D1 7F 00            [12] 1656 	mov	r7,#0x00
                                   1657 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:470: break;
                                   1658 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:471: case USB_GET_STATUS:
      0007D3 80 2C            [24] 1659 	sjmp	00194$
      0007D5                       1660 00183$:
                                   1661 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:472: Ep0Buffer[0] = 0x00;
      0007D5 90 00 00         [24] 1662 	mov	dptr,#_Ep0Buffer
      0007D8 E4               [12] 1663 	clr	a
      0007D9 F0               [24] 1664 	movx	@dptr,a
                                   1665 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:473: Ep0Buffer[1] = 0x00;
      0007DA 90 00 01         [24] 1666 	mov	dptr,#(_Ep0Buffer + 0x0001)
      0007DD F0               [24] 1667 	movx	@dptr,a
                                   1668 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:474: if ( SetupLen >= 2 )
      0007DE AC 0A            [24] 1669 	mov	r4,_SetupLen
      0007E0 AD 0B            [24] 1670 	mov	r5,(_SetupLen + 1)
      0007E2 C3               [12] 1671 	clr	c
      0007E3 EC               [12] 1672 	mov	a,r4
      0007E4 94 02            [12] 1673 	subb	a,#0x02
      0007E6 ED               [12] 1674 	mov	a,r5
      0007E7 94 00            [12] 1675 	subb	a,#0x00
      0007E9 40 06            [24] 1676 	jc	00185$
                                   1677 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:476: len = 2;
      0007EB 7E 02            [12] 1678 	mov	r6,#0x02
      0007ED 7F 00            [12] 1679 	mov	r7,#0x00
      0007EF 80 10            [24] 1680 	sjmp	00194$
      0007F1                       1681 00185$:
                                   1682 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:480: len = SetupLen;
      0007F1 AE 0A            [24] 1683 	mov	r6,_SetupLen
      0007F3 AF 0B            [24] 1684 	mov	r7,(_SetupLen + 1)
                                   1685 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:482: break;
                                   1686 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:483: default:
      0007F5 80 0A            [24] 1687 	sjmp	00194$
      0007F7                       1688 00187$:
                                   1689 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:484: len = 0xff;
      0007F7 7E FF            [12] 1690 	mov	r6,#0xff
      0007F9 7F 00            [12] 1691 	mov	r7,#0x00
                                   1692 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:486: }
      0007FB 80 04            [24] 1693 	sjmp	00194$
      0007FD                       1694 00193$:
                                   1695 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:491: len = 0xff;                                              /* 包长度错误 */
      0007FD 7E FF            [12] 1696 	mov	r6,#0xff
      0007FF 7F 00            [12] 1697 	mov	r7,#0x00
      000801                       1698 00194$:
                                   1699 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:493: if(len == 0xff)
      000801 8E 04            [24] 1700 	mov	ar4,r6
      000803 8F 05            [24] 1701 	mov	ar5,r7
      000805 BC FF 0C         [24] 1702 	cjne	r4,#0xff,00199$
      000808 BD 00 09         [24] 1703 	cjne	r5,#0x00,00199$
                                   1704 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:495: SetupReq = 0xFF;
      00080B 75 0C FF         [24] 1705 	mov	_SetupReq,#0xff
                                   1706 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:496: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_STALL | UEP_T_RES_STALL;/* STALL */
      00080E 75 DC CF         [24] 1707 	mov	_UEP0_CTRL,#0xcf
      000811 02 08 DB         [24] 1708 	ljmp	00213$
      000814                       1709 00199$:
                                   1710 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:498: else if(len <= DEFAULT_ENDP0_SIZE)                           /* 上传数据或状态阶段返回0长度包 */
      000814 C3               [12] 1711 	clr	c
      000815 74 08            [12] 1712 	mov	a,#0x08
      000817 9C               [12] 1713 	subb	a,r4
      000818 E4               [12] 1714 	clr	a
      000819 9D               [12] 1715 	subb	a,r5
      00081A 40 08            [24] 1716 	jc	00196$
                                   1717 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:500: UEP0_T_LEN = len;
      00081C 8E DD            [24] 1718 	mov	_UEP0_T_LEN,r6
                                   1719 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:501: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_ACK | UEP_T_RES_ACK;
      00081E 75 DC C0         [24] 1720 	mov	_UEP0_CTRL,#0xc0
      000821 02 08 DB         [24] 1721 	ljmp	00213$
      000824                       1722 00196$:
                                   1723 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:505: UEP0_T_LEN = 0;                                          /* 预置0长度包, 防止主机提前进入状态阶段 */
      000824 75 DD 00         [24] 1724 	mov	_UEP0_T_LEN,#0x00
                                   1725 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:506: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_ACK | UEP_T_RES_ACK;
      000827 75 DC C0         [24] 1726 	mov	_UEP0_CTRL,#0xc0
                                   1727 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:508: break;
      00082A 02 08 DB         [24] 1728 	ljmp	00213$
                                   1729 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:509: case UIS_TOKEN_IN | 0:                                           /* 端点0 IN */
      00082D                       1730 00201$:
                                   1731 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:510: switch(SetupReq)
      00082D 74 05            [12] 1732 	mov	a,#0x05
      00082F B5 0C 02         [24] 1733 	cjne	a,_SetupReq,00587$
      000832 80 58            [24] 1734 	sjmp	00203$
      000834                       1735 00587$:
      000834 74 06            [12] 1736 	mov	a,#0x06
      000836 B5 0C 63         [24] 1737 	cjne	a,_SetupReq,00204$
                                   1738 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:513: len = SetupLen >= DEFAULT_ENDP0_SIZE ? DEFAULT_ENDP0_SIZE : SetupLen;
      000839 AE 0A            [24] 1739 	mov	r6,_SetupLen
      00083B AF 0B            [24] 1740 	mov	r7,(_SetupLen + 1)
      00083D C3               [12] 1741 	clr	c
      00083E EE               [12] 1742 	mov	a,r6
      00083F 94 08            [12] 1743 	subb	a,#0x08
      000841 EF               [12] 1744 	mov	a,r7
      000842 94 00            [12] 1745 	subb	a,#0x00
      000844 92 00            [24] 1746 	mov	_UsbCdc_DeviceInterrupt_sloc0_1_0,c
      000846 40 06            [24] 1747 	jc	00232$
      000848 7E 08            [12] 1748 	mov	r6,#0x08
      00084A 7F 00            [12] 1749 	mov	r7,#0x00
      00084C 80 04            [24] 1750 	sjmp	00233$
      00084E                       1751 00232$:
      00084E AE 0A            [24] 1752 	mov	r6,_SetupLen
      000850 AF 0B            [24] 1753 	mov	r7,(_SetupLen + 1)
      000852                       1754 00233$:
                                   1755 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:514: memcpy( Ep0Buffer, pDescr, len );                        /* 加载上传数据 */
      000852 85 0E 2B         [24] 1756 	mov	___memcpy_PARM_2,_pDescr
      000855 85 0F 2C         [24] 1757 	mov	(___memcpy_PARM_2 + 1),(_pDescr + 1)
      000858 85 10 2D         [24] 1758 	mov	(___memcpy_PARM_2 + 2),(_pDescr + 2)
      00085B 8E 2E            [24] 1759 	mov	___memcpy_PARM_3,r6
      00085D 8F 2F            [24] 1760 	mov	(___memcpy_PARM_3 + 1),r7
      00085F 90 00 00         [24] 1761 	mov	dptr,#_Ep0Buffer
      000862 75 F0 00         [24] 1762 	mov	b,#0x00
      000865 C0 07            [24] 1763 	push	ar7
      000867 C0 06            [24] 1764 	push	ar6
      000869 12 0F AC         [24] 1765 	lcall	___memcpy
      00086C D0 06            [24] 1766 	pop	ar6
      00086E D0 07            [24] 1767 	pop	ar7
                                   1768 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:515: SetupLen -= len;
      000870 E5 0A            [12] 1769 	mov	a,_SetupLen
      000872 C3               [12] 1770 	clr	c
      000873 9E               [12] 1771 	subb	a,r6
      000874 F5 0A            [12] 1772 	mov	_SetupLen,a
      000876 E5 0B            [12] 1773 	mov	a,(_SetupLen + 1)
      000878 9F               [12] 1774 	subb	a,r7
      000879 F5 0B            [12] 1775 	mov	(_SetupLen + 1),a
                                   1776 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:516: pDescr += len;
      00087B EE               [12] 1777 	mov	a,r6
      00087C 25 0E            [12] 1778 	add	a,_pDescr
      00087E F5 0E            [12] 1779 	mov	_pDescr,a
      000880 EF               [12] 1780 	mov	a,r7
      000881 35 0F            [12] 1781 	addc	a,(_pDescr + 1)
      000883 F5 0F            [12] 1782 	mov	(_pDescr + 1),a
                                   1783 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:517: UEP0_T_LEN = len;
      000885 8E DD            [24] 1784 	mov	_UEP0_T_LEN,r6
                                   1785 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:518: UEP0_CTRL ^= bUEP_T_TOG;                                 /* 同步标志翻转 */
      000887 63 DC 40         [24] 1786 	xrl	_UEP0_CTRL,#0x40
                                   1787 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:519: break;
                                   1788 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:520: case USB_SET_ADDRESS:
      00088A 80 4F            [24] 1789 	sjmp	00213$
      00088C                       1790 00203$:
                                   1791 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:521: USB_DEV_AD = USB_DEV_AD & bUDA_GP_BIT | SetupLen;
      00088C E5 E3            [12] 1792 	mov	a,_USB_DEV_AD
      00088E 54 80            [12] 1793 	anl	a,#0x80
      000890 FF               [12] 1794 	mov	r7,a
      000891 E5 0A            [12] 1795 	mov	a,_SetupLen
      000893 FE               [12] 1796 	mov	r6,a
      000894 4F               [12] 1797 	orl	a,r7
      000895 F5 E3            [12] 1798 	mov	_USB_DEV_AD,a
                                   1799 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:522: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      000897 75 DC 02         [24] 1800 	mov	_UEP0_CTRL,#0x02
                                   1801 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:523: break;
                                   1802 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:524: default:
      00089A 80 3F            [24] 1803 	sjmp	00213$
      00089C                       1804 00204$:
                                   1805 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:525: UEP0_T_LEN = 0;                                          /* 状态阶段完成或强制0长度包结束控制传输 */
      00089C 75 DD 00         [24] 1806 	mov	_UEP0_T_LEN,#0x00
                                   1807 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:526: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      00089F 75 DC 02         [24] 1808 	mov	_UEP0_CTRL,#0x02
                                   1809 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:529: break;
                                   1810 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:530: case UIS_TOKEN_OUT | 0:                                          /* 端点0 OUT */
      0008A2 80 37            [24] 1811 	sjmp	00213$
      0008A4                       1812 00206$:
                                   1813 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:531: if(SetupReq == SET_LINE_CODING)                              /* 设置串口属性 */
      0008A4 74 20            [12] 1814 	mov	a,#0x20
      0008A6 B5 0C 2C         [24] 1815 	cjne	a,_SetupReq,00210$
                                   1816 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:533: if( U_TOG_OK )
      0008A9 30 DE 2F         [24] 1817 	jnb	_U_TOG_OK,00213$
                                   1818 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:535: memcpy(LineCoding,UsbSetupBuf,USB_RX_LEN);
      0008AC 75 2B 00         [24] 1819 	mov	___memcpy_PARM_2,#_Ep0Buffer
      0008AF 75 2C 00         [24] 1820 	mov	(___memcpy_PARM_2 + 1),#(_Ep0Buffer >> 8)
      0008B2 75 2D 00         [24] 1821 	mov	(___memcpy_PARM_2 + 2),#0x00
      0008B5 85 DB 2E         [24] 1822 	mov	___memcpy_PARM_3,_USB_RX_LEN
      0008B8 75 2F 00         [24] 1823 	mov	(___memcpy_PARM_3 + 1),#0x00
      0008BB 90 01 34         [24] 1824 	mov	dptr,#_LineCoding
      0008BE 75 F0 00         [24] 1825 	mov	b,#0x00
      0008C1 12 0F AC         [24] 1826 	lcall	___memcpy
                                   1827 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:536: Config_Uart1(LineCoding);
      0008C4 90 01 34         [24] 1828 	mov	dptr,#_LineCoding
      0008C7 75 F0 00         [24] 1829 	mov	b,#0x00
      0008CA 12 02 6A         [24] 1830 	lcall	_Config_Uart1
                                   1831 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:537: UEP0_T_LEN = 0;
      0008CD 75 DD 00         [24] 1832 	mov	_UEP0_T_LEN,#0x00
                                   1833 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:538: UEP0_CTRL |= UEP_R_RES_ACK | UEP_T_RES_ACK;          /* 准备上传0包 */
      0008D0 85 DC DC         [24] 1834 	mov	_UEP0_CTRL,_UEP0_CTRL
      0008D3 80 06            [24] 1835 	sjmp	00213$
      0008D5                       1836 00210$:
                                   1837 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:543: UEP0_T_LEN = 0;
      0008D5 75 DD 00         [24] 1838 	mov	_UEP0_T_LEN,#0x00
                                   1839 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:544: UEP0_CTRL |= UEP_R_RES_ACK | UEP_T_RES_NAK;              /* 状态阶段, IN 响应 NAK */
      0008D8 43 DC 02         [24] 1840 	orl	_UEP0_CTRL,#0x02
                                   1841 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:549: }
      0008DB                       1842 00213$:
                                   1843 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:550: UIF_TRANSFER = 0;                                                /* 写0清空中断 */
                                   1844 ;	assignBit
      0008DB C2 D9            [12] 1845 	clr	_UIF_TRANSFER
      0008DD                       1846 00215$:
                                   1847 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:552: if(UIF_BUS_RST)                                                      /* 设备模式 USB 总线复位中断 */
      0008DD 30 D8 21         [24] 1848 	jnb	_UIF_BUS_RST,00217$
                                   1849 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:557: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      0008E0 75 DC 02         [24] 1850 	mov	_UEP0_CTRL,#0x02
                                   1851 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:558: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK;
      0008E3 75 D2 12         [24] 1852 	mov	_UEP1_CTRL,#0x12
                                   1853 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:559: UEP2_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;
      0008E6 75 D4 12         [24] 1854 	mov	_UEP2_CTRL,#0x12
                                   1855 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:560: USB_DEV_AD = 0x00;
      0008E9 75 E3 00         [24] 1856 	mov	_USB_DEV_AD,#0x00
                                   1857 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:561: UIF_SUSPEND = 0;
                                   1858 ;	assignBit
      0008EC C2 DA            [12] 1859 	clr	_UIF_SUSPEND
                                   1860 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:562: UIF_TRANSFER = 0;
                                   1861 ;	assignBit
      0008EE C2 D9            [12] 1862 	clr	_UIF_TRANSFER
                                   1863 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:563: UIF_BUS_RST = 0;                                                 /* 清中断标志 */
                                   1864 ;	assignBit
      0008F0 C2 D8            [12] 1865 	clr	_UIF_BUS_RST
                                   1866 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:564: USBByteCount = 0;                                                /* USB 端点待处理字节数清零 */
      0008F2 90 01 3B         [24] 1867 	mov	dptr,#_USBByteCount
      0008F5 E4               [12] 1868 	clr	a
      0008F6 F0               [24] 1869 	movx	@dptr,a
                                   1870 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:565: USBBufOutPoint = 0;
      0008F7 90 01 3C         [24] 1871 	mov	dptr,#_USBBufOutPoint
      0008FA F0               [24] 1872 	movx	@dptr,a
                                   1873 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:566: UsbConfig = 0;                                                   /* 清除配置值 */
                                   1874 ;	1-genFromRTrack replaced	mov	_UsbConfig,#0x00
      0008FB F5 0D            [12] 1875 	mov	_UsbConfig,a
                                   1876 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:567: UpPoint2_Busy = 0;
      0008FD 90 01 3D         [24] 1877 	mov	dptr,#_UpPoint2_Busy
      000900 F0               [24] 1878 	movx	@dptr,a
      000901                       1879 00217$:
                                   1880 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:569: if (UIF_SUSPEND)                                                     /* USB 总线挂起/唤醒完成 */
                                   1881 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:571: UIF_SUSPEND = 0;
                                   1882 ;	assignBit
      000901 10 DA 02         [24] 1883 	jbc	_UIF_SUSPEND,00595$
      000904 80 20            [24] 1884 	sjmp	00224$
      000906                       1885 00595$:
                                   1886 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:572: if ( USB_MIS_ST & bUMS_SUSPEND )                                 /* 挂起 */
      000906 E5 DA            [12] 1887 	mov	a,_USB_MIS_ST
      000908 30 E2 1E         [24] 1888 	jnb	acc.2,00226$
                                   1889 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:577: while ( XBUS_AUX & bUART0_TX )
      00090B                       1890 00218$:
      00090B E5 A2            [12] 1891 	mov	a,_XBUS_AUX
      00090D 20 E7 FB         [24] 1892 	jb	acc.7,00218$
                                   1893 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:581: SAFE_MOD = 0x55;
      000910 75 A1 55         [24] 1894 	mov	_SAFE_MOD,#0x55
                                   1895 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:582: SAFE_MOD = 0xAA;
      000913 75 A1 AA         [24] 1896 	mov	_SAFE_MOD,#0xaa
                                   1897 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:583: WAKE_CTRL = bWAK_BY_USB | bWAK_RXD0_LO | bWAK_RXD1_LO;        /* USB 或 RXD0/1 有信号可唤醒 */
      000916 75 A9 C1         [24] 1898 	mov	_WAKE_CTRL,#0xc1
                                   1899 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:584: PCON |= PD;                                                   /* 睡眠 */
      000919 43 87 02         [24] 1900 	orl	_PCON,#0x02
                                   1901 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:585: SAFE_MOD = 0x55;
      00091C 75 A1 55         [24] 1902 	mov	_SAFE_MOD,#0x55
                                   1903 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:586: SAFE_MOD = 0xAA;
      00091F 75 A1 AA         [24] 1904 	mov	_SAFE_MOD,#0xaa
                                   1905 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:587: WAKE_CTRL = 0x00;
      000922 75 A9 00         [24] 1906 	mov	_WAKE_CTRL,#0x00
      000925 22               [24] 1907 	ret
      000926                       1908 00224$:
                                   1909 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:592: USB_INT_FG = 0xFF;                                               /* 清中断标志 */
      000926 75 D8 FF         [24] 1910 	mov	_USB_INT_FG,#0xff
      000929                       1911 00226$:
                                   1912 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbcdc.c:594: }
      000929 22               [24] 1913 	ret
                                   1914 	.area CSEG    (CODE)
                                   1915 	.area CONST   (CODE)
      0011CE                       1916 _DevDesc:
      0011CE 12                    1917 	.db #0x12	; 18
      0011CF 01                    1918 	.db #0x01	; 1
      0011D0 10                    1919 	.db #0x10	; 16
      0011D1 01                    1920 	.db #0x01	; 1
      0011D2 02                    1921 	.db #0x02	; 2
      0011D3 00                    1922 	.db #0x00	; 0
      0011D4 00                    1923 	.db #0x00	; 0
      0011D5 08                    1924 	.db #0x08	; 8
      0011D6 86                    1925 	.db #0x86	; 134
      0011D7 1A                    1926 	.db #0x1a	; 26
      0011D8 22                    1927 	.db #0x22	; 34
      0011D9 57                    1928 	.db #0x57	; 87	'W'
      0011DA 00                    1929 	.db #0x00	; 0
      0011DB 01                    1930 	.db #0x01	; 1
      0011DC 01                    1931 	.db #0x01	; 1
      0011DD 02                    1932 	.db #0x02	; 2
      0011DE 03                    1933 	.db #0x03	; 3
      0011DF 01                    1934 	.db #0x01	; 1
      0011E0                       1935 _CfgDesc:
      0011E0 09                    1936 	.db #0x09	; 9
      0011E1 02                    1937 	.db #0x02	; 2
      0011E2 43                    1938 	.db #0x43	; 67	'C'
      0011E3 00                    1939 	.db #0x00	; 0
      0011E4 02                    1940 	.db #0x02	; 2
      0011E5 01                    1941 	.db #0x01	; 1
      0011E6 00                    1942 	.db #0x00	; 0
      0011E7 A0                    1943 	.db #0xa0	; 160
      0011E8 32                    1944 	.db #0x32	; 50	'2'
      0011E9 09                    1945 	.db #0x09	; 9
      0011EA 04                    1946 	.db #0x04	; 4
      0011EB 00                    1947 	.db #0x00	; 0
      0011EC 00                    1948 	.db #0x00	; 0
      0011ED 01                    1949 	.db #0x01	; 1
      0011EE 02                    1950 	.db #0x02	; 2
      0011EF 02                    1951 	.db #0x02	; 2
      0011F0 01                    1952 	.db #0x01	; 1
      0011F1 00                    1953 	.db #0x00	; 0
      0011F2 05                    1954 	.db #0x05	; 5
      0011F3 24                    1955 	.db #0x24	; 36
      0011F4 00                    1956 	.db #0x00	; 0
      0011F5 10                    1957 	.db #0x10	; 16
      0011F6 01                    1958 	.db #0x01	; 1
      0011F7 05                    1959 	.db #0x05	; 5
      0011F8 24                    1960 	.db #0x24	; 36
      0011F9 01                    1961 	.db #0x01	; 1
      0011FA 00                    1962 	.db #0x00	; 0
      0011FB 00                    1963 	.db #0x00	; 0
      0011FC 04                    1964 	.db #0x04	; 4
      0011FD 24                    1965 	.db #0x24	; 36
      0011FE 02                    1966 	.db #0x02	; 2
      0011FF 02                    1967 	.db #0x02	; 2
      001200 05                    1968 	.db #0x05	; 5
      001201 24                    1969 	.db #0x24	; 36
      001202 06                    1970 	.db #0x06	; 6
      001203 00                    1971 	.db #0x00	; 0
      001204 01                    1972 	.db #0x01	; 1
      001205 07                    1973 	.db #0x07	; 7
      001206 05                    1974 	.db #0x05	; 5
      001207 81                    1975 	.db #0x81	; 129
      001208 03                    1976 	.db #0x03	; 3
      001209 08                    1977 	.db #0x08	; 8
      00120A 00                    1978 	.db #0x00	; 0
      00120B FF                    1979 	.db #0xff	; 255
      00120C 09                    1980 	.db #0x09	; 9
      00120D 04                    1981 	.db #0x04	; 4
      00120E 01                    1982 	.db #0x01	; 1
      00120F 00                    1983 	.db #0x00	; 0
      001210 02                    1984 	.db #0x02	; 2
      001211 0A                    1985 	.db #0x0a	; 10
      001212 00                    1986 	.db #0x00	; 0
      001213 00                    1987 	.db #0x00	; 0
      001214 00                    1988 	.db #0x00	; 0
      001215 07                    1989 	.db #0x07	; 7
      001216 05                    1990 	.db #0x05	; 5
      001217 02                    1991 	.db #0x02	; 2
      001218 02                    1992 	.db #0x02	; 2
      001219 40                    1993 	.db #0x40	; 64
      00121A 00                    1994 	.db #0x00	; 0
      00121B 00                    1995 	.db #0x00	; 0
      00121C 07                    1996 	.db #0x07	; 7
      00121D 05                    1997 	.db #0x05	; 5
      00121E 82                    1998 	.db #0x82	; 130
      00121F 02                    1999 	.db #0x02	; 2
      001220 40                    2000 	.db #0x40	; 64
      001221 00                    2001 	.db #0x00	; 0
      001222 00                    2002 	.db #0x00	; 0
      001223                       2003 _LangDes:
      001223 04                    2004 	.db #0x04	; 4
      001224 03                    2005 	.db #0x03	; 3
      001225 09                    2006 	.db #0x09	; 9
      001226 04                    2007 	.db #0x04	; 4
      001227                       2008 _SerDes:
      001227 14                    2009 	.db #0x14	; 20
      001228 03                    2010 	.db #0x03	; 3
      001229 32                    2011 	.db #0x32	; 50	'2'
      00122A 00                    2012 	.db #0x00	; 0
      00122B 30                    2013 	.db #0x30	; 48	'0'
      00122C 00                    2014 	.db #0x00	; 0
      00122D 31                    2015 	.db #0x31	; 49	'1'
      00122E 00                    2016 	.db #0x00	; 0
      00122F 37                    2017 	.db #0x37	; 55	'7'
      001230 00                    2018 	.db #0x00	; 0
      001231 2D                    2019 	.db #0x2d	; 45
      001232 00                    2020 	.db #0x00	; 0
      001233 32                    2021 	.db #0x32	; 50	'2'
      001234 00                    2022 	.db #0x00	; 0
      001235 2D                    2023 	.db #0x2d	; 45
      001236 00                    2024 	.db #0x00	; 0
      001237 32                    2025 	.db #0x32	; 50	'2'
      001238 00                    2026 	.db #0x00	; 0
      001239 35                    2027 	.db #0x35	; 53	'5'
      00123A 00                    2028 	.db #0x00	; 0
      00123B                       2029 _Prod_Des:
      00123B 14                    2030 	.db #0x14	; 20
      00123C 03                    2031 	.db #0x03	; 3
      00123D 43                    2032 	.db #0x43	; 67	'C'
      00123E 00                    2033 	.db #0x00	; 0
      00123F 48                    2034 	.db #0x48	; 72	'H'
      001240 00                    2035 	.db #0x00	; 0
      001241 35                    2036 	.db #0x35	; 53	'5'
      001242 00                    2037 	.db #0x00	; 0
      001243 35                    2038 	.db #0x35	; 53	'5'
      001244 00                    2039 	.db #0x00	; 0
      001245 34                    2040 	.db #0x34	; 52	'4'
      001246 00                    2041 	.db #0x00	; 0
      001247 5F                    2042 	.db #0x5f	; 95
      001248 00                    2043 	.db #0x00	; 0
      001249 43                    2044 	.db #0x43	; 67	'C'
      00124A 00                    2045 	.db #0x00	; 0
      00124B 44                    2046 	.db #0x44	; 68	'D'
      00124C 00                    2047 	.db #0x00	; 0
      00124D 43                    2048 	.db #0x43	; 67	'C'
      00124E 00                    2049 	.db #0x00	; 0
      00124F                       2050 _Manuf_Des:
      00124F 0A                    2051 	.db #0x0a	; 10
      001250 03                    2052 	.db #0x03	; 3
      001251 5F                    2053 	.db #0x5f	; 95
      001252 6C                    2054 	.db #0x6c	; 108	'l'
      001253 CF                    2055 	.db #0xcf	; 207
      001254 82                    2056 	.db #0x82	; 130
      001255 81                    2057 	.db #0x81	; 129
      001256 6C                    2058 	.db #0x6c	; 108	'l'
      001257 52                    2059 	.db #0x52	; 82	'R'
      001258 60                    2060 	.db #0x60	; 96
                                   2061 	.area XINIT   (CODE)
      001306                       2062 __xinit__LineCoding:
      001306 00                    2063 	.db #0x00	; 0
      001307 E1                    2064 	.db #0xe1	; 225
      001308 00                    2065 	.db #0x00	; 0
      001309 00                    2066 	.db #0x00	; 0
      00130A 00                    2067 	.db #0x00	; 0
      00130B 00                    2068 	.db #0x00	; 0
      00130C 08                    2069 	.db #0x08	; 8
      00130D                       2070 __xinit__USBByteCount:
      00130D 00                    2071 	.db #0x00	; 0
      00130E                       2072 __xinit__USBBufOutPoint:
      00130E 00                    2073 	.db #0x00	; 0
      00130F                       2074 __xinit__UpPoint2_Busy:
      00130F 00                    2075 	.db #0x00	; 0
                                   2076 	.area CABS    (ABS,CODE)
