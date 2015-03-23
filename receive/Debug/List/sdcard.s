///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.2.51295/W32 for ARM    11/Apr/2011  13:51:33 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\LiYang\Desktop\newest\Demo\source\sdcard.c     /
//    Command line =  C:\Users\LiYang\Desktop\newest\Demo\source\sdcard.c     /
//                    -lC C:\Users\LiYang\Desktop\newest\Demo\project\EWARMv5 /
//                    \Debug\List\ -lb C:\Users\LiYang\Desktop\newest\Demo\pr /
//                    oject\EWARMv5\Debug\List\ -o                            /
//                    C:\Users\LiYang\Desktop\newest\Demo\project\EWARMv5\Deb /
//                    ug\Obj\ --debug --endian=little --cpu=Cortex-M3 -e      /
//                    --fpu=None --dlib_config "E:\Program Files\IAR          /
//                    Systems\Embedded Workbench                              /
//                    5.4\arm\INC\DLib_Config_Full.h" -I                      /
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
//                    ug\List\sdcard.s                                        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME sdcard

        EXTERN DMA_ClearFlag
        EXTERN DMA_Cmd
        EXTERN DMA_GetFlagStatus
        EXTERN DMA_Init
        EXTERN GPIO_Init
        EXTERN RCC_AHBPeriphClockCmd
        EXTERN SDIO_ClearFlag
        EXTERN SDIO_ClearITPendingBit
        EXTERN SDIO_ClockCmd
        EXTERN SDIO_DMACmd
        EXTERN SDIO_DataConfig
        EXTERN SDIO_DeInit
        EXTERN SDIO_GetCommandResponse
        EXTERN SDIO_GetFlagStatus
        EXTERN SDIO_GetITStatus
        EXTERN SDIO_GetPowerState
        EXTERN SDIO_GetResponse
        EXTERN SDIO_ITConfig
        EXTERN SDIO_Init
        EXTERN SDIO_ReadData
        EXTERN SDIO_SendCommand
        EXTERN SDIO_SetPowerState
        EXTERN SDIO_WriteData

        PUBLIC DestBuffer
        PUBLIC NumberOfBytes
        PUBLIC SDIO_CmdInitStructure
        PUBLIC SDIO_DataInitStructure
        PUBLIC SDIO_InitStructure
        PUBLIC SD_EnableWideBusOperation
        PUBLIC SD_Erase
        PUBLIC SD_GetCardInfo
        PUBLIC SD_GetTransferState
        PUBLIC SD_Init
        PUBLIC SD_InitializeCards
        PUBLIC SD_PowerOFF
        PUBLIC SD_PowerON
        PUBLIC SD_ProcessIRQSrc
        PUBLIC SD_ReadBlock
        PUBLIC SD_ReadMultiBlocks
        PUBLIC SD_SelectDeselect
        PUBLIC SD_SendSDStatus
        PUBLIC SD_SendStatus
        PUBLIC SD_SetDeviceMode
        PUBLIC SD_StopTransfer
        PUBLIC SD_WriteBlock
        PUBLIC SD_WriteMultiBlocks
        PUBLIC SrcBuffer
        PUBLIC TransferEnd
        PUBLIC TransferError


        SECTION `.bss`:DATA:NOROOT(2)
SDIO_InitStructure:
        DS8 24

        SECTION `.data`:DATA:NOROOT(2)
TransferError:
        DATA
        DC8 42
        DC8 0, 0, 0
SDIO_DataInitStructure:
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0
SDIO_CmdInitStructure:
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC32 0
        DC32 0
        DC32 2
        DC32 0
        DC32 0
SrcBuffer:
        DC8 0, 0, 0, 0
DestBuffer:
        DC8 0, 0, 0, 0
TransferEnd:
        DC32 0
NumberOfBytes:
        DC32 0

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SD_Init:
        PUSH     {R7,LR}
        MOV      R0,#+7936
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+24
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??SD_Init_0   ;; 0x40011000
        BL       GPIO_Init
        MOVS     R0,#+4
        STRH     R0,[SP, #+0]
        ADD      R1,SP,#+0
        LDR.N    R0,??SD_Init_0+0x4  ;; 0x40011400
        BL       GPIO_Init
        MOVS     R1,#+1
        MOV      R0,#+1024
        BL       RCC_AHBPeriphClockCmd
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       RCC_AHBPeriphClockCmd
        BL       SDIO_DeInit
        BL       SD_PowerON
        CMP      R0,#+42
        BNE.N    ??SD_Init_1
        BL       SD_InitializeCards
        CMP      R0,#+42
        BNE.N    ??SD_Init_1
        LDR.W    R0,??DataTable8  ;; SDIO_InitStructure
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
        STR      R1,[R0, #+8]
        STR      R1,[R0, #+12]
        STR      R1,[R0, #+16]
        STR      R1,[R0, #+20]
        BL       SDIO_Init
        MOVS     R0,#+42
??SD_Init_1:
        POP      {R1,PC}          ;; return
        Nop      
        DATA
??SD_Init_0:
        DC32     0x40011000
        DC32     0x40011400

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SD_PowerON:
        PUSH     {R3-R11,LR}
        MOVS     R4,#+0
        MOV      R8,R4
        MOV      R10,R4
        LDR.W    R0,??DataTable8  ;; SDIO_InitStructure
        MOVS     R1,#+178
        STRB     R1,[R0, #+0]
        STR      R4,[R0, #+4]
        STR      R4,[R0, #+8]
        STR      R4,[R0, #+12]
        STR      R4,[R0, #+16]
        STR      R4,[R0, #+20]
        BL       SDIO_Init
        MOVS     R0,#+3
        BL       SDIO_SetPowerState
        MOVS     R0,#+1
        BL       SDIO_ClockCmd
        LDR.W    R7,??DataTable16  ;; TransferError
        STR      R4,[R7, #+28]
        STR      R4,[R7, #+32]
        STR      R4,[R7, #+36]
        STR      R4,[R7, #+40]
        MOV      R5,#+1024
        BL       ??Subroutine45_0
??CrossCallReturnLabel_162:
        MOVW     R9,#+10000
        MOV      R6,R9
        B.N      ??SD_PowerON_0
??SD_PowerON_1:
        SUBS     R6,R6,#+1
        BEQ.N    ??SD_PowerON_2
??SD_PowerON_0:
        MOVS     R0,#+128
        BL       SDIO_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??SD_PowerON_1
        CMP      R6,#+0
        BNE.N    ??SD_PowerON_3
??SD_PowerON_2:
        MOVS     R6,#+3
??SD_PowerON_4:
        MOV      R0,R6
        B.N      ??SD_PowerON_5
??SD_PowerON_3:
        MOVW     R11,#+1535
        MOV      R0,R11
        BL       SDIO_ClearFlag
        MOV      R0,#+426
        STR      R0,[R7, #+28]
        MOVS     R0,#+8
        BL       ??Subroutine44_0
??CrossCallReturnLabel_163:
        MOV      R0,R9
        LDR.W    R9,??DataTable18  ;; 0x40018034
        B.N      ??SD_PowerON_6
??SD_PowerON_7:
        CBZ      R0,??SD_PowerON_8
        SUBS     R0,R0,#+1
??SD_PowerON_6:
        LDR      R1,[R9, #+0]
        TST      R1,#0x45
        BEQ.N    ??SD_PowerON_7
        CBZ      R0,??SD_PowerON_8
        TST      R1,#0x4
        BEQ.N    ??SD_PowerON_9
??SD_PowerON_8:
        BL       ?Subroutine2
??CrossCallReturnLabel_3:
        BL       ?Subroutine9
??CrossCallReturnLabel_165:
        BL       ?Subroutine31
??CrossCallReturnLabel_109:
        B.N      ??SD_PowerON_10
??SD_PowerON_9:
        TST      R1,#0x40
        BEQ.N    ??SD_PowerON_11
        MOVS     R0,#+64
        BL       SDIO_ClearFlag
??SD_PowerON_11:
        MOVS     R0,#+1
        STR      R0,[R7, #+80]
        MOV      R10,#+1073741824
??SD_PowerON_10:
        BL       ?Subroutine9
??CrossCallReturnLabel_164:
        BL       ?Subroutine31
??CrossCallReturnLabel_108:
        MOV      R6,R0
        CMP      R6,#+42
        BNE.N    ??SD_PowerON_4
??SD_PowerON_12:
        MOVS     R0,#+0
        STR      R0,[R7, #+28]
        MOVS     R0,#+55
        BL       ?Subroutine30
??CrossCallReturnLabel_102:
        BL       ??Subroutine45_0
??CrossCallReturnLabel_161:
        BL       ?Subroutine31
??CrossCallReturnLabel_107:
        MOV      R6,R0
        CMP      R6,#+42
        BNE.N    ??SD_PowerON_4
        LDR.N    R0,??SD_PowerON_13  ;; 0x80100000
        ORR      R0,R0,R10
        STR      R0,[R7, #+28]
        MOVS     R0,#+41
        BL       ?Subroutine30
??CrossCallReturnLabel_103:
        BL       ??Subroutine45_0
??CrossCallReturnLabel_160:
        LDR      R0,[R9, #+0]
        TST      R0,#0x45
        BEQ.N    ??CrossCallReturnLabel_160
        TST      R0,#0x4
        BEQ.N    ??SD_PowerON_14
        BL       ?Subroutine2
??CrossCallReturnLabel_4:
        B.N      ??SD_PowerON_2
??SD_PowerON_14:
        MOV      R0,R11
        BL       SDIO_ClearFlag
        BL       ?Subroutine32
??CrossCallReturnLabel_119:
        LSRS     R1,R0,#+31
        CMP      R1,#+1
        BNE.N    ??SD_PowerON_15
        MOV      R8,#+1
??SD_PowerON_15:
        ADDS     R4,R4,#+1
        MOVW     R1,#+65535
        CMP      R8,#+0
        BNE.N    ??SD_PowerON_16
        CMP      R4,R1
        BCC.N    ??SD_PowerON_12
??SD_PowerON_16:
        CMP      R4,R1
        BCC.N    ??SD_PowerON_17
        MOVS     R0,#+27
??SD_PowerON_5:
        POP      {R1,R4-R11,PC}
??SD_PowerON_17:
        TST      R0,#0x40000000
        BEQ.N    ??SD_PowerON_4
        MOVS     R0,#+2
        STR      R0,[R7, #+80]
        B.N      ??SD_PowerON_4
        Nop      
        DATA
??SD_PowerON_13:
        DC32     0x80100000

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine9:
        STR      R4,[R7, #+28]
        MOVS     R0,#+55
        REQUIRE ??Subroutine44_0
        ;; // Fall through to label ??Subroutine44_0

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
??Subroutine44_0:
        STR      R0,[R7, #+32]
        MOVS     R0,#+64
        STR      R0,[R7, #+36]
        STR      R4,[R7, #+40]
        REQUIRE ??Subroutine45_0
        ;; // Fall through to label ??Subroutine45_0

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
??Subroutine45_0:
        STR      R5,[R7, #+44]
        Nop      
        REQUIRE ??Subroutine46_0
        ;; // Fall through to label ??Subroutine46_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
??Subroutine46_0:
        ADD      R0,R7,#+28
        B.W      SDIO_SendCommand

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SD_PowerOFF:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        BL       SDIO_SetPowerState
        MOVS     R0,#+42
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SD_InitializeCards:
        PUSH     {R4-R6,LR}
        MOVS     R4,#+1
        BL       SDIO_GetPowerState
        CMP      R0,#+0
        BNE.N    ??SD_InitializeCards_0
        MOVS     R0,#+37
        POP      {R4-R6,PC}
??SD_InitializeCards_0:
        LDR.W    R5,??DataTable16  ;; TransferError
        LDR      R0,[R5, #+80]
        CMP      R0,#+4
        BEQ.N    ??SD_InitializeCards_1
        MOVS     R0,#+0
        STR      R0,[R5, #+28]
        MOVS     R0,#+2
        STR      R0,[R5, #+32]
        MOVS     R0,#+192
        STR      R0,[R5, #+36]
        MOVS     R0,#+0
        STR      R0,[R5, #+40]
        MOV      R6,#+1024
        BL       ??Subroutine53_0
??CrossCallReturnLabel_188:
        BL       CmdResp2Error
        CMP      R0,#+42
        BNE.N    ??SD_InitializeCards_2
        BL       ?Subroutine32
??CrossCallReturnLabel_118:
        STR      R0,[R5, #+64]
        MOVS     R0,#+4
        BL       SDIO_GetResponse
        STR      R0,[R5, #+68]
        MOVS     R0,#+8
        BL       SDIO_GetResponse
        STR      R0,[R5, #+72]
        MOVS     R0,#+12
        BL       SDIO_GetResponse
        STR      R0,[R5, #+76]
        LDR      R0,[R5, #+80]
        CBZ      R0,??SD_InitializeCards_3
        CMP      R0,#+1
        BEQ.N    ??SD_InitializeCards_3
        CMP      R0,#+6
        BEQ.N    ??SD_InitializeCards_3
        CMP      R0,#+2
        BNE.N    ??SD_InitializeCards_4
??SD_InitializeCards_3:
        MOVS     R0,#+0
        STR      R0,[R5, #+28]
        MOVS     R0,#+3
        BL       ??Subroutine51_0
??CrossCallReturnLabel_192:
        LDR.W    R0,??DataTable18  ;; 0x40018034
        BL       ?Subroutine33
??CrossCallReturnLabel_123:
        BEQ.N    ??SD_InitializeCards_5
        BL       ?Subroutine2
??CrossCallReturnLabel_5:
        MOVS     R0,#+3
        POP      {R4-R6,PC}
??SD_InitializeCards_5:
        TST      R1,#0x1
        BEQ.N    ??SD_InitializeCards_6
        MOVS     R0,#+1
        BL       SDIO_ClearFlag
        MOV      R0,R4
        POP      {R4-R6,PC}
??SD_InitializeCards_6:
        BL       SDIO_GetCommandResponse
        CMP      R0,#+3
        BEQ.N    ??SD_InitializeCards_7
??SD_InitializeCards_8:
        MOVS     R0,#+16
        POP      {R4-R6,PC}
??SD_InitializeCards_7:
        BL       ?Subroutine18
??CrossCallReturnLabel_52:
        BL       ?Subroutine32
??CrossCallReturnLabel_120:
        TST      R0,#0xE000
        BNE.N    ??SD_InitializeCards_9
        LSRS     R4,R0,#+16
??SD_InitializeCards_4:
        LDR      R0,[R5, #+80]
        CMP      R0,#+4
        BEQ.N    ??SD_InitializeCards_1
        STR      R4,[R5, #+84]
        LSLS     R0,R4,#+16
        STR      R0,[R5, #+28]
        MOVS     R0,#+9
        STR      R0,[R5, #+32]
        MOVS     R0,#+192
        BL       ??Subroutine52_0
??CrossCallReturnLabel_189:
        BL       CmdResp2Error
        CMP      R0,#+42
        BNE.N    ??SD_InitializeCards_2
        BL       ?Subroutine32
??CrossCallReturnLabel_117:
        STR      R0,[R5, #+48]
        MOVS     R0,#+4
        BL       SDIO_GetResponse
        STR      R0,[R5, #+52]
        MOVS     R0,#+8
        BL       SDIO_GetResponse
        STR      R0,[R5, #+56]
        MOVS     R0,#+12
        BL       SDIO_GetResponse
        STR      R0,[R5, #+60]
??SD_InitializeCards_1:
        MOVS     R0,#+42
??SD_InitializeCards_2:
        POP      {R4-R6,PC}       ;; return
??SD_InitializeCards_9:
        TST      R0,#0x2000
        BEQ.N    ??SD_InitializeCards_10
        MOVS     R0,#+19
        POP      {R4-R6,PC}
??SD_InitializeCards_10:
        TST      R0,#0x4000
        BNE.N    ??SD_InitializeCards_8
        TST      R0,#0x8000
        BEQ.N    ??SD_InitializeCards_4
        MOVS     R0,#+15
        POP      {R4-R6,PC}

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SD_GetCardInfo:
        PUSH     {R3-R7,LR}
        LDR.W    R1,??DataTable16  ;; TransferError
        LDR      R3,[R1, #+80]
        ADD      R2,R0,#+64
        STRB     R3,[R2, #+14]
        LDR      R4,[R1, #+84]
        STRH     R4,[R2, #+12]
        LDR      R4,[R1, #+48]
        LSRS     R4,R4,#+24
        LSRS     R5,R4,#+6
        STRB     R5,[R0, #+0]
        AND      R5,R4,#0x3C
        LSRS     R5,R5,#+2
        STRB     R5,[R0, #+1]
        AND      R4,R4,#0x3
        STRB     R4,[R0, #+2]
        LDR      R4,[R1, #+48]
        LSRS     R4,R4,#+16
        STRB     R4,[R0, #+3]
        LDR      R4,[R1, #+48]
        LSRS     R4,R4,#+8
        STRB     R4,[R0, #+4]
        LDR      R4,[R1, #+48]
        STRB     R4,[R0, #+5]
        LDR      R4,[R1, #+52]
        LSRS     R5,R4,#+24
        LSLS     R5,R5,#+4
        STRH     R5,[R0, #+6]
        LSLS     R4,R4,#+8
        LSRS     R4,R4,#+24
        LDRH     R5,[R0, #+6]
        LSRS     R6,R4,#+4
        ORRS     R5,R6,R5
        STRH     R5,[R0, #+6]
        AND      R4,R4,#0xF
        STRB     R4,[R0, #+8]
        LDR      R4,[R1, #+52]
        LSLS     R4,R4,#+16
        LSRS     R4,R4,#+24
        LSRS     R5,R4,#+7
        STRB     R5,[R0, #+9]
        AND      R5,R4,#0x40
        LSRS     R5,R5,#+6
        STRB     R5,[R0, #+10]
        AND      R5,R4,#0x20
        LSRS     R5,R5,#+5
        STRB     R5,[R0, #+11]
        AND      R5,R4,#0x10
        LSRS     R5,R5,#+4
        STRB     R5,[R0, #+12]
        MOVS     R5,#+0
        STRB     R5,[R0, #+13]
        CBZ      R3,??SD_GetCardInfo_0
        CMP      R3,#+1
        BNE.N    ??SD_GetCardInfo_1
??SD_GetCardInfo_0:
        AND      R3,R4,#0x3
        LSLS     R3,R3,#+10
        STR      R3,[R0, #+16]
        LDR      R3,[R0, #+16]
        LDRB     R4,[R1, #+52]
        ORR      R3,R3,R4, LSL #+2
        STR      R3,[R0, #+16]
        LDR      R3,[R1, #+56]
        LSRS     R3,R3,#+24
        LDR      R4,[R0, #+16]
        LSRS     R5,R3,#+6
        ORRS     R4,R5,R4
        STR      R4,[R0, #+16]
        AND      R4,R3,#0x38
        LSRS     R4,R4,#+3
        STRB     R4,[R0, #+20]
        AND      R3,R3,#0x7
        STRB     R3,[R0, #+21]
        LDR      R3,[R1, #+56]
        LSLS     R3,R3,#+8
        LSRS     R3,R3,#+24
        LSRS     R4,R3,#+5
        STRB     R4,[R0, #+22]
        AND      R4,R3,#0x1C
        LSRS     R4,R4,#+2
        STRB     R4,[R0, #+23]
        AND      R3,R3,#0x3
        LSLS     R3,R3,#+1
        STRB     R3,[R0, #+24]
        LDR      R3,[R1, #+56]
        LSRS     R4,R3,#+8
        UXTB     R4,R4
        LDRB     R3,[R0, #+24]
        ORR      R3,R3,R4, LSR #+7
        STRB     R3,[R0, #+24]
        LDR      R3,[R0, #+16]
        LDRB     R5,[R0, #+24]
        MOVS     R6,#+1
        LDRSB    R7,[R0, #+8]
        LSLS     R6,R6,R7
        STR      R6,[R2, #+8]
        ADDS     R3,R3,#+1
        MOVS     R6,#+1
        ADDS     R5,R5,#+2
        LSL      R5,R6,R5
        MULS     R3,R3,R5
        LDR      R5,[R2, #+8]
        MULS     R3,R3,R5
        STR      R3,[R2, #+4]
        B.N      ??SD_GetCardInfo_2
??SD_GetCardInfo_1:
        CMP      R3,#+2
        BNE.N    ??SD_GetCardInfo_2
        LDR      R3,[R1, #+52]
        AND      R3,R3,#0x3F
        LSLS     R3,R3,#+16
        STR      R3,[R0, #+16]
        LDR      R3,[R0, #+16]
        LDR      R4,[R1, #+56]
        LSRS     R4,R4,#+24
        ORR      R3,R3,R4, LSL #+8
        STR      R3,[R0, #+16]
        LDR      R3,[R0, #+16]
        LDR      R4,[R1, #+56]
        LSLS     R4,R4,#+8
        LSRS     R4,R4,#+24
        ORRS     R3,R4,R3
        STR      R3,[R0, #+16]
        LDR      R3,[R1, #+56]
        LSRS     R4,R3,#+8
        UXTB     R4,R4
        LDR      R3,[R0, #+16]
        ADDS     R3,R3,#+1
        LSLS     R3,R3,#+19
        STR      R3,[R2, #+4]
        MOV      R3,#+512
        STR      R3,[R2, #+8]
??SD_GetCardInfo_2:
        AND      R3,R4,#0x40
        LSRS     R3,R3,#+6
        STRB     R3,[R0, #+25]
        AND      R3,R4,#0x3F
        LSLS     R3,R3,#+1
        STRB     R3,[R0, #+26]
        LDRB     R3,[R1, #+56]
        LDRB     R4,[R0, #+26]
        ORR      R4,R4,R3, LSR #+7
        STRB     R4,[R0, #+26]
        AND      R3,R3,#0x7F
        STRB     R3,[R0, #+27]
        LDR      R3,[R1, #+60]
        LSRS     R3,R3,#+24
        LSRS     R4,R3,#+7
        STRB     R4,[R0, #+28]
        AND      R4,R3,#0x60
        LSRS     R4,R4,#+5
        STRB     R4,[R0, #+29]
        AND      R4,R3,#0x1C
        LSRS     R4,R4,#+2
        STRB     R4,[R0, #+30]
        AND      R3,R3,#0x3
        LSLS     R3,R3,#+2
        STRB     R3,[R0, #+31]
        LDR      R3,[R1, #+60]
        LSRS     R4,R3,#+16
        UXTB     R4,R4
        LDRB     R3,[R0, #+31]
        ORR      R3,R3,R4, LSR #+6
        STRB     R3,[R0, #+31]
        AND      R3,R4,#0x20
        LSRS     R3,R3,#+5
        STRB     R3,[R0, #+32]
        ADD      R3,R0,#+32
        MOVS     R5,#+0
        STRB     R5,[R3, #+1]
        AND      R4,R4,#0x1
        STRB     R4,[R3, #+2]
        LDR      R4,[R1, #+60]
        LSLS     R4,R4,#+16
        LSRS     R4,R4,#+24
        LSRS     R5,R4,#+7
        STRB     R5,[R3, #+3]
        AND      R5,R4,#0x40
        LSRS     R5,R5,#+6
        STRB     R5,[R3, #+4]
        AND      R5,R4,#0x20
        LSRS     R5,R5,#+5
        STRB     R5,[R3, #+5]
        AND      R5,R4,#0x10
        LSRS     R5,R5,#+4
        STRB     R5,[R3, #+6]
        AND      R5,R4,#0xC
        LSRS     R5,R5,#+2
        STRB     R5,[R3, #+7]
        AND      R4,R4,#0x3
        STRB     R4,[R3, #+8]
        LDR      R4,[R1, #+60]
        LSLS     R4,R4,#+24
        LSRS     R4,R4,#+25
        STRB     R4,[R3, #+9]
        MOVS     R4,#+1
        STRB     R4,[R3, #+10]
        LDR      R4,[R1, #+64]
        LSRS     R4,R4,#+24
        STRB     R4,[R3, #+12]
        LDR      R4,[R1, #+64]
        LSRS     R5,R4,#+16
        LSLS     R5,R5,#+24
        LSRS     R5,R5,#+16
        STRH     R5,[R3, #+14]
        LDRH     R5,[R3, #+14]
        LSRS     R6,R4,#+8
        UXTB     R6,R6
        ORRS     R5,R6,R5
        STRH     R5,[R3, #+14]
        UXTB     R4,R4
        LSLS     R4,R4,#+24
        STR      R4,[R3, #+16]
        LDR      R4,[R3, #+16]
        LDR      R5,[R1, #+68]
        LSRS     R5,R5,#+24
        ORR      R4,R4,R5, LSL #+16
        STR      R4,[R3, #+16]
        LDR      R4,[R3, #+16]
        LDR      R5,[R1, #+68]
        LSLS     R5,R5,#+8
        LSRS     R5,R5,#+24
        ORR      R4,R4,R5, LSL #+8
        STR      R4,[R3, #+16]
        LDR      R4,[R3, #+16]
        LDR      R5,[R1, #+68]
        LSLS     R5,R5,#+16
        LSRS     R5,R5,#+24
        ORRS     R4,R5,R4
        STR      R4,[R3, #+16]
        LDR      R4,[R1, #+68]
        STRB     R4,[R3, #+20]
        LDR      R4,[R1, #+72]
        LSRS     R4,R4,#+24
        STRB     R4,[R3, #+21]
        LDR      R4,[R1, #+72]
        LSLS     R4,R4,#+8
        LSRS     R4,R4,#+24
        LSLS     R4,R4,#+24
        STR      R4,[R3, #+24]
        LDR      R4,[R3, #+24]
        LDR      R5,[R1, #+72]
        LSLS     R5,R5,#+16
        LSRS     R5,R5,#+24
        ORR      R4,R4,R5, LSL #+16
        STR      R4,[R3, #+24]
        LDR      R4,[R3, #+24]
        LDRB     R5,[R1, #+72]
        ORR      R4,R4,R5, LSL #+8
        STR      R4,[R3, #+24]
        LDR      R4,[R3, #+24]
        LDR      R5,[R1, #+76]
        LSRS     R5,R5,#+24
        ORRS     R4,R5,R4
        STR      R4,[R3, #+24]
        LDR      R4,[R1, #+76]
        LSLS     R4,R4,#+8
        LSRS     R4,R4,#+24
        LDRB     R5,[R3, #+28]
        ORR      R5,R5,R4, LSR #+4
        STRB     R5,[R3, #+28]
        AND      R4,R4,#0xF
        LSLS     R4,R4,#+8
        STRH     R4,[R3, #+30]
        LDR      R1,[R1, #+76]
        LDRH     R4,[R3, #+30]
        LSRS     R5,R1,#+8
        UXTB     R5,R5
        ORRS     R4,R5,R4
        STRH     R4,[R3, #+30]
        LSLS     R1,R1,#+24
        LSRS     R1,R1,#+25
        STRB     R1,[R0, #+64]
        MOVS     R0,#+1
        STRB     R0,[R2, #+1]
        MOVS     R0,#+42
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SD_EnableWideBusOperation:
        PUSH     {R3-R5,LR}
        MOVS     R4,#+42
        LDR.W    R1,??DataTable16  ;; TransferError
        LDR      R1,[R1, #+80]
        CMP      R1,#+3
        BNE.N    ??SD_EnableWideBusOperation_0
??SD_EnableWideBusOperation_1:
        MOVS     R0,#+39
        POP      {R1,R4,R5,PC}
??SD_EnableWideBusOperation_0:
        CBZ      R1,??SD_EnableWideBusOperation_2
        CMP      R1,#+1
        BEQ.N    ??SD_EnableWideBusOperation_2
        CMP      R1,#+2
        BNE.N    ??SD_EnableWideBusOperation_3
??SD_EnableWideBusOperation_2:
        CMP      R0,#+4096
        BEQ.N    ??SD_EnableWideBusOperation_1
        LDR.N    R5,??DataTable8  ;; SDIO_InitStructure
        CMP      R0,#+2048
        BNE.N    ??SD_EnableWideBusOperation_4
        MOVS     R0,#+1
        BL       SDEnWideBus
        MOV      R4,R0
        CMP      R0,#+42
        BNE.N    ??SD_EnableWideBusOperation_3
        BL       ?Subroutine13
??CrossCallReturnLabel_35:
        MOV      R0,#+2048
        STR      R0,[R5, #+16]
        MOVS     R0,#+0
        B.N      ??SD_EnableWideBusOperation_5
??SD_EnableWideBusOperation_4:
        MOVS     R0,#+0
        BL       SDEnWideBus
        MOV      R4,R0
        CMP      R0,#+42
        BNE.N    ??SD_EnableWideBusOperation_3
        BL       ?Subroutine13
??CrossCallReturnLabel_36:
        STR      R0,[R5, #+16]
??SD_EnableWideBusOperation_5:
        STR      R0,[R5, #+20]
        MOV      R0,R5
        BL       SDIO_Init
??SD_EnableWideBusOperation_3:
        MOV      R0,R4
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable8:
        DC32     SDIO_InitStructure

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine13:
        MOVS     R0,#+1
        STRB     R0,[R5, #+0]
        MOVS     R0,#+0
        STR      R0,[R5, #+4]
        STR      R0,[R5, #+8]
        STR      R0,[R5, #+12]
        BX       LR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SD_SetDeviceMode:
        MOV      R1,R0
        MOVS     R0,#+42
        CMP      R1,#+0
        BEQ.N    ??SD_SetDeviceMode_0
        CMP      R1,#+1
        BEQ.N    ??SD_SetDeviceMode_0
        CMP      R1,#+2
        BNE.N    ??SD_SetDeviceMode_1
??SD_SetDeviceMode_0:
        LDR.W    R2,??DataTable16  ;; TransferError
        STR      R1,[R2, #+88]
        BX       LR
??SD_SetDeviceMode_1:
        MOVS     R0,#+38
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SD_SelectDeselect:
        PUSH     {R7,LR}
        LDR.W    R1,??DataTable16  ;; TransferError
        STR      R0,[R1, #+28]
        MOVS     R0,#+7
        STR      R0,[R1, #+32]
        MOVS     R0,#+64
        STR      R0,[R1, #+36]
        MOVS     R0,#+0
        STR      R0,[R1, #+40]
        MOV      R0,#+1024
        STR      R0,[R1, #+44]
        ADD      R0,R1,#+28
        BL       SDIO_SendCommand
        MOVS     R0,#+7
        REQUIRE ?Subroutine1
        ;; // Fall through to label ?Subroutine1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine1:
        POP      {R1,LR}
        B.W      CmdResp1Error

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SD_ReadBlock:
        PUSH     {R3-R11,LR}
        MOV      R4,R0
        MOV      R5,R1
        MOV      R7,R2
        MOV      R9,R5
        CMP      R5,#+0
        BNE.N    ??SD_ReadBlock_0
??SD_ReadBlock_1:
        MOVS     R0,#+38
        B.N      ??SD_ReadBlock_2
??SD_ReadBlock_0:
        LDR.W    R6,??DataTable16  ;; TransferError
        MOVS     R0,#+42
        STRB     R0,[R6, #+0]
        MOVS     R0,#+0
        STR      R0,[R6, #+108]
        STR      R0,[R6, #+92]
        BL       ?Subroutine38
??CrossCallReturnLabel_139:
        MOVS     R0,#+0
        STR      R0,[R6, #+8]
        STR      R0,[R6, #+12]
        STR      R0,[R6, #+16]
        STR      R0,[R6, #+20]
        STR      R0,[R6, #+24]
        ADDS     R0,R6,#+4
        BL       SDIO_DataConfig
        MOVS     R0,#+0
        BL       SDIO_DMACmd
        BL       ?Subroutine32
??CrossCallReturnLabel_116:
        TST      R0,#0x2000000
        BEQ.N    ??SD_ReadBlock_3
        MOVS     R0,#+14
??SD_ReadBlock_2:
        POP      {R1,R4-R11,PC}
??SD_ReadBlock_3:
        LDR      R0,[R6, #+80]
        CMP      R0,#+2
        BNE.N    ??SD_ReadBlock_4
        MOV      R7,#+512
        LSRS     R4,R4,#+9
        B.N      ??SD_ReadBlock_5
??SD_ReadBlock_4:
        CMP      R7,#+0
        BEQ.N    ??SD_ReadBlock_1
        MOVW     R0,#+2049
        CMP      R7,R0
        BCS.N    ??SD_ReadBlock_1
??SD_ReadBlock_5:
        SUBS     R0,R7,#+1
        TST      R7,R0
        BNE.N    ??SD_ReadBlock_1
        MOV      R0,R7
        BL       convert_from_bytes_to_power_of_two
        MOV      R10,R0
        STR      R7,[R6, #+28]
        BL       ?Subroutine39
??CrossCallReturnLabel_144:
        MOVS     R0,#+0
        STR      R0,[R6, #+40]
        MOV      R11,#+1024
        BL       ??Subroutine48_0
??CrossCallReturnLabel_174:
        BL       ?Subroutine34
??CrossCallReturnLabel_128:
        MOV      R8,R0
        CMP      R0,#+42
        BEQ.N    ??SD_ReadBlock_6
??SD_ReadBlock_7:
        MOV      R0,R8
        B.N      ??SD_ReadBlock_2
??SD_ReadBlock_6:
        BL       ?Subroutine38
??CrossCallReturnLabel_140:
        STR      R7,[R6, #+8]
        LSL      R0,R10,#+4
        STR      R0,[R6, #+12]
        MOVS     R0,#+2
        STR      R0,[R6, #+16]
        MOVS     R0,#+0
        STR      R0,[R6, #+20]
        BL       ?Subroutine12
??CrossCallReturnLabel_34:
        STR      R7,[R6, #+92]
        MOVS     R0,#+0
        STR      R0,[R6, #+96]
        STR      R5,[R6, #+104]
        STR      R4,[R6, #+28]
        MOVS     R0,#+17
        STR      R0,[R6, #+32]
        MOVS     R0,#+64
        STR      R0,[R6, #+36]
        MOVS     R0,#+0
        STR      R0,[R6, #+40]
        BL       ??Subroutine48_0
??CrossCallReturnLabel_173:
        MOVS     R0,#+17
        BL       CmdResp1Error
        MOV      R8,R0
        CMP      R0,#+42
        BNE.N    ??SD_ReadBlock_7
        LDR      R0,[R6, #+88]
        CMP      R0,#+2
        BEQ.N    ??SD_ReadBlock_8
        CMP      R0,#+1
        BNE.N    ??SD_ReadBlock_9
        BL       ?Subroutine5
??CrossCallReturnLabel_19:
        LDR      R0,[R6, #+108]
        CBNZ     R0,??SD_ReadBlock_10
        LDRB     R0,[R6, #+0]
        CMP      R0,#+42
        BEQ.N    ??CrossCallReturnLabel_19
??SD_ReadBlock_10:
        LDRB     R0,[R6, #+0]
        CMP      R0,#+42
        BEQ.N    ??SD_ReadBlock_7
        LDRB     R0,[R6, #+0]
        B.N      ??SD_ReadBlock_2
??SD_ReadBlock_11:
        BL       ?Subroutine24
??CrossCallReturnLabel_84:
        CBZ      R0,??SD_ReadBlock_8
        MOVS     R4,#+0
??SD_ReadBlock_12:
        BL       SDIO_ReadData
        STR      R0,[R9, R4, LSL #+2]
        ADDS     R4,R4,#+1
        CMP      R4,#+8
        BCC.N    ??SD_ReadBlock_12
        ADD      R9,R9,#+32
??SD_ReadBlock_8:
        BL       ?Subroutine37
??CrossCallReturnLabel_136:
        BEQ.N    ??SD_ReadBlock_11
        BL       ?Subroutine22
??CrossCallReturnLabel_75:
        CBZ      R0,??SD_ReadBlock_13
        BL       ?Subroutine23
??CrossCallReturnLabel_81:
        MOVS     R0,#+4
        B.N      ??SD_ReadBlock_2
??SD_ReadBlock_13:
        BL       ?Subroutine3
??CrossCallReturnLabel_11:
        CBZ      R0,??SD_ReadBlock_14
        BL       ?Subroutine4
??CrossCallReturnLabel_17:
        MOVS     R0,#+2
        B.N      ??SD_ReadBlock_2
??SD_ReadBlock_14:
        BL       ?Subroutine25
??CrossCallReturnLabel_88:
        CBZ      R0,??SD_ReadBlock_15
        BL       ?Subroutine26
??CrossCallReturnLabel_92:
        MOVS     R0,#+6
        B.N      ??SD_ReadBlock_2
??SD_ReadBlock_15:
        BL       ?Subroutine19
??CrossCallReturnLabel_58:
        CBZ      R0,??SD_ReadBlock_16
        BL       ?Subroutine20
??CrossCallReturnLabel_64:
        MOVS     R0,#+7
        B.N      ??SD_ReadBlock_2
??SD_ReadBlock_17:
        BL       SDIO_ReadData
        STR      R0,[R9], #+4
??SD_ReadBlock_16:
        BL       ?Subroutine21
??CrossCallReturnLabel_69:
        CMP      R0,#+0
        BNE.N    ??SD_ReadBlock_17
        BL       ?Subroutine18
??CrossCallReturnLabel_51:
        B.N      ??SD_ReadBlock_7
??SD_ReadBlock_9:
        CMP      R0,#+0
        BNE.N    ??SD_ReadBlock_7
        BL       ?Subroutine6
??CrossCallReturnLabel_21:
        BL       ?Subroutine14
??CrossCallReturnLabel_40:
        MOV      R1,R7
        MOV      R0,R5
        BL       DMA_RxConfiguration
??SD_ReadBlock_18:
        BL       ?Subroutine41
??CrossCallReturnLabel_152:
        CMP      R0,#+0
        BNE.N    ??SD_ReadBlock_7
        B.N      ??SD_ReadBlock_18

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine17:
        LDR      R0,[R6, #+84]
        LSLS     R0,R0,#+16
        STR      R0,[R6, #+28]
        MOVS     R0,#+13
        REQUIRE ??Subroutine47_0
        ;; // Fall through to label ??Subroutine47_0

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
??Subroutine47_0:
        STR      R0,[R6, #+32]
        MOVS     R0,#+64
        STR      R0,[R6, #+36]
        STR      R7,[R6, #+40]
        REQUIRE ??Subroutine48_0
        ;; // Fall through to label ??Subroutine48_0

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
??Subroutine48_0:
        STR      R11,[R6, #+44]
        REQUIRE ??Subroutine49_0
        ;; // Fall through to label ??Subroutine49_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
??Subroutine49_0:
        ADD      R0,R6,#+28
        B.W      SDIO_SendCommand

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SD_ReadMultiBlocks:
        PUSH     {R1,R4-R11,LR}
        MOV      R11,R0
        MOV      R4,R2
        MOV      R5,R3
        MOV      R9,R1
        CMP      R1,#+0
        BNE.N    ??SD_ReadMultiBlocks_0
??SD_ReadMultiBlocks_1:
        MOVS     R0,#+38
        B.N      ??SD_ReadMultiBlocks_2
??SD_ReadMultiBlocks_0:
        LDR.W    R7,??DataTable16  ;; TransferError
        MOVS     R0,#+42
        STRB     R0,[R7, #+0]
        MOVS     R0,#+0
        STR      R0,[R7, #+108]
        STR      R0,[R7, #+92]
        LDR.W    R0,??DataTable19  ;; 0xfffff
        STR      R0,[R7, #+4]
        MOVS     R0,#+0
        STR      R0,[R7, #+8]
        STR      R0,[R7, #+12]
        STR      R0,[R7, #+16]
        STR      R0,[R7, #+20]
        STR      R0,[R7, #+24]
        ADDS     R0,R7,#+4
        BL       SDIO_DataConfig
        MOVS     R0,#+0
        BL       SDIO_DMACmd
        BL       ?Subroutine32
??CrossCallReturnLabel_115:
        TST      R0,#0x2000000
        BEQ.N    ??SD_ReadMultiBlocks_3
        MOVS     R0,#+14
??SD_ReadMultiBlocks_2:
        POP      {R1,R4-R11,PC}
??SD_ReadMultiBlocks_3:
        LDR      R0,[R7, #+80]
        CMP      R0,#+2
        BNE.N    ??SD_ReadMultiBlocks_4
        MOV      R4,#+512
        LSR      R11,R11,#+9
        B.N      ??SD_ReadMultiBlocks_5
??SD_ReadMultiBlocks_4:
        CMP      R4,#+0
        BEQ.N    ??SD_ReadMultiBlocks_1
        MOVW     R0,#+2049
        CMP      R4,R0
        BCS.N    ??SD_ReadMultiBlocks_1
??SD_ReadMultiBlocks_5:
        SUBS     R0,R4,#+1
        TST      R4,R0
        BNE.N    ??SD_ReadMultiBlocks_1
        MOV      R0,R4
        BL       convert_from_bytes_to_power_of_two
        MOV      R10,R0
        STR      R4,[R7, #+28]
        MOVS     R0,#+16
        BL       ?Subroutine30
??CrossCallReturnLabel_104:
        MOV      R6,#+1024
        STR      R6,[R7, #+44]
        BL       ??Subroutine46_0
??CrossCallReturnLabel_159:
        BL       ?Subroutine34
??CrossCallReturnLabel_127:
        MOV      R8,R0
        CMP      R0,#+42
        BEQ.N    ??SD_ReadMultiBlocks_6
??SD_ReadMultiBlocks_7:
        MOV      R0,R8
        B.N      ??SD_ReadMultiBlocks_2
??SD_ReadMultiBlocks_6:
        CMP      R5,#+2
        BCC.N    ??SD_ReadMultiBlocks_7
        MULS     R4,R5,R4
        CMP      R4,#+33554432
        BCS.N    ??SD_ReadMultiBlocks_1
        STR      R4,[R7, #+92]
        MOVS     R0,#+1
        STR      R0,[R7, #+96]
        LDR      R0,[SP, #+0]
        STR      R0,[R7, #+104]
        LDR.W    R0,??DataTable19  ;; 0xfffff
        STR      R0,[R7, #+4]
        STR      R4,[R7, #+8]
        LSL      R0,R10,#+4
        STR      R0,[R7, #+12]
        MOVS     R0,#+2
        STR      R0,[R7, #+16]
        MOVS     R0,#+0
        STR      R0,[R7, #+20]
        MOVS     R0,#+1
        STR      R0,[R7, #+24]
        ADDS     R0,R7,#+4
        BL       SDIO_DataConfig
        STR      R11,[R7, #+28]
        MOVS     R0,#+18
        BL       ?Subroutine29
??CrossCallReturnLabel_100:
        BL       ??Subroutine46_0
??CrossCallReturnLabel_158:
        MOVS     R0,#+18
        BL       CmdResp1Error
        MOV      R8,R0
        CMP      R0,#+42
        BNE.N    ??SD_ReadMultiBlocks_7
        LDR      R0,[R7, #+88]
        CMP      R0,#+2
        BEQ.N    ??SD_ReadMultiBlocks_8
        CMP      R0,#+1
        BNE.N    ??SD_ReadMultiBlocks_9
        BL       ?Subroutine5
??CrossCallReturnLabel_18:
        B.N      ??SD_ReadMultiBlocks_10
??SD_ReadMultiBlocks_11:
        BL       ?Subroutine24
??CrossCallReturnLabel_83:
        CBZ      R0,??SD_ReadMultiBlocks_8
        MOVS     R4,#+0
??SD_ReadMultiBlocks_12:
        BL       SDIO_ReadData
        STR      R0,[R9, R4, LSL #+2]
        ADDS     R4,R4,#+1
        CMP      R4,#+8
        BCC.N    ??SD_ReadMultiBlocks_12
        ADD      R9,R9,#+32
??SD_ReadMultiBlocks_8:
        LDR.N    R0,??DataTable18  ;; 0x40018034
        LDR      R0,[R0, #+0]
        MOVW     R1,#+810
        TST      R0,R1
        BEQ.N    ??SD_ReadMultiBlocks_11
        BL       ?Subroutine22
??CrossCallReturnLabel_74:
        CBZ      R0,??SD_ReadMultiBlocks_13
        BL       ?Subroutine23
??CrossCallReturnLabel_80:
        MOVS     R0,#+4
        B.N      ??SD_ReadMultiBlocks_2
??SD_ReadMultiBlocks_13:
        BL       ?Subroutine3
??CrossCallReturnLabel_10:
        CBZ      R0,??SD_ReadMultiBlocks_14
        BL       ?Subroutine4
??CrossCallReturnLabel_16:
        MOVS     R0,#+2
        B.N      ??SD_ReadMultiBlocks_2
??SD_ReadMultiBlocks_14:
        BL       ?Subroutine25
??CrossCallReturnLabel_87:
        CBZ      R0,??SD_ReadMultiBlocks_15
        BL       ?Subroutine26
??CrossCallReturnLabel_91:
        MOVS     R0,#+6
        B.N      ??SD_ReadMultiBlocks_2
??SD_ReadMultiBlocks_15:
        BL       ?Subroutine19
??CrossCallReturnLabel_57:
        CBZ      R0,??SD_ReadMultiBlocks_16
        BL       ?Subroutine20
??CrossCallReturnLabel_63:
        MOVS     R0,#+7
        B.N      ??SD_ReadMultiBlocks_2
??SD_ReadMultiBlocks_17:
        BL       SDIO_ReadData
        STR      R0,[R9], #+4
??SD_ReadMultiBlocks_16:
        BL       ?Subroutine21
??CrossCallReturnLabel_68:
        CMP      R0,#+0
        BNE.N    ??SD_ReadMultiBlocks_17
        MOV      R0,#+256
        BL       SDIO_GetFlagStatus
        CBZ      R0,??SD_ReadMultiBlocks_18
        LDR      R0,[R7, #+80]
        CBZ      R0,??SD_ReadMultiBlocks_19
        CMP      R0,#+2
        BEQ.N    ??SD_ReadMultiBlocks_19
        CMP      R0,#+1
        BNE.N    ??SD_ReadMultiBlocks_18
??SD_ReadMultiBlocks_19:
        MOVS     R0,#+0
        STR      R0,[R7, #+28]
        MOVS     R0,#+12
        BL       ?Subroutine29
??CrossCallReturnLabel_101:
        BL       ??Subroutine46_0
??CrossCallReturnLabel_157:
        MOVS     R0,#+12
        BL       CmdResp1Error
        MOV      R8,R0
        CMP      R0,#+42
        BNE.N    ??CrossCallReturnLabel_50
??SD_ReadMultiBlocks_18:
        BL       ?Subroutine18
??CrossCallReturnLabel_50:
        B.N      ??SD_ReadMultiBlocks_7
??SD_ReadMultiBlocks_9:
        CMP      R0,#+0
        BNE.N    ??CrossCallReturnLabel_50
        BL       ?Subroutine6
??CrossCallReturnLabel_20:
        BL       ?Subroutine14
??CrossCallReturnLabel_39:
        MOV      R1,R4
        LDR      R0,[SP, #+0]
        BL       DMA_RxConfiguration
??SD_ReadMultiBlocks_20:
        BL       ?Subroutine41
??CrossCallReturnLabel_151:
        CMP      R0,#+0
        BEQ.N    ??SD_ReadMultiBlocks_20
??SD_ReadMultiBlocks_10:
        LDR      R0,[R7, #+108]
        CBNZ     R0,??SD_ReadMultiBlocks_21
        LDRB     R0,[R7, #+0]
        CMP      R0,#+42
        BEQ.N    ??SD_ReadMultiBlocks_10
??SD_ReadMultiBlocks_21:
        LDRB     R0,[R7, #+0]
        CMP      R0,#+42
        BEQ.N    ??CrossCallReturnLabel_50
        LDRB     R0,[R7, #+0]
        B.N      ??SD_ReadMultiBlocks_2

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine30:
        STR      R0,[R7, #+32]
        MOVS     R0,#+64
        STR      R0,[R7, #+36]
        MOVS     R0,#+0
        STR      R0,[R7, #+40]
        BX       LR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine29:
        STR      R0,[R7, #+32]
        MOVS     R0,#+64
        STR      R0,[R7, #+36]
        MOVS     R0,#+0
        STR      R0,[R7, #+40]
        STR      R6,[R7, #+44]
        BX       LR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine24:
        MOV      R0,#+32768
        B.W      SDIO_GetFlagStatus

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine6:
        MOVS     R1,#+1
        MOVW     R0,#+810
        B.W      SDIO_ITConfig

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine5:
        MOVS     R1,#+1
        MOVW     R0,#+33578
        B.W      SDIO_ITConfig

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SD_WriteBlock:
        PUSH     {R1,R4-R11,LR}
        SUB      SP,SP,#+8
        MOV      R5,R0
        MOV      R4,R2
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
        MOVS     R7,#+0
        LDR      R8,[SP, #+8]
        MOV      R0,R8
        CMP      R0,#+0
        BNE.N    ??SD_WriteBlock_0
??SD_WriteBlock_1:
        MOVS     R0,#+38
        B.N      ??SD_WriteBlock_2
??SD_WriteBlock_0:
        LDR.N    R6,??DataTable16  ;; TransferError
        MOVS     R0,#+42
        STRB     R0,[R6, #+0]
        STR      R7,[R6, #+108]
        STR      R7,[R6, #+92]
        BL       ?Subroutine38
??CrossCallReturnLabel_141:
        STR      R7,[R6, #+8]
        STR      R7,[R6, #+12]
        STR      R7,[R6, #+16]
        STR      R7,[R6, #+20]
        STR      R7,[R6, #+24]
        ADDS     R0,R6,#+4
        BL       SDIO_DataConfig
        MOVS     R0,#+0
        BL       SDIO_DMACmd
        MOV      R0,R7
        BL       SDIO_GetResponse
        TST      R0,#0x2000000
        BEQ.N    ??SD_WriteBlock_3
        MOVS     R0,#+14
??SD_WriteBlock_2:
        POP      {R1-R11,PC}
??SD_WriteBlock_3:
        LDR      R0,[R6, #+80]
        CMP      R0,#+2
        BNE.N    ??SD_WriteBlock_4
        MOV      R4,#+512
        LSRS     R5,R5,#+9
        B.N      ??SD_WriteBlock_5
??SD_WriteBlock_4:
        CMP      R4,#+0
        BEQ.N    ??SD_WriteBlock_1
        MOVW     R0,#+2049
        CMP      R4,R0
        BCS.N    ??SD_WriteBlock_1
??SD_WriteBlock_5:
        SUBS     R0,R4,#+1
        TST      R4,R0
        BNE.N    ??SD_WriteBlock_1
        MOV      R0,R4
        BL       convert_from_bytes_to_power_of_two
        MOV      R9,R0
        STR      R4,[R6, #+28]
        BL       ?Subroutine39
??CrossCallReturnLabel_145:
        STR      R7,[R6, #+40]
        MOV      R11,#+1024
        BL       ??Subroutine48_0
??CrossCallReturnLabel_172:
        BL       ?Subroutine34
??CrossCallReturnLabel_126:
        CMP      R0,#+42
        BNE.N    ??SD_WriteBlock_2
        BL       ?Subroutine17
??CrossCallReturnLabel_177:
        BL       ?Subroutine35
??CrossCallReturnLabel_133:
        CMP      R0,#+42
        BNE.N    ??SD_WriteBlock_2
        MOVS     R0,#+0
        BL       SDIO_GetResponse
        LDR.W    R10,??DataTable19  ;; 0xfffff
        B.N      ??SD_WriteBlock_6
??SD_WriteBlock_7:
        CMP      R10,#+0
        BEQ.N    ??SD_WriteBlock_8
        SUB      R10,R10,#+1
        BL       ?Subroutine17
??CrossCallReturnLabel_176:
        BL       ?Subroutine35
??CrossCallReturnLabel_132:
        CMP      R0,#+42
        BNE.N    ??SD_WriteBlock_2
        MOVS     R0,#+0
        BL       SDIO_GetResponse
??SD_WriteBlock_6:
        TST      R0,#0x100
        BEQ.N    ??SD_WriteBlock_7
        CMP      R10,#+0
        BNE.N    ??SD_WriteBlock_9
??SD_WriteBlock_8:
        MOVS     R0,#+41
        B.N      ??SD_WriteBlock_2
??SD_WriteBlock_9:
        STR      R5,[R6, #+28]
        MOVS     R0,#+24
        BL       ??Subroutine47_0
??CrossCallReturnLabel_175:
        MOVS     R0,#+24
        BL       CmdResp1Error
        CMP      R0,#+42
        BNE.N    ??SD_WriteBlock_2
        STR      R4,[R6, #+92]
        STR      R7,[R6, #+96]
        LDR      R0,[SP, #+8]
        STR      R0,[R6, #+100]
        BL       ?Subroutine38
??CrossCallReturnLabel_142:
        STR      R4,[R6, #+8]
        LSL      R0,R9,#+4
        STR      R0,[R6, #+12]
        STR      R7,[R6, #+16]
        STR      R7,[R6, #+20]
        BL       ?Subroutine12
??CrossCallReturnLabel_33:
        LDR      R0,[R6, #+88]
        CMP      R0,#+2
        BEQ.N    ??SD_WriteBlock_10
        CMP      R0,#+1
        BNE.N    ??SD_WriteBlock_11
        BL       ?Subroutine7
??CrossCallReturnLabel_23:
        LDR      R0,[R6, #+108]
        CBNZ     R0,??SD_WriteBlock_12
        LDRB     R0,[R6, #+0]
        CMP      R0,#+42
        BEQ.N    ??CrossCallReturnLabel_23
??SD_WriteBlock_12:
        LDRB     R0,[R6, #+0]
        CMP      R0,#+42
        BEQ.N    ??SD_WriteBlock_13
        LDRB     R0,[R6, #+0]
        B.N      ??SD_WriteBlock_2
??SD_WriteBlock_14:
        MOVS     R4,#+0
??SD_WriteBlock_15:
        LDR      R0,[R8, R4, LSL #+2]
        BL       SDIO_WriteData
        ADDS     R4,R4,#+1
        CMP      R4,#+8
        BCC.N    ??SD_WriteBlock_15
        ADD      R8,R8,#+32
        ADDS     R7,R7,#+32
??SD_WriteBlock_10:
        LDR.N    R0,??DataTable18  ;; 0x40018034
        LDR      R0,[R0, #+0]
        MOVW     R1,#+1562
        TST      R0,R1
        BNE.N    ??SD_WriteBlock_16
        MOV      R0,#+16384
        BL       SDIO_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??SD_WriteBlock_10
        LDR      R0,[R6, #+92]
        SUBS     R1,R0,R7
        CMP      R1,#+32
        BCS.N    ??SD_WriteBlock_14
        LSRS     R5,R1,#+2
        SUBS     R0,R0,R7
        TST      R0,#0x3
        BEQ.N    ??SD_WriteBlock_17
        ADDS     R5,R5,#+1
??SD_WriteBlock_17:
        MOVS     R4,#+0
??SD_WriteBlock_18:
        CMP      R4,R5
        BCS.N    ??SD_WriteBlock_10
        LDR      R0,[R8], #+4
        BL       SDIO_WriteData
        ADDS     R4,R4,#+1
        ADDS     R7,R7,#+4
        B.N      ??SD_WriteBlock_18
??SD_WriteBlock_16:
        BL       ?Subroutine22
??CrossCallReturnLabel_73:
        CBZ      R0,??SD_WriteBlock_19
        BL       ?Subroutine23
??CrossCallReturnLabel_79:
        MOVS     R0,#+4
        B.N      ??SD_WriteBlock_2
??SD_WriteBlock_19:
        BL       ?Subroutine3
??CrossCallReturnLabel_9:
        CBZ      R0,??SD_WriteBlock_20
        BL       ?Subroutine4
??CrossCallReturnLabel_15:
        MOVS     R0,#+2
        B.N      ??SD_WriteBlock_2
??SD_WriteBlock_20:
        MOVS     R0,#+16
        BL       SDIO_GetFlagStatus
        CBZ      R0,??SD_WriteBlock_21
        MOVS     R0,#+16
        BL       SDIO_ClearFlag
        MOVS     R0,#+5
        B.N      ??SD_WriteBlock_2
??SD_WriteBlock_21:
        BL       ?Subroutine19
??CrossCallReturnLabel_56:
        CBZ      R0,??SD_WriteBlock_13
        BL       ?Subroutine20
??CrossCallReturnLabel_62:
        MOVS     R0,#+7
??SD_WriteBlock_22:
        B.N      ??SD_WriteBlock_2
??SD_WriteBlock_11:
        CBNZ     R0,??SD_WriteBlock_13
        BL       ?Subroutine8
??CrossCallReturnLabel_25:
        MOV      R1,R4
        LDR      R0,[SP, #+8]
        BL       DMA_TxConfiguration
        BL       ?Subroutine14
??CrossCallReturnLabel_38:
        BL       ?Subroutine41
??CrossCallReturnLabel_150:
        CMP      R0,#+0
        BEQ.N    ??CrossCallReturnLabel_38
        B.N      ??SD_WriteBlock_12
??SD_WriteBlock_13:
        BL       ?Subroutine18
??CrossCallReturnLabel_49:
        ADD      R0,SP,#+0
        BL       IsCardProgramming
        CMP      R0,#+42
        BNE.N    ??SD_WriteBlock_22
        LDRB     R1,[SP, #+0]
        CMP      R1,#+7
        BEQ.N    ??CrossCallReturnLabel_49
        CMP      R1,#+6
        BNE.N    ??SD_WriteBlock_22
        B.N      ??CrossCallReturnLabel_49

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable16:
        DC32     TransferError

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable18:
        DC32     0x40018034

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine41:
        LDR.N    R0,??Subroutine41_0  ;; 0x10002000
        B.W      DMA_GetFlagStatus
        Nop      
        DATA
??Subroutine41_0:
        DC32     0x10002000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine39:
        MOVS     R0,#+16
        STR      R0,[R6, #+32]
        MOVS     R0,#+64
        STR      R0,[R6, #+36]
        BX       LR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine38:
        LDR.N    R0,??DataTable19  ;; 0xfffff
        STR      R0,[R6, #+4]
        BX       LR

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable19:
        DC32     0xfffff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine34:
        MOVS     R0,#+16
        B.N      CmdResp1Error

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine14:
        MOVS     R0,#+1
        B.W      SDIO_DMACmd

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine12:
        MOVS     R0,#+1
        STR      R0,[R6, #+24]
        ADDS     R0,R6,#+4
        B.W      SDIO_DataConfig

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SD_WriteMultiBlocks:
        PUSH     {R3-R11,LR}
        SUB      SP,SP,#+8
        MOV      R10,R0
        MOV      R11,R1
        MOV      R6,R2
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
        MOVS     R7,#+0
        MOV      R8,R11
        CMP      R11,#+0
        BNE.N    ??SD_WriteMultiBlocks_0
??SD_WriteMultiBlocks_1:
        MOVS     R0,#+38
        B.N      ??SD_WriteMultiBlocks_2
??SD_WriteMultiBlocks_0:
        LDR.N    R5,??SD_WriteMultiBlocks_3  ;; TransferError
        MOVS     R0,#+42
        STRB     R0,[R5, #+0]
        STR      R7,[R5, #+108]
        STR      R7,[R5, #+92]
        LDR.N    R0,??SD_WriteMultiBlocks_3+0x4  ;; 0xfffff
        STR      R0,[R5, #+4]
        STR      R7,[R5, #+8]
        STR      R7,[R5, #+12]
        STR      R7,[R5, #+16]
        STR      R7,[R5, #+20]
        STR      R7,[R5, #+24]
        ADDS     R0,R5,#+4
        BL       SDIO_DataConfig
        MOVS     R0,#+0
        BL       SDIO_DMACmd
        MOV      R0,R7
        BL       SDIO_GetResponse
        TST      R0,#0x2000000
        BEQ.N    ??SD_WriteMultiBlocks_4
        MOVS     R0,#+14
??SD_WriteMultiBlocks_2:
        POP      {R1-R11,PC}
??SD_WriteMultiBlocks_4:
        LDR      R0,[R5, #+80]
        CMP      R0,#+2
        BNE.N    ??SD_WriteMultiBlocks_5
        MOV      R6,#+512
        LSR      R10,R10,#+9
        B.N      ??SD_WriteMultiBlocks_6
??SD_WriteMultiBlocks_5:
        CMP      R6,#+0
        BEQ.N    ??SD_WriteMultiBlocks_1
        MOVW     R0,#+2049
        CMP      R6,R0
        BCS.N    ??SD_WriteMultiBlocks_1
??SD_WriteMultiBlocks_6:
        SUBS     R0,R6,#+1
        TST      R6,R0
        BNE.N    ??SD_WriteMultiBlocks_1
        MOV      R0,R6
        BL       convert_from_bytes_to_power_of_two
        MOV      R9,R0
        STR      R6,[R5, #+28]
        MOVS     R0,#+16
        STR      R0,[R5, #+32]
        MOVS     R0,#+64
        STR      R0,[R5, #+36]
        STR      R7,[R5, #+40]
        MOV      R4,#+1024
        STR      R4,[R5, #+44]
        BL       ??Subroutine54_0
??CrossCallReturnLabel_186:
        BL       ?Subroutine34
??CrossCallReturnLabel_125:
        CMP      R0,#+42
        BNE.N    ??SD_WriteMultiBlocks_2
        LDR      R0,[R5, #+84]
        LSLS     R0,R0,#+16
        STR      R0,[R5, #+28]
        MOVS     R0,#+13
        BL       ?Subroutine28
??CrossCallReturnLabel_96:
        BL       ??Subroutine54_0
??CrossCallReturnLabel_185:
        BL       ?Subroutine35
??CrossCallReturnLabel_131:
        CMP      R0,#+42
        BNE.N    ??SD_WriteMultiBlocks_2
        LDR      R0,[SP, #+8]
        CMP      R0,#+2
        BCC.W    ??SD_WriteMultiBlocks_7
        MULS     R6,R0,R6
        CMP      R6,#+33554432
        BCS.N    ??SD_WriteMultiBlocks_1
        LDR      R0,[R5, #+80]
        CBZ      R0,??SD_WriteMultiBlocks_8
        CMP      R0,#+1
        BEQ.N    ??SD_WriteMultiBlocks_8
        CMP      R0,#+2
        BNE.N    ??SD_WriteMultiBlocks_9
??SD_WriteMultiBlocks_8:
        LDR      R0,[R5, #+84]
        LSLS     R0,R0,#+16
        STR      R0,[R5, #+28]
        MOVS     R0,#+55
        BL       ?Subroutine28
??CrossCallReturnLabel_97:
        BL       ??Subroutine54_0
??CrossCallReturnLabel_184:
        BL       ?Subroutine31
??CrossCallReturnLabel_106:
        CMP      R0,#+42
        BNE.N    ??SD_WriteMultiBlocks_2
        LDR      R0,[SP, #+8]
        STR      R0,[R5, #+28]
        MOVS     R0,#+23
        BL       ?Subroutine28
??CrossCallReturnLabel_98:
        BL       ??Subroutine54_0
??CrossCallReturnLabel_183:
        MOVS     R0,#+23
        BL       CmdResp1Error
        CMP      R0,#+42
        BNE.N    ??SD_WriteMultiBlocks_2
??SD_WriteMultiBlocks_9:
        STR      R10,[R5, #+28]
        MOVS     R0,#+25
        BL       ?Subroutine28
??CrossCallReturnLabel_99:
        BL       ??Subroutine54_0
??CrossCallReturnLabel_182:
        MOVS     R0,#+25
        BL       CmdResp1Error
        CMP      R0,#+42
        BNE.N    ??SD_WriteMultiBlocks_2
        STR      R6,[R5, #+92]
        MOVS     R0,#+1
        STR      R0,[R5, #+96]
        STR      R11,[R5, #+100]
        LDR.N    R0,??SD_WriteMultiBlocks_3+0x4  ;; 0xfffff
        STR      R0,[R5, #+4]
        STR      R6,[R5, #+8]
        LSL      R0,R9,#+4
        STR      R0,[R5, #+12]
        STR      R7,[R5, #+16]
        STR      R7,[R5, #+20]
        BL       ?Subroutine15
??CrossCallReturnLabel_42:
        LDR      R0,[R5, #+88]
        CMP      R0,#+2
        BEQ.N    ??SD_WriteMultiBlocks_10
        CMP      R0,#+1
        BNE.W    ??SD_WriteMultiBlocks_11
        BL       ?Subroutine7
??CrossCallReturnLabel_22:
        LDR      R0,[R5, #+108]
        CBNZ     R0,??SD_WriteMultiBlocks_12
        LDRB     R0,[R5, #+0]
        CMP      R0,#+42
        BEQ.N    ??CrossCallReturnLabel_22
??SD_WriteMultiBlocks_12:
        LDRB     R0,[R5, #+0]
        CMP      R0,#+42
        BEQ.N    ??SD_WriteMultiBlocks_7
        LDRB     R0,[R5, #+0]
        B.N      ??SD_WriteMultiBlocks_2
??SD_WriteMultiBlocks_13:
        MOVS     R6,#+0
??SD_WriteMultiBlocks_14:
        LDR      R0,[R8, R6, LSL #+2]
        BL       SDIO_WriteData
        ADDS     R6,R6,#+1
        CMP      R6,#+8
        BCC.N    ??SD_WriteMultiBlocks_14
        ADD      R8,R8,#+32
        ADDS     R7,R7,#+32
??SD_WriteMultiBlocks_10:
        LDR.N    R0,??DataTable20  ;; 0x40018034
        LDR      R0,[R0, #+0]
        MOVW     R1,#+794
        TST      R0,R1
        BNE.N    ??SD_WriteMultiBlocks_15
        MOV      R0,#+16384
        BL       SDIO_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??SD_WriteMultiBlocks_10
        LDR      R0,[R5, #+92]
        SUBS     R1,R0,R7
        CMP      R1,#+32
        BCS.N    ??SD_WriteMultiBlocks_13
        LSR      R10,R1,#+2
        SUBS     R0,R0,R7
        TST      R0,#0x3
        BEQ.N    ??SD_WriteMultiBlocks_16
        ADD      R10,R10,#+1
??SD_WriteMultiBlocks_16:
        MOVS     R6,#+0
??SD_WriteMultiBlocks_17:
        CMP      R6,R10
        BCS.N    ??SD_WriteMultiBlocks_10
        LDR      R0,[R8], #+4
        BL       SDIO_WriteData
        ADDS     R6,R6,#+1
        ADDS     R7,R7,#+4
        B.N      ??SD_WriteMultiBlocks_17
??SD_WriteMultiBlocks_15:
        BL       ?Subroutine22
??CrossCallReturnLabel_72:
        CBZ      R0,??SD_WriteMultiBlocks_18
        BL       ?Subroutine23
??CrossCallReturnLabel_78:
        MOVS     R0,#+4
        B.N      ??SD_WriteMultiBlocks_2
??SD_WriteMultiBlocks_18:
        BL       ?Subroutine3
??CrossCallReturnLabel_8:
        CBZ      R0,??SD_WriteMultiBlocks_19
        BL       ?Subroutine4
??CrossCallReturnLabel_14:
        MOVS     R0,#+2
        B.N      ??SD_WriteMultiBlocks_2
??SD_WriteMultiBlocks_19:
        MOVS     R0,#+16
        BL       SDIO_GetFlagStatus
        CBZ      R0,??SD_WriteMultiBlocks_20
        MOVS     R0,#+16
        BL       SDIO_ClearFlag
        MOVS     R0,#+5
        B.N      ??SD_WriteMultiBlocks_2
??SD_WriteMultiBlocks_20:
        BL       ?Subroutine19
??CrossCallReturnLabel_55:
        CBZ      R0,??SD_WriteMultiBlocks_21
        BL       ?Subroutine20
??CrossCallReturnLabel_61:
        MOVS     R0,#+7
??SD_WriteMultiBlocks_22:
        B.N      ??SD_WriteMultiBlocks_2
??SD_WriteMultiBlocks_21:
        MOV      R0,#+256
        BL       SDIO_GetFlagStatus
        CBZ      R0,??SD_WriteMultiBlocks_7
        LDR      R0,[R5, #+80]
        CBZ      R0,??SD_WriteMultiBlocks_23
        CMP      R0,#+1
        BEQ.N    ??SD_WriteMultiBlocks_23
        CMP      R0,#+2
        BNE.N    ??SD_WriteMultiBlocks_7
??SD_WriteMultiBlocks_23:
        MOVS     R0,#+0
        STR      R0,[R5, #+28]
        MOVS     R0,#+12
        BL       ?Subroutine36
??CrossCallReturnLabel_134:
        STR      R4,[R5, #+44]
        BL       ??Subroutine54_0
??CrossCallReturnLabel_181:
        MOVS     R0,#+12
        BL       CmdResp1Error
        CMP      R0,#+42
        BNE.N    ??SD_WriteMultiBlocks_22
??SD_WriteMultiBlocks_7:
        BL       ?Subroutine18
??CrossCallReturnLabel_48:
        ADD      R0,SP,#+0
        BL       IsCardProgramming
        CMP      R0,#+42
        BNE.N    ??SD_WriteMultiBlocks_22
        LDRB     R1,[SP, #+0]
        CMP      R1,#+7
        BEQ.N    ??CrossCallReturnLabel_48
        CMP      R1,#+6
        BNE.N    ??SD_WriteMultiBlocks_22
        B.N      ??CrossCallReturnLabel_48
??SD_WriteMultiBlocks_11:
        CMP      R0,#+0
        BNE.N    ??SD_WriteMultiBlocks_7
        BL       ?Subroutine8
??CrossCallReturnLabel_24:
        BL       ?Subroutine14
??CrossCallReturnLabel_37:
        MOV      R1,R6
        MOV      R0,R11
        BL       DMA_TxConfiguration
??SD_WriteMultiBlocks_24:
        BL       ?Subroutine41
??CrossCallReturnLabel_149:
        CMP      R0,#+0
        BEQ.N    ??SD_WriteMultiBlocks_24
        B.N      ??CrossCallReturnLabel_22
        DATA
??SD_WriteMultiBlocks_3:
        DC32     TransferError
        DC32     0xfffff

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable20:
        DC32     0x40018034

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine31:
        MOVS     R0,#+55
        B.N      CmdResp1Error

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine28:
        STR      R0,[R5, #+32]
        MOVS     R0,#+64
        STR      R0,[R5, #+36]
        STR      R7,[R5, #+40]
        STR      R4,[R5, #+44]
        BX       LR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine23:
        MOVS     R0,#+8
        B.W      SDIO_ClearFlag

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine22:
        MOVS     R0,#+8
        B.W      SDIO_GetFlagStatus

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine20:
        MOV      R0,#+512
        B.W      SDIO_ClearFlag

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine19:
        MOV      R0,#+512
        B.W      SDIO_GetFlagStatus

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine8:
        MOVS     R1,#+1
        MOVW     R0,#+794
        B.W      SDIO_ITConfig

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine7:
        MOVS     R1,#+1
        MOVW     R0,#+17178
        B.W      SDIO_ITConfig

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine4:
        MOVS     R0,#+2
        B.W      SDIO_ClearFlag

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine3:
        MOVS     R0,#+2
        B.W      SDIO_GetFlagStatus

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SD_GetTransferState:
        LDR.N    R0,??SD_GetTransferState_0  ;; 0x40018034
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0x3000
        BEQ.N    ??SD_GetTransferState_1
        MOVS     R0,#+1
??SD_GetTransferState_1:
        UXTB     R0,R0
        BX       LR               ;; return
        DATA
??SD_GetTransferState_0:
        DC32     0x40018034

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SD_StopTransfer:
        PUSH     {R7,LR}
        LDR.N    R0,??SD_StopTransfer_0  ;; TransferError
        MOVS     R1,#+0
        STR      R1,[R0, #+28]
        MOVS     R1,#+12
        BL       ??Subroutine50_0
??CrossCallReturnLabel_178:
        MOVS     R0,#+12
        B.W      ?Subroutine1
        DATA
??SD_StopTransfer_0:
        DC32     TransferError

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SD_Erase:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+12
        MOV      R5,R0
        MOV      R4,R1
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        STRB     R0,[SP, #+0]
        LDR.N    R6,??SD_Erase_0  ;; TransferError
        LDR      R0,[R6, #+52]
        LSRS     R0,R0,#+20
        TST      R0,#0x20
        BNE.N    ??SD_Erase_1
        MOVS     R0,#+37
??SD_Erase_2:
        POP      {R1-R7,PC}       ;; return
??SD_Erase_1:
        LDR.N    R0,??SD_Erase_0+0x4  ;; 0x11940
        LDR.N    R1,??SD_Erase_0+0x8  ;; 0x40018004
        LDR      R1,[R1, #+0]
        UXTB     R1,R1
        ADDS     R1,R1,#+2
        UDIV     R0,R0,R1
        STR      R0,[SP, #+4]
        BL       ?Subroutine32
??CrossCallReturnLabel_114:
        TST      R0,#0x2000000
        BEQ.N    ??SD_Erase_3
        MOVS     R0,#+14
        POP      {R1-R7,PC}
??SD_Erase_3:
        LDR      R0,[R6, #+80]
        MOV      R7,#+1024
        CMP      R0,#+2
        BNE.N    ??SD_Erase_4
        LSRS     R5,R5,#+9
        LSRS     R4,R4,#+9
        B.N      ??SD_Erase_5
??SD_Erase_4:
        CBZ      R0,??SD_Erase_5
        CMP      R0,#+1
        BNE.N    ??SD_Erase_6
??SD_Erase_5:
        STR      R5,[R6, #+28]
        MOVS     R0,#+32
        BL       ?Subroutine27
??CrossCallReturnLabel_93:
        BL       ??Subroutine49_0
??CrossCallReturnLabel_171:
        MOVS     R0,#+32
        BL       CmdResp1Error
        CMP      R0,#+42
        BNE.N    ??SD_Erase_2
        STR      R4,[R6, #+28]
        MOVS     R0,#+33
        BL       ?Subroutine27
??CrossCallReturnLabel_94:
        BL       ??Subroutine49_0
??CrossCallReturnLabel_170:
        MOVS     R0,#+33
        BL       CmdResp1Error
        CMP      R0,#+42
        BNE.N    ??SD_Erase_2
??SD_Erase_6:
        MOVS     R0,#+0
        STR      R0,[R6, #+28]
        MOVS     R0,#+38
        BL       ?Subroutine27
??CrossCallReturnLabel_95:
        BL       ??Subroutine49_0
??CrossCallReturnLabel_169:
        MOVS     R0,#+38
        BL       CmdResp1Error
        CMP      R0,#+42
        BNE.N    ??SD_Erase_2
        MOVS     R0,#+0
        B.N      ??SD_Erase_7
??SD_Erase_8:
        ADDS     R0,R0,#+1
??SD_Erase_7:
        LDR      R1,[SP, #+4]
        CMP      R0,R1
        BCC.N    ??SD_Erase_8
??SD_Erase_9:
        ADD      R0,SP,#+0
        BL       IsCardProgramming
        CMP      R0,#+42
        BNE.N    ??SD_Erase_2
        LDRB     R1,[SP, #+0]
        CMP      R1,#+7
        BEQ.N    ??SD_Erase_9
        CMP      R1,#+6
        BNE.N    ??SD_Erase_2
        B.N      ??SD_Erase_9
        DATA
??SD_Erase_0:
        DC32     TransferError
        DC32     0x11940
        DC32     0x40018004

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine32:
        MOVS     R0,#+0
        B.W      SDIO_GetResponse

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine27:
        STR      R0,[R6, #+32]
        MOVS     R0,#+64
        STR      R0,[R6, #+36]
        MOVS     R0,#+0
        STR      R0,[R6, #+40]
        STR      R7,[R6, #+44]
        BX       LR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SD_SendStatus:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BNE.N    ??SD_SendStatus_0
        MOVS     R0,#+38
        POP      {R4,PC}          ;; return
??SD_SendStatus_0:
        BL       ?Subroutine10
??CrossCallReturnLabel_180:
        BL       ?Subroutine35
??CrossCallReturnLabel_130:
        CMP      R0,#+42
        BNE.N    ??SD_SendStatus_1
        BL       ?Subroutine32
??CrossCallReturnLabel_113:
        STR      R0,[R4, #+0]
        MOVS     R0,#+42
??SD_SendStatus_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine35:
        MOVS     R0,#+13
        B.N      CmdResp1Error

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine10:
        LDR.N    R0,??DataTable21  ;; TransferError
        LDR      R1,[R0, #+84]
        LSLS     R1,R1,#+16
        STR      R1,[R0, #+28]
        MOVS     R1,#+13
        Nop      
        REQUIRE ??Subroutine50_0
        ;; // Fall through to label ??Subroutine50_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
??Subroutine50_0:
        STR      R1,[R0, #+32]
        MOVS     R1,#+64
        STR      R1,[R0, #+36]
        MOVS     R1,#+0
        STR      R1,[R0, #+40]
        MOV      R1,#+1024
        STR      R1,[R0, #+44]
        ADDS     R0,R0,#+28
        B.W      SDIO_SendCommand

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable21:
        DC32     TransferError

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SD_SendSDStatus:
        PUSH     {R3-R7,LR}
        MOV      R4,R0
        BL       ?Subroutine32
??CrossCallReturnLabel_112:
        TST      R0,#0x2000000
        BEQ.N    ??SD_SendSDStatus_0
        MOVS     R0,#+14
        POP      {R1,R4-R7,PC}    ;; return
??SD_SendSDStatus_0:
        LDR.N    R5,??SD_SendSDStatus_1  ;; TransferError
        MOVS     R0,#+64
        STR      R0,[R5, #+28]
        MOVS     R0,#+16
        BL       ?Subroutine36
??CrossCallReturnLabel_135:
        MOV      R6,#+1024
        BL       ??Subroutine53_0
??CrossCallReturnLabel_187:
        BL       ?Subroutine34
??CrossCallReturnLabel_124:
        MOV      R7,R0
        CMP      R0,#+42
        BEQ.N    ??SD_SendSDStatus_2
??SD_SendSDStatus_3:
        MOV      R0,R7
        POP      {R1,R4-R7,PC}
??SD_SendSDStatus_2:
        LDR      R0,[R5, #+84]
        LSLS     R0,R0,#+16
        BL       ?Subroutine16
??CrossCallReturnLabel_195:
        BL       ?Subroutine31
??CrossCallReturnLabel_105:
        MOV      R7,R0
        CMP      R0,#+42
        BNE.N    ??SD_SendSDStatus_3
        LDR.N    R0,??SD_SendSDStatus_1+0x4  ;; 0xfffff
        STR      R0,[R5, #+4]
        MOVS     R0,#+64
        STR      R0,[R5, #+8]
        MOVS     R0,#+96
        STR      R0,[R5, #+12]
        MOVS     R0,#+2
        STR      R0,[R5, #+16]
        MOVS     R0,#+0
        STR      R0,[R5, #+20]
        BL       ?Subroutine15
??CrossCallReturnLabel_41:
        MOVS     R0,#+0
        STR      R0,[R5, #+28]
        MOVS     R0,#+13
        BL       ??Subroutine51_0
??CrossCallReturnLabel_191:
        BL       ?Subroutine35
??CrossCallReturnLabel_129:
        MOV      R7,R0
        CMP      R0,#+42
        BNE.N    ??SD_SendSDStatus_3
        B.N      ??SD_SendSDStatus_4
??SD_SendSDStatus_5:
        BL       ?Subroutine24
??CrossCallReturnLabel_82:
        CBZ      R0,??SD_SendSDStatus_4
        MOVS     R5,#+0
??SD_SendSDStatus_6:
        BL       SDIO_ReadData
        STR      R0,[R4, R5, LSL #+2]
        ADDS     R5,R5,#+1
        CMP      R5,#+8
        BCC.N    ??SD_SendSDStatus_6
        ADDS     R4,R4,#+32
??SD_SendSDStatus_4:
        BL       ?Subroutine37
??CrossCallReturnLabel_137:
        BEQ.N    ??SD_SendSDStatus_5
        BL       ?Subroutine22
??CrossCallReturnLabel_71:
        CBZ      R0,??SD_SendSDStatus_7
        BL       ?Subroutine23
??CrossCallReturnLabel_77:
        MOVS     R0,#+4
        POP      {R1,R4-R7,PC}
??SD_SendSDStatus_7:
        BL       ?Subroutine3
??CrossCallReturnLabel_7:
        CBZ      R0,??SD_SendSDStatus_8
        BL       ?Subroutine4
??CrossCallReturnLabel_13:
        MOVS     R0,#+2
        POP      {R1,R4-R7,PC}
??SD_SendSDStatus_8:
        BL       ?Subroutine25
??CrossCallReturnLabel_86:
        CBZ      R0,??SD_SendSDStatus_9
        BL       ?Subroutine26
??CrossCallReturnLabel_90:
        MOVS     R0,#+6
        POP      {R1,R4-R7,PC}
??SD_SendSDStatus_9:
        BL       ?Subroutine19
??CrossCallReturnLabel_54:
        CBZ      R0,??SD_SendSDStatus_10
        BL       ?Subroutine20
??CrossCallReturnLabel_60:
        MOVS     R0,#+7
        POP      {R1,R4-R7,PC}
??SD_SendSDStatus_11:
        BL       SDIO_ReadData
        STR      R0,[R4], #+4
??SD_SendSDStatus_10:
        BL       ?Subroutine21
??CrossCallReturnLabel_67:
        CMP      R0,#+0
        BNE.N    ??SD_SendSDStatus_11
        BL       ?Subroutine18
??CrossCallReturnLabel_47:
        SUBS     R4,R4,#+64
        MOVS     R5,#+0
??SD_SendSDStatus_12:
        LDR      R0,[R4, R5, LSL #+2]
        AND      R1,R0,#0xFF00
        LSLS     R1,R1,#+8
        ORR      R0,R1,R0, LSL #+24
        LDR      R1,[R4, R5, LSL #+2]
        AND      R1,R1,#0xFF0000
        ORR      R0,R0,R1, LSR #+8
        LDR      R1,[R4, R5, LSL #+2]
        ORR      R0,R0,R1, LSR #+24
        STR      R0,[R4, R5, LSL #+2]
        ADDS     R5,R5,#+1
        CMP      R5,#+16
        BCS.N    ??SD_SendSDStatus_3
        B.N      ??SD_SendSDStatus_12
        DATA
??SD_SendSDStatus_1:
        DC32     TransferError
        DC32     0xfffff

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine37:
        LDR.N    R0,??Subroutine37_0  ;; 0x40018034
        LDR      R0,[R0, #+0]
        MOVW     R1,#+1578
        TST      R0,R1
        BX       LR
        DATA
??Subroutine37_0:
        DC32     0x40018034

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine36:
        STR      R0,[R5, #+32]
        MOVS     R0,#+64
        STR      R0,[R5, #+36]
        MOVS     R0,#+0
        STR      R0,[R5, #+40]
        BX       LR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine26:
        MOVS     R0,#+32
        B.W      SDIO_ClearFlag

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine25:
        MOVS     R0,#+32
        B.W      SDIO_GetFlagStatus

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine21:
        MOV      R0,#+2097152
        B.W      SDIO_GetFlagStatus

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine18:
        MOVW     R0,#+1535
        B.W      SDIO_ClearFlag

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine16:
        STR      R0,[R5, #+28]
        MOVS     R0,#+55
        REQUIRE ??Subroutine51_0
        ;; // Fall through to label ??Subroutine51_0

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
??Subroutine51_0:
        STR      R0,[R5, #+32]
        MOVS     R0,#+64
        REQUIRE ??Subroutine52_0
        ;; // Fall through to label ??Subroutine52_0

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
??Subroutine52_0:
        STR      R0,[R5, #+36]
        MOVS     R0,#+0
        STR      R0,[R5, #+40]
        Nop      
        REQUIRE ??Subroutine53_0
        ;; // Fall through to label ??Subroutine53_0

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
??Subroutine53_0:
        STR      R6,[R5, #+44]
        Nop      
        REQUIRE ??Subroutine54_0
        ;; // Fall through to label ??Subroutine54_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
??Subroutine54_0:
        ADD      R0,R5,#+28
        B.W      SDIO_SendCommand

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine15:
        MOVS     R0,#+1
        STR      R0,[R5, #+24]
        ADDS     R0,R5,#+4
        B.W      SDIO_DataConfig

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SD_ProcessIRQSrc:
        PUSH     {R4-R6,LR}
        LDR.N    R4,??SD_ProcessIRQSrc_0  ;; TransferError
        LDR      R0,[R4, #+88]
        CMP      R0,#+1
        BNE.N    ??SD_ProcessIRQSrc_1
        MOV      R0,#+32768
        BL       SDIO_GetITStatus
        CBZ      R0,??SD_ProcessIRQSrc_2
        MOVS     R5,#+0
??SD_ProcessIRQSrc_3:
        BL       SDIO_ReadData
        LDR      R1,[R4, #+104]
        STR      R0,[R1, R5, LSL #+2]
        ADDS     R5,R5,#+1
        CMP      R5,#+8
        BCC.N    ??SD_ProcessIRQSrc_3
        ADD      R0,R1,#+32
        STR      R0,[R4, #+104]
        B.N      ??SD_ProcessIRQSrc_4
??SD_ProcessIRQSrc_2:
        MOV      R0,#+16384
        BL       SDIO_GetITStatus
        CBZ      R0,??SD_ProcessIRQSrc_1
        LDR      R0,[R4, #+92]
        LDR      R1,[R4, #+112]
        SUBS     R1,R0,R1
        CMP      R1,#+32
        BCS.N    ??SD_ProcessIRQSrc_5
        LDR      R1,[R4, #+112]
        SUBS     R1,R0,R1
        TST      R1,#0x3
        LDR      R1,[R4, #+112]
        BNE.N    ??SD_ProcessIRQSrc_6
        SUBS     R0,R0,R1
        LSRS     R6,R0,#+2
        B.N      ??SD_ProcessIRQSrc_7
??SD_ProcessIRQSrc_6:
        SUBS     R0,R0,R1
        LSRS     R0,R0,#+2
        ADDS     R6,R0,#+1
??SD_ProcessIRQSrc_7:
        MOVS     R5,#+0
??SD_ProcessIRQSrc_8:
        CMP      R5,R6
        BCS.N    ??SD_ProcessIRQSrc_1
        LDR      R0,[R4, #+100]
        LDR      R0,[R0, #+0]
        BL       SDIO_WriteData
        ADDS     R5,R5,#+1
        LDR      R0,[R4, #+100]
        ADDS     R0,R0,#+4
        STR      R0,[R4, #+100]
        LDR      R0,[R4, #+112]
        ADDS     R0,R0,#+4
        STR      R0,[R4, #+112]
        B.N      ??SD_ProcessIRQSrc_8
??SD_ProcessIRQSrc_5:
        MOVS     R5,#+0
??SD_ProcessIRQSrc_9:
        LDR      R0,[R4, #+100]
        LDR      R0,[R0, R5, LSL #+2]
        BL       SDIO_WriteData
        ADDS     R5,R5,#+1
        CMP      R5,#+8
        BCC.N    ??SD_ProcessIRQSrc_9
        LDR      R0,[R4, #+100]
        ADDS     R0,R0,#+32
        STR      R0,[R4, #+100]
??SD_ProcessIRQSrc_4:
        LDR      R0,[R4, #+112]
        ADDS     R0,R0,#+32
        STR      R0,[R4, #+112]
??SD_ProcessIRQSrc_1:
        MOVW     R5,#+49978
        MOV      R0,#+256
        BL       SDIO_GetITStatus
        CBZ      R0,??SD_ProcessIRQSrc_10
        LDR      R0,[R4, #+88]
        CBNZ     R0,??SD_ProcessIRQSrc_11
        B.N      ??SD_ProcessIRQSrc_12
??SD_ProcessIRQSrc_13:
        BL       SDIO_ReadData
        LDR      R2,[R4, #+104]
        ADDS     R1,R2,#+4
        STR      R1,[R4, #+104]
        STR      R0,[R2, #+0]
        LDR      R0,[R4, #+112]
        ADDS     R0,R0,#+4
        STR      R0,[R4, #+112]
??SD_ProcessIRQSrc_11:
        BL       ?Subroutine21
??CrossCallReturnLabel_66:
        CBZ      R0,??SD_ProcessIRQSrc_12
        LDR      R0,[R4, #+112]
        LDR      R1,[R4, #+92]
        CMP      R0,R1
        BCC.N    ??SD_ProcessIRQSrc_13
??SD_ProcessIRQSrc_12:
        LDR      R0,[R4, #+96]
        CMP      R0,#+1
        BNE.N    ??SD_ProcessIRQSrc_14
        BL       SD_StopTransfer
        B.N      ??SD_ProcessIRQSrc_15
??SD_ProcessIRQSrc_14:
        MOVS     R0,#+42
??SD_ProcessIRQSrc_15:
        STRB     R0,[R4, #+0]
        MOV      R0,#+256
        BL       SDIO_ClearITPendingBit
        BL       ?Subroutine11
??CrossCallReturnLabel_31:
        MOVS     R0,#+1
        STR      R0,[R4, #+108]
        MOVS     R0,#+0
        STR      R0,[R4, #+112]
        LDRB     R0,[R4, #+0]
        POP      {R4-R6,PC}
??SD_ProcessIRQSrc_10:
        MOVS     R0,#+2
        BL       SDIO_GetITStatus
        CBZ      R0,??SD_ProcessIRQSrc_16
        MOVS     R0,#+2
        BL       SDIO_ClearITPendingBit
        BL       ?Subroutine11
??CrossCallReturnLabel_30:
        MOVS     R0,#+0
        STR      R0,[R4, #+112]
        MOVS     R0,#+2
        B.N      ??SD_ProcessIRQSrc_17
??SD_ProcessIRQSrc_16:
        MOVS     R0,#+8
        BL       SDIO_GetITStatus
        CBZ      R0,??SD_ProcessIRQSrc_18
        MOVS     R0,#+8
        BL       SDIO_ClearITPendingBit
        BL       ?Subroutine11
??CrossCallReturnLabel_29:
        MOVS     R0,#+0
        STR      R0,[R4, #+112]
        MOVS     R0,#+4
        B.N      ??SD_ProcessIRQSrc_17
??SD_ProcessIRQSrc_18:
        MOVS     R0,#+32
        BL       SDIO_GetITStatus
        CBZ      R0,??SD_ProcessIRQSrc_19
        MOVS     R0,#+32
        BL       SDIO_ClearITPendingBit
        BL       ?Subroutine11
??CrossCallReturnLabel_28:
        MOVS     R0,#+0
        STR      R0,[R4, #+112]
        MOVS     R0,#+6
??SD_ProcessIRQSrc_17:
        STRB     R0,[R4, #+0]
        POP      {R4-R6,PC}
??SD_ProcessIRQSrc_19:
        MOVS     R0,#+16
        BL       SDIO_GetITStatus
        CBZ      R0,??SD_ProcessIRQSrc_20
        MOVS     R0,#+16
        BL       SDIO_ClearITPendingBit
        BL       ?Subroutine11
??CrossCallReturnLabel_27:
        MOVS     R0,#+0
        STR      R0,[R4, #+112]
        MOVS     R0,#+5
        B.N      ??SD_ProcessIRQSrc_17
??SD_ProcessIRQSrc_20:
        MOV      R0,#+512
        BL       SDIO_GetITStatus
        CMP      R0,#+0
        BEQ.N    ??SD_ProcessIRQSrc_21
        MOV      R0,#+512
        BL       SDIO_ClearITPendingBit
        BL       ?Subroutine11
??CrossCallReturnLabel_26:
        MOVS     R0,#+0
        STR      R0,[R4, #+112]
        MOVS     R0,#+7
        B.N      ??SD_ProcessIRQSrc_17
??SD_ProcessIRQSrc_21:
        MOVS     R0,#+42
        POP      {R4-R6,PC}       ;; return
        DATA
??SD_ProcessIRQSrc_0:
        DC32     TransferError

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine11:
        MOVS     R1,#+0
        MOV      R0,R5
        B.W      SDIO_ITConfig

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
CmdResp1Error:
        PUSH     {R4,LR}
        MOV      R4,R0
        LDR.N    R0,??CmdResp1Error_0  ;; 0x40018034
        BL       ?Subroutine33
??CrossCallReturnLabel_121:
        BEQ.N    ??CmdResp1Error_1
        BL       ?Subroutine2
??CrossCallReturnLabel_2:
        MOVS     R0,#+3
        POP      {R4,PC}
??CmdResp1Error_1:
        TST      R1,#0x1
        BEQ.N    ??CmdResp1Error_2
        MOVS     R0,#+1
        BL       SDIO_ClearFlag
        MOVS     R0,#+1
        POP      {R4,PC}
??CmdResp1Error_2:
        BL       SDIO_GetCommandResponse
        CMP      R0,R4
        BEQ.N    ??CmdResp1Error_3
??CmdResp1Error_4:
        MOVS     R0,#+16
        POP      {R4,PC}
??CmdResp1Error_3:
        BL       ?Subroutine18
??CrossCallReturnLabel_46:
        BL       ?Subroutine32
??CrossCallReturnLabel_111:
        LDR.N    R1,??CmdResp1Error_0+0x4  ;; 0xfdffe008
        TST      R1,R0
        BEQ.N    ??CmdResp1Error_5
        TST      R0,#0x80000000
        BEQ.N    ??CmdResp1Error_6
        MOVS     R0,#+28
        POP      {R4,PC}
??CmdResp1Error_6:
        TST      R0,#0x40000000
        BEQ.N    ??CmdResp1Error_7
        MOVS     R0,#+9
        POP      {R4,PC}
??CmdResp1Error_7:
        TST      R0,#0x20000000
        BEQ.N    ??CmdResp1Error_8
        MOVS     R0,#+10
        POP      {R4,PC}
??CmdResp1Error_8:
        TST      R0,#0x10000000
        BEQ.N    ??CmdResp1Error_9
        MOVS     R0,#+11
        POP      {R4,PC}
??CmdResp1Error_9:
        TST      R0,#0x8000000
        BEQ.N    ??CmdResp1Error_10
        MOVS     R0,#+12
        POP      {R4,PC}
??CmdResp1Error_10:
        TST      R0,#0x4000000
        BEQ.N    ??CmdResp1Error_11
        MOVS     R0,#+13
        POP      {R4,PC}
??CmdResp1Error_11:
        TST      R0,#0x1000000
        BEQ.N    ??CmdResp1Error_12
        MOVS     R0,#+14
        POP      {R4,PC}
??CmdResp1Error_12:
        TST      R0,#0x800000
        BEQ.N    ??CmdResp1Error_13
        MOVS     R0,#+15
        POP      {R4,PC}
??CmdResp1Error_13:
        TST      R0,#0x400000
        BNE.N    ??CmdResp1Error_4
        TST      R0,#0x200000
        BEQ.N    ??CmdResp1Error_14
        MOVS     R0,#+17
        POP      {R4,PC}
??CmdResp1Error_14:
        TST      R0,#0x100000
        BEQ.N    ??CmdResp1Error_15
        MOVS     R0,#+18
        POP      {R4,PC}
??CmdResp1Error_15:
        TST      R0,#0x80000
        BEQ.N    ??CmdResp1Error_16
        MOVS     R0,#+19
        POP      {R4,PC}
??CmdResp1Error_16:
        TST      R0,#0x40000
        BEQ.N    ??CmdResp1Error_17
        MOVS     R0,#+20
        POP      {R4,PC}
??CmdResp1Error_17:
        TST      R0,#0x20000
        BEQ.N    ??CmdResp1Error_18
        MOVS     R0,#+21
        POP      {R4,PC}
??CmdResp1Error_18:
        TST      R0,#0x10000
        BEQ.N    ??CmdResp1Error_19
        MOVS     R0,#+22
        POP      {R4,PC}
??CmdResp1Error_19:
        TST      R0,#0x8000
        BEQ.N    ??CmdResp1Error_20
        MOVS     R0,#+23
        POP      {R4,PC}
??CmdResp1Error_20:
        TST      R0,#0x4000
        BEQ.N    ??CmdResp1Error_21
        MOVS     R0,#+24
        POP      {R4,PC}
??CmdResp1Error_21:
        TST      R0,#0x2000
        BEQ.N    ??CmdResp1Error_22
        MOVS     R0,#+25
        POP      {R4,PC}
??CmdResp1Error_22:
        TST      R0,#0x8
        BEQ.N    ??CmdResp1Error_5
        MOVS     R0,#+26
        POP      {R4,PC}
??CmdResp1Error_5:
        MOVS     R0,#+42
        POP      {R4,PC}          ;; return
        DATA
??CmdResp1Error_0:
        DC32     0x40018034
        DC32     0xfdffe008

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine33:
        LDR      R1,[R0, #+0]
        TST      R1,#0x45
        BEQ.N    ?Subroutine33
        TST      R1,#0x4
        BX       LR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine2:
        MOVS     R0,#+4
        B.W      SDIO_ClearFlag

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
CmdResp2Error:
        PUSH     {R7,LR}
        LDR.N    R0,??CmdResp2Error_0  ;; 0x40018034
        BL       ?Subroutine33
??CrossCallReturnLabel_122:
        BEQ.N    ??CmdResp2Error_1
        BL       ?Subroutine2
??CrossCallReturnLabel_1:
        MOVS     R0,#+3
        POP      {R1,PC}
??CmdResp2Error_1:
        TST      R1,#0x1
        BEQ.N    ??CmdResp2Error_2
        MOVS     R0,#+1
        BL       SDIO_ClearFlag
        MOVS     R0,#+1
        POP      {R1,PC}
??CmdResp2Error_2:
        BL       ?Subroutine18
??CrossCallReturnLabel_45:
        MOVS     R0,#+42
        POP      {R1,PC}          ;; return
        Nop      
        DATA
??CmdResp2Error_0:
        DC32     0x40018034

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SDEnWideBus:
        PUSH     {R2-R6,LR}
        MOV      R4,R0
        ADD      R0,SP,#+0
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        MOV      R0,R1
        BL       SDIO_GetResponse
        TST      R0,#0x2000000
        BEQ.N    ??SDEnWideBus_0
        MOVS     R0,#+14
        POP      {R1,R2,R4-R6,PC}
??SDEnWideBus_0:
        LDR.N    R5,??SDEnWideBus_1  ;; TransferError
        ADD      R1,SP,#+0
        LDR      R0,[R5, #+84]
        UXTH     R0,R0
        BL       FindSCR
        CMP      R0,#+42
        BNE.N    ??SDEnWideBus_2
        LDR      R0,[R5, #+84]
        LSLS     R0,R0,#+16
        LDR      R1,[SP, #+4]
        MOV      R6,#+1024
        CMP      R4,#+1
        BNE.N    ??SDEnWideBus_3
        TST      R1,#0x40000
        BEQ.N    ??SDEnWideBus_4
        BL       ?Subroutine16
??CrossCallReturnLabel_194:
        MOVS     R0,#+55
        BL       CmdResp1Error
        CMP      R0,#+42
        BNE.N    ??SDEnWideBus_2
        MOVS     R0,#+2
        B.N      ??SDEnWideBus_5
??SDEnWideBus_4:
        MOVS     R0,#+37
        POP      {R1,R2,R4-R6,PC}
??SDEnWideBus_3:
        TST      R1,#0x10000
        BEQ.N    ??SDEnWideBus_4
        BL       ?Subroutine16
??CrossCallReturnLabel_193:
        MOVS     R0,#+55
        BL       CmdResp1Error
        CMP      R0,#+42
        BNE.N    ??SDEnWideBus_2
        MOVS     R0,#+0
??SDEnWideBus_5:
        STR      R0,[R5, #+28]
        MOVS     R0,#+6
        BL       ??Subroutine51_0
??CrossCallReturnLabel_190:
        MOVS     R0,#+6
        BL       CmdResp1Error
??SDEnWideBus_2:
        POP      {R1,R2,R4-R6,PC}  ;; return
        DATA
??SDEnWideBus_1:
        DC32     TransferError

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
IsCardProgramming:
        PUSH     {R2-R4,LR}
        MOV      R4,R0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        STR      R0,[SP, #+4]
        BL       ?Subroutine10
??CrossCallReturnLabel_179:
        LDR.N    R0,??IsCardProgramming_0  ;; 0x40018034
??IsCardProgramming_1:
        LDR      R1,[R0, #+0]
        STR      R1,[SP, #+4]
        LDR      R1,[SP, #+4]
        TST      R1,#0x45
        BEQ.N    ??IsCardProgramming_1
        LDR      R0,[SP, #+4]
        TST      R0,#0x4
        BEQ.N    ??IsCardProgramming_2
        BL       ?Subroutine2
??CrossCallReturnLabel_0:
        MOVS     R0,#+3
        POP      {R1,R2,R4,PC}
??IsCardProgramming_2:
        LDR      R0,[SP, #+4]
        TST      R0,#0x1
        BEQ.N    ??IsCardProgramming_3
        MOVS     R0,#+1
        BL       SDIO_ClearFlag
        MOVS     R0,#+1
        POP      {R1,R2,R4,PC}
??IsCardProgramming_3:
        BL       SDIO_GetCommandResponse
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+4]
        CMP      R0,#+13
        BEQ.N    ??IsCardProgramming_4
??IsCardProgramming_5:
        MOVS     R0,#+16
        POP      {R1,R2,R4,PC}
??IsCardProgramming_4:
        BL       ?Subroutine18
??CrossCallReturnLabel_44:
        BL       ?Subroutine32
??CrossCallReturnLabel_110:
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        LSRS     R0,R0,#+9
        AND      R0,R0,#0xF
        STRB     R0,[R4, #+0]
        LDR      R0,[SP, #+0]
        LDR.N    R1,??IsCardProgramming_0+0x4  ;; 0xfdffe008
        TST      R1,R0
        BEQ.N    ??IsCardProgramming_6
        LDR      R0,[SP, #+0]
        TST      R0,#0x80000000
        BEQ.N    ??IsCardProgramming_7
        MOVS     R0,#+28
        POP      {R1,R2,R4,PC}
??IsCardProgramming_7:
        LDR      R0,[SP, #+0]
        TST      R0,#0x40000000
        BEQ.N    ??IsCardProgramming_8
        MOVS     R0,#+9
        POP      {R1,R2,R4,PC}
??IsCardProgramming_8:
        LDR      R0,[SP, #+0]
        TST      R0,#0x20000000
        BEQ.N    ??IsCardProgramming_9
        MOVS     R0,#+10
        POP      {R1,R2,R4,PC}
??IsCardProgramming_9:
        LDR      R0,[SP, #+0]
        TST      R0,#0x10000000
        BEQ.N    ??IsCardProgramming_10
        MOVS     R0,#+11
        POP      {R1,R2,R4,PC}
??IsCardProgramming_10:
        LDR      R0,[SP, #+0]
        TST      R0,#0x8000000
        BEQ.N    ??IsCardProgramming_11
        MOVS     R0,#+12
        POP      {R1,R2,R4,PC}
??IsCardProgramming_11:
        LDR      R0,[SP, #+0]
        TST      R0,#0x4000000
        BEQ.N    ??IsCardProgramming_12
        MOVS     R0,#+13
        POP      {R1,R2,R4,PC}
??IsCardProgramming_12:
        LDR      R0,[SP, #+0]
        TST      R0,#0x1000000
        BEQ.N    ??IsCardProgramming_13
        MOVS     R0,#+14
        POP      {R1,R2,R4,PC}
??IsCardProgramming_13:
        LDR      R0,[SP, #+0]
        TST      R0,#0x800000
        BEQ.N    ??IsCardProgramming_14
        MOVS     R0,#+15
        POP      {R1,R2,R4,PC}
??IsCardProgramming_14:
        LDR      R0,[SP, #+0]
        TST      R0,#0x400000
        BNE.N    ??IsCardProgramming_5
        LDR      R0,[SP, #+0]
        TST      R0,#0x200000
        BEQ.N    ??IsCardProgramming_15
        MOVS     R0,#+17
        POP      {R1,R2,R4,PC}
??IsCardProgramming_15:
        LDR      R0,[SP, #+0]
        TST      R0,#0x100000
        BEQ.N    ??IsCardProgramming_16
        MOVS     R0,#+18
        POP      {R1,R2,R4,PC}
??IsCardProgramming_16:
        LDR      R0,[SP, #+0]
        TST      R0,#0x80000
        BEQ.N    ??IsCardProgramming_17
        MOVS     R0,#+19
        POP      {R1,R2,R4,PC}
??IsCardProgramming_17:
        LDR      R0,[SP, #+0]
        TST      R0,#0x40000
        BEQ.N    ??IsCardProgramming_18
        MOVS     R0,#+20
        POP      {R1,R2,R4,PC}
??IsCardProgramming_18:
        LDR      R0,[SP, #+0]
        TST      R0,#0x20000
        BEQ.N    ??IsCardProgramming_19
        MOVS     R0,#+21
        POP      {R1,R2,R4,PC}
??IsCardProgramming_19:
        LDR      R0,[SP, #+0]
        TST      R0,#0x10000
        BEQ.N    ??IsCardProgramming_20
        MOVS     R0,#+22
        POP      {R1,R2,R4,PC}
??IsCardProgramming_20:
        LDR      R0,[SP, #+0]
        TST      R0,#0x8000
        BEQ.N    ??IsCardProgramming_21
        MOVS     R0,#+23
        POP      {R1,R2,R4,PC}
??IsCardProgramming_21:
        LDR      R0,[SP, #+0]
        TST      R0,#0x4000
        BEQ.N    ??IsCardProgramming_22
        MOVS     R0,#+24
        POP      {R1,R2,R4,PC}
??IsCardProgramming_22:
        LDR      R0,[SP, #+0]
        TST      R0,#0x2000
        BEQ.N    ??IsCardProgramming_23
        MOVS     R0,#+25
        POP      {R1,R2,R4,PC}
??IsCardProgramming_23:
        LDR      R0,[SP, #+0]
        TST      R0,#0x8
        BEQ.N    ??IsCardProgramming_6
        MOVS     R0,#+26
        POP      {R1,R2,R4,PC}
??IsCardProgramming_6:
        MOVS     R0,#+42
        POP      {R1,R2,R4,PC}    ;; return
        Nop      
        DATA
??IsCardProgramming_0:
        DC32     0x40018034
        DC32     0xfdffe008

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
FindSCR:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+12
        MOV      R4,R1
        MOVS     R5,#+0
        ADD      R0,SP,#+0
        MOVS     R1,#+0
        MOV      R2,R1
        STM      R0!,{R1,R2}
        LDR.N    R6,??FindSCR_0   ;; TransferError
        MOVS     R0,#+8
        STR      R0,[R6, #+28]
        BL       ?Subroutine39
??CrossCallReturnLabel_146:
        STR      R1,[R6, #+40]
        MOV      R7,#+1024
        STR      R7,[R6, #+44]
        BL       ??Subroutine49_0
??CrossCallReturnLabel_168:
        MOVS     R0,#+16
        BL       CmdResp1Error
        CMP      R0,#+42
        BNE.N    ??FindSCR_1
        LDR      R0,[R6, #+84]
        LSLS     R0,R0,#+16
        STR      R0,[R6, #+28]
        MOVS     R0,#+55
        BL       ?Subroutine40
??CrossCallReturnLabel_147:
        BL       ??Subroutine49_0
??CrossCallReturnLabel_167:
        MOVS     R0,#+55
        BL       CmdResp1Error
        CMP      R0,#+42
        BNE.N    ??FindSCR_1
        BL       ?Subroutine38
??CrossCallReturnLabel_143:
        MOVS     R0,#+8
        STR      R0,[R6, #+8]
        MOVS     R0,#+48
        STR      R0,[R6, #+12]
        MOVS     R0,#+2
        STR      R0,[R6, #+16]
        STR      R5,[R6, #+20]
        BL       ?Subroutine12
??CrossCallReturnLabel_32:
        STR      R5,[R6, #+28]
        MOVS     R0,#+51
        BL       ?Subroutine40
??CrossCallReturnLabel_148:
        BL       ??Subroutine49_0
??CrossCallReturnLabel_166:
        MOVS     R0,#+51
        BL       CmdResp1Error
        MOV      R7,R0
        CMP      R0,#+42
        ADD      R6,SP,#+0
        BEQ.N    ??FindSCR_2
        POP      {R1-R7,PC}       ;; return
??FindSCR_3:
        BL       ?Subroutine21
??CrossCallReturnLabel_65:
        CBZ      R0,??FindSCR_2
        BL       SDIO_ReadData
        STR      R0,[R6, R5, LSL #+2]
        ADDS     R5,R5,#+1
??FindSCR_2:
        BL       ?Subroutine37
??CrossCallReturnLabel_138:
        BEQ.N    ??FindSCR_3
        BL       ?Subroutine22
??CrossCallReturnLabel_70:
        CBZ      R0,??FindSCR_4
        BL       ?Subroutine23
??CrossCallReturnLabel_76:
        MOVS     R0,#+4
        POP      {R1-R7,PC}       ;; return
??FindSCR_4:
        BL       ?Subroutine3
??CrossCallReturnLabel_6:
        CBZ      R0,??FindSCR_5
        BL       ?Subroutine4
??CrossCallReturnLabel_12:
        MOVS     R0,#+2
        POP      {R1-R7,PC}       ;; return
??FindSCR_5:
        BL       ?Subroutine25
??CrossCallReturnLabel_85:
        CBZ      R0,??FindSCR_6
        BL       ?Subroutine26
??CrossCallReturnLabel_89:
        MOVS     R0,#+6
        POP      {R1-R7,PC}       ;; return
??FindSCR_6:
        BL       ?Subroutine19
??CrossCallReturnLabel_53:
        CBZ      R0,??FindSCR_7
        BL       ?Subroutine20
??CrossCallReturnLabel_59:
        MOVS     R0,#+7
        POP      {R1-R7,PC}       ;; return
??FindSCR_7:
        BL       ?Subroutine18
??CrossCallReturnLabel_43:
        LDR      R0,[SP, #+0]
        AND      R1,R0,#0xFF00
        LSLS     R1,R1,#+8
        ORR      R0,R1,R0, LSL #+24
        LDR      R1,[SP, #+0]
        AND      R1,R1,#0xFF0000
        ORR      R0,R0,R1, LSR #+8
        LDR      R1,[SP, #+0]
        ORR      R0,R0,R1, LSR #+24
        STR      R0,[R4, #+4]
        LDR      R0,[R6, #+4]
        AND      R1,R0,#0xFF00
        LSLS     R1,R1,#+8
        ORR      R1,R1,R0, LSL #+24
        AND      R2,R0,#0xFF0000
        ORR      R1,R1,R2, LSR #+8
        ORR      R0,R1,R0, LSR #+24
        STR      R0,[R4, #+0]
        MOV      R0,R7
??FindSCR_1:
        POP      {R1-R7,PC}       ;; return
        Nop      
        DATA
??FindSCR_0:
        DC32     TransferError

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine40:
        STR      R0,[R6, #+32]
        MOVS     R0,#+64
        STR      R0,[R6, #+36]
        STR      R5,[R6, #+40]
        STR      R7,[R6, #+44]
        BX       LR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
convert_from_bytes_to_power_of_two:
        MOV      R1,R0
        MOVS     R0,#+0
        B.N      ??convert_from_bytes_to_power_of_two_0
??convert_from_bytes_to_power_of_two_1:
        LSRS     R1,R1,#+1
        ADDS     R0,R0,#+1
        UXTB     R0,R0
??convert_from_bytes_to_power_of_two_0:
        CMP      R1,#+1
        BNE.N    ??convert_from_bytes_to_power_of_two_1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
DMA_TxConfiguration:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+48
        BL       ?Subroutine42
??CrossCallReturnLabel_154:
        BL       ?Subroutine43
??CrossCallReturnLabel_156:
        LDR.N    R0,??DataTable22  ;; 0x40018080
        STR      R0,[SP, #+0]
        STR      R6,[SP, #+4]
        MOVS     R0,#+16
        REQUIRE ?Subroutine0
        ;; // Fall through to label ?Subroutine0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine0:
        STR      R0,[SP, #+8]
        LSRS     R0,R5,#+2
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
        MOVS     R0,#+128
        STR      R0,[SP, #+20]
        MOV      R0,#+512
        STR      R0,[SP, #+24]
        MOV      R0,#+2048
        STR      R0,[SP, #+28]
        MOVS     R0,#+0
        STR      R0,[SP, #+32]
        MOV      R0,#+8192
        STR      R0,[SP, #+36]
        MOVS     R0,#+0
        STR      R0,[SP, #+40]
        ADD      R1,SP,#+0
        MOV      R0,R4
        BL       DMA_Init
        MOVS     R1,#+1
        MOV      R0,R4
        BL       DMA_Cmd
        ADD      SP,SP,#+48
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable22:
        DC32     0x40018080

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
DMA_RxConfiguration:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+48
        BL       ?Subroutine42
??CrossCallReturnLabel_153:
        BL       ?Subroutine43
??CrossCallReturnLabel_155:
        LDR.N    R0,??DMA_RxConfiguration_0  ;; 0x40018080
        STR      R0,[SP, #+0]
        STR      R6,[SP, #+4]
        MOVS     R0,#+0
        B.N      ?Subroutine0
        Nop      
        DATA
??DMA_RxConfiguration_0:
        DC32     0x40018080

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine43:
        LDR.N    R4,??Subroutine43_0  ;; 0x40020444
        MOVS     R1,#+0
        MOV      R0,R4
        B.W      DMA_Cmd
        Nop      
        DATA
??Subroutine43_0:
        DC32     0x40020444

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine42:
        MOV      R6,R0
        MOV      R5,R1
        LDR.N    R0,??Subroutine42_0  ;; 0x1000f000
        B.W      DMA_ClearFlag
        Nop      
        DATA
??Subroutine42_0:
        DC32     0x1000f000

        SECTION `.rodata`:CONST:NOROOT(2)
        DATA
        DC32 0, 0

        SECTION `.rodata`:CONST:NOROOT(2)
        DATA
        DC32 0, 0

        END
// 
//    24 bytes in section .bss
//   116 bytes in section .data
//    16 bytes in section .rodata
// 6 114 bytes in section .text
// 
// 6 114 bytes of CODE  memory
//    16 bytes of CONST memory
//   140 bytes of DATA  memory
//
//Errors: none
//Warnings: none
