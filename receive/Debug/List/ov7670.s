///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.40.0.51500/W32 for ARM    28/Apr/2011  09:50:58 /
// Copyright (C) 1999-2009 IAR Systems AB.                                    /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\Administrator\桌面\2.4G\Demo\ /
//                    source\ov7670.c                                         /
//    Command line =  "C:\Documents and Settings\Administrator\桌面\2.4G\Demo /
//                    \source\ov7670.c" -lC "C:\Documents and                 /
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
//                    project\EWARMv5\Debug\List\ov7670.s                     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ov7670

        EXTERN Delay
        EXTERN EXTI_GenerateSWInterrupt
        EXTERN EXTI_Init
        EXTERN GPIO_EXTILineConfig
        EXTERN GPIO_Init
        EXTERN NVIC_Init
        EXTERN NVIC_PriorityGroupConfig
        EXTERN NVIC_SetVectorTable
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN RCC_MCOConfig
        EXTERN SCCB_GPIO_Config
        EXTERN SCCBreadByte
        EXTERN SCCBwriteByte
        EXTERN delay_us
        EXTERN noAck
        EXTERN startSCCB
        EXTERN stopSCCB

        PUBLIC OV7670_EXTI_Config
        PUBLIC OV7670_init
        PUBLIC XCLK_init_OFF
        PUBLIC XCLK_init_ON
        PUBLIC change_reg
        PUBLIC change_reg1
        PUBLIC ov7670_GPIO_Init
        PUBLIC ov7670_Interrupts_Config
        PUBLIC rdOV7670Reg
        PUBLIC wrOV7670Reg


        SECTION `.rodata`:CONST:NOROOT(2)
// char const change_reg[167][2]
change_reg:
        DATA
        DC8 58, 4, 64, 16, 18, 20, 50, 128, 23, 22, 24, 4, 25, 2, 26, 123, 3, 6
        DC8 12, 12, 62, 0, 112, 0, 113, 1, 114, 17, 115, 9, 162, 2, 17, 0, 122
        DC8 32, 123, 28, 124, 40, 125, 60, 126, 85, 127, 104, 128, 118, 129
        DC8 128, 130, 136, 131, 143, 132, 150, 133, 163, 134, 175, 135, 196
        DC8 136, 215, 137, 232, 19, 224, 0, 0, 16, 0, 13, 0, 20, 16, 165, 5
        DC8 171, 7, 36, 117, 37, 99, 38, 165, 159, 120, 160, 104, 161, 3, 166
        DC8 223, 167, 223, 168, 240, 169, 144, 170, 148, 19, 229, 14, 97, 15
        DC8 75, 22, 2, 30, 39, 33, 2, 34, 145, 41, 7, 51, 11, 53, 11, 55, 29
        DC8 56, 113, 57, 42, 60, 120, 77, 64, 78, 32, 105, 93, 107, 128, 116
        DC8 25, 141, 79, 142, 0, 143, 0, 144, 0, 145, 0, 146, 0, 150, 0, 154
        DC8 128, 176, 132, 177, 12, 178, 14, 179, 130, 184, 10, 67, 20, 68, 240
        DC8 69, 52, 70, 88, 71, 40, 72, 58, 89, 136, 90, 136, 91, 68, 92, 103
        DC8 93, 73, 94, 14, 100, 4, 101, 32, 102, 5, 148, 4, 149, 8, 108, 10
        DC8 109, 85, 110, 17, 111, 159, 106, 64, 19, 231, 21, 0, 79, 128, 80
        DC8 128, 81, 0, 82, 34, 83, 94, 84, 128, 85, 0, 86, 96, 87, 144, 88
        DC8 158, 65, 8, 63, 5, 117, 5, 118, 225, 76, 15, 119, 10, 61, 194, 75
        DC8 9, 201, 96, 65, 56, 52, 17, 59, 2, 164, 137, 150, 0, 151, 48, 152
        DC8 32, 153, 48, 154, 132, 155, 41, 156, 3, 157, 76, 158, 63, 120, 4
        DC8 121, 1, 200, 240, 121, 15, 200, 0, 121, 16, 200, 126, 121, 10, 200
        DC8 128, 121, 11, 200, 1, 121, 12, 200, 15, 121, 13, 200, 32, 121, 9
        DC8 200, 128, 121, 2, 200, 192, 121, 3, 200, 64, 121, 5, 200, 48, 105
        DC8 170, 9, 0, 59, 66, 45, 1, 0, 0, 0, 0
// char const change_reg1[167][2]
change_reg1:
        DC8 50, 0, 42, 0, 17, 1, 18, 6, 18, 70, 66, 127, 77, 0, 99, 240, 100
        DC8 255, 101, 32, 102, 0, 103, 0, 105, 93, 19, 255, 13, 129, 15, 197
        DC8 20, 17, 34, 255, 35, 1, 36, 52, 37, 60, 38, 161, 43, 0, 107, 170
        DC8 19, 255, 144, 10, 145, 1, 146, 1, 147, 1, 148, 95, 149, 83, 150, 17
        DC8 151, 26, 152, 61, 153, 90, 154, 30, 155, 0, 156, 37, 167, 101, 168
        DC8 101, 169, 128, 170, 128, 158, 129, 166, 6, 126, 12, 127, 22, 128
        DC8 42, 129, 78, 130, 97, 131, 111, 132, 123, 133, 134, 134, 142, 135
        DC8 151, 136, 164, 137, 175, 138, 197, 139, 215, 140, 232, 141, 32, 51
        DC8 0, 34, 153, 35, 3, 74, 0, 73, 19, 71, 8, 75, 20, 76, 23, 70, 5, 14
        DC8 117, 12, 80, 0, 240, 41, 80, 44, 120, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
XCLK_init_ON:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       RCC_APB2PeriphClockCmd
        BL       ?Subroutine3
??CrossCallReturnLabel_0:
        MOVS     R0,#+24
        BL       ?Subroutine4
??CrossCallReturnLabel_2:
        BL       GPIO_Init
        MOVS     R0,#+6
        BL       RCC_MCOConfig
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
XCLK_init_OFF:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       RCC_APB2PeriphClockCmd
        BL       ?Subroutine3
??CrossCallReturnLabel_1:
        MOVS     R0,#+16
        BL       ?Subroutine4
??CrossCallReturnLabel_3:
        B.N      ?Subroutine0

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine4:
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??Subroutine4_0  ;; 0x40010800
        BX       LR
        Nop      
        DATA
??Subroutine4_0:
        DC32     0x40010800

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine3:
        MOV      R0,#+256
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        BX       LR

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
ov7670_GPIO_Init:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+16
        BL       RCC_APB2PeriphClockCmd
        MOVS     R0,#+16
        STRH     R0,[SP, #+0]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??Subroutine0_0  ;; 0x40011000
        Nop      
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
ov7670_Interrupts_Config:
        PUSH     {R7,LR}
        MOVS     R1,#+0
        MOV      R0,#+134217728
        BL       NVIC_SetVectorTable
        MOV      R0,#+1792
        BL       NVIC_PriorityGroupConfig
        MOV      R0,#+1536
        BL       NVIC_PriorityGroupConfig
        MOVS     R0,#+10
        STRB     R0,[SP, #+0]
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
        STRB     R0,[SP, #+2]
        MOVS     R0,#+1
        STRB     R0,[SP, #+3]
        ADD      R0,SP,#+0
        BL       NVIC_Init
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OV7670_EXTI_Config:
        PUSH     {LR}
        SUB      SP,SP,#+12
        MOVS     R1,#+4
        MOVS     R0,#+2
        BL       GPIO_EXTILineConfig
        MOVS     R0,#+16
        STR      R0,[SP, #+0]
        MOVS     R0,#+0
        STRB     R0,[SP, #+4]
        MOVS     R0,#+8
        STRB     R0,[SP, #+5]
        MOVS     R0,#+1
        STRB     R0,[SP, #+6]
        ADD      R0,SP,#+0
        BL       EXTI_Init
        MOVS     R0,#+16
        BL       EXTI_GenerateSWInterrupt
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
wrOV7670Reg:
        PUSH     {R3-R5,LR}
        MOV      R5,R0
        MOV      R4,R1
        BL       startSCCB
        MOVS     R0,#+66
        BL       SCCBwriteByte
        CBNZ     R0,??wrOV7670Reg_0
??wrOV7670Reg_1:
        B.N      ?Subroutine2
??wrOV7670Reg_0:
        MOVS     R0,#+100
        BL       delay_us
        MOV      R0,R5
        BL       SCCBwriteByte
        CMP      R0,#+0
        BEQ.N    ??wrOV7670Reg_1
        MOVS     R0,#+100
        BL       delay_us
        MOV      R0,R4
        BL       SCCBwriteByte
        CMP      R0,#+0
        BEQ.N    ??wrOV7670Reg_1
        B.N      ?Subroutine1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rdOV7670Reg:
        PUSH     {R3-R5,LR}
        MOV      R5,R0
        MOV      R4,R1
        BL       startSCCB
        MOVS     R0,#+66
        BL       SCCBwriteByte
        CBNZ     R0,??rdOV7670Reg_0
??rdOV7670Reg_1:
        B.N      ?Subroutine2
??rdOV7670Reg_0:
        MOVS     R0,#+100
        BL       delay_us
        MOV      R0,R5
        BL       SCCBwriteByte
        CMP      R0,#+0
        BEQ.N    ??rdOV7670Reg_1
        BL       stopSCCB
        MOVS     R0,#+100
        BL       delay_us
        BL       startSCCB
        MOVS     R0,#+67
        BL       SCCBwriteByte
        CMP      R0,#+0
        BEQ.N    ??rdOV7670Reg_1
        MOVS     R0,#+100
        BL       delay_us
        BL       SCCBreadByte
        STRB     R0,[R4, #+0]
        BL       noAck
        B.N      ?Subroutine1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine2:
        BL       stopSCCB
        MOVS     R0,#+0
        POP      {R1,R4,R5,PC}

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine1:
        BL       stopSCCB
        MOVS     R0,#+1
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
OV7670_init:
        PUSH     {R3-R5,LR}
        BL       XCLK_init_ON
        BL       ov7670_GPIO_Init
        BL       SCCB_GPIO_Config
        MOVS     R0,#+128
        STRB     R0,[SP, #+0]
        MOVS     R0,#+1
        BL       Delay
        LDRB     R1,[SP, #+0]
        MOVS     R0,#+18
        BL       wrOV7670Reg
        CMP      R0,#+0
        BNE.N    ??OV7670_init_0
??OV7670_init_1:
        MOVS     R0,#+0
        POP      {R1,R4,R5,PC}
??OV7670_init_0:
        MOVS     R0,#+10
        BL       Delay
        ADD      R1,SP,#+0
        MOVS     R0,#+11
        BL       rdOV7670Reg
        CMP      R0,#+0
        BEQ.N    ??OV7670_init_1
        MOVS     R0,#+10
        BL       Delay
        LDR.N    R4,??OV7670_init_2  ;; change_reg
        LDRB     R0,[SP, #+0]
        CMP      R0,#+115
        BNE.N    ??OV7670_init_3
        MOVS     R5,#+0
??OV7670_init_4:
        ADD      R0,R4,R5, LSL #+1
        LDRB     R1,[R0, #+1]
        LDRB     R0,[R4, R5, LSL #+1]
        BL       wrOV7670Reg
        CMP      R0,#+0
        BEQ.N    ??OV7670_init_1
        ADDS     R5,R5,#+1
        CMP      R5,#+167
        BCS.N    ??OV7670_init_5
        B.N      ??OV7670_init_4
??OV7670_init_3:
        CMP      R0,#+33
        BNE.N    ??OV7670_init_5
        MOVS     R5,#+0
??OV7670_init_6:
        ADD      R0,R4,R5, LSL #+1
        LDRB     R1,[R0, #+337]
        LDRB     R0,[R0, #+336]
        BL       wrOV7670Reg
        CMP      R0,#+0
        BEQ.N    ??OV7670_init_1
        ADDS     R5,R5,#+1
        CMP      R5,#+74
        BCC.N    ??OV7670_init_6
??OV7670_init_5:
        MOVS     R0,#+1
        POP      {R1,R4,R5,PC}    ;; return
        Nop      
        DATA
??OV7670_init_2:
        DC32     change_reg

        END
// 
// 672 bytes in section .rodata
// 528 bytes in section .text
// 
// 528 bytes of CODE  memory
// 672 bytes of CONST memory
//
//Errors: none
//Warnings: 3
