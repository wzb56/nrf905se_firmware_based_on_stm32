///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.0.51174/W32 for ARM    28/May/2011  10:37:10 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\253642xvvn\桌面\nrf905se\bigb /
//                    oard\send6\library\src\stm32f10x_usart.c                /
//    Command line =  "C:\Documents and Settings\253642xvvn\桌面\nrf905se\big /
//                    board\send6\library\src\stm32f10x_usart.c" -lC          /
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
//                    oard\send6\Debug\List\stm32f10x_usart.s                 /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f10x_usart

        EXTERN RCC_APB1PeriphResetCmd
        EXTERN RCC_APB2PeriphResetCmd
        EXTERN RCC_GetClocksFreq

        PUBLIC USART_ClearFlag
        PUBLIC USART_ClearITPendingBit
        PUBLIC USART_ClockInit
        PUBLIC USART_ClockStructInit
        PUBLIC USART_Cmd
        PUBLIC USART_DMACmd
        PUBLIC USART_DeInit
        PUBLIC USART_GetFlagStatus
        PUBLIC USART_GetITStatus
        PUBLIC USART_HalfDuplexCmd
        PUBLIC USART_ITConfig
        PUBLIC USART_Init
        PUBLIC USART_IrDACmd
        PUBLIC USART_IrDAConfig
        PUBLIC USART_LINBreakDetectLengthConfig
        PUBLIC USART_LINCmd
        PUBLIC USART_ReceiveData
        PUBLIC USART_ReceiverWakeUpCmd
        PUBLIC USART_SendBreak
        PUBLIC USART_SendData
        PUBLIC USART_SetAddress
        PUBLIC USART_SetGuardTime
        PUBLIC USART_SetPrescaler
        PUBLIC USART_SmartCardCmd
        PUBLIC USART_SmartCardNACKCmd
        PUBLIC USART_StructInit
        PUBLIC USART_WakeUpConfig


        SECTION `.text`:CODE:NOROOT(2)
        THUMB
USART_DeInit:
        PUSH     {R7,LR}
        LDR.N    R1,??USART_DeInit_0  ;; 0x40004400
        SUBS     R0,R0,R1
        BEQ.N    ??USART_DeInit_1
        MOV      R1,#+1024
        SUBS     R0,R0,R1
        BEQ.N    ??USART_DeInit_2
        MOV      R1,#+1024
        SUBS     R0,R0,R1
        BEQ.N    ??USART_DeInit_3
        MOV      R1,#+1024
        SUBS     R0,R0,R1
        BEQ.N    ??USART_DeInit_4
        MOV      R1,#+59392
        SUBS     R0,R0,R1
        BNE.N    ??USART_DeInit_5
??USART_DeInit_6:
        MOVS     R1,#+1
        MOV      R0,#+16384
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+16384
        BL       RCC_APB2PeriphResetCmd
        B.N      ??USART_DeInit_7
??USART_DeInit_1:
        MOVS     R1,#+1
        MOVS     R0,#+131072
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+131072
        BL       RCC_APB1PeriphResetCmd
        B.N      ??USART_DeInit_7
??USART_DeInit_2:
        MOVS     R1,#+1
        MOVS     R0,#+262144
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+262144
        BL       RCC_APB1PeriphResetCmd
        B.N      ??USART_DeInit_7
??USART_DeInit_3:
        MOVS     R1,#+1
        MOVS     R0,#+524288
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+524288
        BL       RCC_APB1PeriphResetCmd
        B.N      ??USART_DeInit_7
??USART_DeInit_4:
        MOVS     R1,#+1
        MOVS     R0,#+1048576
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+1048576
        BL       RCC_APB1PeriphResetCmd
        B.N      ??USART_DeInit_7
??USART_DeInit_5:
??USART_DeInit_7:
        POP      {R0,PC}          ;; return
        DATA
??USART_DeInit_0:
        DC32     0x40004400

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
USART_Init:
        PUSH     {R4-R9,LR}
        SUB      SP,SP,#+20
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R0,#+0
        MOVS     R6,#+0
        MOVS     R7,#+0
        MOVS     R8,#+0
        MOVS     R9,#+0
        MOV      R9,R5
        LDRH     R1,[R5, #+16]
        MOVS     R0,R1
        MOVW     R1,#+53247
        ANDS     R0,R1,R0
        LDRH     R1,[R4, #+6]
        ORRS     R0,R1,R0
        STRH     R0,[R5, #+16]
        LDRH     R0,[R5, #+12]
        MOVW     R1,#+59891
        ANDS     R0,R1,R0
        LDRH     R1,[R4, #+4]
        LDRH     R2,[R4, #+8]
        ORRS     R1,R2,R1
        LDRH     R2,[R4, #+10]
        ORRS     R1,R2,R1
        ORRS     R0,R1,R0
        STRH     R0,[R5, #+12]
        LDRH     R0,[R5, #+20]
        MOVW     R1,#+64767
        ANDS     R0,R1,R0
        LDRH     R1,[R4, #+12]
        ORRS     R0,R1,R0
        STRH     R0,[R5, #+20]
        ADD      R0,SP,#+0
        BL       RCC_GetClocksFreq
        LDR.N    R0,??USART_Init_0  ;; 0x40013800
        CMP      R9,R0
        BNE.N    ??USART_Init_1
        LDR      R6,[SP, #+12]
        B.N      ??USART_Init_2
??USART_Init_1:
        LDR      R6,[SP, #+8]
??USART_Init_2:
        MOVS     R0,#+25
        MULS     R0,R6,R0
        LDR      R1,[R4, #+0]
        LSLS     R1,R1,#+2
        UDIV     R7,R0,R1
        MOVS     R0,#+100
        UDIV     R0,R7,R0
        LSLS     R0,R0,#+4
        LSRS     R1,R0,#+4
        MOVS     R2,#+100
        MLS      R8,R1,R2,R7
        LSLS     R1,R8,#+4
        ADDS     R1,R1,#+50
        MOVS     R2,#+100
        UDIV     R1,R1,R2
        ANDS     R1,R1,#0xF
        ORRS     R0,R1,R0
        STRH     R0,[R5, #+8]
        ADD      SP,SP,#+20
        POP      {R4-R9,PC}       ;; return
        Nop      
        DATA
??USART_Init_0:
        DC32     0x40013800

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_StructInit:
        MOV      R1,#+9600
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
        MOVS     R1,#+0
        STRH     R1,[R0, #+8]
        MOVS     R1,#+12
        STRH     R1,[R0, #+10]
        MOVS     R1,#+0
        STRH     R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ClockInit:
        PUSH     {R3,R4}
        MOVS     R2,#+0
        LDRH     R3,[R0, #+16]
        MOVS     R2,R3
        MOVW     R3,#+61695
        ANDS     R2,R3,R2
        LDRH     R3,[R1, #+0]
        LDRH     R4,[R1, #+2]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+4]
        ORRS     R3,R4,R3
        LDRH     R1,[R1, #+6]
        ORRS     R1,R1,R3
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+16]
        POP      {R0,R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ClockStructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_Cmd_0
        LDRH     R1,[R0, #+12]
        ORRS     R1,R1,#0x2000
        STRH     R1,[R0, #+12]
        B.N      ??USART_Cmd_1
??USART_Cmd_0:
        LDRH     R1,[R0, #+12]
        BICS     R1,R1,#0x2000
        STRH     R1,[R0, #+12]
??USART_Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ITConfig:
        PUSH     {R3-R6}
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R6,#+0
        MOVS     R3,#+0
        MOVS     R3,R0
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R4,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ANDS     R0,R1,#0x1F
        MOVS     R5,R0
        MOVS     R0,#+1
        LSLS     R0,R0,R5
        MOVS     R6,R0
        CMP      R4,#+1
        BNE.N    ??USART_ITConfig_0
        ADDS     R3,R3,#+12
        B.N      ??USART_ITConfig_1
??USART_ITConfig_0:
        CMP      R4,#+2
        BNE.N    ??USART_ITConfig_2
        ADDS     R3,R3,#+16
        B.N      ??USART_ITConfig_3
??USART_ITConfig_2:
        ADDS     R3,R3,#+20
??USART_ITConfig_3:
??USART_ITConfig_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??USART_ITConfig_4
        LDR      R0,[R3, #+0]
        ORRS     R0,R6,R0
        STR      R0,[R3, #+0]
        B.N      ??USART_ITConfig_5
??USART_ITConfig_4:
        LDR      R0,[R3, #+0]
        MVNS     R1,R6
        ANDS     R0,R1,R0
        STR      R0,[R3, #+0]
??USART_ITConfig_5:
        POP      {R0,R4-R6}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_DMACmd:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??USART_DMACmd_0
        LDRH     R2,[R0, #+20]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+20]
        B.N      ??USART_DMACmd_1
??USART_DMACmd_0:
        LDRH     R2,[R0, #+20]
        MVNS     R1,R1
        ANDS     R1,R1,R2
        STRH     R1,[R0, #+20]
??USART_DMACmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SetAddress:
        LDRH     R2,[R0, #+16]
        BICS     R2,R2,#0xF
        STRH     R2,[R0, #+16]
        LDRH     R2,[R0, #+16]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_WakeUpConfig:
        LDRH     R2,[R0, #+12]
        BICS     R2,R2,#0x800
        STRH     R2,[R0, #+12]
        LDRH     R2,[R0, #+12]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ReceiverWakeUpCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_ReceiverWakeUpCmd_0
        LDRH     R1,[R0, #+12]
        ORRS     R1,R1,#0x2
        STRH     R1,[R0, #+12]
        B.N      ??USART_ReceiverWakeUpCmd_1
??USART_ReceiverWakeUpCmd_0:
        LDRH     R1,[R0, #+12]
        BICS     R1,R1,#0x2
        STRH     R1,[R0, #+12]
??USART_ReceiverWakeUpCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_LINBreakDetectLengthConfig:
        LDRH     R2,[R0, #+16]
        BICS     R2,R2,#0x20
        STRH     R2,[R0, #+16]
        LDRH     R2,[R0, #+16]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_LINCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_LINCmd_0
        LDRH     R1,[R0, #+16]
        ORRS     R1,R1,#0x4000
        STRH     R1,[R0, #+16]
        B.N      ??USART_LINCmd_1
??USART_LINCmd_0:
        LDRH     R1,[R0, #+16]
        BICS     R1,R1,#0x4000
        STRH     R1,[R0, #+16]
??USART_LINCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SendData:
        LSLS     R1,R1,#+23
        LSRS     R1,R1,#+23
        STRH     R1,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ReceiveData:
        LDRH     R0,[R0, #+4]
        LSLS     R0,R0,#+23
        LSRS     R0,R0,#+23
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SendBreak:
        LDRH     R1,[R0, #+12]
        ORRS     R1,R1,#0x1
        STRH     R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SetGuardTime:
        LDRH     R2,[R0, #+24]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        STRH     R2,[R0, #+24]
        LDRH     R2,[R0, #+24]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R1,R2,R1, LSL #+8
        STRH     R1,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SetPrescaler:
        LDRH     R2,[R0, #+24]
        ANDS     R2,R2,#0xFF00
        STRH     R2,[R0, #+24]
        LDRH     R2,[R0, #+24]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SmartCardCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_SmartCardCmd_0
        LDRH     R1,[R0, #+20]
        ORRS     R1,R1,#0x20
        STRH     R1,[R0, #+20]
        B.N      ??USART_SmartCardCmd_1
??USART_SmartCardCmd_0:
        LDRH     R1,[R0, #+20]
        BICS     R1,R1,#0x20
        STRH     R1,[R0, #+20]
??USART_SmartCardCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SmartCardNACKCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_SmartCardNACKCmd_0
        LDRH     R1,[R0, #+20]
        ORRS     R1,R1,#0x10
        STRH     R1,[R0, #+20]
        B.N      ??USART_SmartCardNACKCmd_1
??USART_SmartCardNACKCmd_0:
        LDRH     R1,[R0, #+20]
        BICS     R1,R1,#0x10
        STRH     R1,[R0, #+20]
??USART_SmartCardNACKCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_HalfDuplexCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_HalfDuplexCmd_0
        LDRH     R1,[R0, #+20]
        ORRS     R1,R1,#0x8
        STRH     R1,[R0, #+20]
        B.N      ??USART_HalfDuplexCmd_1
??USART_HalfDuplexCmd_0:
        LDRH     R1,[R0, #+20]
        BICS     R1,R1,#0x8
        STRH     R1,[R0, #+20]
??USART_HalfDuplexCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_IrDAConfig:
        LDRH     R2,[R0, #+20]
        BICS     R2,R2,#0x4
        STRH     R2,[R0, #+20]
        LDRH     R2,[R0, #+20]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_IrDACmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_IrDACmd_0
        LDRH     R1,[R0, #+20]
        ORRS     R1,R1,#0x2
        STRH     R1,[R0, #+20]
        B.N      ??USART_IrDACmd_1
??USART_IrDACmd_0:
        LDRH     R1,[R0, #+20]
        BICS     R1,R1,#0x2
        STRH     R1,[R0, #+20]
??USART_IrDACmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_GetFlagStatus:
        MOVS     R2,R0
        MOVS     R0,#+0
        LDRH     R2,[R2, #+0]
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
USART_ClearFlag:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R1,R1
        STRH     R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_GetITStatus:
        PUSH     {R3-R6}
        MOVS     R2,R0
        MOVS     R4,#+0
        MOVS     R3,#+0
        MOVS     R5,#+0
        MOVS     R0,#+0
        MOVS     R6,R1
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSRS     R6,R6,#+5
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R5,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ANDS     R6,R1,#0x1F
        MOVS     R3,R6
        MOVS     R6,#+1
        LSLS     R3,R6,R3
        CMP      R5,#+1
        BNE.N    ??USART_GetITStatus_0
        LDRH     R0,[R2, #+12]
        ANDS     R3,R0,R3
        B.N      ??USART_GetITStatus_1
??USART_GetITStatus_0:
        CMP      R5,#+2
        BNE.N    ??USART_GetITStatus_2
        LDRH     R0,[R2, #+16]
        ANDS     R3,R0,R3
        B.N      ??USART_GetITStatus_3
??USART_GetITStatus_2:
        LDRH     R0,[R2, #+20]
        ANDS     R3,R0,R3
??USART_GetITStatus_3:
??USART_GetITStatus_1:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R4,R1,#+8
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,#+1
        LSLS     R4,R0,R4
        LDRH     R0,[R2, #+0]
        ANDS     R4,R0,R4
        CMP      R3,#+0
        BEQ.N    ??USART_GetITStatus_4
        MOVS     R0,R4
        SUBS     R0,R0,#+1
        SBCS     R0,R0,R0
        MVNS     R0,R0
        LSRS     R0,R0,#+31
        B.N      ??USART_GetITStatus_5
??USART_GetITStatus_4:
        MOVS     R0,#+0
??USART_GetITStatus_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R6}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ClearITPendingBit:
        MOVS     R2,#+0
        MOVS     R3,#+0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R1,R1,#+8
        MOVS     R2,R1
        MOVS     R1,#+1
        LSLS     R1,R1,R2
        MOVS     R3,R1
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MVNS     R1,R3
        STRH     R1,[R0, #+0]
        BX       LR               ;; return

        END
// 
// 966 bytes in section .text
// 
// 966 bytes of CODE memory
//
//Errors: none
//Warnings: none
