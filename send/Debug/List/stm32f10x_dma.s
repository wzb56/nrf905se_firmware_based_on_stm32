///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.40.0.51500/W32 for ARM    28/Apr/2011  09:56:18 /
// Copyright (C) 1999-2009 IAR Systems AB.                                    /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\Administrator\桌面\2.4G\Demo\ /
//                    source\stm32f10x_dma.c                                  /
//    Command line =  "C:\Documents and Settings\Administrator\桌面\2.4G\Demo /
//                    \source\stm32f10x_dma.c" -lC "C:\Documents and          /
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
//                    project\EWARMv5\Debug\List\stm32f10x_dma.s              /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f10x_dma

        PUBLIC DMA_ClearFlag
        PUBLIC DMA_ClearITPendingBit
        PUBLIC DMA_Cmd
        PUBLIC DMA_DeInit
        PUBLIC DMA_GetCurrDataCounter
        PUBLIC DMA_GetFlagStatus
        PUBLIC DMA_GetITStatus
        PUBLIC DMA_ITConfig
        PUBLIC DMA_Init
        PUBLIC DMA_StructInit


        SECTION `.text`:CODE:NOROOT(2)
        THUMB
DMA_DeInit:
        LDR      R1,[R0, #+0]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        STR      R1,[R0, #+4]
        STR      R1,[R0, #+8]
        STR      R1,[R0, #+12]
        LDR.N    R1,??DataTable9  ;; 0x40020004
        LDR.N    R2,??DataTable8  ;; 0x40020404
        LDR.N    R3,??DMA_DeInit_0  ;; 0x40020008
        SUBS     R0,R0,R3
        BEQ.N    ??DMA_DeInit_1
        SUBS     R0,R0,#+20
        BEQ.N    ??DMA_DeInit_2
        SUBS     R0,R0,#+20
        BEQ.N    ??DMA_DeInit_3
        SUBS     R0,R0,#+20
        BEQ.N    ??DMA_DeInit_4
        SUBS     R0,R0,#+20
        BEQ.N    ??DMA_DeInit_5
        SUBS     R0,R0,#+20
        BEQ.N    ??DMA_DeInit_6
        SUBS     R0,R0,#+20
        BEQ.N    ??DMA_DeInit_7
        MOV      R3,#+904
        SUBS     R0,R0,R3
        BEQ.N    ??DMA_DeInit_8
        SUBS     R0,R0,#+20
        BEQ.N    ??DMA_DeInit_9
        SUBS     R0,R0,#+20
        BEQ.N    ??DMA_DeInit_10
        SUBS     R0,R0,#+20
        BEQ.N    ??DMA_DeInit_11
        SUBS     R0,R0,#+20
        BEQ.N    ??DMA_DeInit_12
        BX       LR
??DMA_DeInit_1:
        LDR      R0,[R1, #+0]
        ORR      R0,R0,#0xF
??DMA_DeInit_13:
        B.N      ??DMA_DeInit_14
??DMA_DeInit_2:
        LDR      R0,[R1, #+0]
        ORR      R0,R0,#0xF0
        B.N      ??DMA_DeInit_14
??DMA_DeInit_3:
        LDR      R0,[R1, #+0]
        ORR      R0,R0,#0xF00
??DMA_DeInit_14:
        STR      R0,[R1, #+0]
        BX       LR
??DMA_DeInit_4:
        LDR      R0,[R1, #+0]
        ORR      R0,R0,#0xF000
        B.N      ??DMA_DeInit_14
??DMA_DeInit_5:
        LDR      R0,[R1, #+0]
        ORR      R0,R0,#0xF0000
        B.N      ??DMA_DeInit_14
??DMA_DeInit_6:
        LDR      R0,[R1, #+0]
        ORR      R0,R0,#0xF00000
        B.N      ??DMA_DeInit_14
??DMA_DeInit_7:
        LDR      R0,[R1, #+0]
        ORR      R0,R0,#0xF000000
        B.N      ??DMA_DeInit_14
??DMA_DeInit_8:
        LDR      R0,[R2, #+0]
        ORR      R0,R0,#0xF
        B.N      ??DMA_DeInit_15
??DMA_DeInit_9:
        LDR      R0,[R2, #+0]
        ORR      R0,R0,#0xF0
        B.N      ??DMA_DeInit_15
??DMA_DeInit_10:
        LDR      R0,[R2, #+0]
        ORR      R0,R0,#0xF00
        B.N      ??DMA_DeInit_15
??DMA_DeInit_11:
        LDR      R0,[R2, #+0]
        ORR      R0,R0,#0xF000
        B.N      ??DMA_DeInit_15
??DMA_DeInit_12:
        LDR      R0,[R2, #+0]
        ORR      R0,R0,#0xF0000
??DMA_DeInit_15:
        STR      R0,[R2, #+0]
        BX       LR               ;; return
        Nop      
        DATA
??DMA_DeInit_0:
        DC32     0x40020008

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
DMA_Init:
        LDR      R2,[R0, #+0]
        LDR.N    R3,??DMA_Init_0  ;; 0xffff800f
        ANDS     R2,R3,R2
        LDR      R3,[R1, #+8]
        ORRS     R2,R3,R2
        LDR      R3,[R1, #+32]
        ORRS     R2,R3,R2
        LDR      R3,[R1, #+16]
        ORRS     R2,R3,R2
        LDR      R3,[R1, #+20]
        ORRS     R2,R3,R2
        LDR      R3,[R1, #+24]
        ORRS     R2,R3,R2
        LDR      R3,[R1, #+28]
        ORRS     R2,R3,R2
        LDR      R3,[R1, #+36]
        ORRS     R2,R3,R2
        LDR      R3,[R1, #+40]
        ORRS     R2,R3,R2
        STR      R2,[R0, #+0]
        LDR      R2,[R1, #+12]
        STR      R2,[R0, #+4]
        LDR      R2,[R1, #+0]
        STR      R2,[R0, #+8]
        LDR      R1,[R1, #+4]
        STR      R1,[R0, #+12]
        BX       LR               ;; return
        Nop      
        DATA
??DMA_Init_0:
        DC32     0xffff800f

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_StructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        STR      R1,[R0, #+4]
        STR      R1,[R0, #+8]
        STR      R1,[R0, #+12]
        STR      R1,[R0, #+16]
        STR      R1,[R0, #+20]
        STR      R1,[R0, #+24]
        STR      R1,[R0, #+28]
        STR      R1,[R0, #+32]
        STR      R1,[R0, #+36]
        STR      R1,[R0, #+40]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_Cmd:
        CMP      R1,#+0
        LDR      R1,[R0, #+0]
        ITEE     NE 
        ORRNE    R1,R1,#0x1
        LSREQ    R1,R1,#+1
        LSLEQ    R1,R1,#+1
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_ITConfig:
        CMP      R2,#+0
        LDR      R2,[R0, #+0]
        ITE      NE 
        ORRNE    R1,R1,R2
        BICEQ    R1,R2,R1
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_GetCurrDataCounter:
        LDR      R0,[R0, #+4]
        UXTH     R0,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_GetFlagStatus:
        LSLS     R1,R0,#+3
        ITE      MI 
        LDRMI.N  R1,??DataTable6  ;; 0x40020400
        LDRPL.N  R1,??DataTable7  ;; 0x40020000
        B.N      ?Subroutine0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_ClearFlag:
        LSLS     R1,R0,#+3
        ITE      MI 
        LDRMI.N  R1,??DataTable8  ;; 0x40020404
        LDRPL.N  R1,??DataTable9  ;; 0x40020004
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_GetITStatus:
        LSLS     R1,R0,#+3
        ITE      MI 
        LDRMI.N  R1,??DataTable6  ;; 0x40020400
        LDRPL.N  R1,??DataTable7  ;; 0x40020000
        REQUIRE ?Subroutine0
        ;; // Fall through to label ?Subroutine0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine0:
        LDR      R1,[R1, #+0]
        ANDS     R0,R0,R1
        BEQ.N    ??Subroutine0_0
        MOVS     R0,#+1
??Subroutine0_0:
        UXTB     R0,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable6:
        DC32     0x40020400

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable7:
        DC32     0x40020000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_ClearITPendingBit:
        LSLS     R1,R0,#+3
        ITE      MI 
        LDRMI.N  R1,??DataTable8  ;; 0x40020404
        LDRPL.N  R1,??DataTable9  ;; 0x40020004
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable8:
        DC32     0x40020404

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable9:
        DC32     0x40020004

        END
// 
// 380 bytes in section .text
// 
// 380 bytes of CODE memory
//
//Errors: none
//Warnings: none
