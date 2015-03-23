///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.40.0.51500/W32 for ARM    15/Apr/2011  14:16:14 /
// Copyright (C) 1999-2009 IAR Systems AB.                                    /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\Administrator\桌面\newest-4.1 /
//                    5\Demo\source\at_mu203.c                                /
//    Command line =  "C:\Documents and Settings\Administrator\桌面\newest-4. /
//                    15\Demo\source\at_mu203.c" -lC "C:\Documents and        /
//                    Settings\Administrator\桌面\newest-4.15\Demo\project\EW /
//                    ARMv5\Debug\List\" -lb "C:\Documents and                /
//                    Settings\Administrator\桌面\newest-4.15\Demo\project\EW /
//                    ARMv5\Debug\List\" -o "C:\Documents and                 /
//                    Settings\Administrator\桌面\newest-4.15\Demo\project\EW /
//                    ARMv5\Debug\Obj\" --debug --endian=little               /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "C:\Program Files\IAR Systems\Embedded Workbench        /
//                    5.4_2\arm\INC\DLib_Config_Full.h" -I "C:\Documents and  /
//                    Settings\Administrator\桌面\newest-4.15\Demo\project\EW /
//                    ARMv5\..\..\include\" -I "C:\Documents and              /
//                    Settings\Administrator\桌面\newest-4.15\Demo\project\EW /
//                    ARMv5\..\..\source\" -I "C:\Documents and               /
//                    Settings\Administrator\桌面\newest-4.15\Demo\project\EW /
//                    ARMv5\..\..\..\FWLib\library\inc\" -I "C:\Documents     /
//                    and Settings\Administrator\桌面\newest-4.15\Demo\projec /
//                    t\EWARMv5\..\..\..\USBLib\library\inc\" -I              /
//                    "C:\Documents and Settings\Administrator\桌面\newest-4. /
//                    15\Demo\project\EWARMv5\..\..\fatfs\" -I "C:\Program    /
//                    Files\IAR Systems\Embedded Workbench 5.4_2\arm\INC\"    /
//                    -Ohz                                                    /
//    List file    =  C:\Documents and Settings\Administrator\桌面\newest-4.1 /
//                    5\Demo\project\EWARMv5\Debug\List\at_mu203.s            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME at_mu203

        EXTERN UART2RingBuf
        EXTERN UART2_ReadData
        EXTERN USART_GetFlagStatus
        EXTERN USART_SendData
        EXTERN __aeabi_memcpy4

        PUBLIC UART_ReadData
        PUBLIC at_initial_sequence
        PUBLIC disable_transparent_transfer
        PUBLIC enable_transparent_transfer
        PUBLIC get_received_len
        PUBLIC instr_len
        PUBLIC result_code_buf
        PUBLIC send_ERROR
        PUBLIC send_OK
        PUBLIC send_at
        PUBLIC send_at_general
        PUBLIC send_at_ipinit
        PUBLIC send_at_ipopen
        PUBLIC send_at_reset
        PUBLIC send_at_send


        SECTION `.bss`:DATA:NOROOT(2)
instr_len:
        DS8 4

        SECTION `.data`:DATA:NOROOT(2)
UART_ReadData:
        DATA
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

        SECTION `.bss`:DATA:NOROOT(0)
send_OK:
        DS8 1

        SECTION `.bss`:DATA:NOROOT(0)
send_ERROR:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
send_at_general:
        PUSH     {R3-R7,LR}
        MOV      R4,R0
        MOV      R5,R1
        MOVS     R6,#+0
        LDR.N    R7,??DataTable7  ;; 0x40004400
        B.N      ??send_at_general_0
??send_at_general_1:
        LDRB     R1,[R6, R4]
        MOV      R0,R7
        BL       USART_SendData
??send_at_general_2:
        MOVS     R1,#+64
        MOV      R0,R7
        BL       USART_GetFlagStatus
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
        MOVS     R1,#+64
        MOV      R0,R7
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??send_at_general_3
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
send_at:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable6  ;; instr_len
        MOVS     R1,#+2
        STR      R1,[R0, #+0]
        ADD      R0,SP,#+0
        LDR.N    R1,??send_at_0   ;; `?<Constant "at">`
        LDRH     R2,[R1, #0]
        STRH     R2,[R0, #+0]
        MOVS     R1,#+2
        BL       send_at_general
        POP      {R0,PC}          ;; return
        DATA
??send_at_0:
        DC32     `?<Constant "at">`

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
send_at_ipinit:
        PUSH     {LR}
        SUB      SP,SP,#+20
        LDR.N    R0,??DataTable6  ;; instr_len
        MOVS     R1,#+17
        STR      R1,[R0, #+0]
        ADD      R0,SP,#+0
        LDR.N    R1,??send_at_ipinit_0  ;; `?<Constant "at^ipinit=\\"3gnet\\"">`
        MOVS     R2,#+17
        BL       __aeabi_memcpy4
        MOVS     R1,#+17
        B.N      ?Subroutine0
        DATA
??send_at_ipinit_0:
        DC32     `?<Constant "at^ipinit=\\"3gnet\\"">`

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
send_at_ipopen:
        PUSH     {LR}
        SUB      SP,SP,#+52
        LDR.N    R0,??DataTable6  ;; instr_len
        MOVS     R1,#+45
        STR      R1,[R0, #+0]
        ADD      R0,SP,#+0
        LDR.N    R1,??send_at_ipopen_0  ;; `?<Constant "at^ipopen=3,\\"tcp\\",\\"21...">`
        MOVS     R2,#+45
        BL       __aeabi_memcpy4
        MOVS     R1,#+45
        BL       ?Subroutine1
??CrossCallReturnLabel_3:
        ADD      SP,SP,#+52
        POP      {PC}             ;; return
        Nop      
        DATA
??send_at_ipopen_0:
        DC32     `?<Constant "at^ipopen=3,\\"tcp\\",\\"21...">`

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
send_at_send:
        PUSH     {LR}
        SUB      SP,SP,#+20
        LDR.N    R0,??DataTable6  ;; instr_len
        MOVS     R1,#+19
        STR      R1,[R0, #+0]
        ADD      R0,SP,#+0
        LDR.N    R1,??Subroutine0_0  ;; `?<Constant "at^ipsend=3,\\"hello\\"">`
        MOVS     R2,#+19
        BL       __aeabi_memcpy4
        MOVS     R1,#+19
        Nop      
        REQUIRE ?Subroutine0
        ;; // Fall through to label ?Subroutine0

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine0:
        BL       ?Subroutine1
??CrossCallReturnLabel_2:
        ADD      SP,SP,#+20
        POP      {PC}             ;; return
        DATA
??Subroutine0_0:
        DC32     `?<Constant "at^ipsend=3,\\"hello\\"">`

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
send_at_reset:
        PUSH     {R5-R7,LR}
        LDR.N    R0,??DataTable6  ;; instr_len
        MOVS     R1,#+10
        STR      R1,[R0, #+0]
        ADD      R0,SP,#+0
        LDR.N    R1,??send_at_reset_0  ;; `?<Constant "at^reset=1">`
        MOVS     R2,#+10
        BL       __aeabi_memcpy4
        MOVS     R1,#+10
        BL       ?Subroutine1
??CrossCallReturnLabel_1:
        POP      {R0-R2,PC}       ;; return
        Nop      
        DATA
??send_at_reset_0:
        DC32     `?<Constant "at^reset=1">`

        SECTION `.text`:CODE:NOROOT(2)
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
        LDR.N    R5,??at_initial_sequence_2  ;; UART_ReadData
        MOVS     R1,#+9
        ADDS     R0,R5,#+4
        LDR      R2,[R5, #+0]
        BLX      R2
        BL       send_at_ipinit
        B.N      ??at_initial_sequence_3
??at_initial_sequence_4:
        BL       get_received_len
        MOV      R4,R0
??at_initial_sequence_3:
        CMP      R4,#+24
        BCC.N    ??at_initial_sequence_4
        MOVS     R1,#+24
        ADDS     R0,R5,#+4
        LDR      R2,[R5, #+0]
        BLX      R2
        BL       send_at_ipopen
        B.N      ??at_initial_sequence_5
??at_initial_sequence_6:
        BL       get_received_len
        MOV      R4,R0
??at_initial_sequence_5:
        CMP      R4,#+52
        BCC.N    ??at_initial_sequence_6
        MOVS     R1,#+52
        ADDS     R0,R5,#+4
        LDR      R2,[R5, #+0]
        BLX      R2
        MOVS     R0,#+3
        BL       enable_transparent_transfer
        MOVS     R1,#+21
        ADDS     R0,R5,#+4
        LDR      R2,[R5, #+0]
        POP      {R3-R5,LR}
        BX       R2
        DATA
??at_initial_sequence_2:
        DC32     UART_ReadData

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
enable_transparent_transfer:
        PUSH     {R0-R4,LR}
        MOV      R4,R0
        LDR.N    R0,??DataTable6  ;; instr_len
        MOVS     R1,#+14
        STR      R1,[R0, #+0]
        ADD      R0,SP,#+0
        LDR.N    R1,??enable_transparent_transfer_0  ;; `?<Constant "at^ipentrans=1">`
        MOVS     R2,#+14
        BL       __aeabi_memcpy4
        ADD      R0,R4,#+48
        STRB     R0,[SP, #+13]
        MOVS     R1,#+14
        BL       ?Subroutine1
??CrossCallReturnLabel_0:
        POP      {R0-R4,PC}       ;; return
        DATA
??enable_transparent_transfer_0:
        DC32     `?<Constant "at^ipentrans=1">`

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable6:
        DC32     instr_len

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine1:
        ADD      R0,SP,#+0
        B.N      send_at_general

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
disable_transparent_transfer:
        PUSH     {R3-R5,LR}
        ADD      R0,SP,#+0
        LDR.N    R1,??disable_transparent_transfer_0  ;; `?<Constant "+++">`
        MOVS     R2,#+3
        BL       __aeabi_memcpy4
        MOVS     R4,#+0
        LDR.N    R5,??DataTable7  ;; 0x40004400
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

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable7:
        DC32     0x40004400

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
get_received_len:
        LDR.N    R0,??get_received_len_0  ;; UART2RingBuf
        LDR      R1,[R0, #+8]
        LDR      R2,[R0, #+12]
        CMP      R2,R1
        BCC.N    ??get_received_len_1
        SUBS     R0,R2,R1
        BX       LR
??get_received_len_1:
        LDR      R0,[R0, #+4]
        SUBS     R0,R0,R1
        ADDS     R0,R2,R0
        BX       LR               ;; return
        Nop      
        DATA
??get_received_len_0:
        DC32     UART2RingBuf

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
//     6 bytes in section .bss
// 1 004 bytes in section .data
//   122 bytes in section .rodata
//   456 bytes in section .text
// 
//   456 bytes of CODE  memory
//   122 bytes of CONST memory
// 1 010 bytes of DATA  memory
//
//Errors: none
//Warnings: none
