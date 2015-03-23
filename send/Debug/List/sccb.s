///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.40.0.51500/W32 for ARM    28/Apr/2011  09:50:58 /
// Copyright (C) 1999-2009 IAR Systems AB.                                    /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\Administrator\桌面\2.4G\Demo\ /
//                    source\sccb.c                                           /
//    Command line =  "C:\Documents and Settings\Administrator\桌面\2.4G\Demo /
//                    \source\sccb.c" -lC "C:\Documents and                   /
//                    Settings\Administrator\桌面\2.4G\Demo\project\EWARMv5\D /
//                    ebug\List\" -lb "C:\Documents and                       /
//                    Settings\Administrator\桌面\2.4G\Demo\project\EWARMv5\D /
//                    ebug\List\" -o "C:\Documents and                        /
//                    Settings\Administrator\桌面\2.4G\Demo\project\EWARMv5\D /
//                    ebug\Obj\" --debug --endian=little --cpu=Cortex-M3 -e   /
//                    --fpu=None --dlib_config "C:\Program Files\IAR          /
//                    Systems\Embedded Workbench                              /
//                    5.4_2\arm\INC\DLib_Config_Full.h" -I "C:\Documents and  /
//                    Settings\Administrator\桌面\2.4G\Demo\project\EWARMv5\. /
//                    .\..\include\" -I "C:\Documents and                     /
//                    Settings\Administrator\桌面\2.4G\Demo\project\EWARMv5\. /
//                    .\..\source\" -I "C:\Documents and                      /
//                    Settings\Administrator\桌面\2.4G\Demo\project\EWARMv5\. /
//                    .\..\..\FWLib\library\inc\" -I "C:\Documents and        /
//                    Settings\Administrator\桌面\2.4G\Demo\project\EWARMv5\. /
//                    .\..\..\USBLib\library\inc\" -I "C:\Documents and       /
//                    Settings\Administrator\桌面\2.4G\Demo\project\EWARMv5\. /
//                    .\..\fatfs\" -I "C:\Program Files\IAR Systems\Embedded  /
//                    Workbench 5.4_2\arm\INC\" -Ohz                          /
//    List file    =  C:\Documents and Settings\Administrator\桌面\2.4G\Demo\ /
//                    project\EWARMv5\Debug\List\sccb.s                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME sccb

        EXTERN GPIO_Init
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN delay_us

        PUBLIC SCCB_GPIO_Config
        PUBLIC SCCB_SID_GPIO_INPUT
        PUBLIC SCCB_SID_GPIO_OUTPUT
        PUBLIC SCCBreadByte
        PUBLIC SCCBwriteByte
        PUBLIC noAck
        PUBLIC startSCCB
        PUBLIC stopSCCB


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SCCB_GPIO_Config:
        PUSH     {R7,LR}
        BL       ?Subroutine4
??CrossCallReturnLabel_6:
        MOVS     R0,#+192
        B.N      ?Subroutine0

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SCCB_SID_GPIO_OUTPUT:
        PUSH     {R7,LR}
        BL       ?Subroutine4
??CrossCallReturnLabel_5:
        MOVS     R0,#+64
        REQUIRE ?Subroutine0
        ;; // Fall through to label ?Subroutine0

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine0:
        STRH     R0,[SP, #+0]
        MOVS     R0,#+16
        STRB     R0,[SP, #+3]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        REQUIRE ??Subroutine5_0
        ;; // Fall through to label ??Subroutine5_0

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
??Subroutine5_0:
        ADD      R1,SP,#+0
        LDR.N    R0,??Subroutine5_1  ;; 0x40011000
        BL       GPIO_Init
        POP      {R0,PC}          ;; return
        Nop      
        DATA
??Subroutine5_1:
        DC32     0x40011000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine4:
        MOVS     R1,#+1
        MOVS     R0,#+16
        B.W      RCC_APB2PeriphClockCmd

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SCCB_SID_GPIO_INPUT:
        PUSH     {R7,LR}
        BL       ?Subroutine4
??CrossCallReturnLabel_4:
        MOVS     R0,#+64
        STRH     R0,[SP, #+0]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        B.N      ??Subroutine5_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
startSCCB:
        PUSH     {R4,LR}
        BL       ?Subroutine2
??CrossCallReturnLabel_22:
        MOVS     R0,#+128
        BL       ??Subroutine2_0
??CrossCallReturnLabel_20:
        MOVS     R0,#+64
        STR      R0,[R4, #+4]
        BL       ??Subroutine6_0
??CrossCallReturnLabel_17:
        MOVS     R0,#+128
        B.N      ?Subroutine1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
stopSCCB:
        PUSH     {R4,LR}
        LDR.N    R4,??DataTable1  ;; 0x40011010
        MOVS     R0,#+64
        STR      R0,[R4, #+4]
        BL       ??Subroutine6_0
??CrossCallReturnLabel_16:
        MOVS     R0,#+128
        BL       ??Subroutine2_0
??CrossCallReturnLabel_19:
        MOVS     R0,#+64
        STR      R0,[R4, #+0]
        B.N      ??Subroutine1_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
noAck:
        PUSH     {R4,LR}
        BL       ?Subroutine2
??CrossCallReturnLabel_21:
        MOVS     R0,#+128
        BL       ??Subroutine2_0
??CrossCallReturnLabel_18:
        MOVS     R0,#+128
        STR      R0,[R4, #+4]
        BL       ??Subroutine6_0
??CrossCallReturnLabel_15:
        MOVS     R0,#+64
        REQUIRE ?Subroutine1
        ;; // Fall through to label ?Subroutine1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine1:
        STR      R0,[R4, #+4]
??Subroutine1_0:
        MOV      R0,#+800
        POP      {R4,LR}
        B.W      delay_us

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine2:
        LDR.N    R4,??DataTable1  ;; 0x40011010
        MOVS     R0,#+64
??Subroutine2_0:
        STR      R0,[R4, #+0]
        REQUIRE ??Subroutine6_0
        ;; // Fall through to label ??Subroutine6_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
??Subroutine6_0:
        MOV      R0,#+800
        B.W      delay_us

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1:
        DC32     0x40011010

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SCCBwriteByte:
        PUSH     {R4-R6,LR}
        MOV      R5,R0
        MOVS     R6,#+0
        LDR.N    R4,??DataTable3  ;; 0x40011008
??SCCBwriteByte_0:
        LSL      R0,R5,R6
        LSLS     R0,R0,#+24
        ITTEE    MI 
        MOVMI    R0,#+64
        STRMI    R0,[R4, #+8]
        MOVPL    R0,#+64
        STRPL    R0,[R4, #+12]
        BL       ??Subroutine6_0
??CrossCallReturnLabel_14:
        MOVS     R0,#+128
        STR      R0,[R4, #+8]
        BL       ??Subroutine6_0
??CrossCallReturnLabel_13:
        MOVS     R0,#+128
        STR      R0,[R4, #+12]
        BL       ??Subroutine6_0
??CrossCallReturnLabel_12:
        ADDS     R6,R6,#+1
        CMP      R6,#+8
        BLT.N    ??SCCBwriteByte_0
        MOVS     R0,#+100
        BL       delay_us
        BL       SCCB_SID_GPIO_INPUT
        BL       ?Subroutine3
??CrossCallReturnLabel_3:
        MOVS     R0,#+128
        STR      R0,[R4, #+8]
        BL       ?Subroutine3
??CrossCallReturnLabel_2:
        LDR      R5,[R4, #+0]
        MOVS     R0,#+128
        STR      R0,[R4, #+12]
        BL       ??Subroutine6_0
??CrossCallReturnLabel_11:
        BL       SCCB_SID_GPIO_OUTPUT
        BL       ??Subroutine6_0
??CrossCallReturnLabel_10:
        LSLS     R5,R5,#+24
        LSRS     R0,R5,#+30
        AND      R0,R0,#0x1
        EOR      R0,R0,#0x1
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SCCBreadByte:
        PUSH     {R4-R6,LR}
        MOVS     R4,#+0
        BL       SCCB_SID_GPIO_INPUT
        BL       ??Subroutine6_0
??CrossCallReturnLabel_9:
        MOVS     R5,#+8
        LDR.N    R6,??DataTable3  ;; 0x40011008
??SCCBreadByte_0:
        BL       ??Subroutine6_0
??CrossCallReturnLabel_8:
        MOVS     R0,#+128
        STR      R0,[R6, #+8]
        BL       ?Subroutine3
??CrossCallReturnLabel_1:
        LSLS     R4,R4,#+25
        LSRS     R4,R4,#+24
        LDR      R0,[R6, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??SCCBreadByte_1
        ADDS     R4,R4,#+1
        UXTB     R4,R4
??SCCBreadByte_1:
        MOVS     R0,#+128
        STR      R0,[R6, #+12]
        BL       ??Subroutine6_0
??CrossCallReturnLabel_7:
        ADDS     R5,R5,#+255
        UXTB     R5,R5
        CMP      R5,#+1
        BGE.N    ??SCCBreadByte_0
        BL       SCCB_SID_GPIO_OUTPUT
        BL       ?Subroutine3
??CrossCallReturnLabel_0:
        MOV      R0,R4
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3:
        DC32     0x40011008

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine3:
        MOV      R0,#+500
        B.W      delay_us

        END
// 
// 366 bytes in section .text
// 
// 366 bytes of CODE memory
//
//Errors: none
//Warnings: none
