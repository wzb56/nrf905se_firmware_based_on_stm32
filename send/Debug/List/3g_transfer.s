///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.40.0.51500/W32 for ARM    28/Apr/2011  09:50:56 /
// Copyright (C) 1999-2009 IAR Systems AB.                                    /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\Administrator\桌面\2.4G\Demo\ /
//                    source\3g_transfer.c                                    /
//    Command line =  "C:\Documents and Settings\Administrator\桌面\2.4G\Demo /
//                    \source\3g_transfer.c" -lC "C:\Documents and            /
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
//                    project\EWARMv5\Debug\List\3g_transfer.s                /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME `3g_transfer`

        EXTERN Ring_ReadData
        EXTERN USART_GetFlagStatus
        EXTERN USART_SendData
        EXTERN delay_us

        PUBLIC copyBuf
        PUBLIC copy_to_resendBuf
        PUBLIC num_of_tri_plus
        PUBLIC read_to_sendBuf
        PUBLIC resend
        PUBLIC resend_buf0
        PUBLIC resend_buf1
        PUBLIC resend_buf2
        PUBLIC resend_buf3
        PUBLIC resend_buf4
        PUBLIC sendBuf
        PUBLIC send_line_id
        PUBLIC send_transparent_transfer
        PUBLIC transparent_send_buf


        SECTION `.bss`:DATA:NOROOT(2)
sendBuf:
        DS8 1000
resend_buf0:
        DS8 640
resend_buf1:
        DS8 640
resend_buf2:
        DS8 640
resend_buf3:
        DS8 640
resend_buf4:
        DS8 640

        SECTION `.bss`:DATA:NOROOT(2)
num_of_tri_plus:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_to_sendBuf:
        PUSH     {R4,LR}
        CMP      R2,R1
        ITEEE    CS 
        SUBCS    R4,R2,R1
        MOVCC    R3,#+1000
        SUBCC    R1,R3,R1
        ADDCC    R4,R2,R1
        MOV      R2,R4
        LDR.N    R1,??DataTable8  ;; sendBuf
        BL       Ring_ReadData
        MOV      R0,R4
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
send_transparent_transfer:
        PUSH     {R3-R7,LR}
        MOV      R4,R0
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6  ;; num_of_tri_plus
        LDR      R2,[R1, #+0]
        LDR.N    R5,??DataTable8  ;; sendBuf
        B.N      ??send_transparent_transfer_0
??send_transparent_transfer_1:
        LDRB     R3,[R0, R5]
        CMP      R3,#+43
        BNE.N    ??send_transparent_transfer_2
        ADDS     R3,R0,R5
        LDRB     R3,[R3, #+1]
        CMP      R3,#+43
        BNE.N    ??send_transparent_transfer_2
        ADDS     R3,R0,R5
        LDRB     R3,[R3, #+2]
        CMP      R3,#+43
        BNE.N    ??send_transparent_transfer_2
        MOVS     R3,#+42
        STRB     R3,[R0, R5]
        ADDS     R2,R2,#+1
??send_transparent_transfer_2:
        ADDS     R0,R0,#+1
??send_transparent_transfer_0:
        SUBS     R3,R4,#+2
        CMP      R0,R3
        BCC.N    ??send_transparent_transfer_1
        STR      R2,[R1, #+0]
        MOVS     R6,#+0
        LDR.N    R7,??DataTable7  ;; 0x40004400
        B.N      ??send_transparent_transfer_3
??send_transparent_transfer_4:
        LDRB     R1,[R6, R5]
        MOV      R0,R7
        BL       USART_SendData
??send_transparent_transfer_5:
        MOVS     R1,#+64
        MOV      R0,R7
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??send_transparent_transfer_5
        ADDS     R6,R6,#+1
??send_transparent_transfer_3:
        CMP      R6,R4
        BCC.N    ??send_transparent_transfer_4
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
send_line_id:
        PUSH     {R4,LR}
        LDR.N    R4,??DataTable7  ;; 0x40004400
        UXTB     R1,R0
        MOV      R0,R4
        BL       USART_SendData
??send_line_id_0:
        MOVS     R1,#+64
        MOV      R0,R4
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??send_line_id_0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
copy_to_resendBuf:
        PUSH     {R7,LR}
        SDIV     R3,R0,R1
        MLS      R1,R1,R3,R0
        LDR.N    R0,??DataTable8  ;; sendBuf
        CBNZ     R1,??copy_to_resendBuf_0
        ADDW     R1,R0,#+1000
        B.N      ??copy_to_resendBuf_1
??copy_to_resendBuf_0:
        CMP      R1,#+1
        BNE.N    ??copy_to_resendBuf_2
        ADD      R1,R0,#+1640
        B.N      ??copy_to_resendBuf_1
??copy_to_resendBuf_2:
        CMP      R1,#+2
        BNE.N    ??copy_to_resendBuf_3
        ADDW     R1,R0,#+2280
        B.N      ??copy_to_resendBuf_1
??copy_to_resendBuf_3:
        CMP      R1,#+3
        BNE.N    ??copy_to_resendBuf_4
        ADDW     R1,R0,#+2920
        B.N      ??copy_to_resendBuf_1
??copy_to_resendBuf_4:
        CMP      R1,#+4
        BNE.N    ??copy_to_resendBuf_5
        ADDW     R1,R0,#+3560
??copy_to_resendBuf_1:
        BL       copyBuf
??copy_to_resendBuf_5:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
copyBuf:
        PUSH     {R4,LR}
        MOVS     R3,#+0
        B.N      ??copyBuf_0
??copyBuf_1:
        LDRB     R4,[R3, R0]
        STRB     R4,[R3, R1]
        ADDS     R3,R3,#+1
??copyBuf_0:
        CMP      R3,R2
        BCC.N    ??copyBuf_1
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
transparent_send_buf:
        PUSH     {R3-R7,LR}
        MOV      R4,R0
        MOV      R5,R1
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6  ;; num_of_tri_plus
        B.N      ??transparent_send_buf_0
??transparent_send_buf_1:
        LDRB     R2,[R0, R4]
        CMP      R2,#+43
        BNE.N    ??transparent_send_buf_2
        ADDS     R2,R0,R4
        LDRB     R2,[R2, #+1]
        CMP      R2,#+43
        BNE.N    ??transparent_send_buf_2
        ADDS     R2,R0,R4
        LDRB     R2,[R2, #+2]
        CMP      R2,#+43
        BNE.N    ??transparent_send_buf_2
        MOVS     R2,#+42
        STRB     R2,[R0, R4]
        LDR      R2,[R1, #+0]
        ADDS     R2,R2,#+1
        STR      R2,[R1, #+0]
??transparent_send_buf_2:
        ADDS     R0,R0,#+1
??transparent_send_buf_0:
        SUBS     R2,R5,#+2
        CMP      R0,R2
        BCC.N    ??transparent_send_buf_1
        MOVS     R6,#+0
        LDR.N    R7,??DataTable7  ;; 0x40004400
        B.N      ??transparent_send_buf_3
??transparent_send_buf_4:
        LDRB     R1,[R6, R4]
        MOV      R0,R7
        BL       USART_SendData
??transparent_send_buf_5:
        MOVS     R1,#+64
        MOV      R0,R7
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??transparent_send_buf_5
        ADDS     R6,R6,#+1
??transparent_send_buf_3:
        CMP      R6,R5
        BCC.N    ??transparent_send_buf_4
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable6:
        DC32     num_of_tri_plus

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable7:
        DC32     0x40004400

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
resend:
        PUSH     {R4-R6,LR}
        MOV      R5,R0
        MOV      R4,R1
        MOVS     R6,#+0
        B.N      ??resend_0
??resend_1:
        MOV      R1,R4
        ADDW     R0,R0,#+3560
??resend_2:
        BL       transparent_send_buf
??resend_3:
        LDR.N    R0,??resend_4    ;; 0x186a0
        BL       delay_us
        ADDS     R6,R6,#+1
??resend_0:
        CMP      R6,R5
        BGE.N    ??resend_5
        LDR.N    R0,??DataTable8  ;; sendBuf
        CBZ      R6,??resend_6
        CMP      R6,#+2
        BEQ.N    ??resend_7
        BCC.N    ??resend_8
        CMP      R6,#+4
        BEQ.N    ??resend_1
        BCC.N    ??resend_9
        B.N      ??resend_3
??resend_6:
        MOV      R1,R4
        ADDW     R0,R0,#+1000
        B.N      ??resend_2
??resend_8:
        MOV      R1,R4
        ADD      R0,R0,#+1640
        B.N      ??resend_2
??resend_7:
        MOV      R1,R4
        ADDW     R0,R0,#+2280
        B.N      ??resend_2
??resend_9:
        MOV      R1,R4
        ADDW     R0,R0,#+2920
        B.N      ??resend_2
??resend_5:
        POP      {R4-R6,PC}       ;; return
        DATA
??resend_4:
        DC32     0x186a0

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable8:
        DC32     sendBuf

        END
// 
// 4 204 bytes in section .bss
//   408 bytes in section .text
// 
//   408 bytes of CODE memory
// 4 204 bytes of DATA memory
//
//Errors: none
//Warnings: none
