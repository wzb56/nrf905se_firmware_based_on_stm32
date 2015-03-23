///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.40.0.51500/W32 for ARM    28/Apr/2011  09:50:56 /
// Copyright (C) 1999-2009 IAR Systems AB.                                    /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\Administrator\桌面\2.4G\Demo\ /
//                    source\ILI9331.C                                        /
//    Command line =  "C:\Documents and Settings\Administrator\桌面\2.4G\Demo /
//                    \source\ILI9331.C" -lC "C:\Documents and                /
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
//                    project\EWARMv5\Debug\List\ILI9331.s                    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ILI9331

        EXTERN Delay
        EXTERN GPIO_Init
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN delay_ms
        EXTERN val_Speed

        PUBLIC BMP_write_english
        PUBLIC LCD_BL_GPIO_Config
        PUBLIC LCD_Clear
        PUBLIC LCD_GPIO_INPUT
        PUBLIC LCD_GPIO_OUTPUT
        PUBLIC LCD_Init
        PUBLIC LCD_RD_DATA16
        PUBLIC LCD_SetCursor
        PUBLIC LCD_Set_GPIO_Config
        PUBLIC LCD_WR_DATA16
        PUBLIC LCD_WR_REG
        PUBLIC LCD_WR_REG16
        PUBLIC LCD_write_SUM
        PUBLIC LCD_write_english
        PUBLIC LCD_write_english_string
        PUBLIC Lcd_SetBox
        PUBLIC Test
        PUBLIC english


        SECTION `.rodata`:CONST:NOROOT(2)
// unsigned char const english[95][16]
english:
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 60
        DC8 60, 60, 24, 24, 0, 24, 24, 0, 0, 0, 0, 0, 0, 0, 102, 102, 102, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 54, 54, 127, 54, 54, 54, 127, 54
        DC8 54, 0, 0, 0, 0, 0, 24, 24, 60, 102, 96, 48, 24, 12, 6, 102, 60, 24
        DC8 24, 0, 0, 0, 0, 112, 216, 218, 118, 12, 24, 48, 110, 91, 27, 14, 0
        DC8 0, 0, 0, 0, 0, 56, 108, 108, 56, 96, 111, 102, 102, 59, 0, 0, 0, 0
        DC8 0, 0, 0, 24, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 24
        DC8 24, 48, 48, 48, 48, 48, 24, 24, 12, 0, 0, 0, 0, 0, 48, 24, 24, 12
        DC8 12, 12, 12, 12, 24, 24, 48, 0, 0, 0, 0, 0, 0, 0, 54, 28, 127, 28
        DC8 54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 126, 24, 24, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 28, 12, 24, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 28, 28, 0, 0, 0, 0, 0, 0, 0, 6, 6, 12, 12, 24, 24, 48, 48, 96
        DC8 96, 0, 0, 0, 0, 0, 0, 30, 51, 55, 55, 51, 59, 59, 51, 30, 0, 0, 0
        DC8 0, 0, 0, 0, 12, 28, 124, 12, 12, 12, 12, 12, 12, 0, 0, 0, 0, 0, 0
        DC8 0, 60, 102, 102, 6, 12, 24, 48, 96, 126, 0, 0, 0, 0, 0, 0, 0, 60
        DC8 102, 102, 6, 28, 6, 102, 102, 60, 0, 0, 0, 0, 0, 0, 0, 48, 48, 54
        DC8 54, 54, 102, 127, 6, 6, 0, 0, 0, 0, 0, 0, 0, 126, 96, 96, 96, 124
        DC8 6, 6, 12, 120, 0, 0, 0, 0, 0, 0, 0, 28, 24, 48, 124, 102, 102, 102
        DC8 102, 60, 0, 0, 0, 0, 0, 0, 0, 126, 6, 12, 12, 24, 24, 48, 48, 48, 0
        DC8 0, 0, 0, 0, 0, 0, 60, 102, 102, 118, 60, 110, 102, 102, 60, 0, 0, 0
        DC8 0, 0, 0, 0, 60, 102, 102, 102, 102, 62, 12, 24, 56, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 28, 28, 0, 0, 0, 28, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28
        DC8 28, 0, 0, 0, 28, 28, 12, 24, 0, 0, 0, 0, 0, 6, 12, 24, 48, 96, 48
        DC8 24, 12, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 126, 0, 126, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 96, 48, 24, 12, 6, 12, 24, 48, 96, 0, 0, 0, 0, 0, 0
        DC8 0, 60, 102, 102, 12, 24, 24, 0, 24, 24, 0, 0, 0, 0, 0, 0, 0, 126
        DC8 195, 195, 207, 219, 219, 207, 192, 127, 0, 0, 0, 0, 0, 0, 0, 24, 60
        DC8 102, 102, 102, 126, 102, 102, 102, 0, 0, 0, 0, 0, 0, 0, 124, 102
        DC8 102, 102, 124, 102, 102, 102, 124, 0, 0, 0, 0, 0, 0, 0, 60, 102
        DC8 102, 96, 96, 96, 102, 102, 60, 0, 0, 0, 0, 0, 0, 0, 120, 108, 102
        DC8 102, 102, 102, 102, 108, 120, 0, 0, 0, 0, 0, 0, 0, 126, 96, 96, 96
        DC8 124, 96, 96, 96, 126, 0, 0, 0, 0, 0, 0, 0, 126, 96, 96, 96, 124, 96
        DC8 96, 96, 96, 0, 0, 0, 0, 0, 0, 0, 60, 102, 102, 96, 96, 110, 102
        DC8 102, 62, 0, 0, 0, 0, 0, 0, 0, 102, 102, 102, 102, 126, 102, 102
        DC8 102, 102, 0, 0, 0, 0, 0, 0, 0, 60, 24, 24, 24, 24, 24, 24, 24, 60
        DC8 0, 0, 0, 0, 0, 0, 0, 60, 102, 102, 96, 96, 110, 102, 102, 62, 0, 0
        DC8 0, 0, 0, 0, 0, 102, 102, 108, 108, 120, 108, 108, 102, 102, 0, 0, 0
        DC8 0, 0, 0, 0, 96, 96, 96, 96, 96, 96, 96, 96, 126, 0, 0, 0, 0, 0, 0
        DC8 0, 99, 99, 119, 107, 107, 107, 99, 99, 99, 0, 0, 0, 0, 0, 0, 0, 99
        DC8 99, 115, 123, 111, 103, 99, 99, 99, 0, 0, 0, 0, 0, 0, 0, 60, 102
        DC8 102, 102, 102, 102, 102, 102, 60, 0, 0, 0, 0, 0, 0, 0, 124, 102
        DC8 102, 102, 124, 96, 96, 96, 96, 0, 0, 0, 0, 0, 0, 0, 60, 102, 102
        DC8 102, 102, 102, 102, 102, 60, 12, 6, 0, 0, 0, 0, 0, 124, 102, 102
        DC8 102, 124, 108, 102, 102, 102, 0, 0, 0, 0, 0, 0, 0, 60, 102, 96, 48
        DC8 24, 12, 6, 102, 60, 0, 0, 0, 0, 0, 0, 0, 126, 24, 24, 24, 24, 24
        DC8 24, 24, 24, 0, 0, 0, 0, 0, 0, 0, 102, 102, 102, 102, 102, 102, 102
        DC8 102, 60, 0, 0, 0, 0, 0, 0, 0, 102, 102, 102, 102, 102, 102, 102, 60
        DC8 24, 0, 0, 0, 0, 0, 0, 0, 99, 99, 99, 107, 107, 107, 54, 54, 54, 0
        DC8 0, 0, 0, 0, 0, 0, 102, 102, 52, 24, 24, 44, 102, 102, 102, 0, 0, 0
        DC8 0, 0, 0, 0, 102, 102, 102, 102, 60, 24, 24, 24, 24, 0, 0, 0, 0, 0
        DC8 0, 0, 126, 6, 6, 12, 24, 48, 96, 96, 126, 0, 0, 0, 0, 0, 0, 0, 60
        DC8 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 60, 0, 0, 0, 0, 96, 96, 48
        DC8 48, 24, 24, 12, 12, 6, 6, 0, 0, 0, 0, 0, 0, 60, 12, 12, 12, 12, 12
        DC8 12, 12, 12, 12, 12, 60, 0, 0, 24, 60, 102, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 0, 0, 56
        DC8 24, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 6, 6
        DC8 62, 102, 102, 62, 0, 0, 0, 0, 0, 0, 0, 96, 96, 124, 102, 102, 102
        DC8 102, 102, 124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 102, 96, 96, 96, 102
        DC8 60, 0, 0, 0, 0, 0, 0, 0, 6, 6, 62, 102, 102, 102, 102, 102, 62, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 60, 102, 102, 126, 96, 96, 60, 0, 0, 0, 0
        DC8 0, 0, 0, 30, 48, 48, 48, 126, 48, 48, 48, 48, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 62, 102, 102, 102, 102, 102, 62, 6, 6, 124, 0, 0, 0, 0, 96
        DC8 96, 124, 102, 102, 102, 102, 102, 102, 0, 0, 0, 0, 0, 0, 24, 24, 0
        DC8 120, 24, 24, 24, 24, 24, 126, 0, 0, 0, 0, 0, 0, 12, 12, 0, 60, 12
        DC8 12, 12, 12, 12, 12, 12, 12, 120, 0, 0, 0, 0, 96, 96, 102, 102, 108
        DC8 120, 108, 102, 102, 0, 0, 0, 0, 0, 0, 0, 120, 24, 24, 24, 24, 24
        DC8 24, 24, 126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 126, 107, 107, 107, 107
        DC8 107, 99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 124, 102, 102, 102, 102, 102
        DC8 102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 102, 102, 102, 102, 102, 60, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 124, 102, 102, 102, 102, 102, 124, 96, 96
        DC8 96, 0, 0, 0, 0, 0, 0, 62, 102, 102, 102, 102, 102, 62, 6, 6, 6, 0
        DC8 0, 0, 0, 0, 0, 102, 110, 112, 96, 96, 96, 96, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 62, 96, 96, 60, 6, 6, 124, 0, 0, 0, 0, 0, 0, 0, 48, 48, 126
        DC8 48, 48, 48, 48, 48, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 102, 102, 102
        DC8 102, 102, 102, 62, 0, 0, 0, 0, 0, 0, 0, 0, 0, 102, 102, 102, 102
        DC8 102, 60, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 99, 107, 107, 107, 107, 54
        DC8 54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 102, 102, 60, 24, 60, 102, 102, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 102, 102, 102, 102, 102, 102, 60, 12, 24, 240
        DC8 0, 0, 0, 0, 0, 0, 126, 6, 12, 24, 48, 96, 126, 0, 0, 0, 0, 0, 0, 0
        DC8 12, 24, 24, 24, 48, 96, 48, 24, 24, 24, 12, 0, 0, 0, 0, 0, 24, 24
        DC8 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 0, 0, 0, 0, 48, 24, 24, 24
        DC8 12, 6, 12, 24, 24, 24, 48, 0, 0, 0, 0, 0, 113, 219, 142, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LCD_GPIO_OUTPUT:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+9
        BL       RCC_APB2PeriphClockCmd
        MOVS     R0,#+255
        BL       ?Subroutine2
??CrossCallReturnLabel_0:
        B.N      ?Subroutine0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LCD_GPIO_INPUT:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+9
        BL       RCC_APB2PeriphClockCmd
        MOVS     R0,#+255
        STRH     R0,[SP, #+0]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        REQUIRE ?Subroutine0
        ;; // Fall through to label ?Subroutine0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine0:
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable1  ;; 0x40010c00
??Subroutine0_0:
        BL       GPIO_Init
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LCD_Set_GPIO_Config:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R1,#+1
        MOVS     R0,#+8
        BL       RCC_APB2PeriphClockCmd
        MOV      R0,#+61440
        BL       ?Subroutine2
??CrossCallReturnLabel_1:
        LDR.N    R4,??DataTable1  ;; 0x40010c00
        ADD      R1,SP,#+0
        MOV      R0,R4
        BL       GPIO_Init
        MOV      R0,#+4096
        STR      R0,[R4, #+16]
        MOV      R0,#+32768
        STR      R0,[R4, #+16]
        MOV      R0,#+8192
        STR      R0,[R4, #+16]
        MOV      R0,#+16384
        STR      R0,[R4, #+16]
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1:
        DC32     0x40010c00

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine2:
        STRH     R0,[SP, #+0]
        MOVS     R0,#+16
        STRB     R0,[SP, #+3]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        BX       LR

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
LCD_BL_GPIO_Config:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+5
        BL       RCC_APB2PeriphClockCmd
        MOV      R0,#+32768
        BL       ?Subroutine2
??CrossCallReturnLabel_2:
        ADD      R1,SP,#+0
        LDR.N    R0,??LCD_BL_GPIO_Config_0  ;; 0x40010800
        B.N      ??Subroutine0_0
        DATA
??LCD_BL_GPIO_Config_0:
        DC32     0x40010800

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LCD_WR_DATA16:
        PUSH     {R4,LR}
        LDR.N    R1,??DataTable3  ;; 0x40010c0c
        MOV      R2,#+8192
        STR      R2,[R1, #+4]
        B.N      ?Subroutine1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LCD_WR_REG16:
        PUSH     {R4,LR}
        LDR.N    R1,??DataTable3  ;; 0x40010c0c
        MOV      R2,#+8192
        STR      R2,[R1, #+8]
        REQUIRE ?Subroutine1
        ;; // Fall through to label ?Subroutine1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine1:
        MOV      R2,#+4096
        STR      R2,[R1, #+8]
        LDR      R3,[R1, #+0]
        AND      R3,R3,#0xFF00
        LSRS     R4,R0,#+8
        UXTB     R4,R4
        ORRS     R3,R4,R3
        STR      R3,[R1, #+0]
        MOV      R3,#+16384
        STR      R3,[R1, #+8]
        STR      R3,[R1, #+4]
        LDR      R4,[R1, #+0]
        AND      R4,R4,#0xFF00
        UXTB     R0,R0
        ORRS     R0,R0,R4
        STR      R0,[R1, #+0]
        STR      R3,[R1, #+8]
        STR      R3,[R1, #+4]
        STR      R2,[R1, #+4]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3:
        DC32     0x40010c0c

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
LCD_RD_DATA16:
        PUSH     {R4-R6,LR}
        LDR.N    R4,??LCD_RD_DATA16_0  ;; 0x40010c08
        MOV      R0,#+16384
        STR      R0,[R4, #+8]
        MOV      R0,#+8192
        STR      R0,[R4, #+8]
        BL       LCD_GPIO_INPUT
        MOV      R0,#+4096
        STR      R0,[R4, #+12]
        MOV      R1,#+32768
        STR      R1,[R4, #+12]
        STR      R1,[R4, #+8]
        LDR      R5,[R4, #+0]
        STR      R1,[R4, #+12]
        STR      R1,[R4, #+8]
        LDR      R6,[R4, #+0]
        STR      R0,[R4, #+8]
        BL       LCD_GPIO_OUTPUT
        UXTB     R0,R5
        UXTB     R1,R6
        ORR      R0,R1,R0, LSL #+8
        POP      {R4-R6,PC}       ;; return
        Nop      
        DATA
??LCD_RD_DATA16_0:
        DC32     0x40010c08

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LCD_WR_REG:
        PUSH     {R4,LR}
        MOV      R4,R1
        BL       LCD_WR_REG16
        MOV      R0,R4
        POP      {R4,LR}
        B.N      LCD_WR_DATA16

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
LCD_Init:
        PUSH     {R3-R7,LR}
        BL       LCD_BL_GPIO_Config
        BL       LCD_GPIO_OUTPUT
        BL       LCD_Set_GPIO_Config
        LDR.N    R4,??LCD_Init_0  ;; 0x40010810
        MOV      R5,#+32768
        STR      R5,[R4, #+4]
        BL       ?Subroutine3
??CrossCallReturnLabel_7:
        MOV      R1,R5
        MOVS     R0,#+229
        BL       LCD_WR_REG
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       LCD_WR_REG
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       LCD_WR_REG
        BL       ?Subroutine3
??CrossCallReturnLabel_6:
        MOV      R1,#+1792
        MOVS     R0,#+2
        BL       LCD_WR_REG
        MOVS     R0,#+5
        BL       Delay
        MOVW     R1,#+4104
        MOVS     R0,#+3
        BL       LCD_WR_REG
        MOVS     R1,#+0
        MOVS     R0,#+4
        BL       LCD_WR_REG
        MOVW     R6,#+1028
        MOV      R1,R6
        MOVS     R0,#+8
        BL       LCD_WR_REG
        MOVS     R1,#+0
        MOVS     R0,#+9
        BL       LCD_WR_REG
        MOVS     R1,#+0
        MOVS     R0,#+10
        BL       LCD_WR_REG
        MOVS     R1,#+0
        MOVS     R0,#+12
        BL       LCD_WR_REG
        MOVS     R1,#+0
        MOVS     R0,#+13
        BL       LCD_WR_REG
        MOVS     R1,#+0
        MOVS     R0,#+15
        BL       LCD_WR_REG
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       LCD_WR_REG
        MOVS     R1,#+0
        MOVS     R0,#+17
        BL       LCD_WR_REG
        MOVS     R1,#+0
        MOVS     R0,#+18
        BL       LCD_WR_REG
        MOVS     R1,#+0
        MOVS     R0,#+19
        BL       LCD_WR_REG
        MOVS     R0,#+5
        BL       Delay
        MOVW     R1,#+5552
        MOVS     R0,#+16
        BL       LCD_WR_REG
        MOVW     R1,#+551
        MOVS     R0,#+17
        BL       LCD_WR_REG
        BL       ?Subroutine3
??CrossCallReturnLabel_5:
        MOVS     R1,#+41
        MOVS     R0,#+18
        BL       LCD_WR_REG
        BL       ?Subroutine3
??CrossCallReturnLabel_4:
        MOV      R1,#+5888
        MOVS     R0,#+19
        BL       LCD_WR_REG
        MOVS     R1,#+45
        MOVS     R0,#+41
        BL       LCD_WR_REG
        MOVS     R1,#+13
        MOVS     R0,#+43
        BL       LCD_WR_REG
        BL       ?Subroutine3
??CrossCallReturnLabel_3:
        BL       ?Subroutine8
??CrossCallReturnLabel_27:
        MOVW     R7,#+319
        MOV      R1,R7
        MOVS     R0,#+33
        BL       LCD_WR_REG
        MOVS     R1,#+0
        MOVS     R0,#+48
        BL       LCD_WR_REG
        MOVW     R1,#+1287
        MOVS     R0,#+49
        BL       LCD_WR_REG
        MOV      R1,#+260
        MOVS     R0,#+50
        BL       LCD_WR_REG
        MOVW     R1,#+261
        MOVS     R0,#+53
        BL       LCD_WR_REG
        MOV      R1,R6
        MOVS     R0,#+54
        BL       LCD_WR_REG
        MOVW     R1,#+1539
        MOVS     R0,#+55
        BL       LCD_WR_REG
        MOV      R1,#+260
        MOVS     R0,#+56
        BL       LCD_WR_REG
        MOVW     R1,#+263
        MOVS     R0,#+57
        BL       LCD_WR_REG
        MOVW     R1,#+1281
        MOVS     R0,#+60
        BL       LCD_WR_REG
        MOV      R1,R6
        MOVS     R0,#+61
        BL       LCD_WR_REG
        BL       ?Subroutine5
??CrossCallReturnLabel_15:
        BL       ?Subroutine6
??CrossCallReturnLabel_19:
        BL       ?Subroutine7
??CrossCallReturnLabel_23:
        MOV      R1,R7
        MOVS     R0,#+83
        BL       LCD_WR_REG
        MOV      R1,#+42752
        MOVS     R0,#+96
        BL       LCD_WR_REG
        MOVS     R1,#+1
        MOVS     R0,#+97
        BL       LCD_WR_REG
        MOVS     R1,#+0
        MOVS     R0,#+106
        BL       LCD_WR_REG
        MOVS     R1,#+16
        MOVS     R0,#+144
        BL       LCD_WR_REG
        MOVS     R1,#+0
        MOVS     R0,#+146
        BL       LCD_WR_REG
        MOVS     R1,#+3
        MOVS     R0,#+147
        BL       LCD_WR_REG
        MOV      R1,#+272
        MOVS     R0,#+149
        BL       LCD_WR_REG
        MOVS     R1,#+0
        MOVS     R0,#+151
        BL       LCD_WR_REG
        MOVS     R1,#+0
        MOVS     R0,#+152
        BL       LCD_WR_REG
        MOVS     R0,#+5
        BL       Delay
        MOVW     R1,#+371
        MOVS     R0,#+7
        BL       LCD_WR_REG
        MOVS     R0,#+1
        BL       Delay
        MOVS     R0,#+0
        BL       LCD_Clear
        MOVS     R0,#+2
        BL       Delay
        STR      R5,[R4, #+0]
        POP      {R0,R4-R7,PC}    ;; return
        DATA
??LCD_Init_0:
        DC32     0x40010810

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine8:
        MOVS     R1,#+239
??Subroutine8_0:
        MOVS     R0,#+32
        B.N      LCD_WR_REG

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine3:
        MOVS     R0,#+10
        B.W      Delay

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LCD_Clear:
        PUSH     {R3-R5,LR}
        MOV      R4,R0
        BL       ?Subroutine8
??CrossCallReturnLabel_26:
        MOVW     R5,#+319
        MOV      R1,R5
        MOVS     R0,#+33
        BL       LCD_WR_REG
        BL       ?Subroutine5
??CrossCallReturnLabel_14:
        BL       ?Subroutine6
??CrossCallReturnLabel_18:
        BL       ?Subroutine7
??CrossCallReturnLabel_22:
        MOV      R1,R5
        MOVS     R0,#+83
        BL       LCD_WR_REG
        BL       ?Subroutine4
??CrossCallReturnLabel_11:
        MOV      R5,#+76800
??LCD_Clear_0:
        MOV      R0,R4
        BL       LCD_WR_DATA16
        SUBS     R5,R5,#+1
        BNE.N    ??LCD_Clear_0
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine7:
        MOVS     R1,#+0
??Subroutine7_0:
        MOVS     R0,#+82
        B.N      LCD_WR_REG

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine6:
        MOVS     R1,#+239
??Subroutine6_0:
        MOVS     R0,#+81
        B.N      LCD_WR_REG

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine5:
        MOVS     R1,#+0
??Subroutine5_0:
        MOVS     R0,#+80
        B.N      LCD_WR_REG

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LCD_write_english:
        PUSH     {R3-R9,LR}
        MOV      R9,R0
        MOV      R4,R1
        MOV      R8,R2
        BL       ?Subroutine4
??CrossCallReturnLabel_10:
        MOVS     R7,#+0
??LCD_write_english_0:
        LDR.N    R0,??DataTable6  ;; english
        ADD      R0,R0,R9, LSL #+4
        ADDS     R0,R7,R0
        SUB      R0,R0,#+512
        LDRB     R5,[R0, #+0]
        MOVS     R6,#+8
??LCD_write_english_1:
        LSLS     R0,R5,#+24
        ITE      MI 
        MOVMI    R0,R4
        MOVPL    R0,R8
        BL       LCD_WR_DATA16
        LSLS     R0,R5,#+25
        LSRS     R5,R0,#+24
        SUBS     R6,R6,#+1
        BNE.N    ??LCD_write_english_1
        ADDS     R7,R7,#+1
        CMP      R7,#+16
        BLT.N    ??LCD_write_english_0
        POP      {R0,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LCD_write_english_string:
        PUSH     {R3-R9,LR}
        MOV      R5,R0
        MOV      R8,R1
        MOV      R4,R2
        MOV      R9,R3
        LDR      R6,[SP, #+32]
        MOVS     R7,#+0
        B.N      ??LCD_write_english_string_0
??LCD_write_english_string_1:
        MOVS     R3,#+8
        MOVS     R2,#+15
        ADDS     R1,R7,R5
        MOV      R0,R8
        BL       Lcd_SetBox
        MOV      R2,R6
        MOV      R1,R9
        LDRB     R0,[R4], #+1
        BL       LCD_write_english
        ADDS     R7,R7,#+8
??LCD_write_english_string_0:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BNE.N    ??LCD_write_english_string_1
        POP      {R0,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LCD_write_SUM:
        PUSH     {R3-R9,LR}
        MOV      R4,R0
        MOV      R0,R1
        MOV      R8,R2
        MOV      R9,R3
        LDR      R7,[SP, #+32]
        MOVS     R3,#+8
        MOVS     R2,#+15
        MOV      R1,R4
        BL       Lcd_SetBox
        BL       ?Subroutine4
??CrossCallReturnLabel_9:
        MOVS     R4,#+0
??LCD_write_SUM_0:
        RSBS     R0,R4,#+0
        LDR.N    R1,??DataTable6  ;; english
        ADD      R1,R1,R8, LSL #+4
        ADDS     R0,R0,R1
        LDRB     R5,[R0, #+271]
        MOVS     R6,#+8
??LCD_write_SUM_1:
        LSLS     R0,R5,#+24
        ITE      MI 
        MOVMI    R0,R9
        MOVPL    R0,R7
        BL       LCD_WR_DATA16
        LSLS     R0,R5,#+25
        LSRS     R5,R0,#+24
        SUBS     R6,R6,#+1
        BNE.N    ??LCD_write_SUM_1
        ADDS     R4,R4,#+1
        CMP      R4,#+16
        BLT.N    ??LCD_write_SUM_0
        POP      {R0,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine4:
        MOVS     R0,#+34
        B.N      LCD_WR_REG16

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Lcd_SetBox:
        PUSH     {R3-R7,LR}
        MOV      R4,R0
        MOV      R5,R1
        ADDS     R0,R2,R4
        SUBS     R6,R0,#+1
        SUBS     R0,R3,R5
        ADDW     R7,R0,#+311
        MOV      R1,R7
        MOV      R0,R6
        BL       LCD_SetCursor
        MOV      R1,R4
        BL       ??Subroutine5_0
??CrossCallReturnLabel_12:
        MOV      R1,R6
        BL       ??Subroutine6_0
??CrossCallReturnLabel_16:
        MOV      R0,#+312
        SUBS     R1,R0,R5
        BL       ??Subroutine7_0
??CrossCallReturnLabel_20:
        MOV      R1,R7
        MOVS     R0,#+83
        POP      {R2,R4-R7,LR}
        B.N      LCD_WR_REG

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LCD_SetCursor:
        PUSH     {R4,LR}
        MOV      R4,R1
        MOV      R1,R0
        BL       ??Subroutine8_0
??CrossCallReturnLabel_25:
        MOV      R1,R4
        MOVS     R0,#+33
        POP      {R4,LR}
        B.N      LCD_WR_REG

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Test:
        PUSH     {R3-R5,LR}
        MOVS     R1,#+0
        BL       ??Subroutine8_0
??CrossCallReturnLabel_24:
        MOVS     R1,#+0
        MOVS     R0,#+33
        BL       LCD_WR_REG
        MOVS     R4,#+0
??Test_0:
        BL       ?Subroutine5
??CrossCallReturnLabel_13:
        BL       ?Subroutine6
??CrossCallReturnLabel_17:
        BL       ?Subroutine7
??CrossCallReturnLabel_21:
        MOVW     R1,#+319
        MOVS     R0,#+83
        BL       LCD_WR_REG
        BL       ?Subroutine4
??CrossCallReturnLabel_8:
        MOV      R5,#+76800
??Test_1:
        CBNZ     R4,??Test_2
        MOVS     R0,#+31
        B.N      ??Test_3
??Test_2:
        CMP      R4,#+1
        BNE.N    ??Test_4
        MOV      R0,#+63488
        B.N      ??Test_3
??Test_4:
        CMP      R4,#+2
        BNE.N    ??Test_5
        MOV      R0,#+2016
        B.N      ??Test_3
??Test_5:
        CMP      R4,#+3
        BNE.N    ??Test_6
        MOVW     R0,#+2047
        B.N      ??Test_3
??Test_6:
        CMP      R4,#+4
        BNE.N    ??Test_7
        MOVW     R0,#+63519
        B.N      ??Test_3
??Test_7:
        CMP      R4,#+5
        BNE.N    ??Test_8
        MOVW     R0,#+65504
        B.N      ??Test_3
??Test_8:
        CMP      R4,#+6
        BNE.N    ??Test_9
        MOV      R0,#+258
??Test_3:
        BL       LCD_WR_DATA16
??Test_9:
        SUBS     R5,R5,#+1
        BNE.N    ??Test_1
        MOVS     R0,#+100
        BL       delay_ms
        ADDS     R4,R4,#+1
        CMP      R4,#+7
        BCC.N    ??Test_0
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
BMP_write_english:
        PUSH     {R4-R7,LR}
        MOVS     R3,#+0
        LDR.W    R12,??BMP_write_english_0  ;; val_Speed
??BMP_write_english_1:
        LDR.N    R4,??DataTable6  ;; english
        ADD      R4,R4,R1, LSL #+4
        ADDS     R4,R3,R4
        SUB      R4,R4,#+512
        LDRB     R4,[R4, #+0]
        MOVS     R5,#+0
??BMP_write_english_2:
        RSB      R6,R5,R0, LSL #+3
        MOVS     R7,#+100
        MULS     R7,R7,R3
        RSBS     R7,R7,#+0
        ADD      R7,R7,R12
        ADDS     R6,R6,R7
        LSLS     R7,R4,#+31
        ITEE     MI 
        STRBMI   R2,[R6, #+1507]
        MOVPL    R7,#+0
        STRBPL   R7,[R6, #+1507]
        LSLS     R4,R4,#+23
        LSRS     R4,R4,#+24
        ADDS     R5,R5,#+1
        CMP      R5,#+8
        BLT.N    ??BMP_write_english_2
        ADDS     R3,R3,#+1
        CMP      R3,#+16
        BLT.N    ??BMP_write_english_1
        POP      {R4-R7,PC}       ;; return
        Nop      
        DATA
??BMP_write_english_0:
        DC32     val_Speed

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable6:
        DC32     english

        END
// 
// 1 520 bytes in section .rodata
// 1 378 bytes in section .text
// 
// 1 378 bytes of CODE  memory
// 1 520 bytes of CONST memory
//
//Errors: none
//Warnings: 2
