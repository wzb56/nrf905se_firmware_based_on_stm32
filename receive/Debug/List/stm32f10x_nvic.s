///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.0.51174/W32 for ARM    28/May/2011  10:37:10 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\253642xvvn\桌面\nrf905se\bigb /
//                    oard\send6\library\src\stm32f10x_nvic.c                 /
//    Command line =  "C:\Documents and Settings\253642xvvn\桌面\nrf905se\big /
//                    board\send6\library\src\stm32f10x_nvic.c" -lC           /
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
//                    oard\send6\Debug\List\stm32f10x_nvic.s                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f10x_nvic

        EXTERN __BASEPRICONFIG
        EXTERN __GetBASEPRI
        EXTERN __RESETFAULTMASK
        EXTERN __RESETPRIMASK
        EXTERN __SETFAULTMASK
        EXTERN __SETPRIMASK

        PUBLIC NVIC_BASEPRICONFIG
        PUBLIC NVIC_ClearIRQChannelPendingBit
        PUBLIC NVIC_ClearSystemHandlerPendingBit
        PUBLIC NVIC_DeInit
        PUBLIC NVIC_GenerateCoreReset
        PUBLIC NVIC_GenerateSystemReset
        PUBLIC NVIC_GetBASEPRI
        PUBLIC NVIC_GetCPUID
        PUBLIC NVIC_GetCurrentActiveHandler
        PUBLIC NVIC_GetCurrentPendingIRQChannel
        PUBLIC NVIC_GetFaultAddress
        PUBLIC NVIC_GetFaultHandlerSources
        PUBLIC NVIC_GetIRQChannelActiveBitStatus
        PUBLIC NVIC_GetIRQChannelPendingBitStatus
        PUBLIC NVIC_GetSystemHandlerActiveBitStatus
        PUBLIC NVIC_GetSystemHandlerPendingBitStatus
        PUBLIC NVIC_Init
        PUBLIC NVIC_PriorityGroupConfig
        PUBLIC NVIC_RESETFAULTMASK
        PUBLIC NVIC_RESETPRIMASK
        PUBLIC NVIC_SCBDeInit
        PUBLIC NVIC_SETFAULTMASK
        PUBLIC NVIC_SETPRIMASK
        PUBLIC NVIC_SetIRQChannelPendingBit
        PUBLIC NVIC_SetSystemHandlerPendingBit
        PUBLIC NVIC_SetVectorTable
        PUBLIC NVIC_StructInit
        PUBLIC NVIC_SystemHandlerConfig
        PUBLIC NVIC_SystemHandlerPriorityConfig
        PUBLIC NVIC_SystemLPConfig


        SECTION `.text`:CODE:NOROOT(2)
        THUMB
NVIC_DeInit:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable18  ;; 0xe000e180
        MOVS     R2,#-1
        STR      R2,[R1, #+0]
        LDR.N    R1,??NVIC_DeInit_0  ;; 0xe000e184
        MVNS     R2,#-268435456
        STR      R2,[R1, #+0]
        LDR.N    R1,??DataTable20  ;; 0xe000e280
        MOVS     R2,#-1
        STR      R2,[R1, #+0]
        LDR.N    R1,??NVIC_DeInit_0+0x4  ;; 0xe000e284
        MVNS     R2,#-268435456
        STR      R2,[R1, #+0]
        MOVS     R1,#+0
        MOVS     R0,R1
        B.N      ??NVIC_DeInit_1
??NVIC_DeInit_2:
        LDR.N    R1,??DataTable17  ;; 0xe000e400
        MOVS     R2,#+0
        STR      R2,[R1, R0, LSL #+2]
        ADDS     R0,R0,#+1
??NVIC_DeInit_1:
        CMP      R0,#+15
        BCC.N    ??NVIC_DeInit_2
        BX       LR               ;; return
        DATA
??NVIC_DeInit_0:
        DC32     0xe000e184
        DC32     0xe000e284

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
NVIC_SCBDeInit:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable42  ;; 0xe000ed04
        MOVS     R2,#+167772160
        STR      R2,[R1, #+0]
        LDR.N    R1,??DataTable22  ;; 0xe000ed08
        MOVS     R2,#+0
        STR      R2,[R1, #+0]
        LDR.N    R1,??DataTable33  ;; 0xe000ed0c
        LDR.N    R2,??DataTable13  ;; 0x5fa0000
        STR      R2,[R1, #+0]
        LDR.N    R1,??DataTable28  ;; 0xe000ed10
        MOVS     R2,#+0
        STR      R2,[R1, #+0]
        LDR.N    R1,??NVIC_SCBDeInit_0  ;; 0xe000ed14
        MOVS     R2,#+0
        STR      R2,[R1, #+0]
        MOVS     R1,#+0
        MOVS     R0,R1
        B.N      ??NVIC_SCBDeInit_1
??NVIC_SCBDeInit_2:
        LDR.N    R1,??DataTable37  ;; 0xe000ed18
        MOVS     R2,#+0
        STR      R2,[R1, R0, LSL #+2]
        ADDS     R0,R0,#+1
??NVIC_SCBDeInit_1:
        CMP      R0,#+3
        BCC.N    ??NVIC_SCBDeInit_2
        LDR.W    R0,??DataTable43  ;; 0xe000ed24
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        LDR.W    R0,??DataTable45  ;; 0xe000ed28
        MOVS     R1,#-1
        STR      R1,[R0, #+0]
        LDR.W    R0,??DataTable44  ;; 0xe000ed2c
        MOVS     R1,#-1
        STR      R1,[R0, #+0]
        LDR.W    R0,??DataTable46  ;; 0xe000ed30
        MOVS     R1,#-1
        STR      R1,[R0, #+0]
        BX       LR               ;; return
        DATA
??NVIC_SCBDeInit_0:
        DC32     0xe000ed14

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_PriorityGroupConfig:
        LDR.N    R1,??DataTable13  ;; 0x5fa0000
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable33  ;; 0xe000ed0c
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable13:
        DC32     0x5fa0000

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
NVIC_Init:
        PUSH     {R3-R6}
        MOVS     R1,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R5,#+15
        LDRB     R6,[R0, #+3]
        CMP      R6,#+0
        BEQ.N    ??NVIC_Init_0
        LDR.N    R1,??DataTable33  ;; 0xe000ed0c
        LDR      R1,[R1, #+0]
        ANDS     R1,R1,#0x700
        RSBS     R1,R1,#+1792
        LSRS     R1,R1,#+8
        RSBS     R4,R1,#+4
        LSRS     R5,R5,R1
        LDRB     R1,[R0, #+1]
        LSLS     R1,R1,R4
        LDRB     R2,[R0, #+2]
        ANDS     R2,R5,R2
        ORRS     R1,R2,R1
        LSLS     R1,R1,#+4
        LDRB     R2,[R0, #+0]
        ANDS     R2,R2,#0x3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+3
        LSLS     R1,R1,R2
        LDRB     R2,[R0, #+0]
        ASRS     R2,R2,#+2
        LDR.N    R3,??DataTable17  ;; 0xe000e400
        LDR      R2,[R3, R2, LSL #+2]
        MOVS     R3,#+255
        LDRB     R4,[R0, #+0]
        ANDS     R4,R4,#0x3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R4,R4,#+3
        LSLS     R3,R3,R4
        MVNS     R4,R3
        ANDS     R2,R4,R2
        ANDS     R1,R3,R1
        ORRS     R2,R1,R2
        LDRB     R1,[R0, #+0]
        ASRS     R1,R1,#+2
        LDR.N    R3,??DataTable17  ;; 0xe000e400
        STR      R2,[R3, R1, LSL #+2]
        LDRB     R1,[R0, #+0]
        ASRS     R1,R1,#+5
        LDR.N    R2,??NVIC_Init_1  ;; 0xe000e100
        MOVS     R3,#+1
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x1F
        LSLS     R0,R3,R0
        STR      R0,[R2, R1, LSL #+2]
        B.N      ??NVIC_Init_2
??NVIC_Init_0:
        LDRB     R1,[R0, #+0]
        ASRS     R1,R1,#+5
        LDR.N    R2,??DataTable18  ;; 0xe000e180
        MOVS     R3,#+1
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x1F
        LSLS     R0,R3,R0
        STR      R0,[R2, R1, LSL #+2]
??NVIC_Init_2:
        POP      {R0,R4-R6}
        BX       LR               ;; return
        Nop      
        DATA
??NVIC_Init_1:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable17:
        DC32     0xe000e400

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable18:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_StructInit:
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
        MOVS     R1,#+0
        STRB     R1,[R0, #+1]
        MOVS     R1,#+0
        STRB     R1,[R0, #+2]
        MOVS     R1,#+0
        STRB     R1,[R0, #+3]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_SETPRIMASK:
        PUSH     {R7,LR}
        BL       __SETPRIMASK
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_RESETPRIMASK:
        PUSH     {R7,LR}
        BL       __RESETPRIMASK
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_SETFAULTMASK:
        PUSH     {R7,LR}
        BL       __SETFAULTMASK
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_RESETFAULTMASK:
        PUSH     {R7,LR}
        BL       __RESETFAULTMASK
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_BASEPRICONFIG:
        PUSH     {R7,LR}
        LSLS     R0,R0,#+4
        BL       __BASEPRICONFIG
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_GetBASEPRI:
        PUSH     {R7,LR}
        BL       __GetBASEPRI
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
NVIC_GetCurrentPendingIRQChannel:
        LDR.N    R0,??DataTable42  ;; 0xe000ed04
        LDR      R0,[R0, #+0]
        LDR.N    R1,??NVIC_GetCurrentPendingIRQChannel_0  ;; 0x3ff000
        ANDS     R0,R1,R0
        LSRS     R0,R0,#+12
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
        Nop      
        DATA
??NVIC_GetCurrentPendingIRQChannel_0:
        DC32     0x3ff000

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
NVIC_GetIRQChannelPendingBitStatus:
        PUSH     {R3,R4}
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R2,#+0
        MOVS     R3,#+1
        ANDS     R4,R1,#0x1F
        LSLS     R3,R3,R4
        MOVS     R2,R3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ASRS     R1,R1,#+5
        LDR.N    R3,??NVIC_GetIRQChannelPendingBitStatus_0  ;; 0xe000e200
        LDR      R1,[R3, R1, LSL #+2]
        ANDS     R1,R2,R1
        CMP      R1,R2
        BNE.N    ??NVIC_GetIRQChannelPendingBitStatus_1
        MOVS     R0,#+1
        B.N      ??NVIC_GetIRQChannelPendingBitStatus_2
??NVIC_GetIRQChannelPendingBitStatus_1:
        MOVS     R0,#+0
??NVIC_GetIRQChannelPendingBitStatus_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4}
        BX       LR               ;; return
        Nop      
        DATA
??NVIC_GetIRQChannelPendingBitStatus_0:
        DC32     0xe000e200

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
NVIC_SetIRQChannelPendingBit:
        LDR.N    R1,??NVIC_SetIRQChannelPendingBit_0  ;; 0xe000ef00
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??NVIC_SetIRQChannelPendingBit_0:
        DC32     0xe000ef00

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_ClearIRQChannelPendingBit:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ASRS     R1,R0,#+5
        LDR.N    R2,??DataTable20  ;; 0xe000e280
        MOVS     R3,#+1
        ANDS     R0,R0,#0x1F
        LSLS     R0,R3,R0
        STR      R0,[R2, R1, LSL #+2]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable20:
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_GetCurrentActiveHandler:
        LDR.N    R0,??DataTable42  ;; 0xe000ed04
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+22
        LSRS     R0,R0,#+22
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
NVIC_GetIRQChannelActiveBitStatus:
        PUSH     {R3,R4}
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R2,#+0
        MOVS     R3,#+1
        ANDS     R4,R1,#0x1F
        LSLS     R3,R3,R4
        MOVS     R2,R3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ASRS     R1,R1,#+5
        LDR.N    R3,??NVIC_GetIRQChannelActiveBitStatus_0  ;; 0xe000e300
        LDR      R1,[R3, R1, LSL #+2]
        ANDS     R1,R2,R1
        CMP      R1,R2
        BNE.N    ??NVIC_GetIRQChannelActiveBitStatus_1
        MOVS     R0,#+1
        B.N      ??NVIC_GetIRQChannelActiveBitStatus_2
??NVIC_GetIRQChannelActiveBitStatus_1:
        MOVS     R0,#+0
??NVIC_GetIRQChannelActiveBitStatus_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4}
        BX       LR               ;; return
        Nop      
        DATA
??NVIC_GetIRQChannelActiveBitStatus_0:
        DC32     0xe000e300

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
NVIC_GetCPUID:
        LDR.N    R0,??NVIC_GetCPUID_0  ;; 0xe000ed00
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
        Nop      
        DATA
??NVIC_GetCPUID_0:
        DC32     0xe000ed00

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
NVIC_SetVectorTable:
        LDR.N    R2,??NVIC_SetVectorTable_0  ;; 0x1fffff80
        ANDS     R1,R2,R1
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable22  ;; 0xe000ed08
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??NVIC_SetVectorTable_0:
        DC32     0x1fffff80

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable22:
        DC32     0xe000ed08

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
NVIC_GenerateSystemReset:
        LDR.N    R0,??DataTable33  ;; 0xe000ed0c
        LDR.N    R1,??NVIC_GenerateSystemReset_0  ;; 0x5fa0004
        STR      R1,[R0, #+0]
        BX       LR               ;; return
        DATA
??NVIC_GenerateSystemReset_0:
        DC32     0x5fa0004

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
NVIC_GenerateCoreReset:
        LDR.N    R0,??DataTable33  ;; 0xe000ed0c
        LDR.N    R1,??NVIC_GenerateCoreReset_0  ;; 0x5fa0001
        STR      R1,[R0, #+0]
        BX       LR               ;; return
        DATA
??NVIC_GenerateCoreReset_0:
        DC32     0x5fa0001

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_SystemLPConfig:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??NVIC_SystemLPConfig_0
        LDR.N    R1,??DataTable28  ;; 0xe000ed10
        LDR      R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable28  ;; 0xe000ed10
        STR      R0,[R1, #+0]
        B.N      ??NVIC_SystemLPConfig_1
??NVIC_SystemLPConfig_0:
        LDR.N    R1,??DataTable28  ;; 0xe000ed10
        LDR      R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MVNS     R0,R0
        ANDS     R0,R0,R1
        LDR.N    R1,??DataTable28  ;; 0xe000ed10
        STR      R0,[R1, #+0]
??NVIC_SystemLPConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable28:
        DC32     0xe000ed10

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_SystemHandlerConfig:
        MOVS     R2,#+0
        MOVS     R3,#+1
        ANDS     R0,R0,#0x1F
        LSLS     R0,R3,R0
        MOVS     R2,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??NVIC_SystemHandlerConfig_0
        LDR.N    R0,??DataTable43  ;; 0xe000ed24
        LDR      R0,[R0, #+0]
        ORRS     R0,R2,R0
        LDR.N    R1,??DataTable43  ;; 0xe000ed24
        STR      R0,[R1, #+0]
        B.N      ??NVIC_SystemHandlerConfig_1
??NVIC_SystemHandlerConfig_0:
        LDR.N    R0,??DataTable43  ;; 0xe000ed24
        LDR      R0,[R0, #+0]
        MVNS     R1,R2
        ANDS     R0,R1,R0
        LDR.N    R1,??DataTable43  ;; 0xe000ed24
        STR      R0,[R1, #+0]
??NVIC_SystemHandlerConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_SystemHandlerPriorityConfig:
        PUSH     {R4-R7}
        MOVS     R5,#+0
        MOVS     R6,#+255
        MOVS     R3,#+0
        MOVS     R4,#+0
        LDR.N    R7,??DataTable33  ;; 0xe000ed0c
        LDR      R7,[R7, #+0]
        ANDS     R7,R7,#0x700
        RSBS     R7,R7,#+1792
        LSRS     R7,R7,#+8
        MOVS     R4,R7
        RSBS     R7,R4,#+4
        MOVS     R5,R7
        LSRS     R6,R6,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R4,R1,R5
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ANDS     R1,R6,R2
        ORRS     R4,R1,R4
        LSLS     R4,R4,#+4
        ANDS     R5,R0,#0xC0
        LSRS     R5,R5,#+6
        LSRS     R0,R0,#+8
        ANDS     R6,R0,#0x3
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R0,R0,#+3
        LSLS     R4,R4,R0
        MOVS     R0,#+255
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSLS     R1,R6,#+3
        LSLS     R0,R0,R1
        MOVS     R3,R0
        LDR.N    R0,??DataTable37  ;; 0xe000ed18
        LDR      R0,[R0, R5, LSL #+2]
        MVNS     R1,R3
        ANDS     R0,R1,R0
        LDR.N    R1,??DataTable37  ;; 0xe000ed18
        STR      R0,[R1, R5, LSL #+2]
        LDR.N    R0,??DataTable37  ;; 0xe000ed18
        LDR      R0,[R0, R5, LSL #+2]
        ORRS     R0,R4,R0
        LDR.N    R1,??DataTable37  ;; 0xe000ed18
        STR      R0,[R1, R5, LSL #+2]
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable33:
        DC32     0xe000ed0c

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable37:
        DC32     0xe000ed18

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_GetSystemHandlerPendingBitStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        LSRS     R1,R1,#+10
        MOVS     R3,R1
        ANDS     R3,R3,#0xF
        MOVS     R1,#+1
        LSLS     R3,R1,R3
        LDR.N    R1,??DataTable43  ;; 0xe000ed24
        LDR      R1,[R1, #+0]
        ANDS     R1,R3,R1
        MOVS     R2,R1
        CMP      R2,R3
        BNE.N    ??NVIC_GetSystemHandlerPendingBitStatus_0
        MOVS     R0,#+1
        B.N      ??NVIC_GetSystemHandlerPendingBitStatus_1
??NVIC_GetSystemHandlerPendingBitStatus_0:
        MOVS     R0,#+0
??NVIC_GetSystemHandlerPendingBitStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_SetSystemHandlerPendingBit:
        MOVS     R1,#+0
        ANDS     R0,R0,#0x1F
        MOVS     R1,R0
        LDR.N    R0,??DataTable42  ;; 0xe000ed04
        LDR      R0,[R0, #+0]
        MOVS     R2,#+1
        LSLS     R1,R2,R1
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable42  ;; 0xe000ed04
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_ClearSystemHandlerPendingBit:
        MOVS     R1,#+0
        ANDS     R0,R0,#0x1F
        MOVS     R1,R0
        LDR.N    R0,??DataTable42  ;; 0xe000ed04
        LDR      R0,[R0, #+0]
        MOVS     R2,#+1
        SUBS     R1,R1,#+1
        LSLS     R1,R2,R1
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable42  ;; 0xe000ed04
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable42:
        DC32     0xe000ed04

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_GetSystemHandlerActiveBitStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        LSRS     R1,R1,#+14
        ANDS     R1,R1,#0xF
        MOVS     R3,R1
        MOVS     R1,#+1
        LSLS     R3,R1,R3
        LDR.N    R1,??DataTable43  ;; 0xe000ed24
        LDR      R1,[R1, #+0]
        ANDS     R1,R3,R1
        MOVS     R2,R1
        CMP      R2,R3
        BNE.N    ??NVIC_GetSystemHandlerActiveBitStatus_0
        MOVS     R0,#+1
        B.N      ??NVIC_GetSystemHandlerActiveBitStatus_1
??NVIC_GetSystemHandlerActiveBitStatus_0:
        MOVS     R0,#+0
??NVIC_GetSystemHandlerActiveBitStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable43:
        DC32     0xe000ed24

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_GetFaultHandlerSources:
        PUSH     {R3,R4}
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        LSRS     R4,R1,#+18
        ANDS     R4,R4,#0x3
        MOVS     R2,R4
        LSRS     R1,R1,#+20
        ANDS     R1,R1,#0x3
        MOVS     R3,R1
        CMP      R2,#+0
        BNE.N    ??NVIC_GetFaultHandlerSources_0
        LDR.N    R0,??DataTable44  ;; 0xe000ed2c
        LDR      R0,[R0, #+0]
        B.N      ??NVIC_GetFaultHandlerSources_1
??NVIC_GetFaultHandlerSources_0:
        CMP      R2,#+1
        BNE.N    ??NVIC_GetFaultHandlerSources_2
        LDR.N    R0,??DataTable45  ;; 0xe000ed28
        LDR      R0,[R0, #+0]
        MOVS     R1,R3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+3
        LSRS     R0,R0,R1
        CMP      R3,#+2
        BEQ.N    ??NVIC_GetFaultHandlerSources_3
        ANDS     R0,R0,#0xF
        B.N      ??NVIC_GetFaultHandlerSources_4
??NVIC_GetFaultHandlerSources_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??NVIC_GetFaultHandlerSources_4:
        B.N      ??NVIC_GetFaultHandlerSources_5
??NVIC_GetFaultHandlerSources_2:
        LDR.N    R0,??DataTable46  ;; 0xe000ed30
        LDR      R0,[R0, #+0]
??NVIC_GetFaultHandlerSources_5:
??NVIC_GetFaultHandlerSources_1:
        POP      {R1,R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable44:
        DC32     0xe000ed2c

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable45:
        DC32     0xe000ed28

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable46:
        DC32     0xe000ed30

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
NVIC_GetFaultAddress:
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R2,#+0
        LSRS     R1,R1,#+22
        ANDS     R1,R1,#0x1
        MOVS     R2,R1
        CMP      R2,#+0
        BNE.N    ??NVIC_GetFaultAddress_0
        LDR.N    R0,??NVIC_GetFaultAddress_1  ;; 0xe000ed34
        LDR      R0,[R0, #+0]
        B.N      ??NVIC_GetFaultAddress_2
??NVIC_GetFaultAddress_0:
        LDR.N    R0,??NVIC_GetFaultAddress_1+0x4  ;; 0xe000ed38
        LDR      R0,[R0, #+0]
??NVIC_GetFaultAddress_2:
        BX       LR               ;; return
        Nop      
        DATA
??NVIC_GetFaultAddress_1:
        DC32     0xe000ed34
        DC32     0xe000ed38

        END
// 
// 1 126 bytes in section .text
// 
// 1 126 bytes of CODE memory
//
//Errors: none
//Warnings: none
