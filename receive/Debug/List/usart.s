///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.0.51174/W32 for ARM    24/May/2011  18:21:35 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\253642xvvn\桌面\work\nrf905\s /
//                    end\app\usart.c                                         /
//    Command line =  "C:\Documents and Settings\253642xvvn\桌面\work\nrf905\ /
//                    send\app\usart.c" -lC "C:\Documents and                 /
//                    Settings\253642xvvn\桌面\work\nrf905\send\Debug\List\"  /
//                    -lb "C:\Documents and Settings\253642xvvn\桌面\work\nrf /
//                    905\send\Debug\List\" -o "C:\Documents and              /
//                    Settings\253642xvvn\桌面\work\nrf905\send\Debug\Obj\"   /
//                    --no_cse --no_unroll --no_inline --no_code_motion       /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "D:\Program Files\IAR Systems\Embedded    /
//                    Workbench 5.4\arm\INC\DLib_Config_Full.h" -I            /
//                    "C:\Documents and Settings\253642xvvn\桌面\work\nrf905\ /
//                    send\library\inc\" -I "C:\Documents and                 /
//                    Settings\253642xvvn\桌面\work\nrf905\send\board\" -I    /
//                    "C:\Documents and Settings\253642xvvn\桌面\work\nrf905\ /
//                    send\app\" -I "D:\Program Files\IAR Systems\Embedded    /
//                    Workbench 5.4\arm\INC\" -Ol                             /
//    List file    =  C:\Documents and Settings\253642xvvn\桌面\work\nrf905\s /
//                    end\Debug\List\usart.s                                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME usart

        EXTERN FLASH_PrefetchBufferCmd
        EXTERN FLASH_SetLatency
        EXTERN GPIO_Init
        EXTERN GPIO_StructInit
        EXTERN NVIC_Init
        EXTERN NVIC_PriorityGroupConfig
        EXTERN NVIC_SetVectorTable
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN RCC_DeInit
        EXTERN RCC_GetFlagStatus
        EXTERN RCC_GetSYSCLKSource
        EXTERN RCC_HCLKConfig
        EXTERN RCC_HSEConfig
        EXTERN RCC_PCLK1Config
        EXTERN RCC_PCLK2Config
        EXTERN RCC_PLLCmd
        EXTERN RCC_PLLConfig
        EXTERN RCC_SYSCLKConfig
        EXTERN RCC_WaitForHSEStartUp
        EXTERN USART_Cmd
        EXTERN USART_ITConfig
        EXTERN USART_Init
        EXTERN USART_StructInit

        PUBLIC GPIO_Configuration
        PUBLIC NVIC_Configuration
        PUBLIC RCC_Configuration
        PUBLIC USART_Configuration


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_Configuration:
        PUSH     {R7,LR}
        BL       RCC_DeInit
        MOVS     R0,#+65536
        BL       RCC_HSEConfig
        BL       RCC_WaitForHSEStartUp
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??RCC_Configuration_0
        MOVS     R0,#+0
        BL       RCC_HCLKConfig
        MOVS     R0,#+0
        BL       RCC_PCLK2Config
        MOV      R0,#+1024
        BL       RCC_PCLK1Config
        MOVS     R0,#+2
        BL       FLASH_SetLatency
        MOVS     R0,#+16
        BL       FLASH_PrefetchBufferCmd
        MOVS     R1,#+1835008
        MOVS     R0,#+65536
        BL       RCC_PLLConfig
        MOVS     R0,#+1
        BL       RCC_PLLCmd
??RCC_Configuration_1:
        MOVS     R0,#+57
        BL       RCC_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??RCC_Configuration_1
        MOVS     R0,#+2
        BL       RCC_SYSCLKConfig
??RCC_Configuration_2:
        BL       RCC_GetSYSCLKSource
        CMP      R0,#+8
        BNE.N    ??RCC_Configuration_2
??RCC_Configuration_0:
        MOVS     R1,#+1
        MOVW     R0,#+16389
        BL       RCC_APB2PeriphClockCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
GPIO_Configuration:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+5
        BL       RCC_APB2PeriphClockCmd
        ADD      R0,SP,#+0
        BL       GPIO_StructInit
        MOV      R0,#+512
        STRH     R0,[SP, #+0]
        MOVS     R0,#+24
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??GPIO_Configuration_0  ;; 0x40010800
        BL       GPIO_Init
        MOV      R0,#+1024
        STRH     R0,[SP, #+0]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??GPIO_Configuration_0  ;; 0x40010800
        BL       GPIO_Init
        POP      {R0,PC}          ;; return
        Nop      
        DATA
??GPIO_Configuration_0:
        DC32     0x40010800

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
USART_Configuration:
        PUSH     {LR}
        SUB      SP,SP,#+28
        MOVS     R1,#+1
        MOV      R0,#+16384
        BL       RCC_APB2PeriphClockCmd
        ADD      R0,SP,#+0
        BL       USART_StructInit
        MOVS     R0,#+115200
        STR      R0,[SP, #+0]
        MOVS     R0,#+0
        STRH     R0,[SP, #+4]
        MOVS     R0,#+0
        STRH     R0,[SP, #+6]
        MOVS     R0,#+0
        STRH     R0,[SP, #+8]
        MOVS     R0,#+12
        STRH     R0,[SP, #+12]
        MOVS     R0,#+0
        STRH     R0,[SP, #+10]
        ADD      R1,SP,#+0
        LDR.N    R0,??USART_Configuration_0  ;; 0x40013800
        BL       USART_Init
        MOVS     R2,#+1
        MOVW     R1,#+1317
        LDR.N    R0,??USART_Configuration_0  ;; 0x40013800
        BL       USART_ITConfig
        MOVS     R1,#+1
        LDR.N    R0,??USART_Configuration_0  ;; 0x40013800
        BL       USART_Cmd
        ADD      SP,SP,#+28
        POP      {PC}             ;; return
        DATA
??USART_Configuration_0:
        DC32     0x40013800

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_Configuration:
        PUSH     {R7,LR}
        MOVS     R1,#+0
        MOVS     R0,#+134217728
        BL       NVIC_SetVectorTable
        MOV      R0,#+1280
        BL       NVIC_PriorityGroupConfig
        MOVS     R0,#+37
        STRB     R0,[SP, #+0]
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
        MOVS     R0,#+0
        STRB     R0,[SP, #+2]
        MOVS     R0,#+1
        STRB     R0,[SP, #+3]
        ADD      R0,SP,#+0
        BL       NVIC_Init
        POP      {R0,PC}          ;; return

        END
// 
// 322 bytes in section .text
// 
// 322 bytes of CODE memory
//
//Errors: none
//Warnings: none
