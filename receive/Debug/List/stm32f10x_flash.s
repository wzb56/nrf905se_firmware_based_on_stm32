///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.0.51174/W32 for ARM    28/May/2011  10:37:11 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\253642xvvn\桌面\nrf905se\bigb /
//                    oard\send6\library\src\stm32f10x_flash.c                /
//    Command line =  "C:\Documents and Settings\253642xvvn\桌面\nrf905se\big /
//                    board\send6\library\src\stm32f10x_flash.c" -lC          /
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
//                    oard\send6\Debug\List\stm32f10x_flash.s                 /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f10x_flash

        PUBLIC FLASH_HalfCycleAccessCmd
        PUBLIC FLASH_PrefetchBufferCmd
        PUBLIC FLASH_SetLatency


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_SetLatency:
        LDR.N    R1,??DataTable11  ;; 0x40022000
        LDR      R1,[R1, #+0]
        ANDS     R1,R1,#0x38
        LDR.N    R2,??DataTable11  ;; 0x40022000
        STR      R1,[R2, #+0]
        LDR.N    R1,??DataTable11  ;; 0x40022000
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable11  ;; 0x40022000
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_HalfCycleAccessCmd:
        LDR.N    R1,??DataTable11  ;; 0x40022000
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x8
        LDR.N    R2,??DataTable11  ;; 0x40022000
        STR      R1,[R2, #+0]
        LDR.N    R1,??DataTable11  ;; 0x40022000
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable11  ;; 0x40022000
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_PrefetchBufferCmd:
        LDR.N    R1,??DataTable11  ;; 0x40022000
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x10
        LDR.N    R2,??DataTable11  ;; 0x40022000
        STR      R1,[R2, #+0]
        LDR.N    R1,??DataTable11  ;; 0x40022000
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable11  ;; 0x40022000
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11:
        DC32     0x40022000

        END
// 
// 76 bytes in section .text
// 
// 76 bytes of CODE memory
//
//Errors: none
//Warnings: none
