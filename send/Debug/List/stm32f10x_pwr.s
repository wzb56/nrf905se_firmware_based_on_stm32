///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.0.51174/W32 for ARM    21/May/2011  19:21:00 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\253642xvvn\桌面\IAR\2.4G_send /
//                    \FWLib\library\src\stm32f10x_pwr.c                      /
//    Command line =  "C:\Documents and Settings\253642xvvn\桌面\IAR\2.4G_sen /
//                    d\FWLib\library\src\stm32f10x_pwr.c" -lC "C:\Documents  /
//                    and Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project /
//                    \test\Debug\List\" -lb "C:\Documents and                /
//                    Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project\tes /
//                    t\Debug\List\" -o "C:\Documents and                     /
//                    Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project\tes /
//                    t\Debug\Obj\" --no_cse --no_unroll --no_inline          /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "D:\Program Files\IAR Systems\Embedded Workbench        /
//                    5.4\arm\INC\DLib_Config_Full.h" -I "C:\Documents and    /
//                    Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project\tes /
//                    t\FWLib\library\inc\" -I "C:\Documents and              /
//                    Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project\tes /
//                    t\board\" -I "C:\Documents and                          /
//                    Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project\tes /
//                    t\app\" -I "D:\Program Files\IAR Systems\Embedded       /
//                    Workbench 5.4\arm\INC\" -Ol                             /
//    List file    =  C:\Documents and Settings\253642xvvn\桌面\IAR\2.4G_send /
//                    \Demo\project\test\Debug\List\stm32f10x_pwr.s           /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f10x_pwr

        EXTERN RCC_APB1PeriphResetCmd
        EXTERN __WFE
        EXTERN __WFI

        PUBLIC PWR_BackupAccessCmd
        PUBLIC PWR_ClearFlag
        PUBLIC PWR_DeInit
        PUBLIC PWR_EnterSTANDBYMode
        PUBLIC PWR_EnterSTOPMode
        PUBLIC PWR_GetFlagStatus
        PUBLIC PWR_PVDCmd
        PUBLIC PWR_PVDLevelConfig
        PUBLIC PWR_WakeUpPinCmd


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_DeInit:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+268435456
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+268435456
        BL       RCC_APB1PeriphResetCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
PWR_BackupAccessCmd:
        LDR.N    R1,??PWR_BackupAccessCmd_0  ;; 0x420e0020
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??PWR_BackupAccessCmd_0:
        DC32     0x420e0020

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
PWR_PVDCmd:
        LDR.N    R1,??PWR_PVDCmd_0  ;; 0x420e0010
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??PWR_PVDCmd_0:
        DC32     0x420e0010

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_PVDLevelConfig:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable13  ;; 0x40007000
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        BICS     R1,R1,#0xE0
        ORRS     R1,R0,R1
        LDR.N    R0,??DataTable13  ;; 0x40007000
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
PWR_WakeUpPinCmd:
        LDR.N    R1,??PWR_WakeUpPinCmd_0  ;; 0x420e00a0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??PWR_WakeUpPinCmd_0:
        DC32     0x420e00a0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_EnterSTOPMode:
        PUSH     {R7,LR}
        MOVS     R2,#+0
        LDR.N    R3,??DataTable13  ;; 0x40007000
        LDR      R3,[R3, #+0]
        MOVS     R2,R3
        MOVS     R3,#+3
        BICS     R2,R2,R3
        ORRS     R2,R0,R2
        LDR.N    R0,??DataTable13  ;; 0x40007000
        STR      R2,[R0, #+0]
        LDR.N    R0,??DataTable11  ;; 0xe000ed10
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R2,??DataTable11  ;; 0xe000ed10
        STR      R0,[R2, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BNE.N    ??PWR_EnterSTOPMode_0
        BL       __WFI
        B.N      ??PWR_EnterSTOPMode_1
??PWR_EnterSTOPMode_0:
        BL       __WFE
??PWR_EnterSTOPMode_1:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_EnterSTANDBYMode:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable13  ;; 0x40007000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable13  ;; 0x40007000
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable13  ;; 0x40007000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable13  ;; 0x40007000
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable11  ;; 0xe000ed10
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable11  ;; 0xe000ed10
        STR      R0,[R1, #+0]
        BL       __WFI
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11:
        DC32     0xe000ed10

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
PWR_GetFlagStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR.N    R2,??PWR_GetFlagStatus_0  ;; 0x40007004
        LDR      R2,[R2, #+0]
        ANDS     R1,R1,R2
        SUBS     R1,R1,#+1
        SBCS     R1,R1,R1
        MVNS     R1,R1
        LSRS     R1,R1,#+31
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
        DATA
??PWR_GetFlagStatus_0:
        DC32     0x40007004

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_ClearFlag:
        LDR.N    R1,??DataTable13  ;; 0x40007000
        LDR      R1,[R1, #+0]
        ORRS     R0,R1,R0, LSL #+2
        LDR.N    R1,??DataTable13  ;; 0x40007000
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable13:
        DC32     0x40007000

        END
// 
// 224 bytes in section .text
// 
// 224 bytes of CODE memory
//
//Errors: none
//Warnings: none
