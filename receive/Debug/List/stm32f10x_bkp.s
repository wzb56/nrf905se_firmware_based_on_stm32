///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.0.51174/W32 for ARM    21/May/2011  19:21:00 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\253642xvvn\桌面\IAR\2.4G_send /
//                    \FWLib\library\src\stm32f10x_bkp.c                      /
//    Command line =  "C:\Documents and Settings\253642xvvn\桌面\IAR\2.4G_sen /
//                    d\FWLib\library\src\stm32f10x_bkp.c" -lC "C:\Documents  /
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
//                    \Demo\project\test\Debug\List\stm32f10x_bkp.s           /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f10x_bkp

        EXTERN RCC_BackupResetCmd

        PUBLIC BKP_ClearFlag
        PUBLIC BKP_ClearITPendingBit
        PUBLIC BKP_DeInit
        PUBLIC BKP_GetFlagStatus
        PUBLIC BKP_GetITStatus
        PUBLIC BKP_ITConfig
        PUBLIC BKP_RTCOutputConfig
        PUBLIC BKP_ReadBackupRegister
        PUBLIC BKP_SetRTCCalibrationValue
        PUBLIC BKP_TamperPinCmd
        PUBLIC BKP_TamperPinLevelConfig
        PUBLIC BKP_WriteBackupRegister


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_DeInit:
        PUSH     {R7,LR}
        MOVS     R0,#+1
        BL       RCC_BackupResetCmd
        MOVS     R0,#+0
        BL       RCC_BackupResetCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
BKP_TamperPinLevelConfig:
        LDR.N    R1,??BKP_TamperPinLevelConfig_0  ;; 0x420d8604
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??BKP_TamperPinLevelConfig_0:
        DC32     0x420d8604

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
BKP_TamperPinCmd:
        LDR.N    R1,??BKP_TamperPinCmd_0  ;; 0x420d8600
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??BKP_TamperPinCmd_0:
        DC32     0x420d8600

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
BKP_ITConfig:
        LDR.N    R1,??BKP_ITConfig_0  ;; 0x420d8688
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??BKP_ITConfig_0:
        DC32     0x420d8688

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_RTCOutputConfig:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable3  ;; 0x40006c2c
        LDRH     R2,[R2, #+0]
        MOVS     R1,R2
        MOVW     R2,#+64639
        ANDS     R1,R2,R1
        ORRS     R1,R0,R1
        LDR.N    R0,??DataTable3  ;; 0x40006c2c
        STRH     R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_SetRTCCalibrationValue:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable3  ;; 0x40006c2c
        LDRH     R2,[R2, #+0]
        MOVS     R1,R2
        MOVW     R2,#+65408
        ANDS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R1,R0,R1
        LDR.N    R0,??DataTable3  ;; 0x40006c2c
        STRH     R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3:
        DC32     0x40006c2c

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_WriteBackupRegister:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.N    R2,??DataTable5  ;; 0x40006c00
        STRH     R1,[R2, R0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_ReadBackupRegister:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.N    R1,??DataTable5  ;; 0x40006c00
        LDRH     R0,[R1, R0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable5:
        DC32     0x40006c00

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
BKP_GetFlagStatus:
        LDR.N    R0,??BKP_GetFlagStatus_0  ;; 0x420d86a0
        LDR      R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
        DATA
??BKP_GetFlagStatus_0:
        DC32     0x420d86a0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_ClearFlag:
        LDR.N    R0,??DataTable9  ;; 0x40006c34
        LDRH     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable9  ;; 0x40006c34
        STRH     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
BKP_GetITStatus:
        LDR.N    R0,??BKP_GetITStatus_0  ;; 0x420d86a4
        LDR      R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
        DATA
??BKP_GetITStatus_0:
        DC32     0x420d86a4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_ClearITPendingBit:
        LDR.N    R0,??DataTable9  ;; 0x40006c34
        LDRH     R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable9  ;; 0x40006c34
        STRH     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable9:
        DC32     0x40006c34

        END
// 
// 180 bytes in section .text
// 
// 180 bytes of CODE memory
//
//Errors: none
//Warnings: none
