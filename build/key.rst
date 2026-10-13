                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module key
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _UIF_BUS_RST
                                     12 	.globl _UIF_DETECT
                                     13 	.globl _UIF_TRANSFER
                                     14 	.globl _UIF_SUSPEND
                                     15 	.globl _UIF_HST_SOF
                                     16 	.globl _UIF_FIFO_OV
                                     17 	.globl _U_SIE_FREE
                                     18 	.globl _U_TOG_OK
                                     19 	.globl _U_IS_NAK
                                     20 	.globl _ADC_CHAN0
                                     21 	.globl _ADC_CHAN1
                                     22 	.globl _CMP_CHAN
                                     23 	.globl _ADC_START
                                     24 	.globl _ADC_IF
                                     25 	.globl _CMP_IF
                                     26 	.globl _CMPO
                                     27 	.globl _U1RI
                                     28 	.globl _U1TI
                                     29 	.globl _U1RB8
                                     30 	.globl _U1TB8
                                     31 	.globl _U1REN
                                     32 	.globl _U1SMOD
                                     33 	.globl _U1SM0
                                     34 	.globl _S0_R_FIFO
                                     35 	.globl _S0_T_FIFO
                                     36 	.globl _S0_FREE
                                     37 	.globl _S0_IF_BYTE
                                     38 	.globl _S0_IF_FIRST
                                     39 	.globl _S0_IF_OV
                                     40 	.globl _S0_FST_ACT
                                     41 	.globl _CP_RL2
                                     42 	.globl _C_T2
                                     43 	.globl _TR2
                                     44 	.globl _EXEN2
                                     45 	.globl _TCLK
                                     46 	.globl _RCLK
                                     47 	.globl _EXF2
                                     48 	.globl _CAP1F
                                     49 	.globl _TF2
                                     50 	.globl _RI
                                     51 	.globl _TI
                                     52 	.globl _RB8
                                     53 	.globl _TB8
                                     54 	.globl _REN
                                     55 	.globl _SM2
                                     56 	.globl _SM1
                                     57 	.globl _SM0
                                     58 	.globl _IT0
                                     59 	.globl _IE0
                                     60 	.globl _IT1
                                     61 	.globl _IE1
                                     62 	.globl _TR0
                                     63 	.globl _TF0
                                     64 	.globl _TR1
                                     65 	.globl _TF1
                                     66 	.globl _RXD
                                     67 	.globl _PWM1_
                                     68 	.globl _TXD
                                     69 	.globl _PWM2_
                                     70 	.globl _AIN3
                                     71 	.globl _VBUS1
                                     72 	.globl _INT0
                                     73 	.globl _TXD1_
                                     74 	.globl _INT1
                                     75 	.globl _T0
                                     76 	.globl _RXD1_
                                     77 	.globl _PWM2
                                     78 	.globl _T1
                                     79 	.globl _UDP
                                     80 	.globl _UDM
                                     81 	.globl _TIN0
                                     82 	.globl _CAP1
                                     83 	.globl _T2
                                     84 	.globl _AIN0
                                     85 	.globl _VBUS2
                                     86 	.globl _TIN1
                                     87 	.globl _CAP2
                                     88 	.globl _T2EX
                                     89 	.globl _RXD_
                                     90 	.globl _TXD_
                                     91 	.globl _AIN1
                                     92 	.globl _UCC1
                                     93 	.globl _TIN2
                                     94 	.globl _SCS
                                     95 	.globl _CAP1_
                                     96 	.globl _T2_
                                     97 	.globl _AIN2
                                     98 	.globl _UCC2
                                     99 	.globl _TIN3
                                    100 	.globl _PWM1
                                    101 	.globl _MOSI
                                    102 	.globl _TIN4
                                    103 	.globl _RXD1
                                    104 	.globl _MISO
                                    105 	.globl _TIN5
                                    106 	.globl _TXD1
                                    107 	.globl _SCK
                                    108 	.globl _IE_SPI0
                                    109 	.globl _IE_TKEY
                                    110 	.globl _IE_USB
                                    111 	.globl _IE_ADC
                                    112 	.globl _IE_UART1
                                    113 	.globl _IE_PWMX
                                    114 	.globl _IE_GPIO
                                    115 	.globl _IE_WDOG
                                    116 	.globl _PX0
                                    117 	.globl _PT0
                                    118 	.globl _PX1
                                    119 	.globl _PT1
                                    120 	.globl _PS
                                    121 	.globl _PT2
                                    122 	.globl _PL_FLAG
                                    123 	.globl _PH_FLAG
                                    124 	.globl _EX0
                                    125 	.globl _ET0
                                    126 	.globl _EX1
                                    127 	.globl _ET1
                                    128 	.globl _ES
                                    129 	.globl _ET2
                                    130 	.globl _E_DIS
                                    131 	.globl _EA
                                    132 	.globl _P
                                    133 	.globl _F1
                                    134 	.globl _OV
                                    135 	.globl _RS0
                                    136 	.globl _RS1
                                    137 	.globl _F0
                                    138 	.globl _AC
                                    139 	.globl _CY
                                    140 	.globl _UEP1_DMA_H
                                    141 	.globl _UEP1_DMA_L
                                    142 	.globl _UEP1_DMA
                                    143 	.globl _UEP0_DMA_H
                                    144 	.globl _UEP0_DMA_L
                                    145 	.globl _UEP0_DMA
                                    146 	.globl _UEP2_3_MOD
                                    147 	.globl _UEP4_1_MOD
                                    148 	.globl _UEP3_DMA_H
                                    149 	.globl _UEP3_DMA_L
                                    150 	.globl _UEP3_DMA
                                    151 	.globl _UEP2_DMA_H
                                    152 	.globl _UEP2_DMA_L
                                    153 	.globl _UEP2_DMA
                                    154 	.globl _USB_DEV_AD
                                    155 	.globl _USB_CTRL
                                    156 	.globl _USB_INT_EN
                                    157 	.globl _UEP4_T_LEN
                                    158 	.globl _UEP4_CTRL
                                    159 	.globl _UEP0_T_LEN
                                    160 	.globl _UEP0_CTRL
                                    161 	.globl _USB_RX_LEN
                                    162 	.globl _USB_MIS_ST
                                    163 	.globl _USB_INT_ST
                                    164 	.globl _USB_INT_FG
                                    165 	.globl _UEP3_T_LEN
                                    166 	.globl _UEP3_CTRL
                                    167 	.globl _UEP2_T_LEN
                                    168 	.globl _UEP2_CTRL
                                    169 	.globl _UEP1_T_LEN
                                    170 	.globl _UEP1_CTRL
                                    171 	.globl _UDEV_CTRL
                                    172 	.globl _USB_C_CTRL
                                    173 	.globl _TKEY_DATH
                                    174 	.globl _TKEY_DATL
                                    175 	.globl _TKEY_DAT
                                    176 	.globl _TKEY_CTRL
                                    177 	.globl _ADC_DATA
                                    178 	.globl _ADC_CFG
                                    179 	.globl _ADC_CTRL
                                    180 	.globl _SBAUD1
                                    181 	.globl _SBUF1
                                    182 	.globl _SCON1
                                    183 	.globl _SPI0_SETUP
                                    184 	.globl _SPI0_CK_SE
                                    185 	.globl _SPI0_CTRL
                                    186 	.globl _SPI0_DATA
                                    187 	.globl _SPI0_STAT
                                    188 	.globl _PWM_CK_SE
                                    189 	.globl _PWM_CTRL
                                    190 	.globl _PWM_DATA1
                                    191 	.globl _PWM_DATA2
                                    192 	.globl _T2CAP1H
                                    193 	.globl _T2CAP1L
                                    194 	.globl _T2CAP1
                                    195 	.globl _TH2
                                    196 	.globl _TL2
                                    197 	.globl _T2COUNT
                                    198 	.globl _RCAP2H
                                    199 	.globl _RCAP2L
                                    200 	.globl _RCAP2
                                    201 	.globl _T2MOD
                                    202 	.globl _T2CON
                                    203 	.globl _SBUF
                                    204 	.globl _SCON
                                    205 	.globl _TH1
                                    206 	.globl _TH0
                                    207 	.globl _TL1
                                    208 	.globl _TL0
                                    209 	.globl _TMOD
                                    210 	.globl _TCON
                                    211 	.globl _XBUS_AUX
                                    212 	.globl _PIN_FUNC
                                    213 	.globl _P3_DIR_PU
                                    214 	.globl _P3_MOD_OC
                                    215 	.globl _P3
                                    216 	.globl _P2
                                    217 	.globl _P1_DIR_PU
                                    218 	.globl _P1_MOD_OC
                                    219 	.globl _P1
                                    220 	.globl _ROM_CTRL
                                    221 	.globl _ROM_DATA_H
                                    222 	.globl _ROM_DATA_L
                                    223 	.globl _ROM_DATA
                                    224 	.globl _ROM_ADDR_H
                                    225 	.globl _ROM_ADDR_L
                                    226 	.globl _ROM_ADDR
                                    227 	.globl _GPIO_IE
                                    228 	.globl _IP_EX
                                    229 	.globl _IE_EX
                                    230 	.globl _IP
                                    231 	.globl _IE
                                    232 	.globl _WDOG_COUNT
                                    233 	.globl _RESET_KEEP
                                    234 	.globl _WAKE_CTRL
                                    235 	.globl _CLOCK_CFG
                                    236 	.globl _PCON
                                    237 	.globl _GLOBAL_CFG
                                    238 	.globl _SAFE_MOD
                                    239 	.globl _DPH
                                    240 	.globl _DPL
                                    241 	.globl _SP
                                    242 	.globl _B
                                    243 	.globl _ACC
                                    244 	.globl _PSW
                                    245 	.globl _key_init
                                    246 	.globl _key_timer_tick
                                    247 	.globl _key_event_get
                                    248 ;--------------------------------------------------------
                                    249 ; special function registers
                                    250 ;--------------------------------------------------------
                                    251 	.area RSEG    (ABS,DATA)
      000000                        252 	.org 0x0000
                           0000D0   253 _PSW	=	0x00d0
                           0000E0   254 _ACC	=	0x00e0
                           0000F0   255 _B	=	0x00f0
                           000081   256 _SP	=	0x0081
                           000082   257 _DPL	=	0x0082
                           000083   258 _DPH	=	0x0083
                           0000A1   259 _SAFE_MOD	=	0x00a1
                           0000B1   260 _GLOBAL_CFG	=	0x00b1
                           000087   261 _PCON	=	0x0087
                           0000B9   262 _CLOCK_CFG	=	0x00b9
                           0000A9   263 _WAKE_CTRL	=	0x00a9
                           0000FE   264 _RESET_KEEP	=	0x00fe
                           0000FF   265 _WDOG_COUNT	=	0x00ff
                           0000A8   266 _IE	=	0x00a8
                           0000B8   267 _IP	=	0x00b8
                           0000E8   268 _IE_EX	=	0x00e8
                           0000E9   269 _IP_EX	=	0x00e9
                           0000C7   270 _GPIO_IE	=	0x00c7
                           008584   271 _ROM_ADDR	=	0x8584
                           000084   272 _ROM_ADDR_L	=	0x0084
                           000085   273 _ROM_ADDR_H	=	0x0085
                           008F8E   274 _ROM_DATA	=	0x8f8e
                           00008E   275 _ROM_DATA_L	=	0x008e
                           00008F   276 _ROM_DATA_H	=	0x008f
                           000086   277 _ROM_CTRL	=	0x0086
                           000090   278 _P1	=	0x0090
                           000092   279 _P1_MOD_OC	=	0x0092
                           000093   280 _P1_DIR_PU	=	0x0093
                           0000A0   281 _P2	=	0x00a0
                           0000B0   282 _P3	=	0x00b0
                           000096   283 _P3_MOD_OC	=	0x0096
                           000097   284 _P3_DIR_PU	=	0x0097
                           0000C6   285 _PIN_FUNC	=	0x00c6
                           0000A2   286 _XBUS_AUX	=	0x00a2
                           000088   287 _TCON	=	0x0088
                           000089   288 _TMOD	=	0x0089
                           00008A   289 _TL0	=	0x008a
                           00008B   290 _TL1	=	0x008b
                           00008C   291 _TH0	=	0x008c
                           00008D   292 _TH1	=	0x008d
                           000098   293 _SCON	=	0x0098
                           000099   294 _SBUF	=	0x0099
                           0000C8   295 _T2CON	=	0x00c8
                           0000C9   296 _T2MOD	=	0x00c9
                           00CBCA   297 _RCAP2	=	0xcbca
                           0000CA   298 _RCAP2L	=	0x00ca
                           0000CB   299 _RCAP2H	=	0x00cb
                           00CDCC   300 _T2COUNT	=	0xcdcc
                           0000CC   301 _TL2	=	0x00cc
                           0000CD   302 _TH2	=	0x00cd
                           00CFCE   303 _T2CAP1	=	0xcfce
                           0000CE   304 _T2CAP1L	=	0x00ce
                           0000CF   305 _T2CAP1H	=	0x00cf
                           00009B   306 _PWM_DATA2	=	0x009b
                           00009C   307 _PWM_DATA1	=	0x009c
                           00009D   308 _PWM_CTRL	=	0x009d
                           00009E   309 _PWM_CK_SE	=	0x009e
                           0000F8   310 _SPI0_STAT	=	0x00f8
                           0000F9   311 _SPI0_DATA	=	0x00f9
                           0000FA   312 _SPI0_CTRL	=	0x00fa
                           0000FB   313 _SPI0_CK_SE	=	0x00fb
                           0000FC   314 _SPI0_SETUP	=	0x00fc
                           0000C0   315 _SCON1	=	0x00c0
                           0000C1   316 _SBUF1	=	0x00c1
                           0000C2   317 _SBAUD1	=	0x00c2
                           000080   318 _ADC_CTRL	=	0x0080
                           00009A   319 _ADC_CFG	=	0x009a
                           00009F   320 _ADC_DATA	=	0x009f
                           0000C3   321 _TKEY_CTRL	=	0x00c3
                           00C5C4   322 _TKEY_DAT	=	0xc5c4
                           0000C4   323 _TKEY_DATL	=	0x00c4
                           0000C5   324 _TKEY_DATH	=	0x00c5
                           000091   325 _USB_C_CTRL	=	0x0091
                           0000D1   326 _UDEV_CTRL	=	0x00d1
                           0000D2   327 _UEP1_CTRL	=	0x00d2
                           0000D3   328 _UEP1_T_LEN	=	0x00d3
                           0000D4   329 _UEP2_CTRL	=	0x00d4
                           0000D5   330 _UEP2_T_LEN	=	0x00d5
                           0000D6   331 _UEP3_CTRL	=	0x00d6
                           0000D7   332 _UEP3_T_LEN	=	0x00d7
                           0000D8   333 _USB_INT_FG	=	0x00d8
                           0000D9   334 _USB_INT_ST	=	0x00d9
                           0000DA   335 _USB_MIS_ST	=	0x00da
                           0000DB   336 _USB_RX_LEN	=	0x00db
                           0000DC   337 _UEP0_CTRL	=	0x00dc
                           0000DD   338 _UEP0_T_LEN	=	0x00dd
                           0000DE   339 _UEP4_CTRL	=	0x00de
                           0000DF   340 _UEP4_T_LEN	=	0x00df
                           0000E1   341 _USB_INT_EN	=	0x00e1
                           0000E2   342 _USB_CTRL	=	0x00e2
                           0000E3   343 _USB_DEV_AD	=	0x00e3
                           00E5E4   344 _UEP2_DMA	=	0xe5e4
                           0000E4   345 _UEP2_DMA_L	=	0x00e4
                           0000E5   346 _UEP2_DMA_H	=	0x00e5
                           00E7E6   347 _UEP3_DMA	=	0xe7e6
                           0000E6   348 _UEP3_DMA_L	=	0x00e6
                           0000E7   349 _UEP3_DMA_H	=	0x00e7
                           0000EA   350 _UEP4_1_MOD	=	0x00ea
                           0000EB   351 _UEP2_3_MOD	=	0x00eb
                           00EDEC   352 _UEP0_DMA	=	0xedec
                           0000EC   353 _UEP0_DMA_L	=	0x00ec
                           0000ED   354 _UEP0_DMA_H	=	0x00ed
                           00EFEE   355 _UEP1_DMA	=	0xefee
                           0000EE   356 _UEP1_DMA_L	=	0x00ee
                           0000EF   357 _UEP1_DMA_H	=	0x00ef
                                    358 ;--------------------------------------------------------
                                    359 ; special function bits
                                    360 ;--------------------------------------------------------
                                    361 	.area RSEG    (ABS,DATA)
      000000                        362 	.org 0x0000
                           0000D7   363 _CY	=	0x00d7
                           0000D6   364 _AC	=	0x00d6
                           0000D5   365 _F0	=	0x00d5
                           0000D4   366 _RS1	=	0x00d4
                           0000D3   367 _RS0	=	0x00d3
                           0000D2   368 _OV	=	0x00d2
                           0000D1   369 _F1	=	0x00d1
                           0000D0   370 _P	=	0x00d0
                           0000AF   371 _EA	=	0x00af
                           0000AE   372 _E_DIS	=	0x00ae
                           0000AD   373 _ET2	=	0x00ad
                           0000AC   374 _ES	=	0x00ac
                           0000AB   375 _ET1	=	0x00ab
                           0000AA   376 _EX1	=	0x00aa
                           0000A9   377 _ET0	=	0x00a9
                           0000A8   378 _EX0	=	0x00a8
                           0000BF   379 _PH_FLAG	=	0x00bf
                           0000BE   380 _PL_FLAG	=	0x00be
                           0000BD   381 _PT2	=	0x00bd
                           0000BC   382 _PS	=	0x00bc
                           0000BB   383 _PT1	=	0x00bb
                           0000BA   384 _PX1	=	0x00ba
                           0000B9   385 _PT0	=	0x00b9
                           0000B8   386 _PX0	=	0x00b8
                           0000EF   387 _IE_WDOG	=	0x00ef
                           0000EE   388 _IE_GPIO	=	0x00ee
                           0000ED   389 _IE_PWMX	=	0x00ed
                           0000EC   390 _IE_UART1	=	0x00ec
                           0000EB   391 _IE_ADC	=	0x00eb
                           0000EA   392 _IE_USB	=	0x00ea
                           0000E9   393 _IE_TKEY	=	0x00e9
                           0000E8   394 _IE_SPI0	=	0x00e8
                           000097   395 _SCK	=	0x0097
                           000097   396 _TXD1	=	0x0097
                           000097   397 _TIN5	=	0x0097
                           000096   398 _MISO	=	0x0096
                           000096   399 _RXD1	=	0x0096
                           000096   400 _TIN4	=	0x0096
                           000095   401 _MOSI	=	0x0095
                           000095   402 _PWM1	=	0x0095
                           000095   403 _TIN3	=	0x0095
                           000095   404 _UCC2	=	0x0095
                           000095   405 _AIN2	=	0x0095
                           000094   406 _T2_	=	0x0094
                           000094   407 _CAP1_	=	0x0094
                           000094   408 _SCS	=	0x0094
                           000094   409 _TIN2	=	0x0094
                           000094   410 _UCC1	=	0x0094
                           000094   411 _AIN1	=	0x0094
                           000093   412 _TXD_	=	0x0093
                           000092   413 _RXD_	=	0x0092
                           000091   414 _T2EX	=	0x0091
                           000091   415 _CAP2	=	0x0091
                           000091   416 _TIN1	=	0x0091
                           000091   417 _VBUS2	=	0x0091
                           000091   418 _AIN0	=	0x0091
                           000090   419 _T2	=	0x0090
                           000090   420 _CAP1	=	0x0090
                           000090   421 _TIN0	=	0x0090
                           0000B7   422 _UDM	=	0x00b7
                           0000B6   423 _UDP	=	0x00b6
                           0000B5   424 _T1	=	0x00b5
                           0000B4   425 _PWM2	=	0x00b4
                           0000B4   426 _RXD1_	=	0x00b4
                           0000B4   427 _T0	=	0x00b4
                           0000B3   428 _INT1	=	0x00b3
                           0000B2   429 _TXD1_	=	0x00b2
                           0000B2   430 _INT0	=	0x00b2
                           0000B2   431 _VBUS1	=	0x00b2
                           0000B2   432 _AIN3	=	0x00b2
                           0000B1   433 _PWM2_	=	0x00b1
                           0000B1   434 _TXD	=	0x00b1
                           0000B0   435 _PWM1_	=	0x00b0
                           0000B0   436 _RXD	=	0x00b0
                           00008F   437 _TF1	=	0x008f
                           00008E   438 _TR1	=	0x008e
                           00008D   439 _TF0	=	0x008d
                           00008C   440 _TR0	=	0x008c
                           00008B   441 _IE1	=	0x008b
                           00008A   442 _IT1	=	0x008a
                           000089   443 _IE0	=	0x0089
                           000088   444 _IT0	=	0x0088
                           00009F   445 _SM0	=	0x009f
                           00009E   446 _SM1	=	0x009e
                           00009D   447 _SM2	=	0x009d
                           00009C   448 _REN	=	0x009c
                           00009B   449 _TB8	=	0x009b
                           00009A   450 _RB8	=	0x009a
                           000099   451 _TI	=	0x0099
                           000098   452 _RI	=	0x0098
                           0000CF   453 _TF2	=	0x00cf
                           0000CF   454 _CAP1F	=	0x00cf
                           0000CE   455 _EXF2	=	0x00ce
                           0000CD   456 _RCLK	=	0x00cd
                           0000CC   457 _TCLK	=	0x00cc
                           0000CB   458 _EXEN2	=	0x00cb
                           0000CA   459 _TR2	=	0x00ca
                           0000C9   460 _C_T2	=	0x00c9
                           0000C8   461 _CP_RL2	=	0x00c8
                           0000FF   462 _S0_FST_ACT	=	0x00ff
                           0000FE   463 _S0_IF_OV	=	0x00fe
                           0000FD   464 _S0_IF_FIRST	=	0x00fd
                           0000FC   465 _S0_IF_BYTE	=	0x00fc
                           0000FB   466 _S0_FREE	=	0x00fb
                           0000FA   467 _S0_T_FIFO	=	0x00fa
                           0000F8   468 _S0_R_FIFO	=	0x00f8
                           0000C7   469 _U1SM0	=	0x00c7
                           0000C5   470 _U1SMOD	=	0x00c5
                           0000C4   471 _U1REN	=	0x00c4
                           0000C3   472 _U1TB8	=	0x00c3
                           0000C2   473 _U1RB8	=	0x00c2
                           0000C1   474 _U1TI	=	0x00c1
                           0000C0   475 _U1RI	=	0x00c0
                           000087   476 _CMPO	=	0x0087
                           000086   477 _CMP_IF	=	0x0086
                           000085   478 _ADC_IF	=	0x0085
                           000084   479 _ADC_START	=	0x0084
                           000083   480 _CMP_CHAN	=	0x0083
                           000081   481 _ADC_CHAN1	=	0x0081
                           000080   482 _ADC_CHAN0	=	0x0080
                           0000DF   483 _U_IS_NAK	=	0x00df
                           0000DE   484 _U_TOG_OK	=	0x00de
                           0000DD   485 _U_SIE_FREE	=	0x00dd
                           0000DC   486 _UIF_FIFO_OV	=	0x00dc
                           0000DB   487 _UIF_HST_SOF	=	0x00db
                           0000DA   488 _UIF_SUSPEND	=	0x00da
                           0000D9   489 _UIF_TRANSFER	=	0x00d9
                           0000D8   490 _UIF_DETECT	=	0x00d8
                           0000D8   491 _UIF_BUS_RST	=	0x00d8
                                    492 ;--------------------------------------------------------
                                    493 ; overlayable register banks
                                    494 ;--------------------------------------------------------
                                    495 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        496 	.ds 8
                                    497 ;--------------------------------------------------------
                                    498 ; internal ram data
                                    499 ;--------------------------------------------------------
                                    500 	.area DSEG    (DATA)
      000022                        501 _g_evt_wr:
      000022                        502 	.ds 1
      000023                        503 _g_evt_rd:
      000023                        504 	.ds 1
      000024                        505 _evt_push_PARM_2:
      000024                        506 	.ds 1
      000025                        507 _key_scan_one_k_65536_21:
      000025                        508 	.ds 3
      000028                        509 _key_scan_one_ev_65536_21:
      000028                        510 	.ds 1
      000029                        511 _key_timer_tick_ms_tick_65536_41:
      000029                        512 	.ds 2
                                    513 ;--------------------------------------------------------
                                    514 ; overlayable items in internal ram
                                    515 ;--------------------------------------------------------
                                    516 	.area	OSEG    (OVR,DATA)
                                    517 	.area	OSEG    (OVR,DATA)
                                    518 ;--------------------------------------------------------
                                    519 ; indirectly addressable internal ram data
                                    520 ;--------------------------------------------------------
                                    521 	.area ISEG    (DATA)
                                    522 ;--------------------------------------------------------
                                    523 ; absolute internal ram data
                                    524 ;--------------------------------------------------------
                                    525 	.area IABS    (ABS,DATA)
                                    526 	.area IABS    (ABS,DATA)
                                    527 ;--------------------------------------------------------
                                    528 ; bit data
                                    529 ;--------------------------------------------------------
                                    530 	.area BSEG    (BIT)
                                    531 ;--------------------------------------------------------
                                    532 ; paged external ram data
                                    533 ;--------------------------------------------------------
                                    534 	.area PSEG    (PAG,XDATA)
                                    535 ;--------------------------------------------------------
                                    536 ; external ram data
                                    537 ;--------------------------------------------------------
                                    538 	.area XSEG    (XDATA)
      000110                        539 _g_keys:
      000110                        540 	.ds 4
      000114                        541 _g_evt_buf:
      000114                        542 	.ds 32
                                    543 ;--------------------------------------------------------
                                    544 ; absolute external ram data
                                    545 ;--------------------------------------------------------
                                    546 	.area XABS    (ABS,XDATA)
                                    547 ;--------------------------------------------------------
                                    548 ; external initialized ram data
                                    549 ;--------------------------------------------------------
                                    550 	.area XISEG   (XDATA)
                                    551 	.area HOME    (CODE)
                                    552 	.area GSINIT0 (CODE)
                                    553 	.area GSINIT1 (CODE)
                                    554 	.area GSINIT2 (CODE)
                                    555 	.area GSINIT3 (CODE)
                                    556 	.area GSINIT4 (CODE)
                                    557 	.area GSINIT5 (CODE)
                                    558 	.area GSINIT  (CODE)
                                    559 	.area GSFINAL (CODE)
                                    560 	.area CSEG    (CODE)
                                    561 ;--------------------------------------------------------
                                    562 ; global & static initialisations
                                    563 ;--------------------------------------------------------
                                    564 	.area HOME    (CODE)
                                    565 	.area GSINIT  (CODE)
                                    566 	.area GSFINAL (CODE)
                                    567 	.area GSINIT  (CODE)
                                    568 ;------------------------------------------------------------
                                    569 ;Allocation info for local variables in function 'key_timer_tick'
                                    570 ;------------------------------------------------------------
                                    571 ;ms_tick                   Allocated with name '_key_timer_tick_ms_tick_65536_41'
                                    572 ;i                         Allocated to registers r7 
                                    573 ;ev                        Allocated to registers r5 
                                    574 ;------------------------------------------------------------
                                    575 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:184: static volatile uint16_t ms_tick = 0;
      0000D8 E4               [12]  576 	clr	a
      0000D9 F5 29            [12]  577 	mov	_key_timer_tick_ms_tick_65536_41,a
      0000DB F5 2A            [12]  578 	mov	(_key_timer_tick_ms_tick_65536_41 + 1),a
                                    579 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:35: static volatile uint8_t g_evt_wr = 0;   /* 写指针 */
      0000DD 75 22 00         [24]  580 	mov	_g_evt_wr,#0x00
                                    581 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:36: static volatile uint8_t g_evt_rd = 0;   /* 读指针 */
      0000E0 75 23 00         [24]  582 	mov	_g_evt_rd,#0x00
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
                                    593 ;Allocation info for local variables in function 'evt_push'
                                    594 ;------------------------------------------------------------
                                    595 ;ev                        Allocated with name '_evt_push_PARM_2'
                                    596 ;id                        Allocated to registers r7 
                                    597 ;next                      Allocated to registers r5 
                                    598 ;------------------------------------------------------------
                                    599 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:38: static void evt_push(uint8_t id, KeyEvent ev)
                                    600 ;	-----------------------------------------
                                    601 ;	 function evt_push
                                    602 ;	-----------------------------------------
      000B0E                        603 _evt_push:
                           000007   604 	ar7 = 0x07
                           000006   605 	ar6 = 0x06
                           000005   606 	ar5 = 0x05
                           000004   607 	ar4 = 0x04
                           000003   608 	ar3 = 0x03
                           000002   609 	ar2 = 0x02
                           000001   610 	ar1 = 0x01
                           000000   611 	ar0 = 0x00
      000B0E AF 82            [24]  612 	mov	r7,dpl
                                    613 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:40: uint8_t next = (g_evt_wr + 1) % EVENT_BUF_SIZE;
      000B10 AD 22            [24]  614 	mov	r5,_g_evt_wr
      000B12 7E 00            [12]  615 	mov	r6,#0x00
      000B14 8D 82            [24]  616 	mov	dpl,r5
      000B16 8E 83            [24]  617 	mov	dph,r6
      000B18 A3               [24]  618 	inc	dptr
      000B19 75 2B 10         [24]  619 	mov	__modsint_PARM_2,#0x10
                                    620 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      000B1C 8E 2C            [24]  621 	mov	(__modsint_PARM_2 + 1),r6
      000B1E C0 07            [24]  622 	push	ar7
      000B20 12 11 61         [24]  623 	lcall	__modsint
      000B23 AD 82            [24]  624 	mov	r5,dpl
      000B25 D0 07            [24]  625 	pop	ar7
                                    626 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:41: if (next != g_evt_rd)   /* 缓冲未满才写入 */
      000B27 ED               [12]  627 	mov	a,r5
      000B28 B5 23 01         [24]  628 	cjne	a,_g_evt_rd,00109$
      000B2B 22               [24]  629 	ret
      000B2C                        630 00109$:
                                    631 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:43: g_evt_buf[g_evt_wr].key_id = id;
      000B2C E5 22            [12]  632 	mov	a,_g_evt_wr
      000B2E 75 F0 02         [24]  633 	mov	b,#0x02
      000B31 A4               [48]  634 	mul	ab
      000B32 24 14            [12]  635 	add	a,#_g_evt_buf
      000B34 F5 82            [12]  636 	mov	dpl,a
      000B36 74 01            [12]  637 	mov	a,#(_g_evt_buf >> 8)
      000B38 35 F0            [12]  638 	addc	a,b
      000B3A F5 83            [12]  639 	mov	dph,a
      000B3C EF               [12]  640 	mov	a,r7
      000B3D F0               [24]  641 	movx	@dptr,a
                                    642 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:44: g_evt_buf[g_evt_wr].event  = ev;
      000B3E E5 22            [12]  643 	mov	a,_g_evt_wr
      000B40 75 F0 02         [24]  644 	mov	b,#0x02
      000B43 A4               [48]  645 	mul	ab
      000B44 24 14            [12]  646 	add	a,#_g_evt_buf
      000B46 FE               [12]  647 	mov	r6,a
      000B47 74 01            [12]  648 	mov	a,#(_g_evt_buf >> 8)
      000B49 35 F0            [12]  649 	addc	a,b
      000B4B FF               [12]  650 	mov	r7,a
      000B4C 8E 82            [24]  651 	mov	dpl,r6
      000B4E 8F 83            [24]  652 	mov	dph,r7
      000B50 A3               [24]  653 	inc	dptr
      000B51 E5 24            [12]  654 	mov	a,_evt_push_PARM_2
      000B53 F0               [24]  655 	movx	@dptr,a
                                    656 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:45: g_evt_wr = next;
      000B54 8D 22            [24]  657 	mov	_g_evt_wr,r5
                                    658 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:47: }
      000B56 22               [24]  659 	ret
                                    660 ;------------------------------------------------------------
                                    661 ;Allocation info for local variables in function 'evt_pop'
                                    662 ;------------------------------------------------------------
                                    663 ;out                       Allocated to registers r5 r6 r7 
                                    664 ;------------------------------------------------------------
                                    665 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:49: static uint8_t evt_pop(KeyEventMsg *out)
                                    666 ;	-----------------------------------------
                                    667 ;	 function evt_pop
                                    668 ;	-----------------------------------------
      000B57                        669 _evt_pop:
      000B57 AD 82            [24]  670 	mov	r5,dpl
      000B59 AE 83            [24]  671 	mov	r6,dph
      000B5B AF F0            [24]  672 	mov	r7,b
                                    673 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:51: if (g_evt_rd == g_evt_wr) return 0;   /* 空 */
      000B5D E5 22            [12]  674 	mov	a,_g_evt_wr
      000B5F B5 23 04         [24]  675 	cjne	a,_g_evt_rd,00102$
      000B62 75 82 00         [24]  676 	mov	dpl,#0x00
      000B65 22               [24]  677 	ret
      000B66                        678 00102$:
                                    679 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:52: *out = g_evt_buf[g_evt_rd];
      000B66 E5 23            [12]  680 	mov	a,_g_evt_rd
      000B68 75 F0 02         [24]  681 	mov	b,#0x02
      000B6B A4               [48]  682 	mul	ab
      000B6C 24 14            [12]  683 	add	a,#_g_evt_buf
      000B6E FB               [12]  684 	mov	r3,a
      000B6F 74 01            [12]  685 	mov	a,#(_g_evt_buf >> 8)
      000B71 35 F0            [12]  686 	addc	a,b
      000B73 FC               [12]  687 	mov	r4,a
      000B74 8B 2B            [24]  688 	mov	___memcpy_PARM_2,r3
      000B76 8C 2C            [24]  689 	mov	(___memcpy_PARM_2 + 1),r4
      000B78 75 2D 00         [24]  690 	mov	(___memcpy_PARM_2 + 2),#0x00
      000B7B 75 2E 02         [24]  691 	mov	___memcpy_PARM_3,#0x02
      000B7E 75 2F 00         [24]  692 	mov	(___memcpy_PARM_3 + 1),#0x00
      000B81 8D 82            [24]  693 	mov	dpl,r5
      000B83 8E 83            [24]  694 	mov	dph,r6
      000B85 8F F0            [24]  695 	mov	b,r7
      000B87 12 0F AC         [24]  696 	lcall	___memcpy
                                    697 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:53: g_evt_rd = (g_evt_rd + 1) % EVENT_BUF_SIZE;
      000B8A AE 23            [24]  698 	mov	r6,_g_evt_rd
      000B8C 7F 00            [12]  699 	mov	r7,#0x00
      000B8E 8E 82            [24]  700 	mov	dpl,r6
      000B90 8F 83            [24]  701 	mov	dph,r7
      000B92 A3               [24]  702 	inc	dptr
      000B93 75 2B 10         [24]  703 	mov	__modsint_PARM_2,#0x10
                                    704 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      000B96 8F 2C            [24]  705 	mov	(__modsint_PARM_2 + 1),r7
      000B98 12 11 61         [24]  706 	lcall	__modsint
      000B9B AE 82            [24]  707 	mov	r6,dpl
      000B9D 8E 23            [24]  708 	mov	_g_evt_rd,r6
                                    709 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:54: return 1;
      000B9F 75 82 01         [24]  710 	mov	dpl,#0x01
                                    711 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:55: }
      000BA2 22               [24]  712 	ret
                                    713 ;------------------------------------------------------------
                                    714 ;Allocation info for local variables in function 'key_is_pressed'
                                    715 ;------------------------------------------------------------
                                    716 ;id                        Allocated to registers r7 
                                    717 ;------------------------------------------------------------
                                    718 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:58: static uint8_t key_is_pressed(uint8_t id)
                                    719 ;	-----------------------------------------
                                    720 ;	 function key_is_pressed
                                    721 ;	-----------------------------------------
      000BA3                        722 _key_is_pressed:
                                    723 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:60: if (id == 0)
      000BA3 E5 82            [12]  724 	mov	a,dpl
      000BA5 70 12            [24]  725 	jnz	00102$
                                    726 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:62: return (P1 & (1 << KEY0_PIN)) ? 0 : 1;  /* P1.2 低电平=按下 */
      000BA7 E5 90            [12]  727 	mov	a,_P1
      000BA9 30 E2 06         [24]  728 	jnb	acc.2,00105$
      000BAC 7E 00            [12]  729 	mov	r6,#0x00
      000BAE 7F 00            [12]  730 	mov	r7,#0x00
      000BB0 80 04            [24]  731 	sjmp	00106$
      000BB2                        732 00105$:
      000BB2 7E 01            [12]  733 	mov	r6,#0x01
      000BB4 7F 00            [12]  734 	mov	r7,#0x00
      000BB6                        735 00106$:
      000BB6 8E 82            [24]  736 	mov	dpl,r6
      000BB8 22               [24]  737 	ret
      000BB9                        738 00102$:
                                    739 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:64: return 0;
      000BB9 75 82 00         [24]  740 	mov	dpl,#0x00
                                    741 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:65: }
      000BBC 22               [24]  742 	ret
                                    743 ;------------------------------------------------------------
                                    744 ;Allocation info for local variables in function 'key_scan_one'
                                    745 ;------------------------------------------------------------
                                    746 ;id                        Allocated to registers r7 
                                    747 ;k                         Allocated with name '_key_scan_one_k_65536_21'
                                    748 ;pressed                   Allocated to registers r7 
                                    749 ;ev                        Allocated with name '_key_scan_one_ev_65536_21'
                                    750 ;------------------------------------------------------------
                                    751 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:68: static KeyEvent key_scan_one(uint8_t id)
                                    752 ;	-----------------------------------------
                                    753 ;	 function key_scan_one
                                    754 ;	-----------------------------------------
      000BBD                        755 _key_scan_one:
                                    756 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:70: KeyCtrl *k = &g_keys[id];
      000BBD E5 82            [12]  757 	mov	a,dpl
      000BBF FF               [12]  758 	mov	r7,a
      000BC0 75 F0 04         [24]  759 	mov	b,#0x04
      000BC3 A4               [48]  760 	mul	ab
      000BC4 24 10            [12]  761 	add	a,#_g_keys
      000BC6 FD               [12]  762 	mov	r5,a
      000BC7 74 01            [12]  763 	mov	a,#(_g_keys >> 8)
      000BC9 35 F0            [12]  764 	addc	a,b
      000BCB FE               [12]  765 	mov	r6,a
      000BCC 8D 25            [24]  766 	mov	_key_scan_one_k_65536_21,r5
      000BCE 8E 26            [24]  767 	mov	(_key_scan_one_k_65536_21 + 1),r6
      000BD0 75 27 00         [24]  768 	mov	(_key_scan_one_k_65536_21 + 2),#0x00
                                    769 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:71: uint8_t pressed = key_is_pressed(id);
      000BD3 8F 82            [24]  770 	mov	dpl,r7
      000BD5 12 0B A3         [24]  771 	lcall	_key_is_pressed
      000BD8 AF 82            [24]  772 	mov	r7,dpl
                                    773 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:72: KeyEvent ev = KEY_EVENT_NONE;
      000BDA 75 28 00         [24]  774 	mov	_key_scan_one_ev_65536_21,#0x00
                                    775 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:74: switch (k->state)
      000BDD 85 25 82         [24]  776 	mov	dpl,_key_scan_one_k_65536_21
      000BE0 85 26 83         [24]  777 	mov	dph,(_key_scan_one_k_65536_21 + 1)
      000BE3 85 27 F0         [24]  778 	mov	b,(_key_scan_one_k_65536_21 + 2)
      000BE6 12 11 45         [24]  779 	lcall	__gptrget
      000BE9 FA               [12]  780 	mov  r2,a
      000BEA 24 FB            [12]  781 	add	a,#0xff - 0x04
      000BEC 50 03            [24]  782 	jnc	00178$
      000BEE 02 0E 95         [24]  783 	ljmp	00130$
      000BF1                        784 00178$:
      000BF1 EA               [12]  785 	mov	a,r2
      000BF2 2A               [12]  786 	add	a,r2
      000BF3 2A               [12]  787 	add	a,r2
      000BF4 90 0B F8         [24]  788 	mov	dptr,#00179$
      000BF7 73               [24]  789 	jmp	@a+dptr
      000BF8                        790 00179$:
      000BF8 02 0C 07         [24]  791 	ljmp	00101$
      000BFB 02 0C 35         [24]  792 	ljmp	00104$
      000BFE 02 0C CE         [24]  793 	ljmp	00110$
      000C01 02 0D 6D         [24]  794 	ljmp	00116$
      000C04 02 0E 09         [24]  795 	ljmp	00124$
                                    796 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:76: case KEY_ST_IDLE:
      000C07                        797 00101$:
                                    798 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:77: if (pressed)
      000C07 EF               [12]  799 	mov	a,r7
      000C08 70 03            [24]  800 	jnz	00180$
      000C0A 02 0E BA         [24]  801 	ljmp	00131$
      000C0D                        802 00180$:
                                    803 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:79: k->state = KEY_ST_DEBOUNCE_PRESS;
      000C0D 85 25 82         [24]  804 	mov	dpl,_key_scan_one_k_65536_21
      000C10 85 26 83         [24]  805 	mov	dph,(_key_scan_one_k_65536_21 + 1)
      000C13 85 27 F0         [24]  806 	mov	b,(_key_scan_one_k_65536_21 + 2)
      000C16 74 01            [12]  807 	mov	a,#0x01
      000C18 12 10 01         [24]  808 	lcall	__gptrput
                                    809 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:80: k->timer = 0;
      000C1B 25 25            [12]  810 	add	a,_key_scan_one_k_65536_21
      000C1D F8               [12]  811 	mov	r0,a
      000C1E E4               [12]  812 	clr	a
      000C1F 35 26            [12]  813 	addc	a,(_key_scan_one_k_65536_21 + 1)
      000C21 F9               [12]  814 	mov	r1,a
      000C22 AA 27            [24]  815 	mov	r2,(_key_scan_one_k_65536_21 + 2)
      000C24 88 82            [24]  816 	mov	dpl,r0
      000C26 89 83            [24]  817 	mov	dph,r1
      000C28 8A F0            [24]  818 	mov	b,r2
      000C2A E4               [12]  819 	clr	a
      000C2B 12 10 01         [24]  820 	lcall	__gptrput
      000C2E A3               [24]  821 	inc	dptr
      000C2F 12 10 01         [24]  822 	lcall	__gptrput
                                    823 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:82: break;
      000C32 02 0E BA         [24]  824 	ljmp	00131$
                                    825 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:84: case KEY_ST_DEBOUNCE_PRESS:
      000C35                        826 00104$:
                                    827 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:85: if (pressed)
      000C35 EF               [12]  828 	mov	a,r7
      000C36 60 6E            [24]  829 	jz	00108$
                                    830 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:87: if (++k->timer >= DEBOUNCE_CNT)
      000C38 74 01            [12]  831 	mov	a,#0x01
      000C3A 25 25            [12]  832 	add	a,_key_scan_one_k_65536_21
      000C3C F8               [12]  833 	mov	r0,a
      000C3D E4               [12]  834 	clr	a
      000C3E 35 26            [12]  835 	addc	a,(_key_scan_one_k_65536_21 + 1)
      000C40 F9               [12]  836 	mov	r1,a
      000C41 AA 27            [24]  837 	mov	r2,(_key_scan_one_k_65536_21 + 2)
      000C43 88 82            [24]  838 	mov	dpl,r0
      000C45 89 83            [24]  839 	mov	dph,r1
      000C47 8A F0            [24]  840 	mov	b,r2
      000C49 12 11 45         [24]  841 	lcall	__gptrget
      000C4C FB               [12]  842 	mov	r3,a
      000C4D A3               [24]  843 	inc	dptr
      000C4E 12 11 45         [24]  844 	lcall	__gptrget
      000C51 FE               [12]  845 	mov	r6,a
      000C52 0B               [12]  846 	inc	r3
      000C53 BB 00 01         [24]  847 	cjne	r3,#0x00,00182$
      000C56 0E               [12]  848 	inc	r6
      000C57                        849 00182$:
      000C57 88 82            [24]  850 	mov	dpl,r0
      000C59 89 83            [24]  851 	mov	dph,r1
      000C5B 8A F0            [24]  852 	mov	b,r2
      000C5D EB               [12]  853 	mov	a,r3
      000C5E 12 10 01         [24]  854 	lcall	__gptrput
      000C61 A3               [24]  855 	inc	dptr
      000C62 EE               [12]  856 	mov	a,r6
      000C63 12 10 01         [24]  857 	lcall	__gptrput
      000C66 C3               [12]  858 	clr	c
      000C67 EB               [12]  859 	mov	a,r3
      000C68 94 02            [12]  860 	subb	a,#0x02
      000C6A EE               [12]  861 	mov	a,r6
      000C6B 94 00            [12]  862 	subb	a,#0x00
      000C6D 50 03            [24]  863 	jnc	00183$
      000C6F 02 0E BA         [24]  864 	ljmp	00131$
      000C72                        865 00183$:
                                    866 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:89: k->state = KEY_ST_PRESS;
      000C72 85 25 82         [24]  867 	mov	dpl,_key_scan_one_k_65536_21
      000C75 85 26 83         [24]  868 	mov	dph,(_key_scan_one_k_65536_21 + 1)
      000C78 85 27 F0         [24]  869 	mov	b,(_key_scan_one_k_65536_21 + 2)
      000C7B 74 02            [12]  870 	mov	a,#0x02
      000C7D 12 10 01         [24]  871 	lcall	__gptrput
                                    872 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:90: k->timer = 0;
      000C80 88 82            [24]  873 	mov	dpl,r0
      000C82 89 83            [24]  874 	mov	dph,r1
      000C84 8A F0            [24]  875 	mov	b,r2
      000C86 E4               [12]  876 	clr	a
      000C87 12 10 01         [24]  877 	lcall	__gptrput
      000C8A A3               [24]  878 	inc	dptr
      000C8B 12 10 01         [24]  879 	lcall	__gptrput
                                    880 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:91: k->long_triggered = 0;
      000C8E 74 03            [12]  881 	mov	a,#0x03
      000C90 25 25            [12]  882 	add	a,_key_scan_one_k_65536_21
      000C92 FC               [12]  883 	mov	r4,a
      000C93 E4               [12]  884 	clr	a
      000C94 35 26            [12]  885 	addc	a,(_key_scan_one_k_65536_21 + 1)
      000C96 FD               [12]  886 	mov	r5,a
      000C97 AE 27            [24]  887 	mov	r6,(_key_scan_one_k_65536_21 + 2)
      000C99 8C 82            [24]  888 	mov	dpl,r4
      000C9B 8D 83            [24]  889 	mov	dph,r5
      000C9D 8E F0            [24]  890 	mov	b,r6
      000C9F E4               [12]  891 	clr	a
      000CA0 12 10 01         [24]  892 	lcall	__gptrput
      000CA3 02 0E BA         [24]  893 	ljmp	00131$
      000CA6                        894 00108$:
                                    895 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:96: k->state = KEY_ST_IDLE;
      000CA6 85 25 82         [24]  896 	mov	dpl,_key_scan_one_k_65536_21
      000CA9 85 26 83         [24]  897 	mov	dph,(_key_scan_one_k_65536_21 + 1)
      000CAC 85 27 F0         [24]  898 	mov	b,(_key_scan_one_k_65536_21 + 2)
      000CAF E4               [12]  899 	clr	a
      000CB0 12 10 01         [24]  900 	lcall	__gptrput
                                    901 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:97: k->timer = 0;
      000CB3 04               [12]  902 	inc	a
      000CB4 25 25            [12]  903 	add	a,_key_scan_one_k_65536_21
      000CB6 FC               [12]  904 	mov	r4,a
      000CB7 E4               [12]  905 	clr	a
      000CB8 35 26            [12]  906 	addc	a,(_key_scan_one_k_65536_21 + 1)
      000CBA FD               [12]  907 	mov	r5,a
      000CBB AE 27            [24]  908 	mov	r6,(_key_scan_one_k_65536_21 + 2)
      000CBD 8C 82            [24]  909 	mov	dpl,r4
      000CBF 8D 83            [24]  910 	mov	dph,r5
      000CC1 8E F0            [24]  911 	mov	b,r6
      000CC3 E4               [12]  912 	clr	a
      000CC4 12 10 01         [24]  913 	lcall	__gptrput
      000CC7 A3               [24]  914 	inc	dptr
      000CC8 12 10 01         [24]  915 	lcall	__gptrput
                                    916 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:99: break;
      000CCB 02 0E BA         [24]  917 	ljmp	00131$
                                    918 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:101: case KEY_ST_PRESS:
      000CCE                        919 00110$:
                                    920 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:102: if (pressed)
      000CCE EF               [12]  921 	mov	a,r7
      000CCF 60 72            [24]  922 	jz	00114$
                                    923 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:104: if (++k->timer >= LONG_PRESS_CNT)
      000CD1 74 01            [12]  924 	mov	a,#0x01
      000CD3 25 25            [12]  925 	add	a,_key_scan_one_k_65536_21
      000CD5 FC               [12]  926 	mov	r4,a
      000CD6 E4               [12]  927 	clr	a
      000CD7 35 26            [12]  928 	addc	a,(_key_scan_one_k_65536_21 + 1)
      000CD9 FD               [12]  929 	mov	r5,a
      000CDA AE 27            [24]  930 	mov	r6,(_key_scan_one_k_65536_21 + 2)
      000CDC 8C 82            [24]  931 	mov	dpl,r4
      000CDE 8D 83            [24]  932 	mov	dph,r5
      000CE0 8E F0            [24]  933 	mov	b,r6
      000CE2 12 11 45         [24]  934 	lcall	__gptrget
      000CE5 FA               [12]  935 	mov	r2,a
      000CE6 A3               [24]  936 	inc	dptr
      000CE7 12 11 45         [24]  937 	lcall	__gptrget
      000CEA FB               [12]  938 	mov	r3,a
      000CEB 0A               [12]  939 	inc	r2
      000CEC BA 00 01         [24]  940 	cjne	r2,#0x00,00185$
      000CEF 0B               [12]  941 	inc	r3
      000CF0                        942 00185$:
      000CF0 8C 82            [24]  943 	mov	dpl,r4
      000CF2 8D 83            [24]  944 	mov	dph,r5
      000CF4 8E F0            [24]  945 	mov	b,r6
      000CF6 EA               [12]  946 	mov	a,r2
      000CF7 12 10 01         [24]  947 	lcall	__gptrput
      000CFA A3               [24]  948 	inc	dptr
      000CFB EB               [12]  949 	mov	a,r3
      000CFC 12 10 01         [24]  950 	lcall	__gptrput
      000CFF C3               [12]  951 	clr	c
      000D00 EA               [12]  952 	mov	a,r2
      000D01 94 64            [12]  953 	subb	a,#0x64
      000D03 EB               [12]  954 	mov	a,r3
      000D04 94 00            [12]  955 	subb	a,#0x00
      000D06 50 03            [24]  956 	jnc	00186$
      000D08 02 0E BA         [24]  957 	ljmp	00131$
      000D0B                        958 00186$:
                                    959 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:106: ev = KEY_EVENT_LONG_PRESS;
      000D0B 75 28 02         [24]  960 	mov	_key_scan_one_ev_65536_21,#0x02
                                    961 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:107: k->long_triggered = 1;     /* 只产生一次长按 */
      000D0E 74 03            [12]  962 	mov	a,#0x03
      000D10 25 25            [12]  963 	add	a,_key_scan_one_k_65536_21
      000D12 F9               [12]  964 	mov	r1,a
      000D13 E4               [12]  965 	clr	a
      000D14 35 26            [12]  966 	addc	a,(_key_scan_one_k_65536_21 + 1)
      000D16 FA               [12]  967 	mov	r2,a
      000D17 AB 27            [24]  968 	mov	r3,(_key_scan_one_k_65536_21 + 2)
      000D19 89 82            [24]  969 	mov	dpl,r1
      000D1B 8A 83            [24]  970 	mov	dph,r2
      000D1D 8B F0            [24]  971 	mov	b,r3
      000D1F 74 01            [12]  972 	mov	a,#0x01
      000D21 12 10 01         [24]  973 	lcall	__gptrput
                                    974 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:108: k->state = KEY_ST_LONG_PRESS;
      000D24 85 25 82         [24]  975 	mov	dpl,_key_scan_one_k_65536_21
      000D27 85 26 83         [24]  976 	mov	dph,(_key_scan_one_k_65536_21 + 1)
      000D2A 85 27 F0         [24]  977 	mov	b,(_key_scan_one_k_65536_21 + 2)
      000D2D 74 04            [12]  978 	mov	a,#0x04
      000D2F 12 10 01         [24]  979 	lcall	__gptrput
                                    980 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:109: k->timer = 0;
      000D32 8C 82            [24]  981 	mov	dpl,r4
      000D34 8D 83            [24]  982 	mov	dph,r5
      000D36 8E F0            [24]  983 	mov	b,r6
      000D38 E4               [12]  984 	clr	a
      000D39 12 10 01         [24]  985 	lcall	__gptrput
      000D3C A3               [24]  986 	inc	dptr
      000D3D 12 10 01         [24]  987 	lcall	__gptrput
      000D40 02 0E BA         [24]  988 	ljmp	00131$
      000D43                        989 00114$:
                                    990 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:114: k->state = KEY_ST_DEBOUNCE_RELEASE;
      000D43 85 25 82         [24]  991 	mov	dpl,_key_scan_one_k_65536_21
      000D46 85 26 83         [24]  992 	mov	dph,(_key_scan_one_k_65536_21 + 1)
      000D49 85 27 F0         [24]  993 	mov	b,(_key_scan_one_k_65536_21 + 2)
      000D4C 74 03            [12]  994 	mov	a,#0x03
      000D4E 12 10 01         [24]  995 	lcall	__gptrput
                                    996 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:115: k->timer = 0;
      000D51 74 01            [12]  997 	mov	a,#0x01
      000D53 25 25            [12]  998 	add	a,_key_scan_one_k_65536_21
      000D55 FC               [12]  999 	mov	r4,a
      000D56 E4               [12] 1000 	clr	a
      000D57 35 26            [12] 1001 	addc	a,(_key_scan_one_k_65536_21 + 1)
      000D59 FD               [12] 1002 	mov	r5,a
      000D5A AE 27            [24] 1003 	mov	r6,(_key_scan_one_k_65536_21 + 2)
      000D5C 8C 82            [24] 1004 	mov	dpl,r4
      000D5E 8D 83            [24] 1005 	mov	dph,r5
      000D60 8E F0            [24] 1006 	mov	b,r6
      000D62 E4               [12] 1007 	clr	a
      000D63 12 10 01         [24] 1008 	lcall	__gptrput
      000D66 A3               [24] 1009 	inc	dptr
      000D67 12 10 01         [24] 1010 	lcall	__gptrput
                                   1011 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:117: break;
      000D6A 02 0E BA         [24] 1012 	ljmp	00131$
                                   1013 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:119: case KEY_ST_DEBOUNCE_RELEASE:
      000D6D                       1014 00116$:
                                   1015 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:120: if (!pressed)
      000D6D EF               [12] 1016 	mov	a,r7
      000D6E 70 70            [24] 1017 	jnz	00122$
                                   1018 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:122: if (++k->timer >= DEBOUNCE_CNT)
      000D70 74 01            [12] 1019 	mov	a,#0x01
      000D72 25 25            [12] 1020 	add	a,_key_scan_one_k_65536_21
      000D74 FC               [12] 1021 	mov	r4,a
      000D75 E4               [12] 1022 	clr	a
      000D76 35 26            [12] 1023 	addc	a,(_key_scan_one_k_65536_21 + 1)
      000D78 FD               [12] 1024 	mov	r5,a
      000D79 AE 27            [24] 1025 	mov	r6,(_key_scan_one_k_65536_21 + 2)
      000D7B 8C 82            [24] 1026 	mov	dpl,r4
      000D7D 8D 83            [24] 1027 	mov	dph,r5
      000D7F 8E F0            [24] 1028 	mov	b,r6
      000D81 12 11 45         [24] 1029 	lcall	__gptrget
      000D84 FA               [12] 1030 	mov	r2,a
      000D85 A3               [24] 1031 	inc	dptr
      000D86 12 11 45         [24] 1032 	lcall	__gptrget
      000D89 FB               [12] 1033 	mov	r3,a
      000D8A 0A               [12] 1034 	inc	r2
      000D8B BA 00 01         [24] 1035 	cjne	r2,#0x00,00188$
      000D8E 0B               [12] 1036 	inc	r3
      000D8F                       1037 00188$:
      000D8F 8C 82            [24] 1038 	mov	dpl,r4
      000D91 8D 83            [24] 1039 	mov	dph,r5
      000D93 8E F0            [24] 1040 	mov	b,r6
      000D95 EA               [12] 1041 	mov	a,r2
      000D96 12 10 01         [24] 1042 	lcall	__gptrput
      000D99 A3               [24] 1043 	inc	dptr
      000D9A EB               [12] 1044 	mov	a,r3
      000D9B 12 10 01         [24] 1045 	lcall	__gptrput
      000D9E C3               [12] 1046 	clr	c
      000D9F EA               [12] 1047 	mov	a,r2
      000DA0 94 02            [12] 1048 	subb	a,#0x02
      000DA2 EB               [12] 1049 	mov	a,r3
      000DA3 94 00            [12] 1050 	subb	a,#0x00
      000DA5 50 03            [24] 1051 	jnc	00189$
      000DA7 02 0E BA         [24] 1052 	ljmp	00131$
      000DAA                       1053 00189$:
                                   1054 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:124: if (!k->long_triggered)
      000DAA 74 03            [12] 1055 	mov	a,#0x03
      000DAC 25 25            [12] 1056 	add	a,_key_scan_one_k_65536_21
      000DAE F9               [12] 1057 	mov	r1,a
      000DAF E4               [12] 1058 	clr	a
      000DB0 35 26            [12] 1059 	addc	a,(_key_scan_one_k_65536_21 + 1)
      000DB2 FA               [12] 1060 	mov	r2,a
      000DB3 AB 27            [24] 1061 	mov	r3,(_key_scan_one_k_65536_21 + 2)
      000DB5 89 82            [24] 1062 	mov	dpl,r1
      000DB7 8A 83            [24] 1063 	mov	dph,r2
      000DB9 8B F0            [24] 1064 	mov	b,r3
      000DBB 12 11 45         [24] 1065 	lcall	__gptrget
      000DBE 70 03            [24] 1066 	jnz	00118$
                                   1067 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:125: ev = KEY_EVENT_SHORT_PRESS;   /* 释放且未长按 -> 短按 */
      000DC0 75 28 01         [24] 1068 	mov	_key_scan_one_ev_65536_21,#0x01
      000DC3                       1069 00118$:
                                   1070 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:126: k->state = KEY_ST_IDLE;
      000DC3 85 25 82         [24] 1071 	mov	dpl,_key_scan_one_k_65536_21
      000DC6 85 26 83         [24] 1072 	mov	dph,(_key_scan_one_k_65536_21 + 1)
      000DC9 85 27 F0         [24] 1073 	mov	b,(_key_scan_one_k_65536_21 + 2)
      000DCC E4               [12] 1074 	clr	a
      000DCD 12 10 01         [24] 1075 	lcall	__gptrput
                                   1076 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:127: k->timer = 0;
      000DD0 8C 82            [24] 1077 	mov	dpl,r4
      000DD2 8D 83            [24] 1078 	mov	dph,r5
      000DD4 8E F0            [24] 1079 	mov	b,r6
      000DD6 12 10 01         [24] 1080 	lcall	__gptrput
      000DD9 A3               [24] 1081 	inc	dptr
      000DDA 12 10 01         [24] 1082 	lcall	__gptrput
      000DDD 02 0E BA         [24] 1083 	ljmp	00131$
      000DE0                       1084 00122$:
                                   1085 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:132: k->state = KEY_ST_PRESS;
      000DE0 85 25 82         [24] 1086 	mov	dpl,_key_scan_one_k_65536_21
      000DE3 85 26 83         [24] 1087 	mov	dph,(_key_scan_one_k_65536_21 + 1)
      000DE6 85 27 F0         [24] 1088 	mov	b,(_key_scan_one_k_65536_21 + 2)
      000DE9 74 02            [12] 1089 	mov	a,#0x02
      000DEB 12 10 01         [24] 1090 	lcall	__gptrput
                                   1091 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:133: k->timer = 0;
      000DEE 14               [12] 1092 	dec	a
      000DEF 25 25            [12] 1093 	add	a,_key_scan_one_k_65536_21
      000DF1 FC               [12] 1094 	mov	r4,a
      000DF2 E4               [12] 1095 	clr	a
      000DF3 35 26            [12] 1096 	addc	a,(_key_scan_one_k_65536_21 + 1)
      000DF5 FD               [12] 1097 	mov	r5,a
      000DF6 AE 27            [24] 1098 	mov	r6,(_key_scan_one_k_65536_21 + 2)
      000DF8 8C 82            [24] 1099 	mov	dpl,r4
      000DFA 8D 83            [24] 1100 	mov	dph,r5
      000DFC 8E F0            [24] 1101 	mov	b,r6
      000DFE E4               [12] 1102 	clr	a
      000DFF 12 10 01         [24] 1103 	lcall	__gptrput
      000E02 A3               [24] 1104 	inc	dptr
      000E03 12 10 01         [24] 1105 	lcall	__gptrput
                                   1106 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:135: break;
      000E06 02 0E BA         [24] 1107 	ljmp	00131$
                                   1108 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:137: case KEY_ST_LONG_PRESS:
      000E09                       1109 00124$:
                                   1110 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:138: if (pressed)
      000E09 EF               [12] 1111 	mov	a,r7
      000E0A 60 4D            [24] 1112 	jz	00128$
                                   1113 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:140: if (++k->timer >= REPEAT_INTERVAL_CNT)
      000E0C 74 01            [12] 1114 	mov	a,#0x01
      000E0E 25 25            [12] 1115 	add	a,_key_scan_one_k_65536_21
      000E10 FD               [12] 1116 	mov	r5,a
      000E11 E4               [12] 1117 	clr	a
      000E12 35 26            [12] 1118 	addc	a,(_key_scan_one_k_65536_21 + 1)
      000E14 FE               [12] 1119 	mov	r6,a
      000E15 AF 27            [24] 1120 	mov	r7,(_key_scan_one_k_65536_21 + 2)
      000E17 8D 82            [24] 1121 	mov	dpl,r5
      000E19 8E 83            [24] 1122 	mov	dph,r6
      000E1B 8F F0            [24] 1123 	mov	b,r7
      000E1D 12 11 45         [24] 1124 	lcall	__gptrget
      000E20 FB               [12] 1125 	mov	r3,a
      000E21 A3               [24] 1126 	inc	dptr
      000E22 12 11 45         [24] 1127 	lcall	__gptrget
      000E25 FC               [12] 1128 	mov	r4,a
      000E26 0B               [12] 1129 	inc	r3
      000E27 BB 00 01         [24] 1130 	cjne	r3,#0x00,00192$
      000E2A 0C               [12] 1131 	inc	r4
      000E2B                       1132 00192$:
      000E2B 8D 82            [24] 1133 	mov	dpl,r5
      000E2D 8E 83            [24] 1134 	mov	dph,r6
      000E2F 8F F0            [24] 1135 	mov	b,r7
      000E31 EB               [12] 1136 	mov	a,r3
      000E32 12 10 01         [24] 1137 	lcall	__gptrput
      000E35 A3               [24] 1138 	inc	dptr
      000E36 EC               [12] 1139 	mov	a,r4
      000E37 12 10 01         [24] 1140 	lcall	__gptrput
      000E3A C3               [12] 1141 	clr	c
      000E3B EB               [12] 1142 	mov	a,r3
      000E3C 94 1E            [12] 1143 	subb	a,#0x1e
      000E3E EC               [12] 1144 	mov	a,r4
      000E3F 94 00            [12] 1145 	subb	a,#0x00
      000E41 50 03            [24] 1146 	jnc	00193$
      000E43 02 0E BA         [24] 1147 	ljmp	00131$
      000E46                       1148 00193$:
                                   1149 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:142: ev = KEY_EVENT_REPEAT;            /* 连续按只产生 REPEAT */
      000E46 75 28 03         [24] 1150 	mov	_key_scan_one_ev_65536_21,#0x03
                                   1151 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:143: k->timer = 0;
      000E49 8D 82            [24] 1152 	mov	dpl,r5
      000E4B 8E 83            [24] 1153 	mov	dph,r6
      000E4D 8F F0            [24] 1154 	mov	b,r7
      000E4F E4               [12] 1155 	clr	a
      000E50 12 10 01         [24] 1156 	lcall	__gptrput
      000E53 A3               [24] 1157 	inc	dptr
      000E54 12 10 01         [24] 1158 	lcall	__gptrput
      000E57 80 61            [24] 1159 	sjmp	00131$
      000E59                       1160 00128$:
                                   1161 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:148: k->state = KEY_ST_IDLE;
      000E59 85 25 82         [24] 1162 	mov	dpl,_key_scan_one_k_65536_21
      000E5C 85 26 83         [24] 1163 	mov	dph,(_key_scan_one_k_65536_21 + 1)
      000E5F 85 27 F0         [24] 1164 	mov	b,(_key_scan_one_k_65536_21 + 2)
      000E62 E4               [12] 1165 	clr	a
      000E63 12 10 01         [24] 1166 	lcall	__gptrput
                                   1167 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:149: k->timer = 0;
      000E66 04               [12] 1168 	inc	a
      000E67 25 25            [12] 1169 	add	a,_key_scan_one_k_65536_21
      000E69 FD               [12] 1170 	mov	r5,a
      000E6A E4               [12] 1171 	clr	a
      000E6B 35 26            [12] 1172 	addc	a,(_key_scan_one_k_65536_21 + 1)
      000E6D FE               [12] 1173 	mov	r6,a
      000E6E AF 27            [24] 1174 	mov	r7,(_key_scan_one_k_65536_21 + 2)
      000E70 8D 82            [24] 1175 	mov	dpl,r5
      000E72 8E 83            [24] 1176 	mov	dph,r6
      000E74 8F F0            [24] 1177 	mov	b,r7
      000E76 E4               [12] 1178 	clr	a
      000E77 12 10 01         [24] 1179 	lcall	__gptrput
      000E7A A3               [24] 1180 	inc	dptr
      000E7B 12 10 01         [24] 1181 	lcall	__gptrput
                                   1182 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:150: k->long_triggered = 0;
      000E7E 74 03            [12] 1183 	mov	a,#0x03
      000E80 25 25            [12] 1184 	add	a,_key_scan_one_k_65536_21
      000E82 FD               [12] 1185 	mov	r5,a
      000E83 E4               [12] 1186 	clr	a
      000E84 35 26            [12] 1187 	addc	a,(_key_scan_one_k_65536_21 + 1)
      000E86 FE               [12] 1188 	mov	r6,a
      000E87 AF 27            [24] 1189 	mov	r7,(_key_scan_one_k_65536_21 + 2)
      000E89 8D 82            [24] 1190 	mov	dpl,r5
      000E8B 8E 83            [24] 1191 	mov	dph,r6
      000E8D 8F F0            [24] 1192 	mov	b,r7
      000E8F E4               [12] 1193 	clr	a
      000E90 12 10 01         [24] 1194 	lcall	__gptrput
                                   1195 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:152: break;
                                   1196 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:154: default:
      000E93 80 25            [24] 1197 	sjmp	00131$
      000E95                       1198 00130$:
                                   1199 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:155: k->state = KEY_ST_IDLE;
      000E95 85 25 82         [24] 1200 	mov	dpl,_key_scan_one_k_65536_21
      000E98 85 26 83         [24] 1201 	mov	dph,(_key_scan_one_k_65536_21 + 1)
      000E9B 85 27 F0         [24] 1202 	mov	b,(_key_scan_one_k_65536_21 + 2)
      000E9E E4               [12] 1203 	clr	a
      000E9F 12 10 01         [24] 1204 	lcall	__gptrput
                                   1205 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:156: k->timer = 0;
      000EA2 04               [12] 1206 	inc	a
      000EA3 25 25            [12] 1207 	add	a,_key_scan_one_k_65536_21
      000EA5 FD               [12] 1208 	mov	r5,a
      000EA6 E4               [12] 1209 	clr	a
      000EA7 35 26            [12] 1210 	addc	a,(_key_scan_one_k_65536_21 + 1)
      000EA9 FE               [12] 1211 	mov	r6,a
      000EAA AF 27            [24] 1212 	mov	r7,(_key_scan_one_k_65536_21 + 2)
      000EAC 8D 82            [24] 1213 	mov	dpl,r5
      000EAE 8E 83            [24] 1214 	mov	dph,r6
      000EB0 8F F0            [24] 1215 	mov	b,r7
      000EB2 E4               [12] 1216 	clr	a
      000EB3 12 10 01         [24] 1217 	lcall	__gptrput
      000EB6 A3               [24] 1218 	inc	dptr
      000EB7 12 10 01         [24] 1219 	lcall	__gptrput
                                   1220 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:158: }
      000EBA                       1221 00131$:
                                   1222 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:159: return ev;
      000EBA 85 28 82         [24] 1223 	mov	dpl,_key_scan_one_ev_65536_21
                                   1224 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:160: }
      000EBD 22               [24] 1225 	ret
                                   1226 ;------------------------------------------------------------
                                   1227 ;Allocation info for local variables in function 'key_init'
                                   1228 ;------------------------------------------------------------
                                   1229 ;i                         Allocated to registers r7 
                                   1230 ;------------------------------------------------------------
                                   1231 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:164: void key_init(void)
                                   1232 ;	-----------------------------------------
                                   1233 ;	 function key_init
                                   1234 ;	-----------------------------------------
      000EBE                       1235 _key_init:
                                   1236 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:169: P1_MOD_OC &= ~(1 << KEY0_PIN);                              /* 推挽模式 */
      000EBE 53 92 FB         [24] 1237 	anl	_P1_MOD_OC,#0xfb
                                   1238 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:170: P1_DIR_PU |= (1 << KEY0_PIN);                               /* 使能内部上拉 */
      000EC1 43 93 04         [24] 1239 	orl	_P1_DIR_PU,#0x04
                                   1240 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:172: for (i = 0; i < KEY_NUM; i++)
      000EC4 7F 00            [12] 1241 	mov	r7,#0x00
      000EC6                       1242 00102$:
                                   1243 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:174: g_keys[i].state = KEY_ST_IDLE;
      000EC6 EF               [12] 1244 	mov	a,r7
      000EC7 75 F0 04         [24] 1245 	mov	b,#0x04
      000ECA A4               [48] 1246 	mul	ab
      000ECB FD               [12] 1247 	mov	r5,a
      000ECC AE F0            [24] 1248 	mov	r6,b
      000ECE 24 10            [12] 1249 	add	a,#_g_keys
      000ED0 F5 82            [12] 1250 	mov	dpl,a
      000ED2 EE               [12] 1251 	mov	a,r6
      000ED3 34 01            [12] 1252 	addc	a,#(_g_keys >> 8)
      000ED5 F5 83            [12] 1253 	mov	dph,a
      000ED7 E4               [12] 1254 	clr	a
      000ED8 F0               [24] 1255 	movx	@dptr,a
                                   1256 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:175: g_keys[i].timer = 0;
      000ED9 ED               [12] 1257 	mov	a,r5
      000EDA 24 10            [12] 1258 	add	a,#_g_keys
      000EDC FD               [12] 1259 	mov	r5,a
      000EDD EE               [12] 1260 	mov	a,r6
      000EDE 34 01            [12] 1261 	addc	a,#(_g_keys >> 8)
      000EE0 FE               [12] 1262 	mov	r6,a
      000EE1 8D 82            [24] 1263 	mov	dpl,r5
      000EE3 8E 83            [24] 1264 	mov	dph,r6
      000EE5 A3               [24] 1265 	inc	dptr
      000EE6 E4               [12] 1266 	clr	a
      000EE7 F0               [24] 1267 	movx	@dptr,a
      000EE8 A3               [24] 1268 	inc	dptr
      000EE9 F0               [24] 1269 	movx	@dptr,a
                                   1270 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:176: g_keys[i].long_triggered = 0;
      000EEA 8D 82            [24] 1271 	mov	dpl,r5
      000EEC 8E 83            [24] 1272 	mov	dph,r6
      000EEE A3               [24] 1273 	inc	dptr
      000EEF A3               [24] 1274 	inc	dptr
      000EF0 A3               [24] 1275 	inc	dptr
      000EF1 F0               [24] 1276 	movx	@dptr,a
                                   1277 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:172: for (i = 0; i < KEY_NUM; i++)
      000EF2 0F               [12] 1278 	inc	r7
      000EF3 BF 01 00         [24] 1279 	cjne	r7,#0x01,00115$
      000EF6                       1280 00115$:
      000EF6 40 CE            [24] 1281 	jc	00102$
                                   1282 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:178: g_evt_wr = 0;
      000EF8 75 22 00         [24] 1283 	mov	_g_evt_wr,#0x00
                                   1284 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:179: g_evt_rd = 0;
      000EFB 75 23 00         [24] 1285 	mov	_g_evt_rd,#0x00
                                   1286 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:180: }
      000EFE 22               [24] 1287 	ret
                                   1288 ;------------------------------------------------------------
                                   1289 ;Allocation info for local variables in function 'key_timer_tick'
                                   1290 ;------------------------------------------------------------
                                   1291 ;ms_tick                   Allocated with name '_key_timer_tick_ms_tick_65536_41'
                                   1292 ;i                         Allocated to registers r7 
                                   1293 ;ev                        Allocated to registers r5 
                                   1294 ;------------------------------------------------------------
                                   1295 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:182: void key_timer_tick(void)
                                   1296 ;	-----------------------------------------
                                   1297 ;	 function key_timer_tick
                                   1298 ;	-----------------------------------------
      000EFF                       1299 _key_timer_tick:
                                   1300 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:186: if (++ms_tick >= SCAN_TICK_DIV)
      000EFF 74 01            [12] 1301 	mov	a,#0x01
      000F01 25 29            [12] 1302 	add	a,_key_timer_tick_ms_tick_65536_41
      000F03 FE               [12] 1303 	mov	r6,a
      000F04 E4               [12] 1304 	clr	a
      000F05 35 2A            [12] 1305 	addc	a,(_key_timer_tick_ms_tick_65536_41 + 1)
      000F07 FF               [12] 1306 	mov	r7,a
      000F08 8E 29            [24] 1307 	mov	_key_timer_tick_ms_tick_65536_41,r6
      000F0A 8F 2A            [24] 1308 	mov	(_key_timer_tick_ms_tick_65536_41 + 1),r7
      000F0C C3               [12] 1309 	clr	c
      000F0D EE               [12] 1310 	mov	a,r6
      000F0E 94 0A            [12] 1311 	subb	a,#0x0a
      000F10 EF               [12] 1312 	mov	a,r7
      000F11 94 00            [12] 1313 	subb	a,#0x00
      000F13 40 27            [24] 1314 	jc	00108$
                                   1315 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:189: ms_tick = 0;
      000F15 E4               [12] 1316 	clr	a
      000F16 F5 29            [12] 1317 	mov	_key_timer_tick_ms_tick_65536_41,a
      000F18 F5 2A            [12] 1318 	mov	(_key_timer_tick_ms_tick_65536_41 + 1),a
                                   1319 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:191: for (i = 0; i < KEY_NUM; i++)
      000F1A 7F 00            [12] 1320 	mov	r7,#0x00
      000F1C                       1321 00106$:
                                   1322 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:193: KeyEvent ev = key_scan_one(i);
      000F1C 8F 82            [24] 1323 	mov	dpl,r7
      000F1E C0 07            [24] 1324 	push	ar7
      000F20 12 0B BD         [24] 1325 	lcall	_key_scan_one
      000F23 AE 82            [24] 1326 	mov	r6,dpl
      000F25 D0 07            [24] 1327 	pop	ar7
                                   1328 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:194: if (ev != KEY_EVENT_NONE)
      000F27 EE               [12] 1329 	mov	a,r6
      000F28 FD               [12] 1330 	mov	r5,a
      000F29 60 0B            [24] 1331 	jz	00107$
                                   1332 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:195: evt_push(i, ev);
      000F2B 8D 24            [24] 1333 	mov	_evt_push_PARM_2,r5
      000F2D 8F 82            [24] 1334 	mov	dpl,r7
      000F2F C0 07            [24] 1335 	push	ar7
      000F31 12 0B 0E         [24] 1336 	lcall	_evt_push
      000F34 D0 07            [24] 1337 	pop	ar7
      000F36                       1338 00107$:
                                   1339 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:191: for (i = 0; i < KEY_NUM; i++)
      000F36 0F               [12] 1340 	inc	r7
      000F37 BF 01 00         [24] 1341 	cjne	r7,#0x01,00125$
      000F3A                       1342 00125$:
      000F3A 40 E0            [24] 1343 	jc	00106$
      000F3C                       1344 00108$:
                                   1345 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:198: }
      000F3C 22               [24] 1346 	ret
                                   1347 ;------------------------------------------------------------
                                   1348 ;Allocation info for local variables in function 'key_event_get'
                                   1349 ;------------------------------------------------------------
                                   1350 ;out                       Allocated to registers r5 r6 r7 
                                   1351 ;------------------------------------------------------------
                                   1352 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:200: uint8_t key_event_get(KeyEventMsg *out)
                                   1353 ;	-----------------------------------------
                                   1354 ;	 function key_event_get
                                   1355 ;	-----------------------------------------
      000F3D                       1356 _key_event_get:
                                   1357 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:202: return evt_pop(out);
                                   1358 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/key.c:203: }
      000F3D 02 0B 57         [24] 1359 	ljmp	_evt_pop
                                   1360 	.area CSEG    (CODE)
                                   1361 	.area CONST   (CODE)
                                   1362 	.area XINIT   (CODE)
                                   1363 	.area CABS    (ABS,CODE)
