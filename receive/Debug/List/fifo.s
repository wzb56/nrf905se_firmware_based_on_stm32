///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.2.51295/W32 for ARM    11/Apr/2011  13:51:30 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\LiYang\Desktop\newest\Demo\source\fifo.c       /
//    Command line =  C:\Users\LiYang\Desktop\newest\Demo\source\fifo.c -lC   /
//                    C:\Users\LiYang\Desktop\newest\Demo\project\EWARMv5\Deb /
//                    ug\List\ -lb C:\Users\LiYang\Desktop\newest\Demo\projec /
//                    t\EWARMv5\Debug\List\ -o C:\Users\LiYang\Desktop\newest /
//                    \Demo\project\EWARMv5\Debug\Obj\ --debug                /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "E:\Program Files\IAR Systems\Embedded    /
//                    Workbench 5.4\arm\INC\DLib_Config_Full.h" -I            /
//                    C:\Users\LiYang\Desktop\newest\Demo\project\EWARMv5\..\ /
//                    ..\include\ -I C:\Users\LiYang\Desktop\newest\Demo\proj /
//                    ect\EWARMv5\..\..\source\ -I                            /
//                    C:\Users\LiYang\Desktop\newest\Demo\project\EWARMv5\..\ /
//                    ..\..\FWLib\library\inc\ -I                             /
//                    C:\Users\LiYang\Desktop\newest\Demo\project\EWARMv5\..\ /
//                    ..\..\USBLib\library\inc\ -I                            /
//                    C:\Users\LiYang\Desktop\newest\Demo\project\EWARMv5\..\ /
//                    ..\fatfs\ -I "E:\Program Files\IAR Systems\Embedded     /
//                    Workbench 5.4\arm\INC\" -Ohz                            /
//    List file    =  C:\Users\LiYang\Desktop\newest\Demo\project\EWARMv5\Deb /
//                    ug\List\fifo.s                                          /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME fifo

        EXTERN GPIO_Init
        EXTERN RCC_APB2PeriphClockCmd

        PUBLIC FIFO_GPIO_INPUT
        PUBLIC FIFO_Set_GPIO_Config


        SECTION `.text`:CODE:NOROOT(2)
        THUMB
FIFO_Set_GPIO_Config:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+8
        BL       RCC_APB2PeriphClockCmd
        MOV      R0,#+3840
        BL       ?Subroutine1
??CrossCallReturnLabel_0:
        LDR.N    R0,??DataTable1  ;; 0x40010c00
        BL       GPIO_Init
        MOVS     R1,#+1
        MOVS     R0,#+16
        BL       RCC_APB2PeriphClockCmd
        MOVS     R0,#+32
        BL       ?Subroutine1
??CrossCallReturnLabel_1:
        LDR.N    R0,??Subroutine0_0  ;; 0x40011000
        REQUIRE ?Subroutine0
        ;; // Fall through to label ?Subroutine0

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine0:
        BL       GPIO_Init
        POP      {R0,PC}          ;; return
        Nop      
        DATA
??Subroutine0_0:
        DC32     0x40011000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine1:
        STRH     R0,[SP, #+0]
        MOVS     R0,#+16
        STRB     R0,[SP, #+3]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        ADD      R1,SP,#+0
        BX       LR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FIFO_GPIO_INPUT:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+9
        BL       RCC_APB2PeriphClockCmd
        MOVS     R0,#+255
        STRH     R0,[SP, #+0]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable1  ;; 0x40010c00
        B.N      ?Subroutine0

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1:
        DC32     0x40010c00

        END
// 
// 110 bytes in section .text
// 
// 110 bytes of CODE memory
//
//Errors: none
//Warnings: none
