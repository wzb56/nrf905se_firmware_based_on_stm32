///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.2.51295/W32 for ARM    11/Apr/2011  15:18:00 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\LiYang\Desktop\newest\Demo\source\at.c         /
//    Command line =  C:\Users\LiYang\Desktop\newest\Demo\source\at.c -lC     /
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
//                    ug\List\at.s                                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME at

        EXTERN Ring_ReadData
        EXTERN UART2RingBuf
        EXTERN UART2_ReadData
        EXTERN USART_GetFlagStatus
        EXTERN USART_SendData
        EXTERN __aeabi_memcpy
        EXTERN __aeabi_memcpy4
        EXTERN check_send_OK
        EXTERN delay_us

        PUBLIC UART_ReadData
        PUBLIC _3g_send
        PUBLIC _3g_send_by_group
        PUBLIC at_initial_sequence
        PUBLIC check_send_ERROR
        PUBLIC disable_transparent_transfer
        PUBLIC enable_transparent_transfer
        PUBLIC get_received_len
        PUBLIC instr_len
        PUBLIC num_of_tri_plus
        PUBLIC read_to_sendBuf
        PUBLIC result_code_buf
        PUBLIC sendBuf
        PUBLIC send_ERROR
        PUBLIC send_OK
        PUBLIC send_ascii
        PUBLIC send_at
        PUBLIC send_at0
        PUBLIC send_at1
        PUBLIC send_at_general
        PUBLIC send_at_ipinit
        PUBLIC send_at_ipopen
        PUBLIC send_at_reset
        PUBLIC send_at_send
        PUBLIC send_at_sendFromBuf
        PUBLIC send_line_id
        PUBLIC send_to_pc
        PUBLIC send_transparent_transfer
        PUBLIC send_without_check


        SECTION `.bss`:DATA:NOROOT(2)
instr_len:
        DS8 4

        SECTION `.bss`:DATA:NOROOT(2)
sendBuf:
        DS8 1000

        SECTION `.data`:DATA:NOROOT(2)
send_OK:
        DATA
        DC8 0
send_ERROR:
        DC8 0
        DC8 0, 0
UART_ReadData:
        DC32 UART2_ReadData
result_code_buf:
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
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.bss`:DATA:NOROOT(2)
num_of_tri_plus:
        DS8 4

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
send_at0:
        PUSH     {R4,LR}
        LDR.W    R4,??DataTable25  ;; 0x40004400
        MOVS     R1,#+97
        MOV      R0,R4
        BL       USART_SendData
??send_at0_0:
        BL       ?Subroutine2
??CrossCallReturnLabel_2:
        CMP      R0,#+0
        BEQ.N    ??send_at0_0
        MOVS     R1,#+116
        MOV      R0,R4
        BL       USART_SendData
??send_at0_1:
        BL       ?Subroutine2
??CrossCallReturnLabel_1:
        CMP      R0,#+0
        BEQ.N    ??send_at0_1
        MOVS     R1,#+13
        REQUIRE ?Subroutine0
        ;; // Fall through to label ?Subroutine0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine0:
        MOV      R0,R4
        BL       USART_SendData
??Subroutine0_0:
        BL       ?Subroutine2
??CrossCallReturnLabel_0:
        CMP      R0,#+0
        BEQ.N    ??Subroutine0_0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine2:
        MOVS     R1,#+64
        MOV      R0,R4
        B.W      USART_GetFlagStatus

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
send_at1:
        PUSH     {R7,LR}
        LDR.W    R0,??DataTable20  ;; instr_len
        MOVS     R1,#+3
        STR      R1,[R0, #+0]
        ADD      R0,SP,#+0
        LDR.N    R1,??send_at1_0  ;; `?<Constant {97, 116, 13}>`
        LDR      R2,[R1, #0]
        STR      R2,[R0, #+0]
        MOVS     R1,#+3
        BL       send_at_general
        POP      {R0,PC}          ;; return
        Nop      
        DATA
??send_at1_0:
        DC32     `?<Constant {97, 116, 13}>`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
send_at_general:
        PUSH     {R3-R7,LR}
        MOV      R4,R0
        MOV      R5,R1
        MOVS     R6,#+0
        LDR.W    R7,??DataTable25  ;; 0x40004400
        B.N      ??send_at_general_0
??send_at_general_1:
        LDRB     R1,[R6, R4]
        MOV      R0,R7
        BL       USART_SendData
??send_at_general_2:
        BL       ?Subroutine3
??CrossCallReturnLabel_5:
        CMP      R0,#+0
        BEQ.N    ??send_at_general_2
        ADDS     R6,R6,#+1
??send_at_general_0:
        CMP      R6,R5
        BCC.N    ??send_at_general_1
        MOVS     R1,#+13
        MOV      R0,R7
        BL       USART_SendData
??send_at_general_3:
        BL       ?Subroutine3
??CrossCallReturnLabel_4:
        CMP      R0,#+0
        BEQ.N    ??send_at_general_3
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
send_at:
        PUSH     {R7,LR}
        LDR.W    R0,??DataTable20  ;; instr_len
        MOVS     R1,#+2
        STR      R1,[R0, #+0]
        ADD      R0,SP,#+0
        LDR.N    R1,??send_at_0   ;; `?<Constant "at">`
        LDRB     R2,[R1, #0]
        STRB     R2,[R0, #+0]
        LDRB     R2,[R1, #+1]
        STRB     R2,[R0, #+1]
        MOVS     R1,#+2
        BL       send_at_general
        POP      {R0,PC}          ;; return
        Nop      
        DATA
??send_at_0:
        DC32     `?<Constant "at">`

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
send_at_ipinit:
        PUSH     {LR}
        SUB      SP,SP,#+20
        LDR.W    R0,??DataTable20  ;; instr_len
        MOVS     R1,#+17
        STR      R1,[R0, #+0]
        ADD      R0,SP,#+0
        LDR.N    R1,??Subroutine1_0  ;; `?<Constant "at^ipinit=\\"3gnet\\"">`
        MOVS     R2,#+17
        BL       __aeabi_memcpy
        MOVS     R1,#+17
        REQUIRE ?Subroutine1
        ;; // Fall through to label ?Subroutine1

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine1:
        BL       ?Subroutine5
??CrossCallReturnLabel_9:
        ADD      SP,SP,#+20
        POP      {PC}             ;; return
        DATA
??Subroutine1_0:
        DC32     `?<Constant "at^ipinit=\\"3gnet\\"">`

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
send_at_ipopen:
        PUSH     {LR}
        SUB      SP,SP,#+52
        LDR.W    R0,??DataTable20  ;; instr_len
        MOVS     R1,#+45
        STR      R1,[R0, #+0]
        ADD      R0,SP,#+0
        LDR.N    R1,??send_at_ipopen_0  ;; `?<Constant "at^ipopen=3,\\"tcp\\",\\"21...">`
        MOVS     R2,#+45
        BL       __aeabi_memcpy
        MOVS     R1,#+45
        BL       ?Subroutine5
??CrossCallReturnLabel_8:
        ADD      SP,SP,#+52
        POP      {PC}             ;; return
        DATA
??send_at_ipopen_0:
        DC32     `?<Constant "at^ipopen=3,\\"tcp\\",\\"21...">`

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
send_at_send:
        PUSH     {LR}
        SUB      SP,SP,#+20
        LDR.N    R0,??DataTable20  ;; instr_len
        MOVS     R1,#+19
        STR      R1,[R0, #+0]
        ADD      R0,SP,#+0
        LDR.N    R1,??send_at_send_0  ;; `?<Constant "at^ipsend=3,\\"hello\\"">`
        MOVS     R2,#+19
        BL       __aeabi_memcpy
        MOVS     R1,#+19
        B.N      ?Subroutine1
        DATA
??send_at_send_0:
        DC32     `?<Constant "at^ipsend=3,\\"hello\\"">`

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
send_at_reset:
        PUSH     {R5-R7,LR}
        LDR.N    R0,??DataTable20  ;; instr_len
        MOVS     R1,#+10
        STR      R1,[R0, #+0]
        ADD      R0,SP,#+0
        LDR.N    R1,??send_at_reset_0  ;; `?<Constant "at^reset=1">`
        MOVS     R2,#+10
        BL       __aeabi_memcpy
        MOVS     R1,#+10
        BL       ?Subroutine5
??CrossCallReturnLabel_7:
        POP      {R0-R2,PC}       ;; return
        Nop      
        DATA
??send_at_reset_0:
        DC32     `?<Constant "at^reset=1">`

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
send_at_sendFromBuf:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+1016
        MOV      R8,R0
        MOV      R4,R1
        MOV      R5,R2
        SUBS     R6,R3,R5
        LDR.N    R7,??DataTable20  ;; instr_len
        ADD      R0,R6,#+14
        STR      R0,[R7, #+0]
        ADD      R0,SP,#+0
        LDR.N    R1,??send_at_sendFromBuf_0  ;; `?<Constant "at^ipsend=1,\\"">`
        MOVS     R2,#+13
        BL       __aeabi_memcpy
        MOVS     R2,#+13
        ADD      R1,SP,#+0
        ADD      R0,SP,#+16
        BL       __aeabi_memcpy4
        ADD      R0,R8,#+48
        STRB     R0,[SP, #+26]
        MOVS     R0,#+0
        B.N      ??send_at_sendFromBuf_1
??send_at_sendFromBuf_2:
        STRB     R3,[R1, #+13]
??send_at_sendFromBuf_3:
        ADDS     R0,R0,#+1
??send_at_sendFromBuf_1:
        CMP      R0,R6
        BCS.N    ??send_at_sendFromBuf_4
        ADDS     R2,R0,R5
        ADD      R1,SP,#+16
        ADDS     R1,R0,R1
        LDRB     R3,[R2, R4]
        CMP      R3,#+13
        BNE.N    ??send_at_sendFromBuf_2
        MOVS     R2,#+12
        STRB     R2,[R1, #+13]
        B.N      ??send_at_sendFromBuf_3
??send_at_sendFromBuf_4:
        ADD      R0,SP,#+16
        ADDS     R0,R6,R0
        MOVS     R1,#+34
        STRB     R1,[R0, #+13]
        LDR      R1,[R7, #+0]
        ADD      R0,SP,#+16
        BL       send_at_general
        ADD      SP,SP,#+1016
        POP      {R4-R8,PC}       ;; return
        Nop      
        DATA
??send_at_sendFromBuf_0:
        DC32     `?<Constant "at^ipsend=1,\\"">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
at_initial_sequence:
        PUSH     {R3-R5,LR}
        BL       get_received_len
        MOV      R4,R0
        BL       send_at
        B.N      ??at_initial_sequence_0
??at_initial_sequence_1:
        BL       get_received_len
        MOV      R4,R0
??at_initial_sequence_0:
        CMP      R4,#+9
        BCC.N    ??at_initial_sequence_1
        LDR.N    R5,??DataTable17  ;; send_OK
        MOVS     R1,#+9
        BL       ?Subroutine7
??CrossCallReturnLabel_12:
        BL       send_at_ipinit
        B.N      ??at_initial_sequence_2
??at_initial_sequence_3:
        BL       get_received_len
        MOV      R4,R0
??at_initial_sequence_2:
        CMP      R4,#+24
        BCC.N    ??at_initial_sequence_3
        MOVS     R1,#+24
        BL       ?Subroutine7
??CrossCallReturnLabel_11:
        BL       send_at_ipopen
        B.N      ??at_initial_sequence_4
??at_initial_sequence_5:
        BL       get_received_len
        MOV      R4,R0
??at_initial_sequence_4:
        CMP      R4,#+52
        BCC.N    ??at_initial_sequence_5
        MOVS     R1,#+52
        BL       ?Subroutine7
??CrossCallReturnLabel_10:
        MOVS     R0,#+3
        BL       enable_transparent_transfer
        MOVS     R1,#+21
        ADD      R0,R5,#+8
        LDR      R2,[R5, #+4]
        POP      {R3-R5,LR}
        BX       R2

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine7:
        ADD      R0,R5,#+8
        LDR      R2,[R5, #+4]
        BX       R2

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
_3g_send:
        PUSH     {R4-R6,LR}
        MOV      R6,R0
        MOV      R0,R1
        CMP      R3,R2
        ITEE     CS 
        SUBCS    R5,R3,R2
        RSBCC    R1,R2,#+1000
        ADDCC    R5,R3,R1
        BL       ?Subroutine8
??CrossCallReturnLabel_14:
        MOV      R3,R5
        MOVS     R2,#+0
        MOV      R1,R4
        MOV      R0,R6
        BL       send_at_sendFromBuf
        ADD      R1,R5,#+34
        LDR.N    R0,??DataTable26  ;; UART2RingBuf
??_3g_send_0:
        LDR      R2,[R0, #+12]
        LDR      R3,[R0, #+8]
        SUBS     R2,R2,R3
        CMP      R2,R1
        BCC.N    ??_3g_send_0
        LDR.N    R2,??DataTable17  ;; send_OK
        ADD      R0,R2,#+8
        LDR      R2,[R2, #+4]
        POP      {R4-R6,LR}
        BX       R2

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
_3g_send_by_group:
        PUSH     {R3-R11,LR}
        MOV      R10,R0
        MOV      R0,R1
        LDR      R4,[SP, #+40]
        CMP      R3,R2
        ITEE     CS 
        SUBCS    R7,R3,R2
        RSBCC    R1,R2,#+1000
        ADDCC    R7,R3,R1
        LDR.W    R8,??DataTable23  ;; sendBuf
        MOV      R2,R7
        MOV      R1,R8
        BL       Ring_ReadData
        MOVS     R5,#+0
        STR      R7,[SP, #+0]
        ADD      R11,R4,#+24
        LDR.N    R6,??DataTable17  ;; send_OK
        B.N      ??_3g_send_by_group_0
??_3g_send_by_group_1:
        MOV      R1,R11
        BL       ??Subroutine10_0
??CrossCallReturnLabel_16:
        MOVS     R0,#+0
        STRB     R0,[R6, #+1]
        BL       ?Subroutine6
??CrossCallReturnLabel_21:
        LDRB     R0,[R6, #+0]
        LDRB     R1,[R6, #+1]
        ORRS     R0,R1,R0
        BNE.N    ??_3g_send_by_group_2
        MOV      R0,R4
        BL       check_send_OK
        LDR      R2,[R6, #+4]
        LDRB     R0,[R6, #+0]
        CMP      R0,#+0
        BEQ.N    ??_3g_send_by_group_1
        CMP      R0,#+1
        BNE.N    ??CrossCallReturnLabel_21
        BL       ?Subroutine9
??CrossCallReturnLabel_18:
        MOVS     R0,#+0
        STRB     R0,[R6, #+0]
??_3g_send_by_group_2:
        MOV      R5,R9
        LDR      R0,[SP, #+0]
        SUBS     R7,R0,R5
??_3g_send_by_group_0:
        ADD      R9,R4,R5
        CMP      R4,R7
        BCS.N    ??_3g_send_by_group_3
        BL       ?Subroutine6
??CrossCallReturnLabel_20:
        LDR.N    R0,??DataTable19  ;; 0x1e8480
        BL       delay_us
        B.N      ??CrossCallReturnLabel_21
??_3g_send_by_group_3:
        LDR      R3,[SP, #+0]
        B.N      ??_3g_send_by_group_4
??_3g_send_by_group_5:
        MOV      R1,R11
        BL       ??Subroutine10_0
??CrossCallReturnLabel_15:
        MOVS     R0,#+0
        STRB     R0,[R6, #+1]
        MOV      R3,R9
??_3g_send_by_group_4:
        BL       ??Subroutine11_0
??CrossCallReturnLabel_19:
        LDRB     R0,[R6, #+0]
        LDRB     R1,[R6, #+1]
        ORRS     R0,R1,R0
        BNE.N    ??_3g_send_by_group_6
        MOV      R0,R4
        BL       check_send_OK
        LDR      R2,[R6, #+4]
        LDRB     R0,[R6, #+1]
        CMP      R0,#+1
        BEQ.N    ??_3g_send_by_group_5
        LDRB     R0,[R6, #+0]
        CMP      R0,#+1
        BNE.N    ??CrossCallReturnLabel_19
        BL       ?Subroutine9
??CrossCallReturnLabel_17:
        MOVS     R0,#+0
        STRB     R0,[R6, #+0]
??_3g_send_by_group_6:
        MOVW     R0,#+10000
        POP      {R1,R4-R11,LR}
        B.W      delay_us

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine9:
        ADD      R1,R4,#+34
        REQUIRE ??Subroutine10_0
        ;; // Fall through to label ??Subroutine10_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
??Subroutine10_0:
        ADD      R0,R6,#+8
        BX       R2

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine6:
        MOV      R3,R9
        Nop      
        REQUIRE ??Subroutine11_0
        ;; // Fall through to label ??Subroutine11_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
??Subroutine11_0:
        MOV      R2,R5
        MOV      R1,R8
        MOV      R0,R10
        B.N      send_at_sendFromBuf

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
send_to_pc:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+1000
        CMP      R1,R2
        ITEE     CC 
        SUBCC    R4,R2,R1
        RSBCS    R1,R1,#+1000
        ADDCS    R4,R2,R1
        MOV      R2,R4
        ADD      R1,SP,#+0
        BL       Ring_ReadData
        MOVS     R5,#+0
        LDR.N    R6,??DataTable25  ;; 0x40004400
        B.N      ??send_to_pc_0
??send_to_pc_1:
        ADD      R0,SP,#+0
        LDRB     R1,[R5, R0]
        MOV      R0,R6
        BL       USART_SendData
??send_to_pc_2:
        MOVS     R1,#+64
        MOV      R0,R6
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??send_to_pc_2
        ADDS     R5,R5,#+1
??send_to_pc_0:
        CMP      R5,R4
        BCC.N    ??send_to_pc_1
        ADD      SP,SP,#+1000
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
check_send_ERROR:
        PUSH     {R4,LR}
        MOVS     R1,#+0
        LDR.N    R2,??DataTable26  ;; UART2RingBuf
        LDR      R3,[R2, #+12]
        B.N      ??check_send_ERROR_0
??check_send_ERROR_1:
        SUBS     R1,R3,R4
??check_send_ERROR_0:
        ADD      R4,R0,#+24
        CMP      R1,R4
        BCS.N    ??check_send_ERROR_2
        LDR      R4,[R2, #+8]
        CMP      R4,R3
        BCC.N    ??check_send_ERROR_1
        RSB      R4,R4,#+1000
        ADDS     R1,R3,R4
        B.N      ??check_send_ERROR_0
??check_send_ERROR_2:
        LDR      R0,[R2, #+0]
        ADDS     R0,R3,R0
        LDRB     R1,[R0, #-4]
        CMP      R1,#+79
        BNE.N    ??check_send_ERROR_3
        SUBS     R0,R0,#+4
        LDRB     R0,[R0, #+1]
        CMP      R0,#+82
        BNE.N    ??check_send_ERROR_3
        LDR.N    R0,??DataTable17  ;; send_OK
        MOVS     R1,#+1
        STRB     R1,[R0, #+1]
??check_send_ERROR_3:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable17:
        DC32     send_OK

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
send_without_check:
        PUSH     {R3-R5,LR}
        MOV      R0,R1
        CMP      R2,R3
        ITEE     CC 
        SUBCC    R5,R3,R2
        RSBCS    R1,R2,#+1000
        ADDCS    R5,R3,R1
        BL       ?Subroutine8
??CrossCallReturnLabel_13:
        MOV      R3,R5
        MOVS     R2,#+0
        MOV      R1,R4
        MOVS     R0,#+3
        ADD      SP,SP,#+4
        POP      {R4,R5,LR}
        B.N      send_at_sendFromBuf

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine8:
        LDR.N    R4,??DataTable23  ;; sendBuf
        MOV      R2,R5
        MOV      R1,R4
        B.W      Ring_ReadData

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
send_ascii:
        PUSH     {R4,LR}
        SUB      SP,SP,#+256
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
        MOVS     R0,#+1
        ADD      R2,SP,#+0
??send_ascii_0:
        LDRB     R1,[SP, #+0]
        ADDS     R1,R0,R1
        STRB     R1,[R0, R2]
        ADDS     R0,R0,#+1
        CMP      R0,#+255
        BLE.N    ??send_ascii_0
        MOVS     R3,#+48
        BL       ?Subroutine4
??CrossCallReturnLabel_24:
        LDR.N    R4,??DataTable19  ;; 0x1e8480
        MOV      R0,R4
        BL       delay_us
        MOVS     R3,#+35
        BL       ?Subroutine4
??CrossCallReturnLabel_23:
        MOV      R0,R4
        BL       delay_us
        MOVS     R3,#+48
        MOVS     R2,#+35
        BL       ??Subroutine12_0
??CrossCallReturnLabel_22:
        MOV      R0,R4
        BL       delay_us
        ADD      SP,SP,#+256
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable19:
        DC32     0x1e8480

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine4:
        MOVS     R2,#+32
        Nop      
        REQUIRE ??Subroutine12_0
        ;; // Fall through to label ??Subroutine12_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
??Subroutine12_0:
        ADD      R1,SP,#+0
        MOVS     R0,#+3
        B.N      send_at_sendFromBuf

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
enable_transparent_transfer:
        PUSH     {R0-R4,LR}
        MOV      R4,R0
        LDR.N    R0,??DataTable20  ;; instr_len
        MOVS     R1,#+14
        STR      R1,[R0, #+0]
        ADD      R0,SP,#+0
        LDR.N    R1,??enable_transparent_transfer_0  ;; `?<Constant "at^ipentrans=1">`
        MOVS     R2,#+14
        BL       __aeabi_memcpy
        ADD      R0,R4,#+48
        STRB     R0,[SP, #+13]
        MOVS     R1,#+14
        BL       ?Subroutine5
??CrossCallReturnLabel_6:
        POP      {R0-R4,PC}       ;; return
        DATA
??enable_transparent_transfer_0:
        DC32     `?<Constant "at^ipentrans=1">`

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable20:
        DC32     instr_len

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine5:
        ADD      R0,SP,#+0
        B.N      send_at_general

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
disable_transparent_transfer:
        PUSH     {R3-R5,LR}
        ADD      R0,SP,#+0
        LDR.N    R1,??disable_transparent_transfer_0  ;; `?<Constant "+++">`
        MOVS     R2,#+3
        BL       __aeabi_memcpy
        MOVS     R4,#+0
        LDR.N    R5,??DataTable25  ;; 0x40004400
??disable_transparent_transfer_1:
        ADD      R0,SP,#+0
        LDRB     R1,[R4, R0]
        MOV      R0,R5
        BL       USART_SendData
??disable_transparent_transfer_2:
        MOVS     R1,#+64
        MOV      R0,R5
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??disable_transparent_transfer_2
        ADDS     R4,R4,#+1
        CMP      R4,#+3
        BLT.N    ??disable_transparent_transfer_1
        POP      {R0,R4,R5,PC}    ;; return
        Nop      
        DATA
??disable_transparent_transfer_0:
        DC32     `?<Constant "+++">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_to_sendBuf:
        PUSH     {R4,LR}
        CMP      R2,R1
        ITEE     CS 
        SUBCS    R4,R2,R1
        RSBCC    R1,R1,#+1000
        ADDCC    R4,R2,R1
        MOV      R2,R4
        LDR.N    R1,??DataTable23  ;; sendBuf
        BL       Ring_ReadData
        MOV      R0,R4
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
send_transparent_transfer:
        PUSH     {R3-R7,LR}
        MOV      R4,R0
        MOVS     R0,#+0
        LDR.N    R1,??send_transparent_transfer_0  ;; num_of_tri_plus
        LDR      R2,[R1, #+0]
        LDR.N    R5,??DataTable23  ;; sendBuf
        B.N      ??send_transparent_transfer_1
??send_transparent_transfer_2:
        LDRB     R3,[R0, R5]
        CMP      R3,#+43
        BNE.N    ??send_transparent_transfer_3
        ADDS     R3,R0,R5
        LDRB     R3,[R3, #+1]
        CMP      R3,#+43
        BNE.N    ??send_transparent_transfer_3
        ADDS     R3,R0,R5
        LDRB     R3,[R3, #+2]
        CMP      R3,#+43
        BNE.N    ??send_transparent_transfer_3
        MOVS     R3,#+42
        STRB     R3,[R0, R5]
        ADDS     R2,R2,#+1
??send_transparent_transfer_3:
        ADDS     R0,R0,#+1
??send_transparent_transfer_1:
        SUBS     R3,R4,#+2
        CMP      R0,R3
        BCC.N    ??send_transparent_transfer_2
        STR      R2,[R1, #+0]
        MOVS     R6,#+0
        LDR.N    R7,??DataTable25  ;; 0x40004400
        B.N      ??send_transparent_transfer_4
??send_transparent_transfer_5:
        LDRB     R1,[R6, R5]
        MOV      R0,R7
        BL       USART_SendData
??send_transparent_transfer_6:
        BL       ?Subroutine3
??CrossCallReturnLabel_3:
        CMP      R0,#+0
        BEQ.N    ??send_transparent_transfer_6
        ADDS     R6,R6,#+1
??send_transparent_transfer_4:
        CMP      R6,R4
        BCC.N    ??send_transparent_transfer_5
        POP      {R0,R4-R7,PC}    ;; return
        Nop      
        DATA
??send_transparent_transfer_0:
        DC32     num_of_tri_plus

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable23:
        DC32     sendBuf

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine3:
        MOVS     R1,#+64
        MOV      R0,R7
        B.W      USART_GetFlagStatus

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
send_line_id:
        PUSH     {R4,LR}
        LDR.N    R4,??DataTable25  ;; 0x40004400
        UXTB     R1,R0
        B.N      ?Subroutine0

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable25:
        DC32     0x40004400

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_received_len:
        LDR.N    R0,??DataTable26  ;; UART2RingBuf
        LDR      R1,[R0, #+8]
        LDR      R2,[R0, #+12]
        CMP      R2,R1
        BCC.N    ??get_received_len_0
        SUBS     R0,R2,R1
        BX       LR
??get_received_len_0:
        LDR      R0,[R0, #+4]
        SUBS     R0,R0,R1
        ADDS     R0,R2,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable26:
        DC32     UART2RingBuf

        SECTION `.rodata`:CONST:NOROOT(2)
`?<Constant {97, 116, 13}>`:
        DATA
        DC8 97, 116, 13, 0

        SECTION `.rodata`:CONST:NOROOT(1)
`?<Constant "at">`:
        DATA
        DC8 61H, 74H

        SECTION `.rodata`:CONST:NOROOT(2)
`?<Constant "at^ipinit=\\"3gnet\\"">`:
        DATA
        DC8 61H, 74H, 5EH, 69H, 70H, 69H, 6EH, 69H
        DC8 74H, 3DH, 22H, 33H, 67H, 6EH, 65H, 74H
        DC8 22H
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:NOROOT(2)
`?<Constant "at^ipopen=3,\\"tcp\\",\\"21...">`:
        DATA
        DC8 61H, 74H, 5EH, 69H, 70H, 6FH, 70H, 65H
        DC8 6EH, 3DH, 33H, 2CH, 22H, 74H, 63H, 70H
        DC8 22H, 2CH, 22H, 32H, 31H, 31H, 2EH, 38H
        DC8 37H, 2EH, 32H, 33H, 35H, 2EH, 31H, 35H
        DC8 37H, 22H, 2CH, 38H, 38H, 38H, 38H, 2CH
        DC8 33H, 33H, 30H, 30H, 30H
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:NOROOT(2)
`?<Constant "at^ipsend=3,\\"hello\\"">`:
        DATA
        DC8 61H, 74H, 5EH, 69H, 70H, 73H, 65H, 6EH
        DC8 64H, 3DH, 33H, 2CH, 22H, 68H, 65H, 6CH
        DC8 6CH, 6FH, 22H
        DC8 0

        SECTION `.rodata`:CONST:NOROOT(2)
`?<Constant "at^reset=1">`:
        DATA
        DC8 61H, 74H, 5EH, 72H, 65H, 73H, 65H, 74H
        DC8 3DH, 31H
        DC8 0, 0

        SECTION `.rodata`:CONST:NOROOT(2)
`?<Constant "at^ipsend=1,\\"">`:
        DATA
        DC8 61H, 74H, 5EH, 69H, 70H, 73H, 65H, 6EH
        DC8 64H, 3DH, 31H, 2CH, 22H
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:NOROOT(2)
`?<Constant "at^ipentrans=1">`:
        DATA
        DC8 61H, 74H, 5EH, 69H, 70H, 65H, 6EH, 74H
        DC8 72H, 61H, 6EH, 73H, 3DH, 31H
        DC8 0, 0

        SECTION `.rodata`:CONST:NOROOT(2)
`?<Constant "+++">`:
        DATA
        DC8 2BH, 2BH, 2BH
        DC8 0

        END
// 
// 1 008 bytes in section .bss
// 1 008 bytes in section .data
//   142 bytes in section .rodata
// 1 336 bytes in section .text
// 
// 1 336 bytes of CODE  memory
//   142 bytes of CONST memory
// 2 016 bytes of DATA  memory
//
//Errors: none
//Warnings: none
