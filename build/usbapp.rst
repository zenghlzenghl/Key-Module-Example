                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module usbapp
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _UsbAppLedOffMsg
                                     12 	.globl _UsbAppLedOnMsg
                                     13 	.globl _UsbHelp1
                                     14 	.globl _UsbHelp0
                                     15 	.globl _BootloaderMsg
                                     16 	.globl _UsbAppCmdTable
                                     17 	.globl _UsbCdc_TxSend
                                     18 	.globl _UsbCdc_TxReady
                                     19 	.globl _mDelaymS
                                     20 	.globl _memmove
                                     21 	.globl _UIF_BUS_RST
                                     22 	.globl _UIF_DETECT
                                     23 	.globl _UIF_TRANSFER
                                     24 	.globl _UIF_SUSPEND
                                     25 	.globl _UIF_HST_SOF
                                     26 	.globl _UIF_FIFO_OV
                                     27 	.globl _U_SIE_FREE
                                     28 	.globl _U_TOG_OK
                                     29 	.globl _U_IS_NAK
                                     30 	.globl _ADC_CHAN0
                                     31 	.globl _ADC_CHAN1
                                     32 	.globl _CMP_CHAN
                                     33 	.globl _ADC_START
                                     34 	.globl _ADC_IF
                                     35 	.globl _CMP_IF
                                     36 	.globl _CMPO
                                     37 	.globl _U1RI
                                     38 	.globl _U1TI
                                     39 	.globl _U1RB8
                                     40 	.globl _U1TB8
                                     41 	.globl _U1REN
                                     42 	.globl _U1SMOD
                                     43 	.globl _U1SM0
                                     44 	.globl _S0_R_FIFO
                                     45 	.globl _S0_T_FIFO
                                     46 	.globl _S0_FREE
                                     47 	.globl _S0_IF_BYTE
                                     48 	.globl _S0_IF_FIRST
                                     49 	.globl _S0_IF_OV
                                     50 	.globl _S0_FST_ACT
                                     51 	.globl _CP_RL2
                                     52 	.globl _C_T2
                                     53 	.globl _TR2
                                     54 	.globl _EXEN2
                                     55 	.globl _TCLK
                                     56 	.globl _RCLK
                                     57 	.globl _EXF2
                                     58 	.globl _CAP1F
                                     59 	.globl _TF2
                                     60 	.globl _RI
                                     61 	.globl _TI
                                     62 	.globl _RB8
                                     63 	.globl _TB8
                                     64 	.globl _REN
                                     65 	.globl _SM2
                                     66 	.globl _SM1
                                     67 	.globl _SM0
                                     68 	.globl _IT0
                                     69 	.globl _IE0
                                     70 	.globl _IT1
                                     71 	.globl _IE1
                                     72 	.globl _TR0
                                     73 	.globl _TF0
                                     74 	.globl _TR1
                                     75 	.globl _TF1
                                     76 	.globl _RXD
                                     77 	.globl _PWM1_
                                     78 	.globl _TXD
                                     79 	.globl _PWM2_
                                     80 	.globl _AIN3
                                     81 	.globl _VBUS1
                                     82 	.globl _INT0
                                     83 	.globl _TXD1_
                                     84 	.globl _INT1
                                     85 	.globl _T0
                                     86 	.globl _RXD1_
                                     87 	.globl _PWM2
                                     88 	.globl _T1
                                     89 	.globl _UDP
                                     90 	.globl _UDM
                                     91 	.globl _TIN0
                                     92 	.globl _CAP1
                                     93 	.globl _T2
                                     94 	.globl _AIN0
                                     95 	.globl _VBUS2
                                     96 	.globl _TIN1
                                     97 	.globl _CAP2
                                     98 	.globl _T2EX
                                     99 	.globl _RXD_
                                    100 	.globl _TXD_
                                    101 	.globl _AIN1
                                    102 	.globl _UCC1
                                    103 	.globl _TIN2
                                    104 	.globl _SCS
                                    105 	.globl _CAP1_
                                    106 	.globl _T2_
                                    107 	.globl _AIN2
                                    108 	.globl _UCC2
                                    109 	.globl _TIN3
                                    110 	.globl _PWM1
                                    111 	.globl _MOSI
                                    112 	.globl _TIN4
                                    113 	.globl _RXD1
                                    114 	.globl _MISO
                                    115 	.globl _TIN5
                                    116 	.globl _TXD1
                                    117 	.globl _SCK
                                    118 	.globl _IE_SPI0
                                    119 	.globl _IE_TKEY
                                    120 	.globl _IE_USB
                                    121 	.globl _IE_ADC
                                    122 	.globl _IE_UART1
                                    123 	.globl _IE_PWMX
                                    124 	.globl _IE_GPIO
                                    125 	.globl _IE_WDOG
                                    126 	.globl _PX0
                                    127 	.globl _PT0
                                    128 	.globl _PX1
                                    129 	.globl _PT1
                                    130 	.globl _PS
                                    131 	.globl _PT2
                                    132 	.globl _PL_FLAG
                                    133 	.globl _PH_FLAG
                                    134 	.globl _EX0
                                    135 	.globl _ET0
                                    136 	.globl _EX1
                                    137 	.globl _ET1
                                    138 	.globl _ES
                                    139 	.globl _ET2
                                    140 	.globl _E_DIS
                                    141 	.globl _EA
                                    142 	.globl _P
                                    143 	.globl _F1
                                    144 	.globl _OV
                                    145 	.globl _RS0
                                    146 	.globl _RS1
                                    147 	.globl _F0
                                    148 	.globl _AC
                                    149 	.globl _CY
                                    150 	.globl _UEP1_DMA_H
                                    151 	.globl _UEP1_DMA_L
                                    152 	.globl _UEP1_DMA
                                    153 	.globl _UEP0_DMA_H
                                    154 	.globl _UEP0_DMA_L
                                    155 	.globl _UEP0_DMA
                                    156 	.globl _UEP2_3_MOD
                                    157 	.globl _UEP4_1_MOD
                                    158 	.globl _UEP3_DMA_H
                                    159 	.globl _UEP3_DMA_L
                                    160 	.globl _UEP3_DMA
                                    161 	.globl _UEP2_DMA_H
                                    162 	.globl _UEP2_DMA_L
                                    163 	.globl _UEP2_DMA
                                    164 	.globl _USB_DEV_AD
                                    165 	.globl _USB_CTRL
                                    166 	.globl _USB_INT_EN
                                    167 	.globl _UEP4_T_LEN
                                    168 	.globl _UEP4_CTRL
                                    169 	.globl _UEP0_T_LEN
                                    170 	.globl _UEP0_CTRL
                                    171 	.globl _USB_RX_LEN
                                    172 	.globl _USB_MIS_ST
                                    173 	.globl _USB_INT_ST
                                    174 	.globl _USB_INT_FG
                                    175 	.globl _UEP3_T_LEN
                                    176 	.globl _UEP3_CTRL
                                    177 	.globl _UEP2_T_LEN
                                    178 	.globl _UEP2_CTRL
                                    179 	.globl _UEP1_T_LEN
                                    180 	.globl _UEP1_CTRL
                                    181 	.globl _UDEV_CTRL
                                    182 	.globl _USB_C_CTRL
                                    183 	.globl _TKEY_DATH
                                    184 	.globl _TKEY_DATL
                                    185 	.globl _TKEY_DAT
                                    186 	.globl _TKEY_CTRL
                                    187 	.globl _ADC_DATA
                                    188 	.globl _ADC_CFG
                                    189 	.globl _ADC_CTRL
                                    190 	.globl _SBAUD1
                                    191 	.globl _SBUF1
                                    192 	.globl _SCON1
                                    193 	.globl _SPI0_SETUP
                                    194 	.globl _SPI0_CK_SE
                                    195 	.globl _SPI0_CTRL
                                    196 	.globl _SPI0_DATA
                                    197 	.globl _SPI0_STAT
                                    198 	.globl _PWM_CK_SE
                                    199 	.globl _PWM_CTRL
                                    200 	.globl _PWM_DATA1
                                    201 	.globl _PWM_DATA2
                                    202 	.globl _T2CAP1H
                                    203 	.globl _T2CAP1L
                                    204 	.globl _T2CAP1
                                    205 	.globl _TH2
                                    206 	.globl _TL2
                                    207 	.globl _T2COUNT
                                    208 	.globl _RCAP2H
                                    209 	.globl _RCAP2L
                                    210 	.globl _RCAP2
                                    211 	.globl _T2MOD
                                    212 	.globl _T2CON
                                    213 	.globl _SBUF
                                    214 	.globl _SCON
                                    215 	.globl _TH1
                                    216 	.globl _TH0
                                    217 	.globl _TL1
                                    218 	.globl _TL0
                                    219 	.globl _TMOD
                                    220 	.globl _TCON
                                    221 	.globl _XBUS_AUX
                                    222 	.globl _PIN_FUNC
                                    223 	.globl _P3_DIR_PU
                                    224 	.globl _P3_MOD_OC
                                    225 	.globl _P3
                                    226 	.globl _P2
                                    227 	.globl _P1_DIR_PU
                                    228 	.globl _P1_MOD_OC
                                    229 	.globl _P1
                                    230 	.globl _ROM_CTRL
                                    231 	.globl _ROM_DATA_H
                                    232 	.globl _ROM_DATA_L
                                    233 	.globl _ROM_DATA
                                    234 	.globl _ROM_ADDR_H
                                    235 	.globl _ROM_ADDR_L
                                    236 	.globl _ROM_ADDR
                                    237 	.globl _GPIO_IE
                                    238 	.globl _IP_EX
                                    239 	.globl _IE_EX
                                    240 	.globl _IP
                                    241 	.globl _IE
                                    242 	.globl _WDOG_COUNT
                                    243 	.globl _RESET_KEEP
                                    244 	.globl _WAKE_CTRL
                                    245 	.globl _CLOCK_CFG
                                    246 	.globl _PCON
                                    247 	.globl _GLOBAL_CFG
                                    248 	.globl _SAFE_MOD
                                    249 	.globl _DPH
                                    250 	.globl _DPL
                                    251 	.globl _SP
                                    252 	.globl _B
                                    253 	.globl _ACC
                                    254 	.globl _PSW
                                    255 	.globl _UsbAppWinLen
                                    256 	.globl _UsbAppWin
                                    257 	.globl _bootloader
                                    258 	.globl _UsbApp_Reset
                                    259 	.globl _UsbApp_Feed
                                    260 	.globl _UsbApp_HandleDownload
                                    261 	.globl _UsbApp_Help
                                    262 	.globl _UsbApp_LedOn
                                    263 	.globl _UsbApp_LedOff
                                    264 ;--------------------------------------------------------
                                    265 ; special function registers
                                    266 ;--------------------------------------------------------
                                    267 	.area RSEG    (ABS,DATA)
      000000                        268 	.org 0x0000
                           0000D0   269 _PSW	=	0x00d0
                           0000E0   270 _ACC	=	0x00e0
                           0000F0   271 _B	=	0x00f0
                           000081   272 _SP	=	0x0081
                           000082   273 _DPL	=	0x0082
                           000083   274 _DPH	=	0x0083
                           0000A1   275 _SAFE_MOD	=	0x00a1
                           0000B1   276 _GLOBAL_CFG	=	0x00b1
                           000087   277 _PCON	=	0x0087
                           0000B9   278 _CLOCK_CFG	=	0x00b9
                           0000A9   279 _WAKE_CTRL	=	0x00a9
                           0000FE   280 _RESET_KEEP	=	0x00fe
                           0000FF   281 _WDOG_COUNT	=	0x00ff
                           0000A8   282 _IE	=	0x00a8
                           0000B8   283 _IP	=	0x00b8
                           0000E8   284 _IE_EX	=	0x00e8
                           0000E9   285 _IP_EX	=	0x00e9
                           0000C7   286 _GPIO_IE	=	0x00c7
                           008584   287 _ROM_ADDR	=	0x8584
                           000084   288 _ROM_ADDR_L	=	0x0084
                           000085   289 _ROM_ADDR_H	=	0x0085
                           008F8E   290 _ROM_DATA	=	0x8f8e
                           00008E   291 _ROM_DATA_L	=	0x008e
                           00008F   292 _ROM_DATA_H	=	0x008f
                           000086   293 _ROM_CTRL	=	0x0086
                           000090   294 _P1	=	0x0090
                           000092   295 _P1_MOD_OC	=	0x0092
                           000093   296 _P1_DIR_PU	=	0x0093
                           0000A0   297 _P2	=	0x00a0
                           0000B0   298 _P3	=	0x00b0
                           000096   299 _P3_MOD_OC	=	0x0096
                           000097   300 _P3_DIR_PU	=	0x0097
                           0000C6   301 _PIN_FUNC	=	0x00c6
                           0000A2   302 _XBUS_AUX	=	0x00a2
                           000088   303 _TCON	=	0x0088
                           000089   304 _TMOD	=	0x0089
                           00008A   305 _TL0	=	0x008a
                           00008B   306 _TL1	=	0x008b
                           00008C   307 _TH0	=	0x008c
                           00008D   308 _TH1	=	0x008d
                           000098   309 _SCON	=	0x0098
                           000099   310 _SBUF	=	0x0099
                           0000C8   311 _T2CON	=	0x00c8
                           0000C9   312 _T2MOD	=	0x00c9
                           00CBCA   313 _RCAP2	=	0xcbca
                           0000CA   314 _RCAP2L	=	0x00ca
                           0000CB   315 _RCAP2H	=	0x00cb
                           00CDCC   316 _T2COUNT	=	0xcdcc
                           0000CC   317 _TL2	=	0x00cc
                           0000CD   318 _TH2	=	0x00cd
                           00CFCE   319 _T2CAP1	=	0xcfce
                           0000CE   320 _T2CAP1L	=	0x00ce
                           0000CF   321 _T2CAP1H	=	0x00cf
                           00009B   322 _PWM_DATA2	=	0x009b
                           00009C   323 _PWM_DATA1	=	0x009c
                           00009D   324 _PWM_CTRL	=	0x009d
                           00009E   325 _PWM_CK_SE	=	0x009e
                           0000F8   326 _SPI0_STAT	=	0x00f8
                           0000F9   327 _SPI0_DATA	=	0x00f9
                           0000FA   328 _SPI0_CTRL	=	0x00fa
                           0000FB   329 _SPI0_CK_SE	=	0x00fb
                           0000FC   330 _SPI0_SETUP	=	0x00fc
                           0000C0   331 _SCON1	=	0x00c0
                           0000C1   332 _SBUF1	=	0x00c1
                           0000C2   333 _SBAUD1	=	0x00c2
                           000080   334 _ADC_CTRL	=	0x0080
                           00009A   335 _ADC_CFG	=	0x009a
                           00009F   336 _ADC_DATA	=	0x009f
                           0000C3   337 _TKEY_CTRL	=	0x00c3
                           00C5C4   338 _TKEY_DAT	=	0xc5c4
                           0000C4   339 _TKEY_DATL	=	0x00c4
                           0000C5   340 _TKEY_DATH	=	0x00c5
                           000091   341 _USB_C_CTRL	=	0x0091
                           0000D1   342 _UDEV_CTRL	=	0x00d1
                           0000D2   343 _UEP1_CTRL	=	0x00d2
                           0000D3   344 _UEP1_T_LEN	=	0x00d3
                           0000D4   345 _UEP2_CTRL	=	0x00d4
                           0000D5   346 _UEP2_T_LEN	=	0x00d5
                           0000D6   347 _UEP3_CTRL	=	0x00d6
                           0000D7   348 _UEP3_T_LEN	=	0x00d7
                           0000D8   349 _USB_INT_FG	=	0x00d8
                           0000D9   350 _USB_INT_ST	=	0x00d9
                           0000DA   351 _USB_MIS_ST	=	0x00da
                           0000DB   352 _USB_RX_LEN	=	0x00db
                           0000DC   353 _UEP0_CTRL	=	0x00dc
                           0000DD   354 _UEP0_T_LEN	=	0x00dd
                           0000DE   355 _UEP4_CTRL	=	0x00de
                           0000DF   356 _UEP4_T_LEN	=	0x00df
                           0000E1   357 _USB_INT_EN	=	0x00e1
                           0000E2   358 _USB_CTRL	=	0x00e2
                           0000E3   359 _USB_DEV_AD	=	0x00e3
                           00E5E4   360 _UEP2_DMA	=	0xe5e4
                           0000E4   361 _UEP2_DMA_L	=	0x00e4
                           0000E5   362 _UEP2_DMA_H	=	0x00e5
                           00E7E6   363 _UEP3_DMA	=	0xe7e6
                           0000E6   364 _UEP3_DMA_L	=	0x00e6
                           0000E7   365 _UEP3_DMA_H	=	0x00e7
                           0000EA   366 _UEP4_1_MOD	=	0x00ea
                           0000EB   367 _UEP2_3_MOD	=	0x00eb
                           00EDEC   368 _UEP0_DMA	=	0xedec
                           0000EC   369 _UEP0_DMA_L	=	0x00ec
                           0000ED   370 _UEP0_DMA_H	=	0x00ed
                           00EFEE   371 _UEP1_DMA	=	0xefee
                           0000EE   372 _UEP1_DMA_L	=	0x00ee
                           0000EF   373 _UEP1_DMA_H	=	0x00ef
                                    374 ;--------------------------------------------------------
                                    375 ; special function bits
                                    376 ;--------------------------------------------------------
                                    377 	.area RSEG    (ABS,DATA)
      000000                        378 	.org 0x0000
                           0000D7   379 _CY	=	0x00d7
                           0000D6   380 _AC	=	0x00d6
                           0000D5   381 _F0	=	0x00d5
                           0000D4   382 _RS1	=	0x00d4
                           0000D3   383 _RS0	=	0x00d3
                           0000D2   384 _OV	=	0x00d2
                           0000D1   385 _F1	=	0x00d1
                           0000D0   386 _P	=	0x00d0
                           0000AF   387 _EA	=	0x00af
                           0000AE   388 _E_DIS	=	0x00ae
                           0000AD   389 _ET2	=	0x00ad
                           0000AC   390 _ES	=	0x00ac
                           0000AB   391 _ET1	=	0x00ab
                           0000AA   392 _EX1	=	0x00aa
                           0000A9   393 _ET0	=	0x00a9
                           0000A8   394 _EX0	=	0x00a8
                           0000BF   395 _PH_FLAG	=	0x00bf
                           0000BE   396 _PL_FLAG	=	0x00be
                           0000BD   397 _PT2	=	0x00bd
                           0000BC   398 _PS	=	0x00bc
                           0000BB   399 _PT1	=	0x00bb
                           0000BA   400 _PX1	=	0x00ba
                           0000B9   401 _PT0	=	0x00b9
                           0000B8   402 _PX0	=	0x00b8
                           0000EF   403 _IE_WDOG	=	0x00ef
                           0000EE   404 _IE_GPIO	=	0x00ee
                           0000ED   405 _IE_PWMX	=	0x00ed
                           0000EC   406 _IE_UART1	=	0x00ec
                           0000EB   407 _IE_ADC	=	0x00eb
                           0000EA   408 _IE_USB	=	0x00ea
                           0000E9   409 _IE_TKEY	=	0x00e9
                           0000E8   410 _IE_SPI0	=	0x00e8
                           000097   411 _SCK	=	0x0097
                           000097   412 _TXD1	=	0x0097
                           000097   413 _TIN5	=	0x0097
                           000096   414 _MISO	=	0x0096
                           000096   415 _RXD1	=	0x0096
                           000096   416 _TIN4	=	0x0096
                           000095   417 _MOSI	=	0x0095
                           000095   418 _PWM1	=	0x0095
                           000095   419 _TIN3	=	0x0095
                           000095   420 _UCC2	=	0x0095
                           000095   421 _AIN2	=	0x0095
                           000094   422 _T2_	=	0x0094
                           000094   423 _CAP1_	=	0x0094
                           000094   424 _SCS	=	0x0094
                           000094   425 _TIN2	=	0x0094
                           000094   426 _UCC1	=	0x0094
                           000094   427 _AIN1	=	0x0094
                           000093   428 _TXD_	=	0x0093
                           000092   429 _RXD_	=	0x0092
                           000091   430 _T2EX	=	0x0091
                           000091   431 _CAP2	=	0x0091
                           000091   432 _TIN1	=	0x0091
                           000091   433 _VBUS2	=	0x0091
                           000091   434 _AIN0	=	0x0091
                           000090   435 _T2	=	0x0090
                           000090   436 _CAP1	=	0x0090
                           000090   437 _TIN0	=	0x0090
                           0000B7   438 _UDM	=	0x00b7
                           0000B6   439 _UDP	=	0x00b6
                           0000B5   440 _T1	=	0x00b5
                           0000B4   441 _PWM2	=	0x00b4
                           0000B4   442 _RXD1_	=	0x00b4
                           0000B4   443 _T0	=	0x00b4
                           0000B3   444 _INT1	=	0x00b3
                           0000B2   445 _TXD1_	=	0x00b2
                           0000B2   446 _INT0	=	0x00b2
                           0000B2   447 _VBUS1	=	0x00b2
                           0000B2   448 _AIN3	=	0x00b2
                           0000B1   449 _PWM2_	=	0x00b1
                           0000B1   450 _TXD	=	0x00b1
                           0000B0   451 _PWM1_	=	0x00b0
                           0000B0   452 _RXD	=	0x00b0
                           00008F   453 _TF1	=	0x008f
                           00008E   454 _TR1	=	0x008e
                           00008D   455 _TF0	=	0x008d
                           00008C   456 _TR0	=	0x008c
                           00008B   457 _IE1	=	0x008b
                           00008A   458 _IT1	=	0x008a
                           000089   459 _IE0	=	0x0089
                           000088   460 _IT0	=	0x0088
                           00009F   461 _SM0	=	0x009f
                           00009E   462 _SM1	=	0x009e
                           00009D   463 _SM2	=	0x009d
                           00009C   464 _REN	=	0x009c
                           00009B   465 _TB8	=	0x009b
                           00009A   466 _RB8	=	0x009a
                           000099   467 _TI	=	0x0099
                           000098   468 _RI	=	0x0098
                           0000CF   469 _TF2	=	0x00cf
                           0000CF   470 _CAP1F	=	0x00cf
                           0000CE   471 _EXF2	=	0x00ce
                           0000CD   472 _RCLK	=	0x00cd
                           0000CC   473 _TCLK	=	0x00cc
                           0000CB   474 _EXEN2	=	0x00cb
                           0000CA   475 _TR2	=	0x00ca
                           0000C9   476 _C_T2	=	0x00c9
                           0000C8   477 _CP_RL2	=	0x00c8
                           0000FF   478 _S0_FST_ACT	=	0x00ff
                           0000FE   479 _S0_IF_OV	=	0x00fe
                           0000FD   480 _S0_IF_FIRST	=	0x00fd
                           0000FC   481 _S0_IF_BYTE	=	0x00fc
                           0000FB   482 _S0_FREE	=	0x00fb
                           0000FA   483 _S0_T_FIFO	=	0x00fa
                           0000F8   484 _S0_R_FIFO	=	0x00f8
                           0000C7   485 _U1SM0	=	0x00c7
                           0000C5   486 _U1SMOD	=	0x00c5
                           0000C4   487 _U1REN	=	0x00c4
                           0000C3   488 _U1TB8	=	0x00c3
                           0000C2   489 _U1RB8	=	0x00c2
                           0000C1   490 _U1TI	=	0x00c1
                           0000C0   491 _U1RI	=	0x00c0
                           000087   492 _CMPO	=	0x0087
                           000086   493 _CMP_IF	=	0x0086
                           000085   494 _ADC_IF	=	0x0085
                           000084   495 _ADC_START	=	0x0084
                           000083   496 _CMP_CHAN	=	0x0083
                           000081   497 _ADC_CHAN1	=	0x0081
                           000080   498 _ADC_CHAN0	=	0x0080
                           0000DF   499 _U_IS_NAK	=	0x00df
                           0000DE   500 _U_TOG_OK	=	0x00de
                           0000DD   501 _U_SIE_FREE	=	0x00dd
                           0000DC   502 _UIF_FIFO_OV	=	0x00dc
                           0000DB   503 _UIF_HST_SOF	=	0x00db
                           0000DA   504 _UIF_SUSPEND	=	0x00da
                           0000D9   505 _UIF_TRANSFER	=	0x00d9
                           0000D8   506 _UIF_DETECT	=	0x00d8
                           0000D8   507 _UIF_BUS_RST	=	0x00d8
                                    508 ;--------------------------------------------------------
                                    509 ; overlayable register banks
                                    510 ;--------------------------------------------------------
                                    511 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        512 	.ds 8
                                    513 ;--------------------------------------------------------
                                    514 ; internal ram data
                                    515 ;--------------------------------------------------------
                                    516 	.area DSEG    (DATA)
      000012                        517 _bootloader::
      000012                        518 	.ds 2
      000014                        519 _UsbApp_Feed_i_65536_67:
      000014                        520 	.ds 1
      000015                        521 _UsbApp_Feed_j_65536_67:
      000015                        522 	.ds 1
      000016                        523 _UsbApp_Feed_k_65536_67:
      000016                        524 	.ds 1
      000017                        525 _UsbApp_Reply_PARM_2:
      000017                        526 	.ds 1
                                    527 ;--------------------------------------------------------
                                    528 ; overlayable items in internal ram
                                    529 ;--------------------------------------------------------
                                    530 	.area	OSEG    (OVR,DATA)
                                    531 ;--------------------------------------------------------
                                    532 ; indirectly addressable internal ram data
                                    533 ;--------------------------------------------------------
                                    534 	.area ISEG    (DATA)
                                    535 ;--------------------------------------------------------
                                    536 ; absolute internal ram data
                                    537 ;--------------------------------------------------------
                                    538 	.area IABS    (ABS,DATA)
                                    539 	.area IABS    (ABS,DATA)
                                    540 ;--------------------------------------------------------
                                    541 ; bit data
                                    542 ;--------------------------------------------------------
                                    543 	.area BSEG    (BIT)
                                    544 ;--------------------------------------------------------
                                    545 ; paged external ram data
                                    546 ;--------------------------------------------------------
                                    547 	.area PSEG    (PAG,XDATA)
                                    548 ;--------------------------------------------------------
                                    549 ; external ram data
                                    550 ;--------------------------------------------------------
                                    551 	.area XSEG    (XDATA)
      000100                        552 _UsbAppWin::
      000100                        553 	.ds 16
                                    554 ;--------------------------------------------------------
                                    555 ; absolute external ram data
                                    556 ;--------------------------------------------------------
                                    557 	.area XABS    (ABS,XDATA)
                                    558 ;--------------------------------------------------------
                                    559 ; external initialized ram data
                                    560 ;--------------------------------------------------------
                                    561 	.area XISEG   (XDATA)
      00013E                        562 _UsbAppWinLen::
      00013E                        563 	.ds 1
                                    564 	.area HOME    (CODE)
                                    565 	.area GSINIT0 (CODE)
                                    566 	.area GSINIT1 (CODE)
                                    567 	.area GSINIT2 (CODE)
                                    568 	.area GSINIT3 (CODE)
                                    569 	.area GSINIT4 (CODE)
                                    570 	.area GSINIT5 (CODE)
                                    571 	.area GSINIT  (CODE)
                                    572 	.area GSFINAL (CODE)
                                    573 	.area CSEG    (CODE)
                                    574 ;--------------------------------------------------------
                                    575 ; global & static initialisations
                                    576 ;--------------------------------------------------------
                                    577 	.area HOME    (CODE)
                                    578 	.area GSINIT  (CODE)
                                    579 	.area GSFINAL (CODE)
                                    580 	.area GSINIT  (CODE)
                                    581 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:23: void (* __data bootloader)(void) = (void (*)(void))BOOT_ADDR;
      0000D2 75 12 00         [24]  582 	mov	_bootloader,#0x00
      0000D5 75 13 38         [24]  583 	mov	(_bootloader + 1),#0x38
                                    584 ;--------------------------------------------------------
                                    585 ; Home
                                    586 ;--------------------------------------------------------
                                    587 	.area HOME    (CODE)
                                    588 	.area HOME    (CODE)
                                    589 ;--------------------------------------------------------
                                    590 ; code
                                    591 ;--------------------------------------------------------
                                    592 	.area CSEG    (CODE)
                                    593 ;------------------------------------------------------------
                                    594 ;Allocation info for local variables in function 'UsbApp_Reset'
                                    595 ;------------------------------------------------------------
                                    596 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:54: void UsbApp_Reset(void)
                                    597 ;	-----------------------------------------
                                    598 ;	 function UsbApp_Reset
                                    599 ;	-----------------------------------------
      00092A                        600 _UsbApp_Reset:
                           000007   601 	ar7 = 0x07
                           000006   602 	ar6 = 0x06
                           000005   603 	ar5 = 0x05
                           000004   604 	ar4 = 0x04
                           000003   605 	ar3 = 0x03
                           000002   606 	ar2 = 0x02
                           000001   607 	ar1 = 0x01
                           000000   608 	ar0 = 0x00
                                    609 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:56: UsbAppWinLen = 0;
      00092A 90 01 3E         [24]  610 	mov	dptr,#_UsbAppWinLen
      00092D E4               [12]  611 	clr	a
      00092E F0               [24]  612 	movx	@dptr,a
                                    613 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:57: }
      00092F 22               [24]  614 	ret
                                    615 ;------------------------------------------------------------
                                    616 ;Allocation info for local variables in function 'UsbApp_Feed'
                                    617 ;------------------------------------------------------------
                                    618 ;byte                      Allocated to registers r7 
                                    619 ;i                         Allocated with name '_UsbApp_Feed_i_65536_67'
                                    620 ;j                         Allocated with name '_UsbApp_Feed_j_65536_67'
                                    621 ;k                         Allocated with name '_UsbApp_Feed_k_65536_67'
                                    622 ;------------------------------------------------------------
                                    623 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:64: uint8_t UsbApp_Feed(uint8_t byte)
                                    624 ;	-----------------------------------------
                                    625 ;	 function UsbApp_Feed
                                    626 ;	-----------------------------------------
      000930                        627 _UsbApp_Feed:
      000930 AF 82            [24]  628 	mov	r7,dpl
                                    629 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:68: if ( UsbAppWinLen < USBAPP_CMD_MAX_LEN )
      000932 90 01 3E         [24]  630 	mov	dptr,#_UsbAppWinLen
      000935 E0               [24]  631 	movx	a,@dptr
      000936 FE               [12]  632 	mov	r6,a
      000937 BE 10 00         [24]  633 	cjne	r6,#0x10,00152$
      00093A                        634 00152$:
      00093A 50 14            [24]  635 	jnc	00102$
                                    636 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:70: UsbAppWin[UsbAppWinLen++] = byte;
      00093C 90 01 3E         [24]  637 	mov	dptr,#_UsbAppWinLen
      00093F EE               [12]  638 	mov	a,r6
      000940 04               [12]  639 	inc	a
      000941 F0               [24]  640 	movx	@dptr,a
      000942 EE               [12]  641 	mov	a,r6
      000943 24 00            [12]  642 	add	a,#_UsbAppWin
      000945 F5 82            [12]  643 	mov	dpl,a
      000947 E4               [12]  644 	clr	a
      000948 34 01            [12]  645 	addc	a,#(_UsbAppWin >> 8)
      00094A F5 83            [12]  646 	mov	dph,a
      00094C EF               [12]  647 	mov	a,r7
      00094D F0               [24]  648 	movx	@dptr,a
      00094E 80 21            [24]  649 	sjmp	00125$
      000950                        650 00102$:
                                    651 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:74: memmove( &UsbAppWin[0], &UsbAppWin[1], USBAPP_CMD_MAX_LEN - 1 );
      000950 75 2B 01         [24]  652 	mov	_memmove_PARM_2,#(_UsbAppWin + 0x0001)
      000953 75 2C 01         [24]  653 	mov	(_memmove_PARM_2 + 1),#((_UsbAppWin + 0x0001) >> 8)
      000956 75 2D 00         [24]  654 	mov	(_memmove_PARM_2 + 2),#0x00
      000959 75 2E 0F         [24]  655 	mov	_memmove_PARM_3,#0x0f
      00095C 75 2F 00         [24]  656 	mov	(_memmove_PARM_3 + 1),#0x00
      00095F 90 01 00         [24]  657 	mov	dptr,#_UsbAppWin
      000962 75 F0 00         [24]  658 	mov	b,#0x00
      000965 C0 07            [24]  659 	push	ar7
      000967 12 10 1C         [24]  660 	lcall	_memmove
      00096A D0 07            [24]  661 	pop	ar7
                                    662 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:75: UsbAppWin[USBAPP_CMD_MAX_LEN - 1] = byte;
      00096C 90 01 0F         [24]  663 	mov	dptr,#(_UsbAppWin + 0x000f)
      00096F EF               [12]  664 	mov	a,r7
      000970 F0               [24]  665 	movx	@dptr,a
                                    666 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:77: for ( i = 0; i < USBAPP_CMD_COUNT; i++ )
      000971                        667 00125$:
      000971 75 14 00         [24]  668 	mov	_UsbApp_Feed_i_65536_67,#0x00
      000974                        669 00115$:
                                    670 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:79: if ( UsbAppWinLen >= UsbAppCmdTable[i].len )
      000974 E5 14            [12]  671 	mov	a,_UsbApp_Feed_i_65536_67
      000976 75 F0 05         [24]  672 	mov	b,#0x05
      000979 A4               [48]  673 	mul	ab
      00097A 24 59            [12]  674 	add	a,#_UsbAppCmdTable
      00097C FD               [12]  675 	mov	r5,a
      00097D 74 12            [12]  676 	mov	a,#(_UsbAppCmdTable >> 8)
      00097F 35 F0            [12]  677 	addc	a,b
      000981 FE               [12]  678 	mov	r6,a
      000982 74 02            [12]  679 	mov	a,#0x02
      000984 2D               [12]  680 	add	a,r5
      000985 FB               [12]  681 	mov	r3,a
      000986 E4               [12]  682 	clr	a
      000987 3E               [12]  683 	addc	a,r6
      000988 FC               [12]  684 	mov	r4,a
      000989 8B 82            [24]  685 	mov	dpl,r3
      00098B 8C 83            [24]  686 	mov	dph,r4
      00098D E4               [12]  687 	clr	a
      00098E 93               [24]  688 	movc	a,@a+dptr
      00098F FA               [12]  689 	mov	r2,a
      000990 90 01 3E         [24]  690 	mov	dptr,#_UsbAppWinLen
      000993 E0               [24]  691 	movx	a,@dptr
      000994 F9               [12]  692 	mov	r1,a
      000995 C3               [12]  693 	clr	c
      000996 9A               [12]  694 	subb	a,r2
      000997 40 6C            [24]  695 	jc	00116$
                                    696 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:81: k = UsbAppWinLen - UsbAppCmdTable[i].len;
      000999 E9               [12]  697 	mov	a,r1
      00099A C3               [12]  698 	clr	c
      00099B 9A               [12]  699 	subb	a,r2
      00099C F5 16            [12]  700 	mov	_UsbApp_Feed_k_65536_67,a
                                    701 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:82: for ( j = 0; j < UsbAppCmdTable[i].len; j++ )
      00099E 75 15 00         [24]  702 	mov	_UsbApp_Feed_j_65536_67,#0x00
      0009A1                        703 00113$:
      0009A1 8B 82            [24]  704 	mov	dpl,r3
      0009A3 8C 83            [24]  705 	mov	dph,r4
      0009A5 E4               [12]  706 	clr	a
      0009A6 93               [24]  707 	movc	a,@a+dptr
      0009A7 F8               [12]  708 	mov	r0,a
      0009A8 C3               [12]  709 	clr	c
      0009A9 E5 15            [12]  710 	mov	a,_UsbApp_Feed_j_65536_67
      0009AB 98               [12]  711 	subb	a,r0
      0009AC 50 2E            [24]  712 	jnc	00106$
                                    713 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:84: if ( UsbAppWin[k + j] != UsbAppCmdTable[i].cmd[j] )
      0009AE E5 15            [12]  714 	mov	a,_UsbApp_Feed_j_65536_67
      0009B0 25 16            [12]  715 	add	a,_UsbApp_Feed_k_65536_67
      0009B2 24 00            [12]  716 	add	a,#_UsbAppWin
      0009B4 F5 82            [12]  717 	mov	dpl,a
      0009B6 E4               [12]  718 	clr	a
      0009B7 34 01            [12]  719 	addc	a,#(_UsbAppWin >> 8)
      0009B9 F5 83            [12]  720 	mov	dph,a
      0009BB E0               [24]  721 	movx	a,@dptr
      0009BC FA               [12]  722 	mov	r2,a
      0009BD 8D 82            [24]  723 	mov	dpl,r5
      0009BF 8E 83            [24]  724 	mov	dph,r6
      0009C1 E4               [12]  725 	clr	a
      0009C2 93               [24]  726 	movc	a,@a+dptr
      0009C3 F9               [12]  727 	mov	r1,a
      0009C4 A3               [24]  728 	inc	dptr
      0009C5 E4               [12]  729 	clr	a
      0009C6 93               [24]  730 	movc	a,@a+dptr
      0009C7 FF               [12]  731 	mov	r7,a
      0009C8 E5 15            [12]  732 	mov	a,_UsbApp_Feed_j_65536_67
      0009CA 29               [12]  733 	add	a,r1
      0009CB F5 82            [12]  734 	mov	dpl,a
      0009CD E4               [12]  735 	clr	a
      0009CE 3F               [12]  736 	addc	a,r7
      0009CF F5 83            [12]  737 	mov	dph,a
      0009D1 E4               [12]  738 	clr	a
      0009D2 93               [24]  739 	movc	a,@a+dptr
      0009D3 FF               [12]  740 	mov	r7,a
      0009D4 EA               [12]  741 	mov	a,r2
      0009D5 B5 07 04         [24]  742 	cjne	a,ar7,00106$
                                    743 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:82: for ( j = 0; j < UsbAppCmdTable[i].len; j++ )
      0009D8 05 15            [12]  744 	inc	_UsbApp_Feed_j_65536_67
      0009DA 80 C5            [24]  745 	sjmp	00113$
      0009DC                        746 00106$:
                                    747 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:87: if ( j == UsbAppCmdTable[i].len )
      0009DC E8               [12]  748 	mov	a,r0
      0009DD B5 15 25         [24]  749 	cjne	a,_UsbApp_Feed_j_65536_67,00116$
                                    750 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:89: UsbAppWinLen = 0;
      0009E0 90 01 3E         [24]  751 	mov	dptr,#_UsbAppWinLen
      0009E3 E4               [12]  752 	clr	a
      0009E4 F0               [24]  753 	movx	@dptr,a
                                    754 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:90: UsbAppCmdTable[i].handler();
      0009E5 8D 82            [24]  755 	mov	dpl,r5
      0009E7 8E 83            [24]  756 	mov	dph,r6
      0009E9 A3               [24]  757 	inc	dptr
      0009EA A3               [24]  758 	inc	dptr
      0009EB A3               [24]  759 	inc	dptr
                                    760 ;	genFromRTrack removed	clr	a
      0009EC 93               [24]  761 	movc	a,@a+dptr
      0009ED FE               [12]  762 	mov	r6,a
      0009EE A3               [24]  763 	inc	dptr
      0009EF E4               [12]  764 	clr	a
      0009F0 93               [24]  765 	movc	a,@a+dptr
      0009F1 FF               [12]  766 	mov	r7,a
      0009F2 C0 07            [24]  767 	push	ar7
      0009F4 C0 06            [24]  768 	push	ar6
      0009F6 8E 82            [24]  769 	mov	dpl,r6
      0009F8 8F 83            [24]  770 	mov	dph,r7
      0009FA 12 00 49         [24]  771 	lcall	__sdcc_call_dptr
      0009FD D0 06            [24]  772 	pop	ar6
      0009FF D0 07            [24]  773 	pop	ar7
                                    774 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:91: return 1;
      000A01 75 82 01         [24]  775 	mov	dpl,#0x01
      000A04 22               [24]  776 	ret
      000A05                        777 00116$:
                                    778 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:77: for ( i = 0; i < USBAPP_CMD_COUNT; i++ )
      000A05 05 14            [12]  779 	inc	_UsbApp_Feed_i_65536_67
      000A07 74 FB            [12]  780 	mov	a,#0x100 - 0x05
      000A09 25 14            [12]  781 	add	a,_UsbApp_Feed_i_65536_67
      000A0B 40 03            [24]  782 	jc	00160$
      000A0D 02 09 74         [24]  783 	ljmp	00115$
      000A10                        784 00160$:
                                    785 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:95: return 0;
      000A10 75 82 00         [24]  786 	mov	dpl,#0x00
                                    787 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:96: }
      000A13 22               [24]  788 	ret
                                    789 ;------------------------------------------------------------
                                    790 ;Allocation info for local variables in function 'UsbApp_HandleDownload'
                                    791 ;------------------------------------------------------------
                                    792 ;waitCnt                   Allocated to registers r7 
                                    793 ;------------------------------------------------------------
                                    794 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:105: void UsbApp_HandleDownload(void)
                                    795 ;	-----------------------------------------
                                    796 ;	 function UsbApp_HandleDownload
                                    797 ;	-----------------------------------------
      000A14                        798 _UsbApp_HandleDownload:
                                    799 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:109: for ( waitCnt = 0; waitCnt < 250 && !UsbCdc_TxReady(); waitCnt++ )
      000A14 7F 00            [12]  800 	mov	r7,#0x00
      000A16                        801 00108$:
      000A16 BF FA 00         [24]  802 	cjne	r7,#0xfa,00146$
      000A19                        803 00146$:
      000A19 50 18            [24]  804 	jnc	00101$
      000A1B C0 07            [24]  805 	push	ar7
      000A1D 12 03 61         [24]  806 	lcall	_UsbCdc_TxReady
      000A20 E5 82            [12]  807 	mov	a,dpl
      000A22 D0 07            [24]  808 	pop	ar7
      000A24 70 0D            [24]  809 	jnz	00101$
                                    810 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:111: mDelaymS( 2 );
      000A26 90 00 02         [24]  811 	mov	dptr,#0x0002
      000A29 C0 07            [24]  812 	push	ar7
      000A2B 12 0F 70         [24]  813 	lcall	_mDelaymS
      000A2E D0 07            [24]  814 	pop	ar7
                                    815 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:109: for ( waitCnt = 0; waitCnt < 250 && !UsbCdc_TxReady(); waitCnt++ )
      000A30 0F               [12]  816 	inc	r7
      000A31 80 E3            [24]  817 	sjmp	00108$
      000A33                        818 00101$:
                                    819 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:113: UsbCdc_TxSend( BootloaderMsg, sizeof(BootloaderMsg) - 1 );
      000A33 75 11 12         [24]  820 	mov	_UsbCdc_TxSend_PARM_2,#0x12
      000A36 90 12 72         [24]  821 	mov	dptr,#_BootloaderMsg
      000A39 75 F0 80         [24]  822 	mov	b,#0x80
      000A3C 12 03 6E         [24]  823 	lcall	_UsbCdc_TxSend
                                    824 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:114: for ( waitCnt = 0; waitCnt < 250 && !UsbCdc_TxReady(); waitCnt++ )
      000A3F 7F 00            [12]  825 	mov	r7,#0x00
      000A41                        826 00112$:
      000A41 BF FA 00         [24]  827 	cjne	r7,#0xfa,00149$
      000A44                        828 00149$:
      000A44 50 18            [24]  829 	jnc	00102$
      000A46 C0 07            [24]  830 	push	ar7
      000A48 12 03 61         [24]  831 	lcall	_UsbCdc_TxReady
      000A4B E5 82            [12]  832 	mov	a,dpl
      000A4D D0 07            [24]  833 	pop	ar7
      000A4F 70 0D            [24]  834 	jnz	00102$
                                    835 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:116: mDelaymS( 2 );
      000A51 90 00 02         [24]  836 	mov	dptr,#0x0002
      000A54 C0 07            [24]  837 	push	ar7
      000A56 12 0F 70         [24]  838 	lcall	_mDelaymS
      000A59 D0 07            [24]  839 	pop	ar7
                                    840 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:114: for ( waitCnt = 0; waitCnt < 250 && !UsbCdc_TxReady(); waitCnt++ )
      000A5B 0F               [12]  841 	inc	r7
      000A5C 80 E3            [24]  842 	sjmp	00112$
      000A5E                        843 00102$:
                                    844 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:118: USB_INT_EN = 0;
      000A5E 75 E1 00         [24]  845 	mov	_USB_INT_EN,#0x00
                                    846 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:119: USB_CTRL = 0x06;
      000A61 75 E2 06         [24]  847 	mov	_USB_CTRL,#0x06
                                    848 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:120: mDelaymS( 100 );
      000A64 90 00 64         [24]  849 	mov	dptr,#0x0064
      000A67 12 0F 70         [24]  850 	lcall	_mDelaymS
                                    851 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:121: EA = 0;
                                    852 ;	assignBit
      000A6A C2 AF            [12]  853 	clr	_EA
                                    854 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:122: bootloader();
      000A6C 85 12 82         [24]  855 	mov	dpl,_bootloader
      000A6F 85 13 83         [24]  856 	mov	dph,(_bootloader + 1)
      000A72 12 00 49         [24]  857 	lcall	__sdcc_call_dptr
                                    858 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:123: while( 1 );
      000A75                        859 00104$:
                                    860 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:124: }
      000A75 80 FE            [24]  861 	sjmp	00104$
                                    862 ;------------------------------------------------------------
                                    863 ;Allocation info for local variables in function 'UsbApp_Reply'
                                    864 ;------------------------------------------------------------
                                    865 ;len                       Allocated with name '_UsbApp_Reply_PARM_2'
                                    866 ;msg                       Allocated to registers r6 r7 
                                    867 ;waitCnt                   Allocated to registers r5 
                                    868 ;------------------------------------------------------------
                                    869 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:127: static void UsbApp_Reply(const __code uint8_t *msg, uint8_t len)
                                    870 ;	-----------------------------------------
                                    871 ;	 function UsbApp_Reply
                                    872 ;	-----------------------------------------
      000A77                        873 _UsbApp_Reply:
      000A77 AE 82            [24]  874 	mov	r6,dpl
      000A79 AF 83            [24]  875 	mov	r7,dph
                                    876 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:130: for ( waitCnt = 0; waitCnt < 250 && !UsbCdc_TxReady(); waitCnt++ )
      000A7B 7D 00            [12]  877 	mov	r5,#0x00
      000A7D                        878 00104$:
      000A7D BD FA 00         [24]  879 	cjne	r5,#0xfa,00121$
      000A80                        880 00121$:
      000A80 50 28            [24]  881 	jnc	00101$
      000A82 C0 07            [24]  882 	push	ar7
      000A84 C0 06            [24]  883 	push	ar6
      000A86 C0 05            [24]  884 	push	ar5
      000A88 12 03 61         [24]  885 	lcall	_UsbCdc_TxReady
      000A8B E5 82            [12]  886 	mov	a,dpl
      000A8D D0 05            [24]  887 	pop	ar5
      000A8F D0 06            [24]  888 	pop	ar6
      000A91 D0 07            [24]  889 	pop	ar7
      000A93 70 15            [24]  890 	jnz	00101$
                                    891 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:132: mDelaymS( 2 );
      000A95 90 00 02         [24]  892 	mov	dptr,#0x0002
      000A98 C0 07            [24]  893 	push	ar7
      000A9A C0 06            [24]  894 	push	ar6
      000A9C C0 05            [24]  895 	push	ar5
      000A9E 12 0F 70         [24]  896 	lcall	_mDelaymS
      000AA1 D0 05            [24]  897 	pop	ar5
      000AA3 D0 06            [24]  898 	pop	ar6
      000AA5 D0 07            [24]  899 	pop	ar7
                                    900 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:130: for ( waitCnt = 0; waitCnt < 250 && !UsbCdc_TxReady(); waitCnt++ )
      000AA7 0D               [12]  901 	inc	r5
      000AA8 80 D3            [24]  902 	sjmp	00104$
      000AAA                        903 00101$:
                                    904 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:134: UsbCdc_TxSend( msg, len );
      000AAA 7D 80            [12]  905 	mov	r5,#0x80
      000AAC 85 17 11         [24]  906 	mov	_UsbCdc_TxSend_PARM_2,_UsbApp_Reply_PARM_2
      000AAF 8E 82            [24]  907 	mov	dpl,r6
      000AB1 8F 83            [24]  908 	mov	dph,r7
      000AB3 8D F0            [24]  909 	mov	b,r5
                                    910 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:135: }
      000AB5 02 03 6E         [24]  911 	ljmp	_UsbCdc_TxSend
                                    912 ;------------------------------------------------------------
                                    913 ;Allocation info for local variables in function 'UsbApp_Help'
                                    914 ;------------------------------------------------------------
                                    915 ;i                         Allocated to registers r7 
                                    916 ;------------------------------------------------------------
                                    917 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:149: void UsbApp_Help(void)
                                    918 ;	-----------------------------------------
                                    919 ;	 function UsbApp_Help
                                    920 ;	-----------------------------------------
      000AB8                        921 _UsbApp_Help:
                                    922 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:152: for ( i = 0; i < sizeof(gHelpSegs) / sizeof(gHelpSegs[0]); i++ )
      000AB8 7F 00            [12]  923 	mov	r7,#0x00
      000ABA                        924 00102$:
                                    925 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:154: UsbApp_Reply( gHelpSegs[i].p, gHelpSegs[i].n );
      000ABA EF               [12]  926 	mov	a,r7
      000ABB 75 F0 03         [24]  927 	mov	b,#0x03
      000ABE A4               [48]  928 	mul	ab
      000ABF FD               [12]  929 	mov	r5,a
      000AC0 AE F0            [24]  930 	mov	r6,b
      000AC2 24 CE            [12]  931 	add	a,#_gHelpSegs
      000AC4 F5 82            [12]  932 	mov	dpl,a
      000AC6 EE               [12]  933 	mov	a,r6
      000AC7 34 12            [12]  934 	addc	a,#(_gHelpSegs >> 8)
      000AC9 F5 83            [12]  935 	mov	dph,a
      000ACB E4               [12]  936 	clr	a
      000ACC 93               [24]  937 	movc	a,@a+dptr
      000ACD FB               [12]  938 	mov	r3,a
      000ACE A3               [24]  939 	inc	dptr
      000ACF E4               [12]  940 	clr	a
      000AD0 93               [24]  941 	movc	a,@a+dptr
      000AD1 FC               [12]  942 	mov	r4,a
      000AD2 ED               [12]  943 	mov	a,r5
      000AD3 24 CE            [12]  944 	add	a,#_gHelpSegs
      000AD5 FD               [12]  945 	mov	r5,a
      000AD6 EE               [12]  946 	mov	a,r6
      000AD7 34 12            [12]  947 	addc	a,#(_gHelpSegs >> 8)
      000AD9 FE               [12]  948 	mov	r6,a
      000ADA 8D 82            [24]  949 	mov	dpl,r5
      000ADC 8E 83            [24]  950 	mov	dph,r6
      000ADE A3               [24]  951 	inc	dptr
      000ADF A3               [24]  952 	inc	dptr
      000AE0 E4               [12]  953 	clr	a
      000AE1 93               [24]  954 	movc	a,@a+dptr
      000AE2 F5 17            [12]  955 	mov	_UsbApp_Reply_PARM_2,a
      000AE4 8B 82            [24]  956 	mov	dpl,r3
      000AE6 8C 83            [24]  957 	mov	dph,r4
      000AE8 C0 07            [24]  958 	push	ar7
      000AEA 12 0A 77         [24]  959 	lcall	_UsbApp_Reply
      000AED D0 07            [24]  960 	pop	ar7
                                    961 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:152: for ( i = 0; i < sizeof(gHelpSegs) / sizeof(gHelpSegs[0]); i++ )
      000AEF 0F               [12]  962 	inc	r7
      000AF0 BF 02 00         [24]  963 	cjne	r7,#0x02,00111$
      000AF3                        964 00111$:
      000AF3 40 C5            [24]  965 	jc	00102$
                                    966 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:156: }
      000AF5 22               [24]  967 	ret
                                    968 ;------------------------------------------------------------
                                    969 ;Allocation info for local variables in function 'UsbApp_LedOn'
                                    970 ;------------------------------------------------------------
                                    971 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:162: void UsbApp_LedOn(void)
                                    972 ;	-----------------------------------------
                                    973 ;	 function UsbApp_LedOn
                                    974 ;	-----------------------------------------
      000AF6                        975 _UsbApp_LedOn:
                                    976 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:164: P3 |= 0x01;
      000AF6 43 B0 01         [24]  977 	orl	_P3,#0x01
                                    978 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:165: UsbApp_Reply( UsbAppLedOnMsg, sizeof(UsbAppLedOnMsg) - 1 );
      000AF9 75 17 08         [24]  979 	mov	_UsbApp_Reply_PARM_2,#0x08
      000AFC 90 12 D4         [24]  980 	mov	dptr,#_UsbAppLedOnMsg
                                    981 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:166: }
      000AFF 02 0A 77         [24]  982 	ljmp	_UsbApp_Reply
                                    983 ;------------------------------------------------------------
                                    984 ;Allocation info for local variables in function 'UsbApp_LedOff'
                                    985 ;------------------------------------------------------------
                                    986 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:168: void UsbApp_LedOff(void)
                                    987 ;	-----------------------------------------
                                    988 ;	 function UsbApp_LedOff
                                    989 ;	-----------------------------------------
      000B02                        990 _UsbApp_LedOff:
                                    991 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:170: P3 &= ~0x01;
      000B02 53 B0 FE         [24]  992 	anl	_P3,#0xfe
                                    993 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:171: UsbApp_Reply( UsbAppLedOffMsg, sizeof(UsbAppLedOffMsg) - 1 );
      000B05 75 17 09         [24]  994 	mov	_UsbApp_Reply_PARM_2,#0x09
      000B08 90 12 DD         [24]  995 	mov	dptr,#_UsbAppLedOffMsg
                                    996 ;	d:/tools/WCH/ch554_sdcc-master/examples/usb_device_cdc/source/usbapp.c:172: }
      000B0B 02 0A 77         [24]  997 	ljmp	_UsbApp_Reply
                                    998 	.area CSEG    (CODE)
                                    999 	.area CONST   (CODE)
      001259                       1000 _UsbAppCmdTable:
      001259 E7 12                 1001 	.byte __str_0, (__str_0 >> 8)
      00125B 04                    1002 	.db #0x04	; 4
      00125C B8 0A                 1003 	.byte _UsbApp_Help, (_UsbApp_Help >> 8)
      00125E EC 12                 1004 	.byte __str_1, (__str_1 >> 8)
      001260 01                    1005 	.db #0x01	; 1
      001261 B8 0A                 1006 	.byte _UsbApp_Help, (_UsbApp_Help >> 8)
      001263 EE 12                 1007 	.byte __str_2, (__str_2 >> 8)
      001265 08                    1008 	.db #0x08	; 8
      001266 14 0A                 1009 	.byte _UsbApp_HandleDownload, (_UsbApp_HandleDownload >> 8)
      001268 F7 12                 1010 	.byte __str_3, (__str_3 >> 8)
      00126A 06                    1011 	.db #0x06	; 6
      00126B F6 0A                 1012 	.byte _UsbApp_LedOn, (_UsbApp_LedOn >> 8)
      00126D FE 12                 1013 	.byte __str_4, (__str_4 >> 8)
      00126F 07                    1014 	.db #0x07	; 7
      001270 02 0B                 1015 	.byte _UsbApp_LedOff, (_UsbApp_LedOff >> 8)
      001272                       1016 _BootloaderMsg:
      001272 45 6E 74 65 72 20 62  1017 	.ascii "Enter bootloader"
             6F 6F 74 6C 6F 61 64
             65 72
      001282 0D                    1018 	.db 0x0d
      001283 0A                    1019 	.db 0x0a
      001284 00                    1020 	.db 0x00
      001285                       1021 _UsbHelp0:
      001285 43 48 35 35 32 20 55  1022 	.ascii "CH552 USB-CDC Command Interface"
             53 42 2D 43 44 43 20
             43 6F 6D 6D 61 6E 64
             20 49 6E 74 65 72 66
             61 63 65
      0012A4 0D                    1023 	.db 0x0d
      0012A5 0A                    1024 	.db 0x0a
      0012A6 00                    1025 	.db 0x00
      0012A7                       1026 _UsbHelp1:
      0012A7 63 6D 64 73 3A 20 68  1027 	.ascii "cmds: help ? download led_on led_off"
             65 6C 70 20 3F 20 64
             6F 77 6E 6C 6F 61 64
             20 6C 65 64 5F 6F 6E
             20 6C 65 64 5F 6F 66
             66
      0012CB 0D                    1028 	.db 0x0d
      0012CC 0A                    1029 	.db 0x0a
      0012CD 00                    1030 	.db 0x00
      0012CE                       1031 _gHelpSegs:
      0012CE 85 12                 1032 	.byte _UsbHelp0, (_UsbHelp0 >> 8)
      0012D0 21                    1033 	.db #0x21	; 33
      0012D1 A7 12                 1034 	.byte _UsbHelp1, (_UsbHelp1 >> 8)
      0012D3 26                    1035 	.db #0x26	; 38
      0012D4                       1036 _UsbAppLedOnMsg:
      0012D4 4C 45 44 20 4F 4E     1037 	.ascii "LED ON"
      0012DA 0D                    1038 	.db 0x0d
      0012DB 0A                    1039 	.db 0x0a
      0012DC 00                    1040 	.db 0x00
      0012DD                       1041 _UsbAppLedOffMsg:
      0012DD 4C 45 44 20 4F 46 46  1042 	.ascii "LED OFF"
      0012E4 0D                    1043 	.db 0x0d
      0012E5 0A                    1044 	.db 0x0a
      0012E6 00                    1045 	.db 0x00
                                   1046 	.area CONST   (CODE)
      0012E7                       1047 __str_0:
      0012E7 68 65 6C 70           1048 	.ascii "help"
      0012EB 00                    1049 	.db 0x00
                                   1050 	.area CSEG    (CODE)
                                   1051 	.area CONST   (CODE)
      0012EC                       1052 __str_1:
      0012EC 3F                    1053 	.ascii "?"
      0012ED 00                    1054 	.db 0x00
                                   1055 	.area CSEG    (CODE)
                                   1056 	.area CONST   (CODE)
      0012EE                       1057 __str_2:
      0012EE 64 6F 77 6E 6C 6F 61  1058 	.ascii "download"
             64
      0012F6 00                    1059 	.db 0x00
                                   1060 	.area CSEG    (CODE)
                                   1061 	.area CONST   (CODE)
      0012F7                       1062 __str_3:
      0012F7 6C 65 64 5F 6F 6E     1063 	.ascii "led_on"
      0012FD 00                    1064 	.db 0x00
                                   1065 	.area CSEG    (CODE)
                                   1066 	.area CONST   (CODE)
      0012FE                       1067 __str_4:
      0012FE 6C 65 64 5F 6F 66 66  1068 	.ascii "led_off"
      001305 00                    1069 	.db 0x00
                                   1070 	.area CSEG    (CODE)
                                   1071 	.area XINIT   (CODE)
      001310                       1072 __xinit__UsbAppWinLen:
      001310 00                    1073 	.db #0x00	; 0
                                   1074 	.area CABS    (ABS,CODE)
