///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.0.51174/W32 for ARM    28/May/2011  10:37:10 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\253642xvvn\桌面\nrf905se\bigb /
//                    oard\send6\app\nrf905.c                                 /
//    Command line =  "C:\Documents and Settings\253642xvvn\桌面\nrf905se\big /
//                    board\send6\app\nrf905.c" -lC "C:\Documents and         /
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
//                    oard\send6\Debug\List\nrf905.s                          /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME nrf905

        EXTERN EXTI_ClearITPendingBit
        EXTERN EXTI_Init
        EXTERN GPIO_EXTILineConfig
        EXTERN GPIO_Init
        EXTERN NVIC_Init
        EXTERN NVIC_PriorityGroupConfig
        EXTERN NVIC_SetVectorTable
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN SPI_I2S_GetFlagStatus
        EXTERN SPI_I2S_ReceiveData
        EXTERN SPI_I2S_SendData

        PUBLIC NRF905SE_Config_Buf
        PUBLIC NRF905SE_Configuration
        PUBLIC NRF905SE_DR_FLAG
        PUBLIC NRF905SE_EXTI_DoIt
        PUBLIC NRF905SE_GetAutoRetranMode
        PUBLIC NRF905SE_GetCRCMode
        PUBLIC NRF905SE_GetRxAddress
        PUBLIC NRF905SE_GetRxAddressSize
        PUBLIC NRF905SE_GetRxPayload
        PUBLIC NRF905SE_GetRxPayloadSize
        PUBLIC NRF905SE_GetTxAddress
        PUBLIC NRF905SE_GetTxAddressSize
        PUBLIC NRF905SE_GetTxPayload
        PUBLIC NRF905SE_GetTxPayloadSize
        PUBLIC NRF905SE_IsAutoRetranEnable
        PUBLIC NRF905SE_IsCRCModeEnable
        PUBLIC NRF905SE_ReceiveData
        PUBLIC NRF905SE_ReceivePacket
        PUBLIC NRF905SE_RxAddress
        PUBLIC NRF905SE_RxBuffer
        PUBLIC NRF905SE_SendData
        PUBLIC NRF905SE_SendPacket
        PUBLIC NRF905SE_SendTxPacket
        PUBLIC NRF905SE_SetAutoRetranMode
        PUBLIC NRF905SE_SetCRCMode
        PUBLIC NRF905SE_SetRxAddress
        PUBLIC NRF905SE_SetRxAddressSize
        PUBLIC NRF905SE_SetRxMode
        PUBLIC NRF905SE_SetRxPayload
        PUBLIC NRF905SE_SetRxPayloadSize
        PUBLIC NRF905SE_SetSPIMode
        PUBLIC NRF905SE_SetTxAddress
        PUBLIC NRF905SE_SetTxAddressSize
        PUBLIC NRF905SE_SetTxMode
        PUBLIC NRF905SE_SetTxPayload
        PUBLIC NRF905SE_SetTxPayloadSize
        PUBLIC NRF905SE_TxAddress
        PUBLIC NRF905SE_TxBuffer
        PUBLIC RxAddress
        PUBLIC TxAddress


        SECTION `.bss`:DATA:NOROOT(2)
NRF905SE_RxBuffer:
        DS8 32

        SECTION `.data`:DATA:NOROOT(2)
NRF905SE_TxBuffer:
        DATA
        DC8 48, 50, 51, 65, 66, 67, 68, 69, 48, 50, 51, 65, 66, 67, 68, 69, 48
        DC8 50, 51, 65, 66, 67, 68, 69, 48, 50, 51, 65, 66, 67, 68, 69

        SECTION `.data`:DATA:NOROOT(2)
NRF905SE_TxAddress:
        DATA
        DC8 49, 50, 51, 52

        SECTION `.data`:DATA:NOROOT(2)
NRF905SE_RxAddress:
        DATA
        DC8 48, 49, 50, 51

        SECTION `.bss`:DATA:NOROOT(2)
TxAddress:
        DS8 4

        SECTION `.bss`:DATA:NOROOT(2)
RxAddress:
        DS8 4

        SECTION `.bss`:DATA:NOROOT(0)
NRF905SE_DR_FLAG:
        DS8 1

        SECTION `.data`:DATA:NOROOT(2)
NRF905SE_Config_Buf:
        DATA
        DC8 10, 76, 12, 68, 32, 32, 204, 204, 204, 204, 88, 0

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
NRF905SE_GPIO_Config:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+21
        BL       RCC_APB2PeriphClockCmd
        MOVS     R0,#+1
        STRH     R0,[SP, #+0]
        MOVS     R0,#+16
        STRB     R0,[SP, #+3]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        ADD      R1,SP,#+0
        LDR.N    R0,??NRF905SE_GPIO_Config_0  ;; 0x40010800
        BL       GPIO_Init
        MOVS     R0,#+8
        STRH     R0,[SP, #+0]
        MOVS     R0,#+16
        STRB     R0,[SP, #+3]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        ADD      R1,SP,#+0
        LDR.N    R0,??NRF905SE_GPIO_Config_0  ;; 0x40010800
        BL       GPIO_Init
        MOVS     R0,#+16
        STRH     R0,[SP, #+0]
        MOVS     R0,#+16
        STRB     R0,[SP, #+3]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        ADD      R1,SP,#+0
        LDR.N    R0,??NRF905SE_GPIO_Config_0  ;; 0x40010800
        BL       GPIO_Init
        MOVS     R0,#+1
        STRH     R0,[SP, #+0]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        ADD      R1,SP,#+0
        LDR.N    R0,??NRF905SE_GPIO_Config_0+0x4  ;; 0x40011000
        BL       GPIO_Init
        MOVS     R0,#+2
        STRH     R0,[SP, #+0]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        ADD      R1,SP,#+0
        LDR.N    R0,??NRF905SE_GPIO_Config_0+0x4  ;; 0x40011000
        BL       GPIO_Init
        MOVS     R0,#+4
        STRH     R0,[SP, #+0]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        ADD      R1,SP,#+0
        LDR.N    R0,??NRF905SE_GPIO_Config_0+0x4  ;; 0x40011000
        BL       GPIO_Init
        MOVS     R0,#+8
        STRH     R0,[SP, #+0]
        MOVS     R0,#+16
        STRB     R0,[SP, #+3]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        ADD      R1,SP,#+0
        LDR.N    R0,??NRF905SE_GPIO_Config_0+0x4  ;; 0x40011000
        BL       GPIO_Init
        POP      {R0,PC}          ;; return
        Nop      
        DATA
??NRF905SE_GPIO_Config_0:
        DC32     0x40010800
        DC32     0x40011000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_NVIC_Config:
        PUSH     {R7,LR}
        MOVS     R1,#+0
        MOVS     R0,#+134217728
        BL       NVIC_SetVectorTable
        MOV      R0,#+1792
        BL       NVIC_PriorityGroupConfig
        MOVS     R0,#+6
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
NRF905SE_EXTI_Config:
        PUSH     {LR}
        SUB      SP,SP,#+12
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       GPIO_EXTILineConfig
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R0,#+0
        STRB     R0,[SP, #+4]
        MOVS     R0,#+8
        STRB     R0,[SP, #+5]
        MOVS     R0,#+1
        STRB     R0,[SP, #+6]
        ADD      R0,SP,#+0
        BL       EXTI_Init
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
NRF905SE_InitWriteCR:
        PUSH     {R7,LR}
        LDR.N    R0,??NRF905SE_InitWriteCR_0  ;; NRF905SE_Config_Buf
        LDRB     R2,[R0, #+0]
        ADDS     R1,R0,#+1
        MOVS     R0,#+0
        BL       NRF905SE_WriteReg_Bytes
        POP      {R0,PC}          ;; return
        DATA
??NRF905SE_InitWriteCR_0:
        DC32     NRF905SE_Config_Buf

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
NRF905SE_Configuration:
        PUSH     {R7,LR}
        BL       NRF905SE_GPIO_Config
        BL       NRF905SE_NVIC_Config
        BL       NRF905SE_EXTI_Config
        BL       NRF905SE_InitWriteCR
        MOVS     R1,#+4
        LDR.N    R0,??NRF905SE_Configuration_0  ;; NRF905SE_RxAddress
        BL       NRF905SE_SetRxAddress
        MOVS     R1,#+4
        LDR.N    R0,??NRF905SE_Configuration_0+0x4  ;; NRF905SE_TxAddress
        BL       NRF905SE_SetTxAddress
        LDR.N    R0,??DataTable7  ;; 0x40011010
        MOVS     R1,#+8
        STR      R1,[R0, #+0]
        LDR.W    R0,??DataTable31  ;; 0x40010814
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
        POP      {R0,PC}          ;; return
        Nop      
        DATA
??NRF905SE_Configuration_0:
        DC32     NRF905SE_RxAddress
        DC32     NRF905SE_TxAddress

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_SetSPIMode:
        LDR.N    R0,??DataTable7  ;; 0x40011010
        MOVS     R1,#+8
        STR      R1,[R0, #+0]
        LDR.W    R0,??DataTable31  ;; 0x40010814
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_SetTxMode:
        LDR.N    R0,??DataTable7  ;; 0x40011010
        MOVS     R1,#+8
        STR      R1,[R0, #+0]
        LDR.N    R0,??DataTable25  ;; 0x40010810
        MOVS     R1,#+8
        STR      R1,[R0, #+0]
        LDR.N    R0,??DataTable25  ;; 0x40010810
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_SetRxMode:
        LDR.N    R0,??DataTable7  ;; 0x40011010
        MOVS     R1,#+8
        STR      R1,[R0, #+0]
        LDR.W    R0,??DataTable31  ;; 0x40010814
        MOVS     R1,#+8
        STR      R1,[R0, #+0]
        LDR.N    R0,??DataTable25  ;; 0x40010810
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable7:
        DC32     0x40011010

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_SendByte:
        PUSH     {R4,LR}
        MOVS     R4,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       SPI_I2S_SendData
??SPI_SendByte_0:
        MOVS     R1,#+2
        MOVS     R0,R4
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??SPI_SendByte_0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_ReceiveByte:
        PUSH     {R4,LR}
        MOVS     R4,R0
??SPI_ReceiveByte_0:
        MOVS     R1,#+1
        MOVS     R0,R4
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??SPI_ReceiveByte_0
        MOVS     R0,R4
        BL       SPI_I2S_ReceiveData
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_Read_u8:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R1,#+255
        LDR.N    R0,??DataTable20  ;; 0x40013000
        BL       SPI_SendByte
        LDR.N    R0,??DataTable20  ;; 0x40013000
        BL       SPI_ReceiveByte
        STRB     R0,[R4, #+0]
        LDRB     R0,[R4, #+0]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_Write_u8:
        PUSH     {R7,LR}
        LDRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable20  ;; 0x40013000
        BL       SPI_SendByte
        LDR.N    R0,??DataTable20  ;; 0x40013000
        BL       SPI_ReceiveByte
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_ReadReg_u8:
        PUSH     {R0,LR}
        SUB      SP,SP,#+8
        BL       NRF905SE_SetSPIMode
        LDR.N    R0,??DataTable31  ;; 0x40010814
        MOVS     R1,#+16
        STR      R1,[R0, #+0]
        ADD      R0,SP,#+8
        BL       NRF905SE_Write_u8
        ADD      R0,SP,#+0
        BL       NRF905SE_Read_u8
        LDR.N    R0,??DataTable25  ;; 0x40010810
        MOVS     R1,#+16
        STR      R1,[R0, #+0]
        LDRB     R0,[SP, #+0]
        POP      {R1-R3,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_WriteReg_u8:
        PUSH     {R0,R1,LR}
        SUB      SP,SP,#+4
        BL       NRF905SE_SetSPIMode
        LDR.N    R0,??DataTable31  ;; 0x40010814
        MOVS     R1,#+16
        STR      R1,[R0, #+0]
        ADD      R0,SP,#+4
        BL       NRF905SE_Write_u8
        ADD      R0,SP,#+8
        BL       NRF905SE_Write_u8
        LDR.N    R0,??DataTable25  ;; 0x40010810
        MOVS     R1,#+16
        STR      R1,[R0, #+0]
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_ReadWriteReg_u8:
        PUSH     {R0,R4,LR}
        SUB      SP,SP,#+4
        MOVS     R4,R1
        BL       NRF905SE_SetSPIMode
        LDR.N    R0,??DataTable31  ;; 0x40010814
        MOVS     R1,#+16
        STR      R1,[R0, #+0]
        ADD      R0,SP,#+4
        BL       NRF905SE_Write_u8
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable20  ;; 0x40013000
        BL       SPI_SendByte
        LDR.N    R0,??DataTable20  ;; 0x40013000
        BL       SPI_ReceiveByte
        LDR.N    R1,??DataTable25  ;; 0x40010810
        MOVS     R2,#+16
        STR      R2,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R2,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable20:
        DC32     0x40013000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_ReadReg_Bytes:
        PUSH     {R0,R4-R6,LR}
        SUB      SP,SP,#+4
        MOVS     R4,R1
        MOVS     R5,R2
        BL       NRF905SE_SetSPIMode
        LDR.N    R0,??DataTable31  ;; 0x40010814
        MOVS     R1,#+16
        STR      R1,[R0, #+0]
        ADD      R0,SP,#+4
        BL       NRF905SE_Write_u8
        MOVS     R6,#+0
        B.N      ??NRF905SE_ReadReg_Bytes_0
??NRF905SE_ReadReg_Bytes_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADDS     R0,R6,R4
        BL       NRF905SE_Read_u8
        ADDS     R6,R6,#+1
??NRF905SE_ReadReg_Bytes_0:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R6,R5
        BCC.N    ??NRF905SE_ReadReg_Bytes_1
        LDR.N    R0,??DataTable25  ;; 0x40010810
        MOVS     R1,#+16
        STR      R1,[R0, #+0]
        MOVS     R0,R4
        POP      {R1,R2,R4-R6,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_WriteReg_Bytes:
        PUSH     {R0,R4-R6,LR}
        SUB      SP,SP,#+4
        MOVS     R4,R1
        MOVS     R5,R2
        BL       NRF905SE_SetSPIMode
        LDR.N    R0,??DataTable31  ;; 0x40010814
        MOVS     R1,#+16
        STR      R1,[R0, #+0]
        ADD      R0,SP,#+4
        BL       NRF905SE_Write_u8
        MOVS     R6,#+0
        B.N      ??NRF905SE_WriteReg_Bytes_0
??NRF905SE_WriteReg_Bytes_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADDS     R0,R6,R4
        BL       NRF905SE_Write_u8
        ADDS     R6,R6,#+1
??NRF905SE_WriteReg_Bytes_0:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R6,R5
        BCC.N    ??NRF905SE_WriteReg_Bytes_1
        LDR.N    R0,??DataTable25  ;; 0x40010810
        MOVS     R1,#+16
        STR      R1,[R0, #+0]
        POP      {R0,R1,R4-R6,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable25:
        DC32     0x40010810

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_IsCRCModeEnable:
        PUSH     {R7,LR}
        MOVS     R0,#+25
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_ReadReg_u8
        MOVS     R1,R0
        ANDS     R1,R1,#0x40
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        SUBS     R0,R0,#+1
        SBCS     R0,R0,R0
        MVNS     R0,R0
        LSRS     R0,R0,#+31
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_GetCRCMode:
        PUSH     {R7,LR}
        MOVS     R0,#+25
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_ReadReg_u8
        ANDS     R0,R0,#0x80
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_SetCRCMode:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+25
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_ReadReg_u8
        MOVS     R1,R0
        ANDS     R1,R1,#0x7F
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??NRF905SE_SetCRCMode_0
        MOVS     R0,#+128
        B.N      ??NRF905SE_SetCRCMode_1
??NRF905SE_SetCRCMode_0:
        MOVS     R0,#+0
??NRF905SE_SetCRCMode_1:
        ORRS     R1,R0,R1
        MOVS     R0,#+9
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_WriteReg_u8
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_IsAutoRetranEnable:
        PUSH     {R7,LR}
        MOVS     R0,#+17
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_ReadReg_u8
        MOVS     R1,R0
        ANDS     R1,R1,#0x20
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        SUBS     R0,R0,#+1
        SBCS     R0,R0,R0
        MVNS     R0,R0
        LSRS     R0,R0,#+31
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_GetAutoRetranMode:
        PUSH     {R7,LR}
        MOVS     R0,#+17
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_ReadReg_u8
        MOVS     R1,R0
        ANDS     R1,R1,#0x20
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        SUBS     R0,R0,#+1
        SBCS     R0,R0,R0
        MVNS     R0,R0
        LSRS     R0,R0,#+31
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_SetAutoRetranMode:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+1
        MOVS     R0,#+17
        BL       NRF905SE_ReadReg_u8
        ANDS     R0,R0,#0xDF
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??NRF905SE_SetAutoRetranMode_0
        MOVS     R1,#+32
        B.N      ??NRF905SE_SetAutoRetranMode_1
??NRF905SE_SetAutoRetranMode_0:
        MOVS     R1,#+0
??NRF905SE_SetAutoRetranMode_1:
        ORRS     R0,R1,R0
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_WriteReg_u8
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_GetRxAddressSize:
        PUSH     {R7,LR}
        MOVS     R0,#+18
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_ReadReg_u8
        ANDS     R0,R0,#0x7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_SetRxAddressSize:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+18
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_ReadReg_u8
        ANDS     R0,R0,#0xF8
        ANDS     R4,R4,#0x7
        ORRS     R4,R0,R4
        MOVS     R0,#+2
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_WriteReg_u8
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_GetTxAddressSize:
        PUSH     {R7,LR}
        MOVS     R0,#+18
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_ReadReg_u8
        ANDS     R0,R0,#0x70
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_SetTxAddressSize:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+18
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_ReadReg_u8
        ANDS     R0,R0,#0x8F
        ANDS     R4,R4,#0x7
        LSLS     R4,R4,#+4
        ORRS     R4,R0,R4
        MOVS     R0,#+2
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_WriteReg_u8
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_GetRxPayloadSize:
        PUSH     {R7,LR}
        MOVS     R0,#+19
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_ReadReg_u8
        ANDS     R0,R0,#0x3F
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_SetRxPayloadSize:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+19
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_ReadReg_u8
        ANDS     R0,R0,#0xC0
        ANDS     R4,R4,#0x3F
        ORRS     R4,R0,R4
        MOVS     R0,#+3
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_ReadWriteReg_u8
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_GetTxPayloadSize:
        PUSH     {R7,LR}
        MOVS     R0,#+20
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_ReadReg_u8
        ANDS     R0,R0,#0x3F
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_SetTxPayloadSize:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+20
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_ReadReg_u8
        ANDS     R0,R0,#0xC0
        ANDS     R4,R4,#0x3F
        ORRS     R4,R0,R4
        MOVS     R0,#+4
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_ReadWriteReg_u8
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_GetTxRxPayload:
        PUSH     {R4,LR}
        MOVS     R4,R1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_ReadReg_Bytes
        MOVS     R0,R4
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_SetTxRxPayload:
        PUSH     {R7,LR}
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_WriteReg_Bytes
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_GetTxPayload:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R2,R1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R4
        MOVS     R0,#+33
        BL       NRF905SE_GetTxRxPayload
        MOVS     R0,R4
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_SetTxPayload:
        PUSH     {R7,LR}
        MOVS     R2,R1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R0
        MOVS     R0,#+32
        BL       NRF905SE_SetTxRxPayload
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_GetRxPayload:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R2,R1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R4
        MOVS     R0,#+36
        BL       NRF905SE_GetTxRxPayload
        MOVS     R0,R4
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_SetRxPayload:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_GetTxRxAddress:
        PUSH     {R4,LR}
        MOVS     R4,R1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_ReadReg_Bytes
        MOVS     R0,R4
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_SetTxRxAddress:
        PUSH     {R7,LR}
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF905SE_WriteReg_Bytes
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_SetTxAddress:
        PUSH     {R7,LR}
        MOVS     R2,R1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R0
        MOVS     R0,#+34
        BL       NRF905SE_SetTxRxAddress
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_GetTxAddress:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R2,R1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R4
        MOVS     R0,#+35
        BL       NRF905SE_GetTxRxAddress
        MOVS     R0,R4
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_SetRxAddress:
        PUSH     {R7,LR}
        MOVS     R2,R1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R0
        MOVS     R0,#+5
        BL       NRF905SE_SetTxRxAddress
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_GetRxAddress:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R2,R1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R4
        MOVS     R0,#+21
        BL       NRF905SE_GetTxRxAddress
        MOVS     R0,R4
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_SendData:
        PUSH     {R7,LR}
        BL       NRF905SE_SetTxMode
??NRF905SE_SendData_0:
        LDR.N    R0,??DataTable32  ;; NRF905SE_DR_FLAG
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??NRF905SE_SendData_0
        LDR.N    R0,??DataTable32  ;; NRF905SE_DR_FLAG
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable31  ;; 0x40010814
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_ReceiveData:
        PUSH     {R7,LR}
        BL       NRF905SE_SetRxMode
??NRF905SE_ReceiveData_0:
        LDR.N    R0,??DataTable32  ;; NRF905SE_DR_FLAG
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??NRF905SE_ReceiveData_0
        LDR.N    R0,??DataTable32  ;; NRF905SE_DR_FLAG
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable31  ;; 0x40010814
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable31:
        DC32     0x40010814

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_SendTxPacket:
        PUSH     {R3-R5,LR}
        MOVS     R4,R2
        MOVS     R5,R3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        BL       NRF905SE_SetTxPayload
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        BL       NRF905SE_SetTxAddress
        BL       NRF905SE_SendData
        MOVS     R0,#+1
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_SendPacket:
        PUSH     {R7,LR}
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        BL       NRF905SE_SetTxPayload
        BL       NRF905SE_SendData
        MOVS     R0,#+1
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_ReceivePacket:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        BL       NRF905SE_ReceiveData
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R5
        BL       NRF905SE_GetRxPayload
        MOVS     R0,R5
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NRF905SE_EXTI_DoIt:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable32  ;; NRF905SE_DR_FLAG
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
        MOVS     R0,#+1
        BL       EXTI_ClearITPendingBit
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable32:
        DC32     NRF905SE_DR_FLAG

        END
// 
//    41 bytes in section .bss
//    52 bytes in section .data
// 1 542 bytes in section .text
// 
// 1 542 bytes of CODE memory
//    93 bytes of DATA memory
//
//Errors: none
//Warnings: 2
