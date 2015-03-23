///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.0.51174/W32 for ARM    21/May/2011  19:21:01 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\253642xvvn\桌面\IAR\2.4G_send /
//                    \FWLib\library\src\stm32f10x_rtc.c                      /
//    Command line =  "C:\Documents and Settings\253642xvvn\桌面\IAR\2.4G_sen /
//                    d\FWLib\library\src\stm32f10x_rtc.c" -lC "C:\Documents  /
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
//                    \Demo\project\test\Debug\List\stm32f10x_rtc.s           /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f10x_rtc

        PUBLIC RTC_ClearFlag
        PUBLIC RTC_ClearITPendingBit
        PUBLIC RTC_EnterConfigMode
        PUBLIC RTC_ExitConfigMode
        PUBLIC RTC_GetCounter
        PUBLIC RTC_GetDivider
        PUBLIC RTC_GetFlagStatus
        PUBLIC RTC_GetITStatus
        PUBLIC RTC_ITConfig
        PUBLIC RTC_SetAlarm
        PUBLIC RTC_SetCounter
        PUBLIC RTC_SetPrescaler
        PUBLIC RTC_WaitForLastTask
        PUBLIC RTC_WaitForSynchro


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_ITConfig:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RTC_ITConfig_0
        LDR.N    R1,??DataTable20  ;; 0x40002800
        LDRH     R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable20  ;; 0x40002800
        STRH     R0,[R1, #+0]
        B.N      ??RTC_ITConfig_1
??RTC_ITConfig_0:
        LDR.N    R1,??DataTable20  ;; 0x40002800
        LDRH     R1,[R1, #+0]
        MVNS     R0,R0
        ANDS     R0,R0,R1
        LDR.N    R1,??DataTable20  ;; 0x40002800
        STRH     R0,[R1, #+0]
??RTC_ITConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_EnterConfigMode:
        LDR.N    R0,??DataTable22  ;; 0x40002804
        LDRH     R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable22  ;; 0x40002804
        STRH     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_ExitConfigMode:
        LDR.N    R0,??DataTable22  ;; 0x40002804
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+65519
        ANDS     R0,R1,R0
        LDR.N    R1,??DataTable22  ;; 0x40002804
        STRH     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_GetCounter:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable11  ;; 0x4000281c
        LDRH     R1,[R1, #+0]
        MOVS     R0,R1
        LDR.N    R1,??DataTable10  ;; 0x40002818
        LDRH     R1,[R1, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ORRS     R0,R0,R1, LSL #+16
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_SetCounter:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       RTC_EnterConfigMode
        LSRS     R0,R4,#+16
        LDR.N    R1,??DataTable10  ;; 0x40002818
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable11  ;; 0x4000281c
        STRH     R4,[R0, #+0]
        BL       RTC_ExitConfigMode
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable10:
        DC32     0x40002818

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11:
        DC32     0x4000281c

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
RTC_SetPrescaler:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       RTC_EnterConfigMode
        ANDS     R0,R4,#0xF0000
        LSRS     R0,R0,#+16
        LDR.N    R1,??RTC_SetPrescaler_0  ;; 0x40002808
        STRH     R0,[R1, #+0]
        LDR.N    R0,??RTC_SetPrescaler_0+0x4  ;; 0x4000280c
        STRH     R4,[R0, #+0]
        BL       RTC_ExitConfigMode
        POP      {R4,PC}          ;; return
        DATA
??RTC_SetPrescaler_0:
        DC32     0x40002808
        DC32     0x4000280c

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
RTC_SetAlarm:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       RTC_EnterConfigMode
        LSRS     R0,R4,#+16
        LDR.N    R1,??RTC_SetAlarm_0  ;; 0x40002820
        STRH     R0,[R1, #+0]
        LDR.N    R0,??RTC_SetAlarm_0+0x4  ;; 0x40002824
        STRH     R4,[R0, #+0]
        BL       RTC_ExitConfigMode
        POP      {R4,PC}          ;; return
        DATA
??RTC_SetAlarm_0:
        DC32     0x40002820
        DC32     0x40002824

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
RTC_GetDivider:
        MOVS     R0,#+0
        LDR.N    R1,??RTC_GetDivider_0  ;; 0x40002810
        LDRH     R1,[R1, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ANDS     R1,R1,#0xF
        LSLS     R1,R1,#+16
        MOVS     R0,R1
        LDR.N    R1,??RTC_GetDivider_0+0x4  ;; 0x40002814
        LDRH     R1,[R1, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R0,R1,R0
        BX       LR               ;; return
        Nop      
        DATA
??RTC_GetDivider_0:
        DC32     0x40002810
        DC32     0x40002814

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_WaitForLastTask:
??RTC_WaitForLastTask_0:
        LDR.N    R0,??DataTable22  ;; 0x40002804
        LDRH     R0,[R0, #+0]
        TST      R0,#0x20
        BEQ.N    ??RTC_WaitForLastTask_0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_WaitForSynchro:
        LDR.N    R0,??DataTable22  ;; 0x40002804
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+65527
        ANDS     R0,R1,R0
        LDR.N    R1,??DataTable22  ;; 0x40002804
        STRH     R0,[R1, #+0]
??RTC_WaitForSynchro_0:
        LDR.N    R0,??DataTable22  ;; 0x40002804
        LDRH     R0,[R0, #+0]
        TST      R0,#0x8
        BEQ.N    ??RTC_WaitForSynchro_0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_GetFlagStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR.N    R2,??DataTable22  ;; 0x40002804
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
RTC_ClearFlag:
        LDR.N    R1,??DataTable22  ;; 0x40002804
        LDRH     R1,[R1, #+0]
        MVNS     R0,R0
        ANDS     R0,R0,R1
        LDR.N    R1,??DataTable22  ;; 0x40002804
        STRH     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_GetITStatus:
        PUSH     {R7,LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR.N    R2,??DataTable22  ;; 0x40002804
        LDRH     R2,[R2, #+0]
        ANDS     R2,R1,R2
        MOVS     R0,R2
        LDR.N    R2,??DataTable20  ;; 0x40002800
        LDRH     R2,[R2, #+0]
        TST      R2,R1
        BEQ.N    ??RTC_GetITStatus_0
        MOVS     R1,R0
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        SUBS     R0,R0,#+1
        SBCS     R0,R0,R0
        MVNS     R0,R0
        LSRS     R0,R0,#+31
        B.N      ??RTC_GetITStatus_1
??RTC_GetITStatus_0:
        MOVS     R0,#+0
??RTC_GetITStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable20:
        DC32     0x40002800

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_ClearITPendingBit:
        LDR.N    R1,??DataTable22  ;; 0x40002804
        LDRH     R1,[R1, #+0]
        MVNS     R0,R0
        ANDS     R0,R0,R1
        LDR.N    R1,??DataTable22  ;; 0x40002804
        STRH     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable22:
        DC32     0x40002804

        END
// 
// 366 bytes in section .text
// 
// 366 bytes of CODE memory
//
//Errors: none
//Warnings: none
