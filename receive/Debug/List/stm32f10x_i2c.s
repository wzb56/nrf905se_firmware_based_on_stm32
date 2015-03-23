///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.0.51174/W32 for ARM    21/May/2011  19:21:01 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\253642xvvn\桌面\IAR\2.4G_send /
//                    \FWLib\library\src\stm32f10x_i2c.c                      /
//    Command line =  "C:\Documents and Settings\253642xvvn\桌面\IAR\2.4G_sen /
//                    d\FWLib\library\src\stm32f10x_i2c.c" -lC "C:\Documents  /
//                    and Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project /
//                    \test\Debug\List\" -lb "C:\Documents and                /
//                    Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project\tes /
//                    t\Debug\List\" -o "C:\Documents and                     /
//                    Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project\tes /
//                    t\Debug\Obj\" --no_cse --no_unroll --no_inline          /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "D:\Program Files\IAR Systems\Embedded Workbench        /
//                    5.4\arm\INC\DLib_Config_Full.h" -I "C:\Documents and    /
//                    Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project\tes /
//                    t\FWLib\library\inc\" -I "C:\Documents and              /
//                    Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project\tes /
//                    t\board\" -I "C:\Documents and                          /
//                    Settings\253642xvvn\桌面\IAR\2.4G_send\Demo\project\tes /
//                    t\app\" -I "D:\Program Files\IAR Systems\Embedded       /
//                    Workbench 5.4\arm\INC\" -Ol                             /
//    List file    =  C:\Documents and Settings\253642xvvn\桌面\IAR\2.4G_send /
//                    \Demo\project\test\Debug\List\stm32f10x_i2c.s           /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f10x_i2c

        EXTERN RCC_APB1PeriphResetCmd
        EXTERN RCC_GetClocksFreq

        PUBLIC I2C_ARPCmd
        PUBLIC I2C_AcknowledgeConfig
        PUBLIC I2C_CalculatePEC
        PUBLIC I2C_CheckEvent
        PUBLIC I2C_ClearFlag
        PUBLIC I2C_ClearITPendingBit
        PUBLIC I2C_Cmd
        PUBLIC I2C_DMACmd
        PUBLIC I2C_DMALastTransferCmd
        PUBLIC I2C_DeInit
        PUBLIC I2C_DualAddressCmd
        PUBLIC I2C_FastModeDutyCycleConfig
        PUBLIC I2C_GeneralCallCmd
        PUBLIC I2C_GenerateSTART
        PUBLIC I2C_GenerateSTOP
        PUBLIC I2C_GetFlagStatus
        PUBLIC I2C_GetITStatus
        PUBLIC I2C_GetLastEvent
        PUBLIC I2C_GetPEC
        PUBLIC I2C_ITConfig
        PUBLIC I2C_Init
        PUBLIC I2C_OwnAddress2Config
        PUBLIC I2C_PECPositionConfig
        PUBLIC I2C_ReadRegister
        PUBLIC I2C_ReceiveData
        PUBLIC I2C_SMBusAlertConfig
        PUBLIC I2C_Send7bitAddress
        PUBLIC I2C_SendData
        PUBLIC I2C_SoftwareResetCmd
        PUBLIC I2C_StretchClockCmd
        PUBLIC I2C_StructInit
        PUBLIC I2C_TransmitPEC


        SECTION `.text`:CODE:NOROOT(2)
        THUMB
I2C_DeInit:
        PUSH     {R7,LR}
        LDR.N    R1,??I2C_DeInit_0  ;; 0x40005400
        SUBS     R0,R0,R1
        BEQ.N    ??I2C_DeInit_1
        MOV      R1,#+1024
        SUBS     R0,R0,R1
        BEQ.N    ??I2C_DeInit_2
        B.N      ??I2C_DeInit_3
??I2C_DeInit_1:
        MOVS     R1,#+1
        MOVS     R0,#+2097152
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+2097152
        BL       RCC_APB1PeriphResetCmd
        B.N      ??I2C_DeInit_4
??I2C_DeInit_2:
        MOVS     R1,#+1
        MOVS     R0,#+4194304
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+4194304
        BL       RCC_APB1PeriphResetCmd
        B.N      ??I2C_DeInit_4
??I2C_DeInit_3:
??I2C_DeInit_4:
        POP      {R0,PC}          ;; return
        DATA
??I2C_DeInit_0:
        DC32     0x40005400

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
I2C_Init:
        PUSH     {R4-R9,LR}
        SUB      SP,SP,#+20
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R9,#+0
        MOVS     R6,#+0
        MOVS     R7,#+4
        LDR.W    R8,??I2C_Init_0  ;; 0x7a1200
        LDRH     R0,[R5, #+4]
        MOV      R9,R0
        MOVW     R0,#+65472
        ANDS     R9,R0,R9
        ADD      R0,SP,#+0
        BL       RCC_GetClocksFreq
        LDR      R0,[SP, #+8]
        MOV      R8,R0
        LDR.N    R0,??I2C_Init_0+0x4  ;; 0xf4240
        UDIV     R0,R8,R0
        MOVS     R6,R0
        ORRS     R9,R6,R9
        STRH     R9,[R5, #+4]
        LDRH     R0,[R5, #+0]
        BICS     R0,R0,#0x1
        STRH     R0,[R5, #+0]
        MOVS     R9,#+0
        LDR      R0,[R4, #+12]
        LDR.N    R1,??I2C_Init_0+0x8  ;; 0x186a1
        CMP      R0,R1
        BCS.N    ??I2C_Init_1
        LDR      R0,[R4, #+12]
        LSLS     R0,R0,#+1
        UDIV     R7,R8,R0
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+4
        BCS.N    ??I2C_Init_2
        MOVS     R7,#+4
??I2C_Init_2:
        ORRS     R9,R7,R9
        ADDS     R0,R6,#+1
        STRH     R0,[R5, #+32]
        B.N      ??I2C_Init_3
??I2C_Init_1:
        LDRH     R0,[R4, #+2]
        MOVW     R1,#+49151
        CMP      R0,R1
        BNE.N    ??I2C_Init_4
        LDR      R0,[R4, #+12]
        MOVS     R1,#+3
        MUL      R0,R0,R1
        UDIV     R7,R8,R0
        B.N      ??I2C_Init_5
??I2C_Init_4:
        LDR      R0,[R4, #+12]
        MOVS     R1,#+25
        MUL      R0,R0,R1
        UDIV     R7,R8,R0
        ORRS     R7,R7,#0x4000
??I2C_Init_5:
        LSLS     R0,R7,#+20
        BNE.N    ??I2C_Init_6
        ORRS     R7,R7,#0x1
??I2C_Init_6:
        ORRS     R0,R7,#0x8000
        ORRS     R9,R0,R9
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOV      R0,#+300
        MULS     R0,R6,R0
        MOV      R1,#+1000
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+1
        STRH     R0,[R5, #+32]
??I2C_Init_3:
        STRH     R9,[R5, #+28]
        LDRH     R0,[R5, #+0]
        ORRS     R0,R0,#0x1
        STRH     R0,[R5, #+0]
        LDRH     R9,[R5, #+0]
        MOVW     R0,#+64501
        ANDS     R9,R0,R9
        LDRH     R0,[R4, #+0]
        LDRH     R1,[R4, #+6]
        ORRS     R0,R1,R0
        ORRS     R9,R0,R9
        STRH     R9,[R5, #+0]
        LDRH     R0,[R4, #+8]
        LDRH     R1,[R4, #+4]
        ORRS     R0,R1,R0
        STRH     R0,[R5, #+8]
        ADD      SP,SP,#+20
        POP      {R4-R9,PC}       ;; return
        Nop      
        DATA
??I2C_Init_0:
        DC32     0x7a1200
        DC32     0xf4240
        DC32     0x186a1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_StructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
        MOVW     R1,#+49151
        STRH     R1,[R0, #+2]
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
        MOV      R1,#+16384
        STRH     R1,[R0, #+8]
        MOVW     R1,#+5000
        STR      R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_Cmd_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x1
        STRH     R1,[R0, #+0]
        B.N      ??I2C_Cmd_1
??I2C_Cmd_0:
        LDRH     R1,[R0, #+0]
        BICS     R1,R1,#0x1
        STRH     R1,[R0, #+0]
??I2C_Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_DMACmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_DMACmd_0
        LDRH     R1,[R0, #+4]
        ORRS     R1,R1,#0x800
        STRH     R1,[R0, #+4]
        B.N      ??I2C_DMACmd_1
??I2C_DMACmd_0:
        LDRH     R1,[R0, #+4]
        BICS     R1,R1,#0x800
        STRH     R1,[R0, #+4]
??I2C_DMACmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_DMALastTransferCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_DMALastTransferCmd_0
        LDRH     R1,[R0, #+4]
        ORRS     R1,R1,#0x1000
        STRH     R1,[R0, #+4]
        B.N      ??I2C_DMALastTransferCmd_1
??I2C_DMALastTransferCmd_0:
        LDRH     R1,[R0, #+4]
        BICS     R1,R1,#0x1000
        STRH     R1,[R0, #+4]
??I2C_DMALastTransferCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GenerateSTART:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_GenerateSTART_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x100
        STRH     R1,[R0, #+0]
        B.N      ??I2C_GenerateSTART_1
??I2C_GenerateSTART_0:
        LDRH     R1,[R0, #+0]
        BICS     R1,R1,#0x100
        STRH     R1,[R0, #+0]
??I2C_GenerateSTART_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GenerateSTOP:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_GenerateSTOP_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x200
        STRH     R1,[R0, #+0]
        B.N      ??I2C_GenerateSTOP_1
??I2C_GenerateSTOP_0:
        LDRH     R1,[R0, #+0]
        BICS     R1,R1,#0x200
        STRH     R1,[R0, #+0]
??I2C_GenerateSTOP_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_AcknowledgeConfig:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_AcknowledgeConfig_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x400
        STRH     R1,[R0, #+0]
        B.N      ??I2C_AcknowledgeConfig_1
??I2C_AcknowledgeConfig_0:
        LDRH     R1,[R0, #+0]
        BICS     R1,R1,#0x400
        STRH     R1,[R0, #+0]
??I2C_AcknowledgeConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_OwnAddress2Config:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+12]
        MOVS     R2,R3
        MOVW     R3,#+65281
        ANDS     R2,R3,R2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ANDS     R1,R1,#0xFE
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_DualAddressCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_DualAddressCmd_0
        LDRH     R1,[R0, #+12]
        ORRS     R1,R1,#0x1
        STRH     R1,[R0, #+12]
        B.N      ??I2C_DualAddressCmd_1
??I2C_DualAddressCmd_0:
        LDRH     R1,[R0, #+12]
        BICS     R1,R1,#0x1
        STRH     R1,[R0, #+12]
??I2C_DualAddressCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GeneralCallCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_GeneralCallCmd_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x40
        STRH     R1,[R0, #+0]
        B.N      ??I2C_GeneralCallCmd_1
??I2C_GeneralCallCmd_0:
        LDRH     R1,[R0, #+0]
        BICS     R1,R1,#0x40
        STRH     R1,[R0, #+0]
??I2C_GeneralCallCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ITConfig:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??I2C_ITConfig_0
        LDRH     R2,[R0, #+4]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+4]
        B.N      ??I2C_ITConfig_1
??I2C_ITConfig_0:
        LDRH     R2,[R0, #+4]
        MVNS     R1,R1
        ANDS     R1,R1,R2
        STRH     R1,[R0, #+4]
??I2C_ITConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_SendData:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STRH     R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ReceiveData:
        LDRH     R0,[R0, #+16]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_Send7bitAddress:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??I2C_Send7bitAddress_0
        ORRS     R1,R1,#0x1
        B.N      ??I2C_Send7bitAddress_1
??I2C_Send7bitAddress_0:
        ANDS     R1,R1,#0xFE
??I2C_Send7bitAddress_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STRH     R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ReadRegister:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDRH     R0,[R1, R0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_SoftwareResetCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_SoftwareResetCmd_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x8000
        STRH     R1,[R0, #+0]
        B.N      ??I2C_SoftwareResetCmd_1
??I2C_SoftwareResetCmd_0:
        LDRH     R1,[R0, #+0]
        LSLS     R1,R1,#+17
        LSRS     R1,R1,#+17
        STRH     R1,[R0, #+0]
??I2C_SoftwareResetCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_SMBusAlertConfig:
        MOV      R2,#+8192
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,R2
        BNE.N    ??I2C_SMBusAlertConfig_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x2000
        STRH     R1,[R0, #+0]
        B.N      ??I2C_SMBusAlertConfig_1
??I2C_SMBusAlertConfig_0:
        LDRH     R1,[R0, #+0]
        BICS     R1,R1,#0x2000
        STRH     R1,[R0, #+0]
??I2C_SMBusAlertConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_TransmitPEC:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_TransmitPEC_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x1000
        STRH     R1,[R0, #+0]
        B.N      ??I2C_TransmitPEC_1
??I2C_TransmitPEC_0:
        LDRH     R1,[R0, #+0]
        BICS     R1,R1,#0x1000
        STRH     R1,[R0, #+0]
??I2C_TransmitPEC_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_PECPositionConfig:
        MOV      R2,#+2048
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,R2
        BNE.N    ??I2C_PECPositionConfig_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x800
        STRH     R1,[R0, #+0]
        B.N      ??I2C_PECPositionConfig_1
??I2C_PECPositionConfig_0:
        LDRH     R1,[R0, #+0]
        BICS     R1,R1,#0x800
        STRH     R1,[R0, #+0]
??I2C_PECPositionConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_CalculatePEC:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_CalculatePEC_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x20
        STRH     R1,[R0, #+0]
        B.N      ??I2C_CalculatePEC_1
??I2C_CalculatePEC_0:
        LDRH     R1,[R0, #+0]
        BICS     R1,R1,#0x20
        STRH     R1,[R0, #+0]
??I2C_CalculatePEC_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GetPEC:
        LDRH     R0,[R0, #+24]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ARPCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_ARPCmd_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x10
        STRH     R1,[R0, #+0]
        B.N      ??I2C_ARPCmd_1
??I2C_ARPCmd_0:
        LDRH     R1,[R0, #+0]
        BICS     R1,R1,#0x10
        STRH     R1,[R0, #+0]
??I2C_ARPCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_StretchClockCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??I2C_StretchClockCmd_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x80
        STRH     R1,[R0, #+0]
        B.N      ??I2C_StretchClockCmd_1
??I2C_StretchClockCmd_0:
        LDRH     R1,[R0, #+0]
        BICS     R1,R1,#0x80
        STRH     R1,[R0, #+0]
??I2C_StretchClockCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_FastModeDutyCycleConfig:
        MOV      R2,#+16384
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,R2
        BEQ.N    ??I2C_FastModeDutyCycleConfig_0
        LDRH     R1,[R0, #+28]
        BICS     R1,R1,#0x4000
        STRH     R1,[R0, #+28]
        B.N      ??I2C_FastModeDutyCycleConfig_1
??I2C_FastModeDutyCycleConfig_0:
        LDRH     R1,[R0, #+28]
        ORRS     R1,R1,#0x4000
        STRH     R1,[R0, #+28]
??I2C_FastModeDutyCycleConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GetLastEvent:
        PUSH     {R3,R4}
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        LDRH     R4,[R1, #+20]
        MOVS     R2,R4
        LDRH     R1,[R1, #+24]
        MOVS     R3,R1
        LSLS     R3,R3,#+16
        ORRS     R1,R3,R2
        LSLS     R1,R1,#+8
        LSRS     R1,R1,#+8
        MOVS     R0,R1
        POP      {R1,R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_CheckEvent:
        PUSH     {R3-R6}
        MOVS     R2,R0
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R0,#+0
        LDRH     R6,[R2, #+20]
        MOVS     R4,R6
        LDRH     R2,[R2, #+24]
        MOVS     R5,R2
        LSLS     R5,R5,#+16
        ORRS     R2,R5,R4
        LSLS     R2,R2,#+8
        LSRS     R2,R2,#+8
        MOVS     R3,R2
        CMP      R3,R1
        BNE.N    ??I2C_CheckEvent_0
        MOVS     R0,#+1
        B.N      ??I2C_CheckEvent_1
??I2C_CheckEvent_0:
        MOVS     R0,#+0
??I2C_CheckEvent_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R6}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GetFlagStatus:
        PUSH     {R3-R6}
        MOVS     R2,R0
        MOVS     R0,#+0
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
        LDRH     R6,[R2, #+20]
        MOVS     R4,R6
        LDRH     R2,[R2, #+24]
        MOVS     R5,R2
        LSLS     R5,R5,#+16
        ORRS     R2,R5,R4
        MOVS     R3,R2
        LSLS     R1,R1,#+8
        LSRS     R1,R1,#+8
        ANDS     R1,R1,R3
        SUBS     R1,R1,#+1
        SBCS     R1,R1,R1
        MVNS     R1,R1
        LSRS     R1,R1,#+31
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R6}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ClearFlag:
        PUSH     {R3,R4}
        MOVS     R2,#+0
        MOVS     R3,#+0
        LSLS     R4,R1,#+8
        LSRS     R4,R4,#+8
        MOVS     R2,R4
        LSRS     R1,R1,#+28
        MOVS     R3,R1
        CMP      R3,#+1
        BNE.N    ??I2C_ClearFlag_0
        MVNS     R1,R2
        STRH     R1,[R0, #+20]
        B.N      ??I2C_ClearFlag_1
??I2C_ClearFlag_0:
        CMP      R3,#+2
        BNE.N    ??I2C_ClearFlag_2
        LDRH     R0,[R0, #+20]
        B.N      ??I2C_ClearFlag_3
??I2C_ClearFlag_2:
        CMP      R3,#+6
        BNE.N    ??I2C_ClearFlag_4
        LDRH     R1,[R0, #+20]
        LDRH     R2,[R0, #+0]
        ORRS     R2,R2,#0x1
        STRH     R2,[R0, #+0]
        B.N      ??I2C_ClearFlag_5
??I2C_ClearFlag_4:
        LDRH     R1,[R0, #+20]
        LDRH     R0,[R0, #+24]
??I2C_ClearFlag_5:
??I2C_ClearFlag_3:
??I2C_ClearFlag_1:
        POP      {R0,R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GetITStatus:
        PUSH     {R3-R6}
        MOVS     R2,R0
        MOVS     R0,#+0
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
        LDRH     R6,[R2, #+20]
        MOVS     R4,R6
        LDRH     R2,[R2, #+24]
        MOVS     R5,R2
        LSLS     R5,R5,#+16
        ORRS     R2,R5,R4
        MOVS     R3,R2
        LSLS     R1,R1,#+8
        LSRS     R1,R1,#+8
        ANDS     R1,R1,R3
        SUBS     R1,R1,#+1
        SBCS     R1,R1,R1
        MVNS     R1,R1
        LSRS     R1,R1,#+31
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R6}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ClearITPendingBit:
        PUSH     {R3,R4}
        MOVS     R2,#+0
        MOVS     R3,#+0
        LSLS     R4,R1,#+8
        LSRS     R4,R4,#+8
        MOVS     R2,R4
        LSRS     R1,R1,#+28
        MOVS     R3,R1
        CMP      R3,#+1
        BNE.N    ??I2C_ClearITPendingBit_0
        MVNS     R1,R2
        STRH     R1,[R0, #+20]
        B.N      ??I2C_ClearITPendingBit_1
??I2C_ClearITPendingBit_0:
        CMP      R3,#+2
        BNE.N    ??I2C_ClearITPendingBit_2
        LDRH     R0,[R0, #+20]
        B.N      ??I2C_ClearITPendingBit_3
??I2C_ClearITPendingBit_2:
        CMP      R3,#+6
        BNE.N    ??I2C_ClearITPendingBit_4
        LDRH     R1,[R0, #+20]
        LDRH     R2,[R0, #+0]
        ORRS     R2,R2,#0x1
        STRH     R2,[R0, #+0]
        B.N      ??I2C_ClearITPendingBit_5
??I2C_ClearITPendingBit_4:
        LDRH     R1,[R0, #+20]
        LDRH     R0,[R0, #+24]
??I2C_ClearITPendingBit_5:
??I2C_ClearITPendingBit_3:
??I2C_ClearITPendingBit_1:
        POP      {R0,R4}
        BX       LR               ;; return

        END
// 
// 1 174 bytes in section .text
// 
// 1 174 bytes of CODE memory
//
//Errors: none
//Warnings: none
