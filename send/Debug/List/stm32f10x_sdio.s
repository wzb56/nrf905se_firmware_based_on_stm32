///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.0.51174/W32 for ARM    21/May/2011  19:21:01 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\253642xvvn\桌面\IAR\2.4G_send /
//                    \FWLib\library\src\stm32f10x_sdio.c                     /
//    Command line =  "C:\Documents and Settings\253642xvvn\桌面\IAR\2.4G_sen /
//                    d\FWLib\library\src\stm32f10x_sdio.c" -lC               /
//                    "C:\Documents and Settings\253642xvvn\桌面\IAR\2.4G_sen /
//                    d\Demo\project\test\Debug\List\" -lb "C:\Documents and  /
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
//                    \Demo\project\test\Debug\List\stm32f10x_sdio.s          /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f10x_sdio

        PUBLIC SDIO_CEATAITCmd
        PUBLIC SDIO_ClearFlag
        PUBLIC SDIO_ClearITPendingBit
        PUBLIC SDIO_ClockCmd
        PUBLIC SDIO_CmdStructInit
        PUBLIC SDIO_CommandCompletionCmd
        PUBLIC SDIO_DMACmd
        PUBLIC SDIO_DataConfig
        PUBLIC SDIO_DataStructInit
        PUBLIC SDIO_DeInit
        PUBLIC SDIO_GetCommandResponse
        PUBLIC SDIO_GetDataCounter
        PUBLIC SDIO_GetFIFOCount
        PUBLIC SDIO_GetFlagStatus
        PUBLIC SDIO_GetITStatus
        PUBLIC SDIO_GetPowerState
        PUBLIC SDIO_GetResponse
        PUBLIC SDIO_ITConfig
        PUBLIC SDIO_Init
        PUBLIC SDIO_ReadData
        PUBLIC SDIO_SendCEATACmd
        PUBLIC SDIO_SendCommand
        PUBLIC SDIO_SendSDIOSuspendCmd
        PUBLIC SDIO_SetPowerState
        PUBLIC SDIO_SetSDIOOperation
        PUBLIC SDIO_SetSDIOReadWaitMode
        PUBLIC SDIO_StartSDIOReadWait
        PUBLIC SDIO_StopSDIOReadWait
        PUBLIC SDIO_StructInit
        PUBLIC SDIO_WriteData


        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SDIO_DeInit:
        LDR.N    R0,??DataTable15  ;; 0x40018000
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        LDR.N    R0,??DataTable10  ;; 0x40018004
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        LDR.N    R0,??DataTable20  ;; 0x40018008
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        LDR.N    R0,??DataTable22  ;; 0x4001800c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        LDR.N    R0,??DataTable23  ;; 0x40018024
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        LDR.N    R0,??DataTable24  ;; 0x40018028
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        LDR.N    R0,??DataTable26  ;; 0x4001802c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        LDR.N    R0,??DataTable32  ;; 0x40018038
        LDR.N    R1,??SDIO_DeInit_0  ;; 0xc007ff
        STR      R1,[R0, #+0]
        LDR.N    R0,??DataTable19  ;; 0x4001803c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        BX       LR               ;; return
        DATA
??SDIO_DeInit_0:
        DC32     0xc007ff

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SDIO_Init:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable10  ;; 0x40018004
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        LDR.N    R2,??SDIO_Init_0  ;; 0xffff8100
        ANDS     R1,R2,R1
        LDRB     R2,[R0, #+0]
        LDR      R3,[R0, #+12]
        ORRS     R2,R3,R2
        LDR      R3,[R0, #+8]
        ORRS     R2,R3,R2
        LDR      R3,[R0, #+16]
        ORRS     R2,R3,R2
        LDR      R3,[R0, #+4]
        ORRS     R2,R3,R2
        LDR      R0,[R0, #+20]
        ORRS     R0,R0,R2
        ORRS     R1,R0,R1
        LDR.N    R0,??DataTable10  ;; 0x40018004
        STR      R1,[R0, #+0]
        BX       LR               ;; return
        Nop      
        DATA
??SDIO_Init_0:
        DC32     0xffff8100

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable10:
        DC32     0x40018004

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SDIO_StructInit:
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        MOVS     R1,#+0
        STR      R1,[R0, #+16]
        MOVS     R1,#+0
        STR      R1,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SDIO_ClockCmd:
        LDR.N    R1,??SDIO_ClockCmd_0  ;; 0x423000a0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??SDIO_ClockCmd_0:
        DC32     0x423000a0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SDIO_SetPowerState:
        LDR.N    R1,??DataTable15  ;; 0x40018000
        LDR      R1,[R1, #+0]
        MOVS     R2,#+3
        BICS     R1,R1,R2
        LDR.N    R2,??DataTable15  ;; 0x40018000
        STR      R1,[R2, #+0]
        LDR.N    R1,??DataTable15  ;; 0x40018000
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable15  ;; 0x40018000
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SDIO_GetPowerState:
        LDR.N    R0,??DataTable15  ;; 0x40018000
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0x3
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable15:
        DC32     0x40018000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SDIO_ITConfig:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??SDIO_ITConfig_0
        LDR.N    R1,??DataTable19  ;; 0x4001803c
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable19  ;; 0x4001803c
        STR      R0,[R1, #+0]
        B.N      ??SDIO_ITConfig_1
??SDIO_ITConfig_0:
        LDR.N    R1,??DataTable19  ;; 0x4001803c
        LDR      R1,[R1, #+0]
        MVNS     R0,R0
        ANDS     R0,R0,R1
        LDR.N    R1,??DataTable19  ;; 0x4001803c
        STR      R0,[R1, #+0]
??SDIO_ITConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable19:
        DC32     0x4001803c

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SDIO_DMACmd:
        LDR.N    R1,??SDIO_DMACmd_0  ;; 0x4230058c
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??SDIO_DMACmd_0:
        DC32     0x4230058c

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SDIO_SendCommand:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable20  ;; 0x40018008
        LDR      R3,[R0, #+0]
        STR      R3,[R2, #+0]
        LDR.N    R2,??DataTable22  ;; 0x4001800c
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        LSRS     R1,R1,#+11
        LSLS     R1,R1,#+11
        LDR      R2,[R0, #+4]
        LDR      R3,[R0, #+8]
        ORRS     R2,R3,R2
        LDR      R3,[R0, #+12]
        ORRS     R2,R3,R2
        LDR      R0,[R0, #+16]
        ORRS     R0,R0,R2
        ORRS     R1,R0,R1
        LDR.N    R0,??DataTable22  ;; 0x4001800c
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable20:
        DC32     0x40018008

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable22:
        DC32     0x4001800c

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SDIO_CmdStructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        MOVS     R1,#+0
        STR      R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SDIO_GetCommandResponse:
        LDR.N    R0,??SDIO_GetCommandResponse_0  ;; 0x40018010
        LDR      R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
        DATA
??SDIO_GetCommandResponse_0:
        DC32     0x40018010

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SDIO_GetResponse:
        LDR.N    R1,??SDIO_GetResponse_0  ;; 0x40018014
        LDR      R0,[R1, R0]
        BX       LR               ;; return
        Nop      
        DATA
??SDIO_GetResponse_0:
        DC32     0x40018014

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SDIO_DataConfig:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable23  ;; 0x40018024
        LDR      R3,[R0, #+0]
        STR      R3,[R2, #+0]
        LDR      R2,[R0, #+4]
        LDR.N    R3,??DataTable24  ;; 0x40018028
        STR      R2,[R3, #+0]
        LDR.N    R2,??DataTable26  ;; 0x4001802c
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        BICS     R1,R1,#0xF7
        LDR      R2,[R0, #+8]
        LDR      R3,[R0, #+12]
        ORRS     R2,R3,R2
        LDR      R3,[R0, #+16]
        ORRS     R2,R3,R2
        LDR      R0,[R0, #+20]
        ORRS     R0,R0,R2
        ORRS     R1,R0,R1
        LDR.N    R0,??DataTable26  ;; 0x4001802c
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable23:
        DC32     0x40018024

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable24:
        DC32     0x40018028

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable26:
        DC32     0x4001802c

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SDIO_DataStructInit:
        MOVS     R1,#-1
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        MOVS     R1,#+0
        STR      R1,[R0, #+16]
        MOVS     R1,#+0
        STR      R1,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SDIO_GetDataCounter:
        LDR.N    R0,??SDIO_GetDataCounter_0  ;; 0x40018030
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
        Nop      
        DATA
??SDIO_GetDataCounter_0:
        DC32     0x40018030

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SDIO_ReadData:
        LDR.N    R0,??DataTable28  ;; 0x40018080
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SDIO_WriteData:
        LDR.N    R1,??DataTable28  ;; 0x40018080
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable28:
        DC32     0x40018080

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SDIO_GetFIFOCount:
        LDR.N    R0,??SDIO_GetFIFOCount_0  ;; 0x40018048
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
        Nop      
        DATA
??SDIO_GetFIFOCount_0:
        DC32     0x40018048

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SDIO_StartSDIOReadWait:
        LDR.N    R1,??SDIO_StartSDIOReadWait_0  ;; 0x423005a0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??SDIO_StartSDIOReadWait_0:
        DC32     0x423005a0

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SDIO_StopSDIOReadWait:
        LDR.N    R1,??SDIO_StopSDIOReadWait_0  ;; 0x423005a4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??SDIO_StopSDIOReadWait_0:
        DC32     0x423005a4

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SDIO_SetSDIOReadWaitMode:
        LDR.N    R1,??SDIO_SetSDIOReadWaitMode_0  ;; 0x423005a8
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        Nop      
        DATA
??SDIO_SetSDIOReadWaitMode_0:
        DC32     0x423005a8

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SDIO_SetSDIOOperation:
        LDR.N    R1,??SDIO_SetSDIOOperation_0  ;; 0x423005ac
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??SDIO_SetSDIOOperation_0:
        DC32     0x423005ac

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SDIO_SendSDIOSuspendCmd:
        LDR.N    R1,??SDIO_SendSDIOSuspendCmd_0  ;; 0x423001ac
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??SDIO_SendSDIOSuspendCmd_0:
        DC32     0x423001ac

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SDIO_CommandCompletionCmd:
        LDR.N    R1,??SDIO_CommandCompletionCmd_0  ;; 0x423001b0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??SDIO_CommandCompletionCmd_0:
        DC32     0x423001b0

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SDIO_CEATAITCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MVNS     R0,R0
        ANDS     R0,R0,#0x1
        LDR.N    R1,??SDIO_CEATAITCmd_0  ;; 0x423001b4
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        Nop      
        DATA
??SDIO_CEATAITCmd_0:
        DC32     0x423001b4

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SDIO_SendCEATACmd:
        LDR.N    R1,??SDIO_SendCEATACmd_0  ;; 0x423001b8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??SDIO_SendCEATACmd_0:
        DC32     0x423001b8

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SDIO_GetFlagStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR.N    R2,??DataTable31  ;; 0x40018034
        LDR      R2,[R2, #+0]
        ANDS     R1,R1,R2
        SUBS     R1,R1,#+1
        SBCS     R1,R1,R1
        MVNS     R1,R1
        LSRS     R1,R1,#+31
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SDIO_ClearFlag:
        LDR.N    R1,??DataTable32  ;; 0x40018038
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SDIO_GetITStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR.N    R2,??DataTable31  ;; 0x40018034
        LDR      R2,[R2, #+0]
        ANDS     R1,R1,R2
        SUBS     R1,R1,#+1
        SBCS     R1,R1,R1
        MVNS     R1,R1
        LSRS     R1,R1,#+31
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable31:
        DC32     0x40018034

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SDIO_ClearITPendingBit:
        LDR.N    R1,??DataTable32  ;; 0x40018038
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable32:
        DC32     0x40018038

        END
// 
// 628 bytes in section .text
// 
// 628 bytes of CODE memory
//
//Errors: none
//Warnings: none
