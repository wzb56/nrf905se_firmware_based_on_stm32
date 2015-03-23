///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.0.51174/W32 for ARM    28/May/2011  10:37:09 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\253642xvvn\桌面\nrf905se\bigb /
//                    oard\send6\library\src\stm32f10x_spi.c                  /
//    Command line =  "C:\Documents and Settings\253642xvvn\桌面\nrf905se\big /
//                    board\send6\library\src\stm32f10x_spi.c" -lC            /
//                    "C:\Documents and Settings\253642xvvn\桌面\nrf905se\big /
//                    board\send6\Debug\List\" -lb "C:\Documents and          /
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
//                    oard\send6\Debug\List\stm32f10x_spi.s                   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f10x_spi

        EXTERN RCC_APB1PeriphResetCmd
        EXTERN RCC_APB2PeriphResetCmd
        EXTERN RCC_GetClocksFreq

        PUBLIC I2S_Cmd
        PUBLIC I2S_Init
        PUBLIC I2S_StructInit
        PUBLIC SPI_BiDirectionalLineConfig
        PUBLIC SPI_CalculateCRC
        PUBLIC SPI_Cmd
        PUBLIC SPI_DataSizeConfig
        PUBLIC SPI_GetCRC
        PUBLIC SPI_GetCRCPolynomial
        PUBLIC SPI_I2S_ClearFlag
        PUBLIC SPI_I2S_ClearITPendingBit
        PUBLIC SPI_I2S_DMACmd
        PUBLIC SPI_I2S_DeInit
        PUBLIC SPI_I2S_GetFlagStatus
        PUBLIC SPI_I2S_GetITStatus
        PUBLIC SPI_I2S_ITConfig
        PUBLIC SPI_I2S_ReceiveData
        PUBLIC SPI_I2S_SendData
        PUBLIC SPI_Init
        PUBLIC SPI_NSSInternalSoftwareConfig
        PUBLIC SPI_SSOutputCmd
        PUBLIC SPI_StructInit
        PUBLIC SPI_TransmitCRC


        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SPI_I2S_DeInit:
        PUSH     {R7,LR}
        LDR.N    R1,??SPI_I2S_DeInit_0  ;; 0x40003800
        SUBS     R0,R0,R1
        BEQ.N    ??SPI_I2S_DeInit_1
        MOV      R1,#+1024
        SUBS     R0,R0,R1
        BEQ.N    ??SPI_I2S_DeInit_2
        MOV      R1,#+62464
        SUBS     R0,R0,R1
        BNE.N    ??SPI_I2S_DeInit_3
??SPI_I2S_DeInit_4:
        MOVS     R1,#+1
        MOV      R0,#+4096
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+4096
        BL       RCC_APB2PeriphResetCmd
        B.N      ??SPI_I2S_DeInit_5
??SPI_I2S_DeInit_1:
        MOVS     R1,#+1
        MOV      R0,#+16384
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+16384
        BL       RCC_APB1PeriphResetCmd
        B.N      ??SPI_I2S_DeInit_5
??SPI_I2S_DeInit_2:
        MOVS     R1,#+1
        MOV      R0,#+32768
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+32768
        BL       RCC_APB1PeriphResetCmd
        B.N      ??SPI_I2S_DeInit_5
??SPI_I2S_DeInit_3:
??SPI_I2S_DeInit_5:
        POP      {R0,PC}          ;; return
        DATA
??SPI_I2S_DeInit_0:
        DC32     0x40003800

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_Init:
        PUSH     {R3,R4}
        MOVS     R2,#+0
        LDRH     R3,[R0, #+0]
        MOVS     R2,R3
        ANDS     R2,R2,#0x3040
        LDRH     R3,[R1, #+0]
        LDRH     R4,[R1, #+2]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+4]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+6]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+8]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+10]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+12]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+14]
        ORRS     R3,R4,R3
        ORRS     R2,R3,R2
        STRH     R2,[R0, #+0]
        LDRH     R2,[R0, #+28]
        BICS     R2,R2,#0x800
        STRH     R2,[R0, #+28]
        LDRH     R1,[R1, #+16]
        STRH     R1,[R0, #+16]
        POP      {R0,R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2S_Init:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+20
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R6,#+0
        MOVS     R1,#+2
        MOVS     R0,#+0
        MOVS     R7,#+1
        MOVS     R2,#+0
        LDRH     R3,[R5, #+28]
        MOVW     R12,#+61504
        ANDS     R3,R12,R3
        STRH     R3,[R5, #+28]
        MOVS     R3,#+2
        STRH     R3,[R5, #+32]
        LDRH     R3,[R5, #+28]
        MOVS     R6,R3
        LDRH     R3,[R4, #+8]
        CMP      R3,#+2
        BNE.N    ??I2S_Init_0
        MOVS     R0,#+0
        MOVS     R1,#+2
        B.N      ??I2S_Init_1
??I2S_Init_0:
        LDRH     R0,[R4, #+4]
        CMP      R0,#+0
        BNE.N    ??I2S_Init_2
        MOVS     R7,#+1
        B.N      ??I2S_Init_3
??I2S_Init_2:
        MOVS     R7,#+2
??I2S_Init_3:
        ADD      R0,SP,#+0
        BL       RCC_GetClocksFreq
        LDRH     R0,[R4, #+6]
        MOV      R1,#+512
        CMP      R0,R1
        BNE.N    ??I2S_Init_4
        LDR      R0,[SP, #+0]
        MOVS     R1,#+10
        MUL      R0,R0,R1
        LDRH     R1,[R4, #+8]
        MOV      R2,#+256
        MUL      R1,R1,R2
        UDIV     R0,R0,R1
        ADDS     R2,R0,#+5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        B.N      ??I2S_Init_5
??I2S_Init_4:
        LDR      R0,[SP, #+0]
        MOVS     R1,#+10
        MUL      R0,R0,R1
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDRH     R1,[R4, #+8]
        MULS     R1,R7,R1
        LSLS     R1,R1,#+5
        UDIV     R0,R0,R1
        ADDS     R2,R0,#+5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
??I2S_Init_5:
        MOVS     R0,#+10
        UDIV     R2,R2,R0
        ANDS     R0,R2,#0x1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        SUBS     R1,R2,R0
        LSRS     R1,R1,#+1
        LSLS     R0,R0,#+8
??I2S_Init_1:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+2
        BCC.N    ??I2S_Init_6
        MOV      R2,#+256
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,R2
        BCC.N    ??I2S_Init_7
??I2S_Init_6:
        MOVS     R1,#+2
        MOVS     R0,#+0
??I2S_Init_7:
        ORRS     R0,R0,R1
        LDRH     R1,[R4, #+6]
        ORRS     R0,R1,R0
        STRH     R0,[R5, #+32]
        LDRH     R0,[R4, #+0]
        LDRH     R1,[R4, #+2]
        ORRS     R0,R1,R0
        LDRH     R1,[R4, #+4]
        ORRS     R0,R1,R0
        LDRH     R1,[R4, #+10]
        ORRS     R0,R1,R0
        ORRS     R0,R0,#0x800
        ORRS     R6,R0,R6
        STRH     R6,[R5, #+28]
        ADD      SP,SP,#+20
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_StructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
        MOVS     R1,#+0
        STRH     R1,[R0, #+8]
        MOVS     R1,#+0
        STRH     R1,[R0, #+10]
        MOVS     R1,#+0
        STRH     R1,[R0, #+12]
        MOVS     R1,#+0
        STRH     R1,[R0, #+14]
        MOVS     R1,#+7
        STRH     R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2S_StructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
        MOVS     R1,#+2
        STRH     R1,[R0, #+8]
        MOVS     R1,#+0
        STRH     R1,[R0, #+10]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??SPI_Cmd_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x40
        STRH     R1,[R0, #+0]
        B.N      ??SPI_Cmd_1
??SPI_Cmd_0:
        LDRH     R1,[R0, #+0]
        BICS     R1,R1,#0x40
        STRH     R1,[R0, #+0]
??SPI_Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2S_Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2S_Cmd_0
        LDRH     R1,[R0, #+28]
        ORRS     R1,R1,#0x400
        STRH     R1,[R0, #+28]
        B.N      ??I2S_Cmd_1
??I2S_Cmd_0:
        LDRH     R1,[R0, #+28]
        BICS     R1,R1,#0x400
        STRH     R1,[R0, #+28]
??I2S_Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_ITConfig:
        PUSH     {R3,R4}
        MOVS     R3,#+0
        MOVS     R4,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R3,R1
        MOVS     R1,#+1
        LSLS     R1,R1,R3
        MOVS     R4,R1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??SPI_I2S_ITConfig_0
        LDRH     R1,[R0, #+4]
        ORRS     R1,R4,R1
        STRH     R1,[R0, #+4]
        B.N      ??SPI_I2S_ITConfig_1
??SPI_I2S_ITConfig_0:
        LDRH     R1,[R0, #+4]
        MVNS     R2,R4
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+4]
??SPI_I2S_ITConfig_1:
        POP      {R0,R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_DMACmd:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??SPI_I2S_DMACmd_0
        LDRH     R2,[R0, #+4]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+4]
        B.N      ??SPI_I2S_DMACmd_1
??SPI_I2S_DMACmd_0:
        LDRH     R2,[R0, #+4]
        MVNS     R1,R1
        ANDS     R1,R1,R2
        STRH     R1,[R0, #+4]
??SPI_I2S_DMACmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_SendData:
        STRH     R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_ReceiveData:
        LDRH     R0,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_NSSInternalSoftwareConfig:
        MOVW     R2,#+65279
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,R2
        BEQ.N    ??SPI_NSSInternalSoftwareConfig_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x100
        STRH     R1,[R0, #+0]
        B.N      ??SPI_NSSInternalSoftwareConfig_1
??SPI_NSSInternalSoftwareConfig_0:
        LDRH     R1,[R0, #+0]
        BICS     R1,R1,#0x100
        STRH     R1,[R0, #+0]
??SPI_NSSInternalSoftwareConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_SSOutputCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??SPI_SSOutputCmd_0
        LDRH     R1,[R0, #+4]
        ORRS     R1,R1,#0x4
        STRH     R1,[R0, #+4]
        B.N      ??SPI_SSOutputCmd_1
??SPI_SSOutputCmd_0:
        LDRH     R1,[R0, #+4]
        BICS     R1,R1,#0x4
        STRH     R1,[R0, #+4]
??SPI_SSOutputCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_DataSizeConfig:
        LDRH     R2,[R0, #+0]
        BICS     R2,R2,#0x800
        STRH     R2,[R0, #+0]
        LDRH     R2,[R0, #+0]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_TransmitCRC:
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x1000
        STRH     R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_CalculateCRC:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??SPI_CalculateCRC_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x2000
        STRH     R1,[R0, #+0]
        B.N      ??SPI_CalculateCRC_1
??SPI_CalculateCRC_0:
        LDRH     R1,[R0, #+0]
        BICS     R1,R1,#0x2000
        STRH     R1,[R0, #+0]
??SPI_CalculateCRC_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_GetCRC:
        MOVS     R2,R0
        MOVS     R0,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BEQ.N    ??SPI_GetCRC_0
        LDRH     R0,[R2, #+24]
        B.N      ??SPI_GetCRC_1
??SPI_GetCRC_0:
        LDRH     R0,[R2, #+20]
??SPI_GetCRC_1:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_GetCRCPolynomial:
        LDRH     R0,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_BiDirectionalLineConfig:
        MOV      R2,#+16384
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,R2
        BNE.N    ??SPI_BiDirectionalLineConfig_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x4000
        STRH     R1,[R0, #+0]
        B.N      ??SPI_BiDirectionalLineConfig_1
??SPI_BiDirectionalLineConfig_0:
        LDRH     R1,[R0, #+0]
        BICS     R1,R1,#0x4000
        STRH     R1,[R0, #+0]
??SPI_BiDirectionalLineConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_GetFlagStatus:
        MOVS     R2,R0
        MOVS     R0,#+0
        LDRH     R2,[R2, #+8]
        ANDS     R1,R1,R2
        MOVS     R2,R1
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        SUBS     R2,R2,#+1
        SBCS     R2,R2,R2
        MVNS     R2,R2
        LSRS     R2,R2,#+31
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_ClearFlag:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+32
        BNE.N    ??SPI_I2S_ClearFlag_0
        LDRH     R1,[R0, #+8]
        LDRH     R2,[R0, #+0]
        ORRS     R2,R2,#0x40
        STRH     R2,[R0, #+0]
        B.N      ??SPI_I2S_ClearFlag_1
??SPI_I2S_ClearFlag_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+64
        BEQ.N    ??SPI_I2S_ClearFlag_2
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+8
        BNE.N    ??SPI_I2S_ClearFlag_3
??SPI_I2S_ClearFlag_2:
        LDRH     R0,[R0, #+8]
        B.N      ??SPI_I2S_ClearFlag_4
??SPI_I2S_ClearFlag_3:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R1,R1
        STRH     R1,[R0, #+8]
??SPI_I2S_ClearFlag_4:
??SPI_I2S_ClearFlag_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_GetITStatus:
        PUSH     {R3-R7,LR}
        MOVS     R2,R0
        MOVS     R0,#+0
        MOVS     R3,#+0
        MOVS     R5,#+0
        MOVS     R4,#+0
        MOVS     R6,#+1
        ANDS     R7,R1,#0xF
        LSLS     R6,R6,R7
        MOVS     R3,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R5,R1
        MOVS     R1,#+1
        LSLS     R5,R1,R5
        LDRH     R1,[R2, #+4]
        ANDS     R1,R5,R1
        MOVS     R4,R1
        LDRH     R1,[R2, #+8]
        TST      R1,R3
        BEQ.N    ??SPI_I2S_GetITStatus_0
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        SUBS     R0,R0,#+1
        SBCS     R0,R0,R0
        MVNS     R0,R0
        LSRS     R0,R0,#+31
        B.N      ??SPI_I2S_GetITStatus_1
??SPI_I2S_GetITStatus_0:
        MOVS     R0,#+0
??SPI_I2S_GetITStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_ClearITPendingBit:
        MOVS     R2,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+85
        BNE.N    ??SPI_I2S_ClearITPendingBit_0
        LDRH     R1,[R0, #+8]
        LDRH     R2,[R0, #+0]
        ORRS     R2,R2,#0x40
        STRH     R2,[R0, #+0]
        B.N      ??SPI_I2S_ClearITPendingBit_1
??SPI_I2S_ClearITPendingBit_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+86
        BEQ.N    ??SPI_I2S_ClearITPendingBit_2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+83
        BNE.N    ??SPI_I2S_ClearITPendingBit_3
??SPI_I2S_ClearITPendingBit_2:
        LDRH     R0,[R0, #+8]
        B.N      ??SPI_I2S_ClearITPendingBit_4
??SPI_I2S_ClearITPendingBit_3:
        MOVS     R2,#+1
        ANDS     R1,R1,#0xF
        LSLS     R2,R2,R1
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MVNS     R1,R2
        STRH     R1,[R0, #+8]
??SPI_I2S_ClearITPendingBit_4:
??SPI_I2S_ClearITPendingBit_1:
        BX       LR               ;; return

        END
// 
// 904 bytes in section .text
// 
// 904 bytes of CODE memory
//
//Errors: none
//Warnings: none
