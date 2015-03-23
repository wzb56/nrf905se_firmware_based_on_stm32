///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.0.51174/W32 for ARM    28/May/2011  10:37:10 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\253642xvvn\桌面\nrf905se\bigb /
//                    oard\send6\library\src\stm32f10x_systick.c              /
//    Command line =  "C:\Documents and Settings\253642xvvn\桌面\nrf905se\big /
//                    board\send6\library\src\stm32f10x_systick.c" -lC        /
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
//                    oard\send6\Debug\List\stm32f10x_systick.s               /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f10x_systick

        PUBLIC SysTick_CLKSourceConfig
        PUBLIC SysTick_CounterCmd
        PUBLIC SysTick_GetCounter
        PUBLIC SysTick_GetFlagStatus
        PUBLIC SysTick_ITConfig
        PUBLIC SysTick_SetReload


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SysTick_CLKSourceConfig:
        CMP      R0,#+4
        BNE.N    ??SysTick_CLKSourceConfig_0
        LDR.N    R0,??DataTable14  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable14  ;; 0xe000e010
        STR      R0,[R1, #+0]
        B.N      ??SysTick_CLKSourceConfig_1
??SysTick_CLKSourceConfig_0:
        LDR.N    R0,??DataTable14  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable14  ;; 0xe000e010
        STR      R0,[R1, #+0]
??SysTick_CLKSourceConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SysTick_SetReload:
        LDR.N    R1,??SysTick_SetReload_0  ;; 0xe000e014
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        Nop      
        DATA
??SysTick_SetReload_0:
        DC32     0xe000e014

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SysTick_CounterCmd:
        CMP      R0,#+1
        BNE.N    ??SysTick_CounterCmd_0
        LDR.N    R0,??DataTable14  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable14  ;; 0xe000e010
        STR      R0,[R1, #+0]
        B.N      ??SysTick_CounterCmd_1
??SysTick_CounterCmd_0:
        MVNS     R1,#+1
        CMP      R0,R1
        BNE.N    ??SysTick_CounterCmd_2
        LDR.N    R0,??DataTable14  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        BICS     R0,R0,R1
        LDR.N    R1,??DataTable14  ;; 0xe000e010
        STR      R0,[R1, #+0]
        B.N      ??SysTick_CounterCmd_3
??SysTick_CounterCmd_2:
        LDR.N    R0,??DataTable13  ;; 0xe000e018
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
??SysTick_CounterCmd_3:
??SysTick_CounterCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SysTick_ITConfig:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SysTick_ITConfig_0
        LDR.N    R0,??DataTable14  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable14  ;; 0xe000e010
        STR      R0,[R1, #+0]
        B.N      ??SysTick_ITConfig_1
??SysTick_ITConfig_0:
        LDR.N    R0,??DataTable14  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2
        LDR.N    R1,??DataTable14  ;; 0xe000e010
        STR      R0,[R1, #+0]
??SysTick_ITConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SysTick_GetCounter:
        LDR.N    R0,??DataTable13  ;; 0xe000e018
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable13:
        DC32     0xe000e018

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SysTick_GetFlagStatus:
        PUSH     {R3,R4}
        MOVS     R1,R0
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R0,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R4,R1,#+3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R3,R4
        CMP      R3,#+2
        BNE.N    ??SysTick_GetFlagStatus_0
        LDR.N    R0,??DataTable14  ;; 0xe000e010
        LDR      R2,[R0, #+0]
        B.N      ??SysTick_GetFlagStatus_1
??SysTick_GetFlagStatus_0:
        LDR.N    R0,??SysTick_GetFlagStatus_2  ;; 0xe000e01c
        LDR      R2,[R0, #+0]
??SysTick_GetFlagStatus_1:
        MOVS     R0,#+1
        LSLS     R0,R0,R1
        ANDS     R0,R0,R2
        SUBS     R0,R0,#+1
        SBCS     R0,R0,R0
        MVNS     R0,R0
        LSRS     R0,R0,#+31
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4}
        BX       LR               ;; return
        DATA
??SysTick_GetFlagStatus_2:
        DC32     0xe000e01c

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable14:
        DC32     0xe000e010

        END
// 
// 196 bytes in section .text
// 
// 196 bytes of CODE memory
//
//Errors: none
//Warnings: none
