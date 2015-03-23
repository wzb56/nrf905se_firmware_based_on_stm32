///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.0.51174/W32 for ARM    31/May/2011  15:52:03 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\253642xvvn\桌面\nrf905se\bigb /
//                    oard\send6\app\main.c                                   /
//    Command line =  "C:\Documents and Settings\253642xvvn\桌面\nrf905se\big /
//                    board\send6\app\main.c" -lC "C:\Documents and           /
//                    Settings\253642xvvn\桌面\nrf905se\bigboard\send6\Debug\ /
//                    List\" -lb "C:\Documents and                            /
//                    Settings\253642xvvn\桌面\nrf905se\bigboard\send6\Debug\ /
//                    List\" -o "C:\Documents and                             /
//                    Settings\253642xvvn\桌面\nrf905se\bigboard\send6\Debug\ /
//                    Obj\" --no_cse --no_unroll --no_inline                  /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "D:\Program Files\IAR Systems\Embedded Workbench        /
//                    5.4\arm\INC\DLib_Config_Full.h" -I "C:\Documents and    /
//                    Settings\253642xvvn\桌面\nrf905se\bigboard\send6\librar /
//                    y\inc\" -I "C:\Documents and                            /
//                    Settings\253642xvvn\桌面\nrf905se\bigboard\send6\board\ /
//                    " -I "C:\Documents and Settings\253642xvvn\桌面\nrf905s /
//                    e\bigboard\send6\app\" -I "D:\Program Files\IAR         /
//                    Systems\Embedded Workbench 5.4\arm\INC\" -Ol            /
//    List file    =  C:\Documents and Settings\253642xvvn\桌面\nrf905se\bigb /
//                    oard\send6\Debug\List\main.s                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME main

        EXTERN NRF905SE_Configuration
        EXTERN NRF905SE_GetRxAddress
        EXTERN NRF905SE_GetRxAddressSize
        EXTERN NRF905SE_GetTxAddress
        EXTERN NRF905SE_GetTxAddressSize
        EXTERN NRF905SE_GetTxPayload
        EXTERN NRF905SE_GetTxPayloadSize
        EXTERN NRF905SE_SendPacket
        EXTERN NRF905SE_TxBuffer
        EXTERN RCC_Configuration
        EXTERN SPI_Configuration
        EXTERN USART_Configuration
        EXTERN usart_cls
        EXTERN usart_printArray
        EXTERN usart_println
        EXTERN usart_putc
        EXTERN usart_puts

        PUBLIC main


        SECTION `.text`:CODE:NOROOT(2)
        THUMB
main:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+44
        BL       RCC_Configuration
        BL       USART_Configuration
        BL       SPI_Configuration
        BL       NRF905SE_Configuration
        BL       NRF905SE_GetRxAddressSize
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R0,SP,#+0
        BL       NRF905SE_GetRxAddress
        BL       NRF905SE_GetTxAddressSize
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R0,SP,#+4
        BL       NRF905SE_GetTxAddress
        BL       usart_cls
        LDR.N    R0,??main_0+0x4  ;; `?<Constant "\\316\\322\\312\\307\\267\\242\\313\\315\\3`
        BL       usart_puts
        BL       NRF905SE_GetRxAddressSize
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,R0
        ADD      R0,SP,#+0
        BL       usart_printArray
        BL       usart_println
        LDR.N    R0,??main_0+0x8  ;; `?<Constant "this is the NRF905SE ...">`
        BL       usart_puts
        BL       usart_println
        LDR.N    R0,??main_0+0xC  ;; `?<Constant "\\316\\322\\265\\304\\275\\323\\312\\325\\2`
        BL       usart_puts
        BL       NRF905SE_GetRxAddressSize
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,R0
        ADD      R0,SP,#+0
        BL       usart_printArray
        BL       usart_println
        LDR.N    R0,??main_0+0x10  ;; `?<Constant "\\316\\322\\265\\304\\317\\362\\304\\277\\2`
        BL       usart_puts
        BL       NRF905SE_GetTxAddressSize
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,R0
        ADD      R0,SP,#+4
        BL       usart_printArray
        LDR.N    R0,??main_0+0x14  ;; `?<Constant "\\267\\242\\313\\315\\312\\375\\276\\335">`
        BL       usart_puts
        BL       usart_println
        MOVS     R5,#+48
        BL       NRF905SE_GetTxPayloadSize
        MOVS     R4,R0
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??main_0+0x18  ;; NRF905SE_TxBuffer
        BL       NRF905SE_SendPacket
        B.N      ??main_1
??main_2:
        ADD      R1,SP,#+8
        LDRB     R1,[R0, R1]
        ADDS     R1,R1,#+1
        ADD      R2,SP,#+8
        STRB     R1,[R0, R2]
        ADDS     R0,R0,#+1
??main_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R0,R4
        BLT.N    ??main_2
??main_4:
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R0,SP,#+8
        BL       NRF905SE_SendPacket
??main_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+58
        BNE.N    ??main_5
        SUBS     R5,R5,#+10
        BL       usart_println
??main_5:
        LDR.N    R0,??main_0+0x1C  ;; `?<Constant "\\267\\242\\260\\374\\243\\272(">`
        BL       usart_puts
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       usart_putc
        ADDS     R5,R5,#+1
        ADR.N    R0,??main_0      ;; ")"
        BL       usart_puts
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R0,SP,#+8
        BL       NRF905SE_GetTxPayload
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,R4
        ADD      R0,SP,#+8
        BL       usart_printArray
        BL       usart_println
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+2
        SDIV     R1,R5,R0
        MLS      R1,R1,R0,R5
        CMP      R1,#+0
        BNE.N    ??main_6
        MOVS     R0,#+0
        B.N      ??main_7
??main_8:
        ADD      R1,SP,#+8
        LDRB     R1,[R0, R1]
        SUBS     R1,R1,#+1
        ADD      R2,SP,#+8
        STRB     R1,[R0, R2]
        ADDS     R0,R0,#+1
??main_7:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R0,R4
        BLT.N    ??main_8
        B.N      ??main_4
??main_6:
        MOVS     R0,#+0
        B.N      ??main_3
        Nop      
        DATA
??main_0:
        DC8      ")",+0,+0
        DC32     `?<Constant "\\316\\322\\312\\307\\267\\242\\313\\315\\3`
        DC32     `?<Constant "this is the NRF905SE ...">`
        DC32     `?<Constant "\\316\\322\\265\\304\\275\\323\\312\\325\\2`
        DC32     `?<Constant "\\316\\322\\265\\304\\317\\362\\304\\277\\2`
        DC32     `?<Constant "\\267\\242\\313\\315\\312\\375\\276\\335">`
        DC32     NRF905SE_TxBuffer
        DC32     `?<Constant "\\267\\242\\260\\374\\243\\272(">`

        SECTION `.rodata`:CONST:NOROOT(2)
`?<Constant "\\316\\322\\312\\307\\267\\242\\313\\315\\3`:
        DATA
        DC8 "\316\322\312\307\267\242\313\315\325\337\243\254 \316\322\265\304\265\330\326\267\312\307: "
        DC8 0, 0

        SECTION `.rodata`:CONST:NOROOT(2)
`?<Constant "this is the NRF905SE ...">`:
        DATA
        DC8 74H, 68H, 69H, 73H, 20H, 69H, 73H, 20H
        DC8 74H, 68H, 65H, 20H, 4EH, 52H, 46H, 39H
        DC8 30H, 35H, 53H, 45H, 20H, 74H, 72H, 61H
        DC8 6EH, 73H, 66H, 65H, 72H, 20H, 66H, 6FH
        DC8 72H, 20H, 73H, 65H, 6EH, 64H, 20H, 64H
        DC8 61H, 74H, 61H, 2CH, 20H, 69H, 74H, 73H
        DC8 20H, 69H, 6EH, 66H, 6FH, 20H, 61H, 72H
        DC8 65H, 20H, 61H, 73H, 20H, 66H, 6FH, 6CH
        DC8 6CH, 6FH, 77H, 73H, 3AH, 20H, 0
        DC8 0

        SECTION `.rodata`:CONST:NOROOT(2)
`?<Constant "\\316\\322\\265\\304\\275\\323\\312\\325\\2`:
        DATA
        DC8 "\316\322\265\304\275\323\312\325\265\330\326\267\243\272 "

        SECTION `.rodata`:CONST:NOROOT(2)
`?<Constant "\\316\\322\\265\\304\\317\\362\\304\\277\\2`:
        DATA
        DC8 "\316\322\265\304\317\362\304\277\261\352\265\330\326\267\243\272"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:NOROOT(2)
`?<Constant "\\267\\242\\313\\315\\312\\375\\276\\335">`:
        DATA
        DC8 "\267\242\313\315\312\375\276\335"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:NOROOT(2)
`?<Constant "\\267\\242\\260\\374\\243\\272(">`:
        DATA
        DC8 "\267\242\260\374\243\272("

        SECTION `.rodata`:CONST:NOROOT(1)
        DATA
        DC8 ")"

        END
// 
// 158 bytes in section .rodata
// 324 bytes in section .text
// 
// 324 bytes of CODE  memory
// 158 bytes of CONST memory
//
//Errors: none
//Warnings: 1
