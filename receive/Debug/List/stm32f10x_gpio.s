///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.0.51174/W32 for ARM    28/May/2011  10:37:10 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\253642xvvn\桌面\nrf905se\bigb /
//                    oard\send6\library\src\stm32f10x_gpio.c                 /
//    Command line =  "C:\Documents and Settings\253642xvvn\桌面\nrf905se\big /
//                    board\send6\library\src\stm32f10x_gpio.c" -lC           /
//                    "C:\Documents and Settings\253642xvvn\桌面\nrf905se\big /
//                    board\send6\Debug\List\" -lb "C:\Documents and          /
//                    Settings\253642xvvn\桌面\nrf905se\bigboard\send6\Debug\ /
//                    List\" -o "C:\Documents and                             /
//                    Settings\253642xvvn\桌面\nrf905se\bigboard\send6\Debug\ /
//                    Obj\" --no_cse --no_unroll --no_inline                  /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "D:\Program Files\IAR Systems\Embedded Workbench        /
//                    5.4\arm\INC\DLib_Config_Full.h" -I "C:\Documents and    /
//                    Settings\253642xvvn\桌面\nrf905se\bigboard\send6\librar /
//                    y\inc\" -I "C:\Documents and                            /
//                    Settings\253642xvvn\桌面\nrf905se\bigboard\send6\board\ /
//                    " -I "C:\Documents and Settings\253642xvvn\桌面\nrf905s /
//                    e\bigboard\send6\app\" -I "D:\Program Files\IAR         /
//                    Systems\Embedded Workbench 5.4\arm\INC\" -Ol            /
//    List file    =  C:\Documents and Settings\253642xvvn\桌面\nrf905se\bigb /
//                    oard\send6\Debug\List\stm32f10x_gpio.s                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f10x_gpio

        EXTERN RCC_APB2PeriphResetCmd

        PUBLIC GPIO_AFIODeInit
        PUBLIC GPIO_DeInit
        PUBLIC GPIO_EXTILineConfig
        PUBLIC GPIO_EventOutputCmd
        PUBLIC GPIO_EventOutputConfig
        PUBLIC GPIO_Init
        PUBLIC GPIO_PinLockConfig
        PUBLIC GPIO_PinRemapConfig
        PUBLIC GPIO_ReadInputData
        PUBLIC GPIO_ReadInputDataBit
        PUBLIC GPIO_ReadOutputData
        PUBLIC GPIO_ReadOutputDataBit
        PUBLIC GPIO_ResetBits
        PUBLIC GPIO_SetBits
        PUBLIC GPIO_StructInit
        PUBLIC GPIO_Write
        PUBLIC GPIO_WriteBit


        SECTION `.text`:CODE:NOROOT(2)
        THUMB
GPIO_DeInit:
        PUSH     {R7,LR}
        LDR.N    R1,??GPIO_DeInit_0  ;; 0x40010800
        SUBS     R0,R0,R1
        BEQ.N    ??GPIO_DeInit_1
        MOV      R1,#+1024
        SUBS     R0,R0,R1
        BEQ.N    ??GPIO_DeInit_2
        MOV      R1,#+1024
        SUBS     R0,R0,R1
        BEQ.N    ??GPIO_DeInit_3
        MOV      R1,#+1024
        SUBS     R0,R0,R1
        BEQ.N    ??GPIO_DeInit_4
        MOV      R1,#+1024
        SUBS     R0,R0,R1
        BEQ.N    ??GPIO_DeInit_5
        MOV      R1,#+1024
        SUBS     R0,R0,R1
        BEQ.N    ??GPIO_DeInit_6
        MOV      R1,#+1024
        SUBS     R0,R0,R1
        BEQ.N    ??GPIO_DeInit_7
        B.N      ??GPIO_DeInit_8
??GPIO_DeInit_1:
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+4
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_9
??GPIO_DeInit_2:
        MOVS     R1,#+1
        MOVS     R0,#+8
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+8
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_9
??GPIO_DeInit_3:
        MOVS     R1,#+1
        MOVS     R0,#+16
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_9
??GPIO_DeInit_4:
        MOVS     R1,#+1
        MOVS     R0,#+32
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+32
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_9
??GPIO_DeInit_5:
        MOVS     R1,#+1
        MOVS     R0,#+64
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+64
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_9
??GPIO_DeInit_6:
        MOVS     R1,#+1
        MOVS     R0,#+128
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_9
??GPIO_DeInit_7:
        MOVS     R1,#+1
        MOV      R0,#+256
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+256
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_9
??GPIO_DeInit_8:
??GPIO_DeInit_9:
        POP      {R0,PC}          ;; return
        Nop      
        DATA
??GPIO_DeInit_0:
        DC32     0x40010800

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_AFIODeInit:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       RCC_APB2PeriphResetCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_Init:
        PUSH     {R4-R7}
        MOVS     R2,#+0
        MOVS     R6,#+0
        MOVS     R3,#+0
        MOVS     R5,#+0
        MOVS     R4,#+0
        MOVS     R7,#+0
        LDRB     R12,[R1, #+3]
        ANDS     R12,R12,#0xF
        MOV      R2,R12
        LDRB     R12,[R1, #+3]
        TST      R12,#0x10
        BEQ.N    ??GPIO_Init_0
        LDRB     R3,[R1, #+2]
        ORRS     R2,R3,R2
??GPIO_Init_0:
        LDRH     R3,[R1, #+0]
        LSLS     R3,R3,#+24
        BEQ.N    ??GPIO_Init_1
        LDR      R4,[R0, #+0]
        MOVS     R3,#+0
        B.N      ??GPIO_Init_2
??GPIO_Init_3:
        MOVS     R5,#+1
        LSLS     R5,R5,R3
        LDRH     R6,[R1, #+0]
        ANDS     R6,R5,R6
        CMP      R6,R5
        BNE.N    ??GPIO_Init_4
        LSLS     R5,R3,#+2
        MOVS     R7,#+15
        LSLS     R7,R7,R5
        MVNS     R6,R7
        ANDS     R4,R6,R4
        LSLS     R5,R2,R5
        ORRS     R4,R5,R4
        LDRB     R5,[R1, #+3]
        CMP      R5,#+40
        BNE.N    ??GPIO_Init_5
        MOVS     R5,#+1
        LSLS     R5,R5,R3
        STR      R5,[R0, #+20]
??GPIO_Init_5:
        LDRB     R5,[R1, #+3]
        CMP      R5,#+72
        BNE.N    ??GPIO_Init_6
        MOVS     R5,#+1
        LSLS     R5,R5,R3
        STR      R5,[R0, #+16]
??GPIO_Init_6:
??GPIO_Init_4:
        ADDS     R3,R3,#+1
??GPIO_Init_2:
        CMP      R3,#+8
        BCC.N    ??GPIO_Init_3
        STR      R4,[R0, #+0]
??GPIO_Init_1:
        LDRH     R3,[R1, #+0]
        MOV      R4,#+256
        CMP      R3,R4
        BCC.N    ??GPIO_Init_7
        LDR      R4,[R0, #+4]
        MOVS     R3,#+0
        B.N      ??GPIO_Init_8
??GPIO_Init_9:
        MOVS     R5,#+1
        ADDS     R6,R3,#+8
        LSLS     R5,R5,R6
        LDRH     R6,[R1, #+0]
        ANDS     R6,R5,R6
        CMP      R6,R5
        BNE.N    ??GPIO_Init_10
        LSLS     R5,R3,#+2
        MOVS     R7,#+15
        LSLS     R7,R7,R5
        MVNS     R6,R7
        ANDS     R4,R6,R4
        LSLS     R5,R2,R5
        ORRS     R4,R5,R4
        LDRB     R5,[R1, #+3]
        CMP      R5,#+40
        BNE.N    ??GPIO_Init_11
        MOVS     R5,#+1
        ADDS     R6,R3,#+8
        LSLS     R5,R5,R6
        STR      R5,[R0, #+20]
??GPIO_Init_11:
        LDRB     R5,[R1, #+3]
        CMP      R5,#+72
        BNE.N    ??GPIO_Init_12
        MOVS     R5,#+1
        ADDS     R6,R3,#+8
        LSLS     R5,R5,R6
        STR      R5,[R0, #+16]
??GPIO_Init_12:
??GPIO_Init_10:
        ADDS     R3,R3,#+1
??GPIO_Init_8:
        CMP      R3,#+8
        BCC.N    ??GPIO_Init_9
        STR      R4,[R0, #+4]
??GPIO_Init_7:
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_StructInit:
        MOVW     R1,#+65535
        STRH     R1,[R0, #+0]
        MOVS     R1,#+2
        STRB     R1,[R0, #+2]
        MOVS     R1,#+4
        STRB     R1,[R0, #+3]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ReadInputDataBit:
        MOVS     R2,R0
        MOVS     R0,#+0
        LDR      R2,[R2, #+8]
        ANDS     R1,R1,R2
        MOVS     R2,R1
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        SUBS     R2,R2,#+1
        SBCS     R2,R2,R2
        MVNS     R2,R2
        LSRS     R2,R2,#+31
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ReadInputData:
        LDR      R0,[R0, #+8]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ReadOutputDataBit:
        MOVS     R2,R0
        MOVS     R0,#+0
        LDR      R2,[R2, #+12]
        ANDS     R1,R1,R2
        MOVS     R2,R1
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        SUBS     R2,R2,#+1
        SBCS     R2,R2,R2
        MVNS     R2,R2
        LSRS     R2,R2,#+31
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ReadOutputData:
        LDR      R0,[R0, #+12]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_SetBits:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ResetBits:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_WriteBit:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??GPIO_WriteBit_0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+16]
        B.N      ??GPIO_WriteBit_1
??GPIO_WriteBit_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+20]
??GPIO_WriteBit_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_Write:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_PinLockConfig:
        MOVS     R2,#+65536
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R2,R1,R2
        STR      R2,[R0, #+24]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+24]
        STR      R2,[R0, #+24]
        LDR      R2,[R0, #+24]
        LDR      R0,[R0, #+24]
        MOVS     R2,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
GPIO_EventOutputConfig:
        MOVS     R2,#+0
        LDR.N    R3,??GPIO_EventOutputConfig_0  ;; 0x40010000
        LDR      R3,[R3, #+0]
        MOVS     R2,R3
        MOVW     R3,#+65408
        ANDS     R2,R3,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R2,R2,R0, LSL #+4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R2,R1,R2
        LDR.N    R0,??GPIO_EventOutputConfig_0  ;; 0x40010000
        STR      R2,[R0, #+0]
        BX       LR               ;; return
        Nop      
        DATA
??GPIO_EventOutputConfig_0:
        DC32     0x40010000

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
GPIO_EventOutputCmd:
        LDR.N    R1,??GPIO_EventOutputCmd_0  ;; 0x4220001c
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??GPIO_EventOutputCmd_0:
        DC32     0x4220001c

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
GPIO_PinRemapConfig:
        PUSH     {R3-R6}
        MOVS     R2,#+0
        MOVS     R4,#+0
        MOVS     R3,#+0
        MOVS     R5,#+0
        LDR.N    R6,??GPIO_PinRemapConfig_0  ;; 0x40010004
        LDR      R6,[R6, #+0]
        MOVS     R3,R6
        ANDS     R6,R0,#0xF0000
        LSRS     R6,R6,#+16
        MOVS     R5,R6
        UXTH     R6,R0            ;; ZeroExt  R6,R0,#+16,#+16
        MOVS     R2,R6
        ANDS     R6,R0,#0x300000
        CMP      R6,#+3145728
        BNE.N    ??GPIO_PinRemapConfig_1
        BICS     R3,R3,#0xF000000
        LDR.N    R4,??GPIO_PinRemapConfig_0  ;; 0x40010004
        LDR      R4,[R4, #+0]
        BICS     R4,R4,#0xF000000
        LDR.N    R5,??GPIO_PinRemapConfig_0  ;; 0x40010004
        STR      R4,[R5, #+0]
        B.N      ??GPIO_PinRemapConfig_2
??GPIO_PinRemapConfig_1:
        TST      R0,#0x100000
        BEQ.N    ??GPIO_PinRemapConfig_3
        MOVS     R4,#+3
        LSLS     R4,R4,R5
        MVNS     R4,R4
        ANDS     R3,R4,R3
        ORRS     R3,R3,#0xF000000
        B.N      ??GPIO_PinRemapConfig_4
??GPIO_PinRemapConfig_3:
        LSRS     R4,R0,#+21
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R4,R4,#+4
        LSLS     R4,R2,R4
        MVNS     R4,R4
        ANDS     R3,R4,R3
        ORRS     R3,R3,#0xF000000
??GPIO_PinRemapConfig_4:
??GPIO_PinRemapConfig_2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??GPIO_PinRemapConfig_5
        LSRS     R0,R0,#+21
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R0,R0,#+4
        LSLS     R0,R2,R0
        ORRS     R3,R0,R3
??GPIO_PinRemapConfig_5:
        LDR.N    R0,??GPIO_PinRemapConfig_0  ;; 0x40010004
        STR      R3,[R0, #+0]
        POP      {R0,R4-R6}
        BX       LR               ;; return
        DATA
??GPIO_PinRemapConfig_0:
        DC32     0x40010004

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
GPIO_EXTILineConfig:
        PUSH     {R3,R4}
        MOVS     R2,#+0
        MOVS     R3,#+15
        ANDS     R4,R1,#0x3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R4,R4,#+2
        LSLS     R3,R3,R4
        MOVS     R2,R3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ASRS     R3,R1,#+2
        LDR.N    R4,??GPIO_EXTILineConfig_0  ;; 0x40010008
        LDR      R3,[R4, R3, LSL #+2]
        MVNS     R2,R2
        ANDS     R2,R2,R3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ASRS     R3,R1,#+2
        LDR.N    R4,??GPIO_EXTILineConfig_0  ;; 0x40010008
        STR      R2,[R4, R3, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ASRS     R2,R1,#+2
        LDR.N    R3,??GPIO_EXTILineConfig_0  ;; 0x40010008
        LDR      R2,[R3, R2, LSL #+2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ANDS     R3,R1,#0x3
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LSLS     R3,R3,#+2
        LSLS     R0,R0,R3
        ORRS     R0,R0,R2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ASRS     R1,R1,#+2
        LDR.N    R2,??GPIO_EXTILineConfig_0  ;; 0x40010008
        STR      R0,[R2, R1, LSL #+2]
        POP      {R0,R4}
        BX       LR               ;; return
        DATA
??GPIO_EXTILineConfig_0:
        DC32     0x40010008

        END
// 
// 814 bytes in section .text
// 
// 814 bytes of CODE memory
//
//Errors: none
//Warnings: none
