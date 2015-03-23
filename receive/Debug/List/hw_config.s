///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.0.51174/W32 for ARM    28/May/2011  10:37:11 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\253642xvvn\桌面\nrf905se\bigb /
//                    oard\send6\app\hw_config.c                              /
//    Command line =  "C:\Documents and Settings\253642xvvn\桌面\nrf905se\big /
//                    board\send6\app\hw_config.c" -lC "C:\Documents and      /
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
//                    oard\send6\Debug\List\hw_config.s                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME hw_config

        EXTERN FLASH_PrefetchBufferCmd
        EXTERN FLASH_SetLatency
        EXTERN GPIO_Init
        EXTERN GPIO_StructInit
        EXTERN NVIC_Init
        EXTERN NVIC_PriorityGroupConfig
        EXTERN NVIC_SetVectorTable
        EXTERN RCC_ADCCLKConfig
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
        EXTERN SPI_Cmd
        EXTERN SPI_Init
        EXTERN SPI_StructInit
        EXTERN SysTick_CLKSourceConfig
        EXTERN SysTick_CounterCmd
        EXTERN SysTick_ITConfig
        EXTERN SysTick_SetReload
        EXTERN USART_Cmd
        EXTERN USART_GetFlagStatus
        EXTERN USART_ITConfig
        EXTERN USART_Init
        EXTERN USART_ReceiveData
        EXTERN USART_SendData
        EXTERN USART_StructInit

        PUBLIC Decrement_TimingDelay
        PUBLIC RCC_Configuration
        PUBLIC RCC_Configuration_1
        PUBLIC SPI_Configuration
        PUBLIC System_Init
        PUBLIC TimingDelay
        PUBLIC USART_Configuration
        PUBLIC USART_EXTI_DoIt
        PUBLIC delay_us
        PUBLIC usart_cls
        PUBLIC usart_printArray
        PUBLIC usart_println
        PUBLIC usart_putc
        PUBLIC usart_puts


        SECTION `.bss`:DATA:NOROOT(2)
TimingDelay:
        DS8 4

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
        MOVW     R0,#+20493
        BL       RCC_APB2PeriphClockCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_Configuration_1:
        PUSH     {R7,LR}
        BL       RCC_DeInit
        MOVS     R0,#+65536
        BL       RCC_HSEConfig
        BL       RCC_WaitForHSEStartUp
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??RCC_Configuration_1_0
        MOVS     R0,#+16
        BL       FLASH_PrefetchBufferCmd
        MOVS     R0,#+2
        BL       FLASH_SetLatency
        MOVS     R0,#+0
        BL       RCC_HCLKConfig
        MOVS     R0,#+0
        BL       RCC_PCLK2Config
        MOV      R0,#+1024
        BL       RCC_PCLK1Config
        MOV      R0,#+32768
        BL       RCC_ADCCLKConfig
        MOVS     R1,#+1835008
        MOVS     R0,#+65536
        BL       RCC_PLLConfig
        MOVS     R0,#+1
        BL       RCC_PLLCmd
??RCC_Configuration_1_1:
        MOVS     R0,#+57
        BL       RCC_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??RCC_Configuration_1_1
        MOVS     R0,#+2
        BL       RCC_SYSCLKConfig
??RCC_Configuration_1_2:
        BL       RCC_GetSYSCLKSource
        CMP      R0,#+8
        BNE.N    ??RCC_Configuration_1_2
??RCC_Configuration_1_0:
        MOVS     R1,#+1
        MOVW     R0,#+20493
        BL       RCC_APB2PeriphClockCmd
        BL       SysTick_Configuration
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SysTick_Configuration:
        PUSH     {R7,LR}
        MOVS     R0,#+4
        BL       SysTick_CLKSourceConfig
        MOVS     R0,#+72
        BL       SysTick_SetReload
        MOVS     R0,#+1
        BL       SysTick_ITConfig
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
delay_us:
        PUSH     {R7,LR}
        LDR.N    R1,??DataTable4  ;; TimingDelay
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        BL       SysTick_CounterCmd
??delay_us_0:
        LDR.N    R0,??DataTable4  ;; TimingDelay
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??delay_us_0
        MVNS     R0,#+1
        BL       SysTick_CounterCmd
        MOVS     R0,#+0
        BL       SysTick_CounterCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Decrement_TimingDelay:
        LDR.N    R0,??DataTable4  ;; TimingDelay
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Decrement_TimingDelay_0
        LDR.N    R0,??DataTable4  ;; TimingDelay
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable4  ;; TimingDelay
        STR      R0,[R1, #+0]
??Decrement_TimingDelay_0:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4:
        DC32     TimingDelay

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_Configuration:
        PUSH     {R7,LR}
        BL       USART1_GPIO_Configuration
        BL       USART1_NVIC_Configuration
        BL       USART1_Configuration
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_Configuration:
        PUSH     {R7,LR}
        BL       SPI1_GPIO_Configuration
        BL       SPI1_NVIC_Configuration
        BL       SPI1_Configuration
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
System_Init:
        PUSH     {R7,LR}
        BL       RCC_Configuration
        BL       USART_Configuration
        BL       SPI_Configuration
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART1_GPIO_Configuration:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+5
        BL       RCC_APB2PeriphClockCmd
        ADD      R0,SP,#+0
        BL       GPIO_StructInit
        MOV      R0,#+512
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+24
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable11  ;; 0x40010800
        BL       GPIO_Init
        MOV      R0,#+1024
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable11  ;; 0x40010800
        BL       GPIO_Init
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART1_NVIC_Configuration:
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

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART1_Configuration:
        PUSH     {LR}
        SUB      SP,SP,#+20
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
        STRH     R0,[SP, #+10]
        MOVS     R0,#+0
        STRH     R0,[SP, #+12]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable19  ;; 0x40013800
        BL       USART_Init
        MOVS     R2,#+1
        MOVW     R1,#+1317
        LDR.N    R0,??DataTable19  ;; 0x40013800
        BL       USART_ITConfig
        MOVS     R1,#+1
        LDR.N    R0,??DataTable19  ;; 0x40013800
        BL       USART_Cmd
        ADD      SP,SP,#+20
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI1_GPIO_Configuration:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+5
        BL       RCC_APB2PeriphClockCmd
        ADD      R0,SP,#+0
        BL       GPIO_StructInit
        MOVS     R0,#+160
        STRH     R0,[SP, #+0]
        MOVS     R0,#+24
        STRB     R0,[SP, #+3]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable11  ;; 0x40010800
        BL       GPIO_Init
        MOVS     R0,#+64
        STRH     R0,[SP, #+0]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable11  ;; 0x40010800
        BL       GPIO_Init
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11:
        DC32     0x40010800

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI1_NVIC_Configuration:
        PUSH     {R7,LR}
        MOVS     R1,#+0
        MOVS     R0,#+134217728
        BL       NVIC_SetVectorTable
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SPI1_Configuration:
        PUSH     {LR}
        SUB      SP,SP,#+20
        MOVS     R1,#+1
        MOV      R0,#+4096
        BL       RCC_APB2PeriphClockCmd
        ADD      R0,SP,#+0
        BL       SPI_StructInit
        MOVS     R0,#+0
        STRH     R0,[SP, #+0]
        MOV      R0,#+260
        STRH     R0,[SP, #+2]
        MOVS     R0,#+0
        STRH     R0,[SP, #+4]
        MOVS     R0,#+0
        STRH     R0,[SP, #+14]
        MOVS     R0,#+0
        STRH     R0,[SP, #+6]
        MOVS     R0,#+0
        STRH     R0,[SP, #+8]
        MOV      R0,#+512
        STRH     R0,[SP, #+10]
        MOVS     R0,#+16
        STRH     R0,[SP, #+12]
        MOVS     R0,#+7
        STRH     R0,[SP, #+16]
        ADD      R1,SP,#+0
        LDR.N    R0,??SPI1_Configuration_0  ;; 0x40013000
        BL       SPI_Init
        MOVS     R1,#+1
        LDR.N    R0,??SPI1_Configuration_0  ;; 0x40013000
        BL       SPI_Cmd
        ADD      SP,SP,#+20
        POP      {PC}             ;; return
        Nop      
        DATA
??SPI1_Configuration_0:
        DC32     0x40013000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
usart_putc:
        PUSH     {R4,LR}
        MOVS     R4,R0
??usart_putc_0:
        MOVS     R1,#+128
        LDR.N    R0,??DataTable19  ;; 0x40013800
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??usart_putc_0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable19  ;; 0x40013800
        BL       USART_SendData
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
usart_puts:
        PUSH     {R4,LR}
        MOVS     R4,R0
        B.N      ??usart_puts_0
??usart_puts_1:
        LDRB     R0,[R4, #+0]
        BL       usart_putc
        ADDS     R4,R4,#+1
??usart_puts_0:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BNE.N    ??usart_puts_1
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
usart_println:
        PUSH     {R7,LR}
        MOVS     R0,#+10
        BL       usart_putc
        MOVS     R0,#+13
        BL       usart_putc
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
usart_cls:
        PUSH     {R7,LR}
        MOVS     R0,#+12
        BL       usart_putc
        MOVS     R0,#+12
        BL       usart_putc
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
usart_printArray:
        PUSH     {R4-R6,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R6,#+0
        B.N      ??usart_printArray_0
??usart_printArray_1:
        LDRB     R0,[R5, #+0]
        BL       usart_putc
        ADDS     R5,R5,#+1
        ADDS     R6,R6,#+1
??usart_printArray_0:
        CMP      R6,R4
        BCC.N    ??usart_printArray_1
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_EXTI_DoIt:
        PUSH     {R4,LR}
        MOVS     R1,#+32
        LDR.N    R0,??DataTable19  ;; 0x40013800
        BL       USART_GetFlagStatus
        CMP      R0,#+1
        BNE.N    ??USART_EXTI_DoIt_0
        LDR.N    R0,??DataTable19  ;; 0x40013800
        BL       USART_ReceiveData
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable19  ;; 0x40013800
        BL       USART_SendData
??USART_EXTI_DoIt_1:
        MOVS     R1,#+128
        LDR.N    R0,??DataTable19  ;; 0x40013800
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??USART_EXTI_DoIt_1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+13
        BNE.N    ??USART_EXTI_DoIt_2
        MOVS     R1,#+10
        LDR.N    R0,??DataTable19  ;; 0x40013800
        BL       USART_SendData
??USART_EXTI_DoIt_3:
        MOVS     R1,#+128
        LDR.N    R0,??DataTable19  ;; 0x40013800
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BNE.N    ??USART_EXTI_DoIt_3
??USART_EXTI_DoIt_2:
??USART_EXTI_DoIt_0:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable19:
        DC32     0x40013800

        END
// 
//   4 bytes in section .bss
// 956 bytes in section .text
// 
// 956 bytes of CODE memory
//   4 bytes of DATA memory
//
//Errors: none
//Warnings: none
