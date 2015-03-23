///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.0.51174/W32 for ARM    28/May/2011  10:37:11 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\253642xvvn\桌面\nrf905se\bigb /
//                    oard\send6\library\src\stm32f10x_exti.c                 /
//    Command line =  "C:\Documents and Settings\253642xvvn\桌面\nrf905se\big /
//                    board\send6\library\src\stm32f10x_exti.c" -lC           /
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
//                    oard\send6\Debug\List\stm32f10x_exti.s                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f10x_exti

        PUBLIC EXTI_ClearFlag
        PUBLIC EXTI_ClearITPendingBit
        PUBLIC EXTI_DeInit
        PUBLIC EXTI_GenerateSWInterrupt
        PUBLIC EXTI_GetFlagStatus
        PUBLIC EXTI_GetITStatus
        PUBLIC EXTI_Init
        PUBLIC EXTI_StructInit


        SECTION `.text`:CODE:NOROOT(2)
        THUMB
EXTI_DeInit:
        LDR.N    R0,??DataTable25  ;; 0x40010400
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        LDR.N    R0,??DataTable8  ;; 0x40010404
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        LDR.N    R0,??DataTable16  ;; 0x40010408
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        LDR.N    R0,??DataTable18  ;; 0x4001040c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        LDR.N    R0,??DataTable27  ;; 0x40010414
        LDR.N    R1,??EXTI_DeInit_0  ;; 0x7ffff
        STR      R1,[R0, #+0]
        BX       LR               ;; return
        DATA
??EXTI_DeInit_0:
        DC32     0x7ffff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_Init:
        LDRB     R1,[R0, #+6]
        CMP      R1,#+0
        BEQ.N    ??EXTI_Init_0
        LDR.N    R1,??DataTable25  ;; 0x40010400
        LDR      R1,[R1, #+0]
        LDR      R2,[R0, #+0]
        MVNS     R2,R2
        ANDS     R1,R2,R1
        LDR.N    R2,??DataTable25  ;; 0x40010400
        STR      R1,[R2, #+0]
        LDR.N    R1,??DataTable8  ;; 0x40010404
        LDR      R1,[R1, #+0]
        LDR      R2,[R0, #+0]
        MVNS     R2,R2
        ANDS     R1,R2,R1
        LDR.N    R2,??DataTable8  ;; 0x40010404
        STR      R1,[R2, #+0]
        LDRB     R1,[R0, #+4]
        LDR.N    R2,??DataTable25  ;; 0x40010400
        LDR      R1,[R2, R1]
        LDR      R2,[R0, #+0]
        ORRS     R1,R2,R1
        LDRB     R2,[R0, #+4]
        LDR.N    R3,??DataTable25  ;; 0x40010400
        STR      R1,[R3, R2]
        LDR.N    R1,??DataTable16  ;; 0x40010408
        LDR      R1,[R1, #+0]
        LDR      R2,[R0, #+0]
        MVNS     R2,R2
        ANDS     R1,R2,R1
        LDR.N    R2,??DataTable16  ;; 0x40010408
        STR      R1,[R2, #+0]
        LDR.N    R1,??DataTable18  ;; 0x4001040c
        LDR      R1,[R1, #+0]
        LDR      R2,[R0, #+0]
        MVNS     R2,R2
        ANDS     R1,R2,R1
        LDR.N    R2,??DataTable18  ;; 0x4001040c
        STR      R1,[R2, #+0]
        LDRB     R1,[R0, #+5]
        CMP      R1,#+16
        BNE.N    ??EXTI_Init_1
        LDR.N    R1,??DataTable16  ;; 0x40010408
        LDR      R1,[R1, #+0]
        LDR      R2,[R0, #+0]
        ORRS     R1,R2,R1
        LDR.N    R2,??DataTable16  ;; 0x40010408
        STR      R1,[R2, #+0]
        LDR.N    R1,??DataTable18  ;; 0x4001040c
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable18  ;; 0x4001040c
        STR      R0,[R1, #+0]
        B.N      ??EXTI_Init_2
??EXTI_Init_1:
        LDRB     R1,[R0, #+5]
        LDR.N    R2,??DataTable25  ;; 0x40010400
        LDR      R1,[R2, R1]
        LDR      R2,[R0, #+0]
        ORRS     R1,R2,R1
        LDRB     R0,[R0, #+5]
        LDR.N    R2,??DataTable25  ;; 0x40010400
        STR      R1,[R2, R0]
??EXTI_Init_2:
        B.N      ??EXTI_Init_3
??EXTI_Init_0:
        LDRB     R1,[R0, #+4]
        LDR.N    R2,??DataTable25  ;; 0x40010400
        LDR      R1,[R2, R1]
        LDR      R2,[R0, #+0]
        MVNS     R2,R2
        ANDS     R1,R2,R1
        LDRB     R0,[R0, #+4]
        LDR.N    R2,??DataTable25  ;; 0x40010400
        STR      R1,[R2, R0]
??EXTI_Init_3:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable8:
        DC32     0x40010404

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable16:
        DC32     0x40010408

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable18:
        DC32     0x4001040c

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_StructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STRB     R1,[R0, #+4]
        MOVS     R1,#+12
        STRB     R1,[R0, #+5]
        MOVS     R1,#+0
        STRB     R1,[R0, #+6]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
EXTI_GenerateSWInterrupt:
        LDR.N    R1,??EXTI_GenerateSWInterrupt_0  ;; 0x40010410
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??EXTI_GenerateSWInterrupt_0  ;; 0x40010410
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??EXTI_GenerateSWInterrupt_0:
        DC32     0x40010410

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_GetFlagStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR.N    R2,??DataTable27  ;; 0x40010414
        LDR      R2,[R2, #+0]
        ANDS     R1,R1,R2
        SUBS     R1,R1,#+1
        SBCS     R1,R1,R1
        MVNS     R1,R1
        LSRS     R1,R1,#+31
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_ClearFlag:
        LDR.N    R1,??DataTable27  ;; 0x40010414
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_GetITStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R2,#+0
        LDR.N    R3,??DataTable25  ;; 0x40010400
        LDR      R3,[R3, #+0]
        ANDS     R3,R1,R3
        MOVS     R2,R3
        LDR.N    R3,??DataTable27  ;; 0x40010414
        LDR      R3,[R3, #+0]
        TST      R1,R3
        BEQ.N    ??EXTI_GetITStatus_0
        MOVS     R0,R2
        SUBS     R0,R0,#+1
        SBCS     R0,R0,R0
        MVNS     R0,R0
        LSRS     R0,R0,#+31
        B.N      ??EXTI_GetITStatus_1
??EXTI_GetITStatus_0:
        MOVS     R0,#+0
??EXTI_GetITStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable25:
        DC32     0x40010400

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_ClearITPendingBit:
        LDR.N    R1,??DataTable27  ;; 0x40010414
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable27:
        DC32     0x40010414

        END
// 
// 314 bytes in section .text
// 
// 314 bytes of CODE memory
//
//Errors: none
//Warnings: none
