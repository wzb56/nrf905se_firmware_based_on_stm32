///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.0.51174/W32 for ARM    18/May/2011  21:40:31 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\253642xvvn\桌面\IAR\2.4G_send /
//                    \Demo\source\ringbuf.c                                  /
//    Command line =  "C:\Documents and Settings\253642xvvn\桌面\IAR\2.4G_sen /
//                    d\Demo\source\ringbuf.c" -lC "C:\Documents and          /
//                    Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project\EWA /
//                    RMv5\Debug\List\" -lb "C:\Documents and                 /
//                    Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project\EWA /
//                    RMv5\Debug\List\" -o "C:\Documents and                  /
//                    Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project\EWA /
//                    RMv5\Debug\Obj\" --no_cse --no_unroll --no_inline       /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "D:\Program Files\IAR Systems\Embedded Workbench        /
//                    5.4\arm\INC\DLib_Config_Full.h" -I "C:\Documents and    /
//                    Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project\EWA /
//                    RMv5\..\..\include\" -I "C:\Documents and               /
//                    Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project\EWA /
//                    RMv5\..\..\source\" -I "C:\Documents and                /
//                    Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project\EWA /
//                    RMv5\..\..\..\FWLib\library\inc\" -I "C:\Documents and  /
//                    Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project\EWA /
//                    RMv5\..\..\..\USBLib\library\inc\" -I "C:\Documents     /
//                    and Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project /
//                    \EWARMv5\..\..\fatfs\" -I "D:\Program Files\IAR         /
//                    Systems\Embedded Workbench 5.4\arm\INC\" -Ol            /
//    List file    =  C:\Documents and Settings\253642xvvn\桌面\IAR\2.4G_send /
//                    \Demo\project\EWARMv5\Debug\List\ringbuf.s              /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ringbuf

        EXTERN __aeabi_memcpy

        PUBLIC FIFO_WriteData
        PUBLIC GetUsedRingBufferSize
        PUBLIC MemCycleToLine
        PUBLIC MemLineToCycle
        PUBLIC ReadData
        PUBLIC RingBufInit
        PUBLIC Ring_ReadData
        PUBLIC Ring_WriteData
        PUBLIC UART2RingBuf
        PUBLIC UART2_ReadData
        PUBLIC UART2_WriteData
        PUBLIC Uart2Buf
        PUBLIC UserBuf
        PUBLIC UserRingBuf
        PUBWEAK memcpy


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// __??Code16?? __intrinsic __code __interwork void *memcpy(void *, void const *, size_t)
memcpy:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       __aeabi_memcpy
        MOVS     R0,R4
        POP      {R4,PC}          ;; return

        SECTION `.bss`:DATA:NOROOT(2)
UserRingBuf:
        DS8 16

        SECTION `.bss`:DATA:NOROOT(2)
UART2RingBuf:
        DS8 16

        SECTION `.bss`:DATA:NOROOT(2)
UserBuf:
        DS8 1000

        SECTION `.bss`:DATA:NOROOT(2)
Uart2Buf:
        DS8 1000

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
RingBufInit:
        LDR.N    R0,??DataTable10  ;; UserRingBuf
        LDR.N    R1,??RingBufInit_0  ;; UserBuf
        STR      R1,[R0, #+0]
        LDR.N    R0,??DataTable10  ;; UserRingBuf
        MOV      R1,#+1000
        STR      R1,[R0, #+4]
        LDR.N    R0,??DataTable10  ;; UserRingBuf
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        LDR.N    R0,??DataTable10  ;; UserRingBuf
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        LDR.N    R0,??DataTable11  ;; UART2RingBuf
        LDR.N    R1,??RingBufInit_0+0x4  ;; Uart2Buf
        STR      R1,[R0, #+0]
        LDR.N    R0,??DataTable11  ;; UART2RingBuf
        MOV      R1,#+1000
        STR      R1,[R0, #+4]
        LDR.N    R0,??DataTable11  ;; UART2RingBuf
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        LDR.N    R0,??DataTable11  ;; UART2RingBuf
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        BX       LR               ;; return
        Nop      
        DATA
??RingBufInit_0:
        DC32     UserBuf
        DC32     Uart2Buf

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
MemLineToCycle:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOV      R9,R3
        LDR      R7,[SP, #+32]
        MOVS     R8,#+0
        CMP      R5,#+0
        BEQ.N    ??MemLineToCycle_0
        CMP      R6,R5
        BCC.N    ??MemLineToCycle_1
??MemLineToCycle_0:
        MOVS     R0,R4
        B.N      ??MemLineToCycle_2
??MemLineToCycle_1:
        SUBS     R8,R5,R6
        CMP      R8,R7
        BCS.N    ??MemLineToCycle_3
        SUBS     R2,R5,R6
        MOV      R1,R9
        ADDS     R0,R6,R4
        BL       memcpy
        ADDS     R9,R8,R9
        SUBS     R7,R7,R8
        MOVS     R6,#+0
        MOV      R8,R5
??MemLineToCycle_3:
        B.N      ??MemLineToCycle_4
??MemLineToCycle_5:
        MOVS     R2,R5
        MOV      R1,R9
        MOVS     R0,R4
        BL       memcpy
        ADDS     R9,R8,R9
        SUBS     R7,R7,R8
??MemLineToCycle_4:
        CMP      R8,R7
        BCC.N    ??MemLineToCycle_5
        MOVS     R2,R7
        MOV      R1,R9
        ADDS     R0,R6,R4
        BL       memcpy
        ADDS     R0,R7,R6
        UDIV     R1,R0,R5
        MLS      R0,R1,R5,R0
        ADDS     R0,R0,R4
??MemLineToCycle_2:
        POP      {R1,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
MemCycleToLine:
        PUSH     {R3-R7,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R0,R2
        MOVS     R4,R3
        LDR      R1,[SP, #+24]
        MOVS     R7,#+0
        CMP      R0,R4
        BCS.N    ??MemCycleToLine_0
        SUBS     R7,R4,R0
        MOVS     R2,R7
        ADDS     R1,R0,R6
        MOVS     R0,R5
        BL       memcpy
        B.N      ??MemCycleToLine_1
??MemCycleToLine_0:
        CMP      R4,R0
        BCS.N    ??MemCycleToLine_2
        SUBS     R7,R1,R0
        MOVS     R2,R7
        ADDS     R1,R0,R6
        MOVS     R0,R5
        BL       memcpy
        MOVS     R2,R4
        MOVS     R1,R6
        ADDS     R0,R7,R5
        BL       memcpy
        ADDS     R7,R4,R7
??MemCycleToLine_2:
??MemCycleToLine_1:
        MOVS     R0,R7
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Ring_ReadData:
        PUSH     {R3-R7,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOVS     R0,R5
        BL       GetUsedRingBufferSize
        CMP      R0,R7
        BCS.N    ??Ring_ReadData_0
        MOVS     R0,R5
        BL       GetUsedRingBufferSize
        MOVS     R7,R0
        B.N      ??Ring_ReadData_1
??Ring_ReadData_0:
??Ring_ReadData_1:
        LDR      R0,[R5, #+8]
        ADDS     R0,R7,R0
        LDR      R1,[R5, #+4]
        CMP      R0,R1
        BCC.N    ??Ring_ReadData_2
        LDR      R0,[R5, #+8]
        ADDS     R0,R7,R0
        LDR      R1,[R5, #+4]
        SUBS     R4,R0,R1
        B.N      ??Ring_ReadData_3
??Ring_ReadData_2:
        LDR      R0,[R5, #+8]
        ADDS     R4,R7,R0
??Ring_ReadData_3:
        LDR      R0,[R5, #+4]
        PUSH     {R0,LR}
        MOVS     R3,R4
        LDR      R2,[R5, #+8]
        LDR      R1,[R5, #+0]
        MOVS     R0,R6
        BL       MemCycleToLine
        ADD      SP,SP,#+8
        STR      R4,[R5, #+8]
        MOVS     R0,R7
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ReadData:
        PUSH     {R7,LR}
        MOVS     R2,R1
        MOVS     R1,R0
        LDR.N    R0,??DataTable10  ;; UserRingBuf
        BL       Ring_ReadData
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
UART2_ReadData:
        PUSH     {R7,LR}
        MOVS     R2,R1
        MOVS     R1,R0
        LDR.N    R0,??DataTable11  ;; UART2RingBuf
        BL       Ring_ReadData
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Ring_WriteData:
        PUSH     {R3-R7,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R6,R2
        LDR      R7,[R5, #+4]
        MOVS     R0,R5
        BL       GetUsedRingBufferSize
        SUBS     R0,R7,R0
        CMP      R0,R6
        BCS.N    ??Ring_WriteData_0
        MOVS     R0,#+0
        B.N      ??Ring_WriteData_1
??Ring_WriteData_0:
        PUSH     {R6,LR}
        MOVS     R3,R4
        LDR      R2,[R5, #+12]
        LDR      R1,[R5, #+4]
        LDR      R0,[R5, #+0]
        BL       MemLineToCycle
        ADD      SP,SP,#+8
        B.N      ??Ring_WriteData_2
??Ring_WriteData_3:
        LDR      R0,[R5, #+4]
        SUBS     R6,R6,R0
??Ring_WriteData_2:
        LDR      R0,[R5, #+4]
        CMP      R6,R0
        BCS.N    ??Ring_WriteData_3
        LDR      R0,[R5, #+4]
        LDR      R1,[R5, #+12]
        SUBS     R0,R0,R1
        CMP      R6,R0
        BCC.N    ??Ring_WriteData_4
        LDR      R0,[R5, #+12]
        LDR      R1,[R5, #+4]
        SUBS     R1,R6,R1
        ADDS     R0,R1,R0
        STR      R0,[R5, #+12]
        B.N      ??Ring_WriteData_5
??Ring_WriteData_4:
        LDR      R0,[R5, #+12]
        ADDS     R0,R6,R0
        STR      R0,[R5, #+12]
??Ring_WriteData_5:
        MOVS     R0,#+1
??Ring_WriteData_1:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FIFO_WriteData:
        PUSH     {R7,LR}
        MOVS     R2,R1
        MOVS     R1,R0
        LDR.N    R0,??DataTable10  ;; UserRingBuf
        BL       Ring_WriteData
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable10:
        DC32     UserRingBuf

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
UART2_WriteData:
        PUSH     {R7,LR}
        MOVS     R2,R1
        MOVS     R1,R0
        LDR.N    R0,??DataTable11  ;; UART2RingBuf
        BL       Ring_WriteData
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11:
        DC32     UART2RingBuf

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GetUsedRingBufferSize:
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R2,[R1, #+12]
        LDR      R3,[R1, #+8]
        CMP      R2,R3
        BCC.N    ??GetUsedRingBufferSize_0
        LDR      R0,[R1, #+12]
        LDR      R1,[R1, #+8]
        SUBS     R0,R0,R1
        B.N      ??GetUsedRingBufferSize_1
??GetUsedRingBufferSize_0:
        LDR      R0,[R1, #+4]
        LDR      R2,[R1, #+8]
        SUBS     R0,R0,R2
        LDR      R1,[R1, #+12]
        ADDS     R0,R1,R0
??GetUsedRingBufferSize_1:
        BX       LR               ;; return

        END
// 
// 2 032 bytes in section .bss
//   510 bytes in section .text
// 
//   496 bytes of CODE memory (+ 14 bytes shared)
// 2 032 bytes of DATA memory
//
//Errors: none
//Warnings: none
