///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.0.51174/W32 for ARM    21/May/2011  19:21:02 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\253642xvvn\桌面\IAR\2.4G_send /
//                    \FWLib\library\src\stm32f10x_tim.c                      /
//    Command line =  "C:\Documents and Settings\253642xvvn\桌面\IAR\2.4G_sen /
//                    d\FWLib\library\src\stm32f10x_tim.c" -lC "C:\Documents  /
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
//                    \Demo\project\test\Debug\List\stm32f10x_tim.s           /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f10x_tim

        EXTERN RCC_APB1PeriphResetCmd
        EXTERN RCC_APB2PeriphResetCmd

        PUBLIC TIM_ARRPreloadConfig
        PUBLIC TIM_BDTRConfig
        PUBLIC TIM_BDTRStructInit
        PUBLIC TIM_CCPreloadControl
        PUBLIC TIM_CCxCmd
        PUBLIC TIM_CCxNCmd
        PUBLIC TIM_ClearFlag
        PUBLIC TIM_ClearITPendingBit
        PUBLIC TIM_ClearOC1Ref
        PUBLIC TIM_ClearOC2Ref
        PUBLIC TIM_ClearOC3Ref
        PUBLIC TIM_ClearOC4Ref
        PUBLIC TIM_Cmd
        PUBLIC TIM_CounterModeConfig
        PUBLIC TIM_CtrlPWMOutputs
        PUBLIC TIM_DMACmd
        PUBLIC TIM_DMAConfig
        PUBLIC TIM_DeInit
        PUBLIC TIM_ETRClockMode1Config
        PUBLIC TIM_ETRClockMode2Config
        PUBLIC TIM_ETRConfig
        PUBLIC TIM_EncoderInterfaceConfig
        PUBLIC TIM_ForcedOC1Config
        PUBLIC TIM_ForcedOC2Config
        PUBLIC TIM_ForcedOC3Config
        PUBLIC TIM_ForcedOC4Config
        PUBLIC TIM_GenerateEvent
        PUBLIC TIM_GetCapture1
        PUBLIC TIM_GetCapture2
        PUBLIC TIM_GetCapture3
        PUBLIC TIM_GetCapture4
        PUBLIC TIM_GetCounter
        PUBLIC TIM_GetFlagStatus
        PUBLIC TIM_GetITStatus
        PUBLIC TIM_GetPrescaler
        PUBLIC TIM_ICInit
        PUBLIC TIM_ICStructInit
        PUBLIC TIM_ITConfig
        PUBLIC TIM_ITRxExternalClockConfig
        PUBLIC TIM_InternalClockConfig
        PUBLIC TIM_OC1FastConfig
        PUBLIC TIM_OC1Init
        PUBLIC TIM_OC1NPolarityConfig
        PUBLIC TIM_OC1PolarityConfig
        PUBLIC TIM_OC1PreloadConfig
        PUBLIC TIM_OC2FastConfig
        PUBLIC TIM_OC2Init
        PUBLIC TIM_OC2NPolarityConfig
        PUBLIC TIM_OC2PolarityConfig
        PUBLIC TIM_OC2PreloadConfig
        PUBLIC TIM_OC3FastConfig
        PUBLIC TIM_OC3Init
        PUBLIC TIM_OC3NPolarityConfig
        PUBLIC TIM_OC3PolarityConfig
        PUBLIC TIM_OC3PreloadConfig
        PUBLIC TIM_OC4FastConfig
        PUBLIC TIM_OC4Init
        PUBLIC TIM_OC4PolarityConfig
        PUBLIC TIM_OC4PreloadConfig
        PUBLIC TIM_OCStructInit
        PUBLIC TIM_PWMIConfig
        PUBLIC TIM_PrescalerConfig
        PUBLIC TIM_SelectCCDMA
        PUBLIC TIM_SelectCOM
        PUBLIC TIM_SelectHallSensor
        PUBLIC TIM_SelectInputTrigger
        PUBLIC TIM_SelectMasterSlaveMode
        PUBLIC TIM_SelectOCxM
        PUBLIC TIM_SelectOnePulseMode
        PUBLIC TIM_SelectOutputTrigger
        PUBLIC TIM_SelectSlaveMode
        PUBLIC TIM_SetAutoreload
        PUBLIC TIM_SetClockDivision
        PUBLIC TIM_SetCompare1
        PUBLIC TIM_SetCompare2
        PUBLIC TIM_SetCompare3
        PUBLIC TIM_SetCompare4
        PUBLIC TIM_SetCounter
        PUBLIC TIM_SetIC1Prescaler
        PUBLIC TIM_SetIC2Prescaler
        PUBLIC TIM_SetIC3Prescaler
        PUBLIC TIM_SetIC4Prescaler
        PUBLIC TIM_TIxExternalClockConfig
        PUBLIC TIM_TimeBaseInit
        PUBLIC TIM_TimeBaseStructInit
        PUBLIC TIM_UpdateDisableConfig
        PUBLIC TIM_UpdateRequestConfig


        SECTION `.text`:CODE:NOROOT(2)
        THUMB
TIM_DeInit:
        PUSH     {R7,LR}
        CMP      R0,#+1073741824
        BEQ.N    ??TIM_DeInit_0
        LDR.N    R1,??TIM_DeInit_1  ;; 0x40000400
        CMP      R0,R1
        BEQ.N    ??TIM_DeInit_2
        LDR.N    R1,??TIM_DeInit_1+0x4  ;; 0x40000800
        CMP      R0,R1
        BEQ.N    ??TIM_DeInit_3
        LDR.N    R1,??TIM_DeInit_1+0x8  ;; 0x40000c00
        CMP      R0,R1
        BEQ.N    ??TIM_DeInit_4
        LDR.N    R1,??TIM_DeInit_1+0xC  ;; 0x40001000
        CMP      R0,R1
        BEQ.N    ??TIM_DeInit_5
        LDR.N    R1,??TIM_DeInit_1+0x10  ;; 0x40001400
        CMP      R0,R1
        BEQ.N    ??TIM_DeInit_6
        LDR.N    R1,??DataTable10  ;; 0x40012c00
        CMP      R0,R1
        BEQ.N    ??TIM_DeInit_7
        LDR.N    R1,??DataTable11  ;; 0x40013400
        CMP      R0,R1
        BEQ.N    ??TIM_DeInit_8
        B.N      ??TIM_DeInit_9
??TIM_DeInit_7:
        MOVS     R1,#+1
        MOV      R0,#+2048
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+2048
        BL       RCC_APB2PeriphResetCmd
        B.N      ??TIM_DeInit_10
??TIM_DeInit_0:
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       RCC_APB1PeriphResetCmd
        B.N      ??TIM_DeInit_10
??TIM_DeInit_2:
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       RCC_APB1PeriphResetCmd
        B.N      ??TIM_DeInit_10
??TIM_DeInit_3:
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+4
        BL       RCC_APB1PeriphResetCmd
        B.N      ??TIM_DeInit_10
??TIM_DeInit_4:
        MOVS     R1,#+1
        MOVS     R0,#+8
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+8
        BL       RCC_APB1PeriphResetCmd
        B.N      ??TIM_DeInit_10
??TIM_DeInit_5:
        MOVS     R1,#+1
        MOVS     R0,#+16
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       RCC_APB1PeriphResetCmd
        B.N      ??TIM_DeInit_10
??TIM_DeInit_6:
        MOVS     R1,#+1
        MOVS     R0,#+32
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+32
        BL       RCC_APB1PeriphResetCmd
        B.N      ??TIM_DeInit_10
??TIM_DeInit_8:
        MOVS     R1,#+1
        MOV      R0,#+8192
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+8192
        BL       RCC_APB2PeriphResetCmd
        B.N      ??TIM_DeInit_10
??TIM_DeInit_9:
??TIM_DeInit_10:
        POP      {R0,PC}          ;; return
        Nop      
        DATA
??TIM_DeInit_1:
        DC32     0x40000400
        DC32     0x40000800
        DC32     0x40000c00
        DC32     0x40001000
        DC32     0x40001400

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_TimeBaseInit:
        PUSH     {R3,R4}
        LDRH     R2,[R0, #+0]
        ANDS     R2,R2,#0x8F
        STRH     R2,[R0, #+0]
        LDRH     R2,[R0, #+0]
        LDRH     R3,[R1, #+6]
        LDRH     R4,[R1, #+2]
        ORRS     R3,R4,R3
        ORRS     R2,R3,R2
        STRH     R2,[R0, #+0]
        LDRH     R2,[R1, #+4]
        STRH     R2,[R0, #+44]
        LDRH     R2,[R1, #+0]
        STRH     R2,[R0, #+40]
        MOVS     R2,#+1
        STRH     R2,[R0, #+20]
        LDR.N    R2,??DataTable10  ;; 0x40012c00
        CMP      R0,R2
        BEQ.N    ??TIM_TimeBaseInit_0
        LDR.N    R2,??DataTable11  ;; 0x40013400
        CMP      R0,R2
        BNE.N    ??TIM_TimeBaseInit_1
??TIM_TimeBaseInit_0:
        LDRB     R1,[R1, #+8]
        STRH     R1,[R0, #+48]
??TIM_TimeBaseInit_1:
        POP      {R0,R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC1Init:
        PUSH     {R4,R5}
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R2,#+0
        LDRH     R5,[R0, #+32]
        BICS     R5,R5,#0x1
        STRH     R5,[R0, #+32]
        LDRH     R5,[R0, #+32]
        MOVS     R4,R5
        LDRH     R5,[R0, #+4]
        MOVS     R2,R5
        LDRH     R5,[R0, #+24]
        MOVS     R3,R5
        MOVW     R5,#+65423
        ANDS     R3,R5,R3
        LDRH     R5,[R1, #+0]
        ORRS     R3,R5,R3
        MOVW     R5,#+65533
        ANDS     R4,R5,R4
        LDRH     R5,[R1, #+8]
        ORRS     R4,R5,R4
        LDRH     R5,[R1, #+2]
        ORRS     R4,R5,R4
        LDRH     R5,[R1, #+6]
        STRH     R5,[R0, #+52]
        LDR.N    R5,??DataTable10  ;; 0x40012c00
        CMP      R0,R5
        BEQ.N    ??TIM_OC1Init_0
        LDR.N    R5,??DataTable11  ;; 0x40013400
        CMP      R0,R5
        BNE.N    ??TIM_OC1Init_1
??TIM_OC1Init_0:
        MOVW     R5,#+65527
        ANDS     R4,R5,R4
        LDRH     R5,[R1, #+10]
        ORRS     R4,R5,R4
        MOVW     R5,#+65531
        ANDS     R4,R5,R4
        LDRH     R5,[R1, #+4]
        ORRS     R4,R5,R4
        MOVW     R5,#+32511
        ANDS     R2,R5,R2
        MOVW     R5,#+32255
        ANDS     R2,R5,R2
        LDRH     R5,[R1, #+12]
        ORRS     R2,R5,R2
        LDRH     R1,[R1, #+14]
        ORRS     R2,R1,R2
??TIM_OC1Init_1:
        STRH     R2,[R0, #+4]
        STRH     R3,[R0, #+24]
        STRH     R4,[R0, #+32]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC2Init:
        PUSH     {R4,R5}
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R2,#+0
        LDRH     R5,[R0, #+32]
        BICS     R5,R5,#0x10
        STRH     R5,[R0, #+32]
        LDRH     R5,[R0, #+32]
        MOVS     R4,R5
        LDRH     R5,[R0, #+4]
        MOVS     R2,R5
        LDRH     R5,[R0, #+24]
        MOVS     R3,R5
        MOVW     R5,#+36863
        ANDS     R3,R5,R3
        LDRH     R5,[R1, #+0]
        ORRS     R3,R3,R5, LSL #+8
        MOVW     R5,#+65503
        ANDS     R4,R5,R4
        LDRH     R5,[R1, #+8]
        ORRS     R4,R4,R5, LSL #+4
        LDRH     R5,[R1, #+2]
        ORRS     R4,R4,R5, LSL #+4
        LDRH     R5,[R1, #+6]
        STRH     R5,[R0, #+56]
        LDR.N    R5,??DataTable10  ;; 0x40012c00
        CMP      R0,R5
        BEQ.N    ??TIM_OC2Init_0
        LDR.N    R5,??DataTable11  ;; 0x40013400
        CMP      R0,R5
        BNE.N    ??TIM_OC2Init_1
??TIM_OC2Init_0:
        MOVW     R5,#+65407
        ANDS     R4,R5,R4
        LDRH     R5,[R1, #+10]
        ORRS     R4,R4,R5, LSL #+4
        MOVW     R5,#+65471
        ANDS     R4,R5,R4
        LDRH     R5,[R1, #+4]
        ORRS     R4,R4,R5, LSL #+4
        MOVW     R5,#+31743
        ANDS     R2,R5,R2
        MOVW     R5,#+30719
        ANDS     R2,R5,R2
        LDRH     R5,[R1, #+12]
        ORRS     R2,R2,R5, LSL #+2
        LDRH     R1,[R1, #+14]
        ORRS     R2,R2,R1, LSL #+2
??TIM_OC2Init_1:
        STRH     R2,[R0, #+4]
        STRH     R3,[R0, #+24]
        STRH     R4,[R0, #+32]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC3Init:
        PUSH     {R4,R5}
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R2,#+0
        LDRH     R5,[R0, #+32]
        BICS     R5,R5,#0x100
        STRH     R5,[R0, #+32]
        LDRH     R5,[R0, #+32]
        MOVS     R4,R5
        LDRH     R5,[R0, #+4]
        MOVS     R2,R5
        LDRH     R5,[R0, #+28]
        MOVS     R3,R5
        MOVW     R5,#+65423
        ANDS     R3,R5,R3
        LDRH     R5,[R1, #+0]
        ORRS     R3,R5,R3
        MOVW     R5,#+65023
        ANDS     R4,R5,R4
        LDRH     R5,[R1, #+8]
        ORRS     R4,R4,R5, LSL #+8
        LDRH     R5,[R1, #+2]
        ORRS     R4,R4,R5, LSL #+8
        LDRH     R5,[R1, #+6]
        STRH     R5,[R0, #+60]
        LDR.N    R5,??DataTable10  ;; 0x40012c00
        CMP      R0,R5
        BEQ.N    ??TIM_OC3Init_0
        LDR.N    R5,??DataTable11  ;; 0x40013400
        CMP      R0,R5
        BNE.N    ??TIM_OC3Init_1
??TIM_OC3Init_0:
        MOVW     R5,#+63487
        ANDS     R4,R5,R4
        LDRH     R5,[R1, #+10]
        ORRS     R4,R4,R5, LSL #+8
        MOVW     R5,#+64511
        ANDS     R4,R5,R4
        LDRH     R5,[R1, #+4]
        ORRS     R4,R4,R5, LSL #+8
        MOVW     R5,#+28671
        ANDS     R2,R5,R2
        MOVW     R5,#+24575
        ANDS     R2,R5,R2
        LDRH     R5,[R1, #+12]
        ORRS     R2,R2,R5, LSL #+4
        LDRH     R1,[R1, #+14]
        ORRS     R2,R2,R1, LSL #+4
??TIM_OC3Init_1:
        STRH     R2,[R0, #+4]
        STRH     R3,[R0, #+28]
        STRH     R4,[R0, #+32]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC4Init:
        PUSH     {R4,R5}
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R2,#+0
        LDRH     R5,[R0, #+32]
        BICS     R5,R5,#0x1000
        STRH     R5,[R0, #+32]
        LDRH     R5,[R0, #+32]
        MOVS     R4,R5
        LDRH     R5,[R0, #+4]
        MOVS     R2,R5
        LDRH     R5,[R0, #+28]
        MOVS     R3,R5
        MOVW     R5,#+36863
        ANDS     R3,R5,R3
        LDRH     R5,[R1, #+0]
        ORRS     R3,R3,R5, LSL #+8
        MOVW     R5,#+57343
        ANDS     R4,R5,R4
        LDRH     R5,[R1, #+8]
        ORRS     R4,R4,R5, LSL #+12
        LDRH     R5,[R1, #+2]
        ORRS     R4,R4,R5, LSL #+12
        LDRH     R5,[R1, #+6]
        STRH     R5,[R0, #+64]
        LDR.N    R5,??DataTable10  ;; 0x40012c00
        CMP      R0,R5
        BEQ.N    ??TIM_OC4Init_0
        LDR.N    R5,??DataTable11  ;; 0x40013400
        CMP      R0,R5
        BNE.N    ??TIM_OC4Init_1
??TIM_OC4Init_0:
        LSLS     R2,R2,#+18
        LSRS     R2,R2,#+18
        LDRH     R1,[R1, #+12]
        ORRS     R2,R2,R1, LSL #+6
??TIM_OC4Init_1:
        STRH     R2,[R0, #+4]
        STRH     R3,[R0, #+28]
        STRH     R4,[R0, #+32]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable10:
        DC32     0x40012c00

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11:
        DC32     0x40013400

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ICInit:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        LDRH     R0,[R5, #+0]
        CMP      R0,#+0
        BNE.N    ??TIM_ICInit_0
        LDRH     R3,[R5, #+8]
        LDRH     R2,[R5, #+4]
        LDRH     R1,[R5, #+2]
        MOVS     R0,R4
        BL       TI1_Config
        LDRH     R1,[R5, #+6]
        MOVS     R0,R4
        BL       TIM_SetIC1Prescaler
        B.N      ??TIM_ICInit_1
??TIM_ICInit_0:
        LDRH     R0,[R5, #+0]
        CMP      R0,#+4
        BNE.N    ??TIM_ICInit_2
        LDRH     R3,[R5, #+8]
        LDRH     R2,[R5, #+4]
        LDRH     R1,[R5, #+2]
        MOVS     R0,R4
        BL       TI2_Config
        LDRH     R1,[R5, #+6]
        MOVS     R0,R4
        BL       TIM_SetIC2Prescaler
        B.N      ??TIM_ICInit_3
??TIM_ICInit_2:
        LDRH     R0,[R5, #+0]
        CMP      R0,#+8
        BNE.N    ??TIM_ICInit_4
        LDRH     R3,[R5, #+8]
        LDRH     R2,[R5, #+4]
        LDRH     R1,[R5, #+2]
        MOVS     R0,R4
        BL       TI3_Config
        LDRH     R1,[R5, #+6]
        MOVS     R0,R4
        BL       TIM_SetIC3Prescaler
        B.N      ??TIM_ICInit_5
??TIM_ICInit_4:
        LDRH     R3,[R5, #+8]
        LDRH     R2,[R5, #+4]
        LDRH     R1,[R5, #+2]
        MOVS     R0,R4
        BL       TI4_Config
        LDRH     R1,[R5, #+6]
        MOVS     R0,R4
        BL       TIM_SetIC4Prescaler
??TIM_ICInit_5:
??TIM_ICInit_3:
??TIM_ICInit_1:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_PWMIConfig:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        MOVS     R7,#+1
        LDRH     R0,[R5, #+2]
        CMP      R0,#+0
        BNE.N    ??TIM_PWMIConfig_0
        MOVS     R6,#+2
        B.N      ??TIM_PWMIConfig_1
??TIM_PWMIConfig_0:
        MOVS     R6,#+0
??TIM_PWMIConfig_1:
        LDRH     R0,[R5, #+4]
        CMP      R0,#+1
        BNE.N    ??TIM_PWMIConfig_2
        MOVS     R7,#+2
        B.N      ??TIM_PWMIConfig_3
??TIM_PWMIConfig_2:
        MOVS     R7,#+1
??TIM_PWMIConfig_3:
        LDRH     R0,[R5, #+0]
        CMP      R0,#+0
        BNE.N    ??TIM_PWMIConfig_4
        LDRH     R3,[R5, #+8]
        LDRH     R2,[R5, #+4]
        LDRH     R1,[R5, #+2]
        MOVS     R0,R4
        BL       TI1_Config
        LDRH     R1,[R5, #+6]
        MOVS     R0,R4
        BL       TIM_SetIC1Prescaler
        LDRH     R3,[R5, #+8]
        MOVS     R2,R7
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       TI2_Config
        LDRH     R1,[R5, #+6]
        MOVS     R0,R4
        BL       TIM_SetIC2Prescaler
        B.N      ??TIM_PWMIConfig_5
??TIM_PWMIConfig_4:
        LDRH     R3,[R5, #+8]
        LDRH     R2,[R5, #+4]
        LDRH     R1,[R5, #+2]
        MOVS     R0,R4
        BL       TI2_Config
        LDRH     R1,[R5, #+6]
        MOVS     R0,R4
        BL       TIM_SetIC2Prescaler
        LDRH     R3,[R5, #+8]
        MOVS     R2,R7
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       TI1_Config
        LDRH     R1,[R5, #+6]
        MOVS     R0,R4
        BL       TIM_SetIC1Prescaler
??TIM_PWMIConfig_5:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_BDTRConfig:
        LDRH     R2,[R1, #+0]
        LDRH     R3,[R1, #+2]
        ORRS     R2,R3,R2
        LDRH     R3,[R1, #+4]
        ORRS     R2,R3,R2
        LDRH     R3,[R1, #+6]
        ORRS     R2,R3,R2
        LDRH     R3,[R1, #+8]
        ORRS     R2,R3,R2
        LDRH     R3,[R1, #+10]
        ORRS     R2,R3,R2
        LDRH     R1,[R1, #+12]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+68]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_TimeBaseStructInit:
        MOVW     R1,#+65535
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
        MOVS     R1,#+0
        STRB     R1,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OCStructInit:
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
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ICStructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
        MOVS     R1,#+1
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
        MOVS     R1,#+0
        STRH     R1,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_BDTRStructInit:
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
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??TIM_Cmd_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x1
        STRH     R1,[R0, #+0]
        B.N      ??TIM_Cmd_1
??TIM_Cmd_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+1022
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??TIM_Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_CtrlPWMOutputs:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??TIM_CtrlPWMOutputs_0
        LDRH     R1,[R0, #+68]
        ORRS     R1,R1,#0x8000
        STRH     R1,[R0, #+68]
        B.N      ??TIM_CtrlPWMOutputs_1
??TIM_CtrlPWMOutputs_0:
        LDRH     R1,[R0, #+68]
        LSLS     R1,R1,#+17
        LSRS     R1,R1,#+17
        STRH     R1,[R0, #+68]
??TIM_CtrlPWMOutputs_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ITConfig:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??TIM_ITConfig_0
        LDRH     R2,[R0, #+12]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+12]
        B.N      ??TIM_ITConfig_1
??TIM_ITConfig_0:
        LDRH     R2,[R0, #+12]
        MVNS     R1,R1
        ANDS     R1,R1,R2
        STRH     R1,[R0, #+12]
??TIM_ITConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_GenerateEvent:
        STRH     R1,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_DMAConfig:
        ORRS     R1,R2,R1
        STRH     R1,[R0, #+72]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_DMACmd:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??TIM_DMACmd_0
        LDRH     R2,[R0, #+12]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+12]
        B.N      ??TIM_DMACmd_1
??TIM_DMACmd_0:
        LDRH     R2,[R0, #+12]
        MVNS     R1,R1
        ANDS     R1,R1,R2
        STRH     R1,[R0, #+12]
??TIM_DMACmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_InternalClockConfig:
        LDRH     R1,[R0, #+8]
        BICS     R1,R1,#0x7
        STRH     R1,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ITRxExternalClockConfig:
        PUSH     {R4,LR}
        MOVS     R4,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       TIM_SelectInputTrigger
        LDRH     R0,[R4, #+8]
        ORRS     R0,R0,#0x7
        STRH     R0,[R4, #+8]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_TIxExternalClockConfig:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R1,R2
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+96
        BNE.N    ??TIM_TIxExternalClockConfig_0
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,#+1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       TI2_Config
        B.N      ??TIM_TIxExternalClockConfig_1
??TIM_TIxExternalClockConfig_0:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,#+1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       TI1_Config
??TIM_TIxExternalClockConfig_1:
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       TIM_SelectInputTrigger
        LDRH     R0,[R4, #+8]
        ORRS     R0,R0,#0x7
        STRH     R0,[R4, #+8]
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ETRClockMode1Config:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       TIM_ETRConfig
        LDRH     R0,[R4, #+8]
        MOVS     R5,R0
        MOVW     R0,#+65528
        ANDS     R5,R0,R5
        ORRS     R5,R5,#0x7
        MOVW     R0,#+65423
        ANDS     R5,R0,R5
        ORRS     R5,R5,#0x70
        STRH     R5,[R4, #+8]
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ETRClockMode2Config:
        PUSH     {R4,LR}
        MOVS     R4,R0
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       TIM_ETRConfig
        LDRH     R0,[R4, #+8]
        ORRS     R0,R0,#0x4000
        STRH     R0,[R4, #+8]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ETRConfig:
        PUSH     {R4,R5}
        MOVS     R4,#+0
        LDRH     R5,[R0, #+8]
        MOVS     R4,R5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ORRS     R1,R2,R1
        ORRS     R1,R1,R3, LSL #+8
        ORRS     R4,R1,R4
        STRH     R4,[R0, #+8]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_PrescalerConfig:
        STRH     R1,[R0, #+40]
        STRH     R2,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_CounterModeConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+0]
        MOVS     R2,R3
        MOVW     R3,#+911
        ANDS     R2,R3,R2
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectInputTrigger:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+8]
        MOVS     R2,R3
        MOVW     R3,#+65423
        ANDS     R2,R3,R2
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_EncoderInterfaceConfig:
        PUSH     {R4-R7}
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R6,#+0
        LDRH     R7,[R0, #+8]
        MOVS     R4,R7
        LDRH     R7,[R0, #+24]
        MOVS     R5,R7
        LDRH     R7,[R0, #+32]
        MOVS     R6,R7
        MOVW     R7,#+65528
        ANDS     R4,R7,R4
        ORRS     R4,R1,R4
        MOVW     R1,#+64764
        ANDS     R5,R1,R5
        MOVW     R1,#+257
        ORRS     R5,R1,R5
        MOVW     R1,#+65501
        ANDS     R6,R1,R6
        ORRS     R1,R2,R3, LSL #+4
        ORRS     R6,R1,R6
        STRH     R4,[R0, #+8]
        STRH     R5,[R0, #+24]
        STRH     R6,[R0, #+32]
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ForcedOC1Config:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
        MOVW     R3,#+65423
        ANDS     R2,R3,R2
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ForcedOC2Config:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
        MOVW     R3,#+36863
        ANDS     R2,R3,R2
        ORRS     R2,R2,R1, LSL #+8
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ForcedOC3Config:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
        MOVW     R3,#+65423
        ANDS     R2,R3,R2
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ForcedOC4Config:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
        MOVW     R3,#+36863
        ANDS     R2,R3,R2
        ORRS     R2,R2,R1, LSL #+8
        STRH     R2,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ARRPreloadConfig:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??TIM_ARRPreloadConfig_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x80
        STRH     R1,[R0, #+0]
        B.N      ??TIM_ARRPreloadConfig_1
??TIM_ARRPreloadConfig_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+895
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??TIM_ARRPreloadConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectCOM:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??TIM_SelectCOM_0
        LDRH     R1,[R0, #+4]
        ORRS     R1,R1,#0x4
        STRH     R1,[R0, #+4]
        B.N      ??TIM_SelectCOM_1
??TIM_SelectCOM_0:
        LDRH     R1,[R0, #+4]
        BICS     R1,R1,#0x4
        STRH     R1,[R0, #+4]
??TIM_SelectCOM_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectCCDMA:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??TIM_SelectCCDMA_0
        LDRH     R1,[R0, #+4]
        ORRS     R1,R1,#0x8
        STRH     R1,[R0, #+4]
        B.N      ??TIM_SelectCCDMA_1
??TIM_SelectCCDMA_0:
        LDRH     R1,[R0, #+4]
        BICS     R1,R1,#0x8
        STRH     R1,[R0, #+4]
??TIM_SelectCCDMA_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_CCPreloadControl:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??TIM_CCPreloadControl_0
        LDRH     R1,[R0, #+4]
        ORRS     R1,R1,#0x1
        STRH     R1,[R0, #+4]
        B.N      ??TIM_CCPreloadControl_1
??TIM_CCPreloadControl_0:
        LDRH     R1,[R0, #+4]
        BICS     R1,R1,#0x1
        STRH     R1,[R0, #+4]
??TIM_CCPreloadControl_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC1PreloadConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
        MOVW     R3,#+65527
        ANDS     R2,R3,R2
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC2PreloadConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
        MOVW     R3,#+63487
        ANDS     R2,R3,R2
        ORRS     R2,R2,R1, LSL #+8
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC3PreloadConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
        MOVW     R3,#+65527
        ANDS     R2,R3,R2
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC4PreloadConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
        MOVW     R3,#+63487
        ANDS     R2,R3,R2
        ORRS     R2,R2,R1, LSL #+8
        STRH     R2,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC1FastConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
        MOVW     R3,#+65531
        ANDS     R2,R3,R2
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC2FastConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
        MOVW     R3,#+64511
        ANDS     R2,R3,R2
        ORRS     R2,R2,R1, LSL #+8
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC3FastConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
        MOVW     R3,#+65531
        ANDS     R2,R3,R2
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC4FastConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
        MOVW     R3,#+64511
        ANDS     R2,R3,R2
        ORRS     R2,R2,R1, LSL #+8
        STRH     R2,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ClearOC1Ref:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
        MOVW     R3,#+65407
        ANDS     R2,R3,R2
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ClearOC2Ref:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
        LSLS     R2,R2,#+17
        LSRS     R2,R2,#+17
        ORRS     R2,R2,R1, LSL #+8
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ClearOC3Ref:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
        MOVW     R3,#+65407
        ANDS     R2,R3,R2
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ClearOC4Ref:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
        LSLS     R2,R2,#+17
        LSRS     R2,R2,#+17
        ORRS     R2,R2,R1, LSL #+8
        STRH     R2,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC1PolarityConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
        MOVW     R3,#+65533
        ANDS     R2,R3,R2
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+32]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC1NPolarityConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
        MOVW     R3,#+65527
        ANDS     R2,R3,R2
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+32]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC2PolarityConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
        MOVW     R3,#+65503
        ANDS     R2,R3,R2
        ORRS     R2,R2,R1, LSL #+4
        STRH     R2,[R0, #+32]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC2NPolarityConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
        MOVW     R3,#+65407
        ANDS     R2,R3,R2
        ORRS     R2,R2,R1, LSL #+4
        STRH     R2,[R0, #+32]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC3PolarityConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
        MOVW     R3,#+65023
        ANDS     R2,R3,R2
        ORRS     R2,R2,R1, LSL #+8
        STRH     R2,[R0, #+32]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC3NPolarityConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
        MOVW     R3,#+63487
        ANDS     R2,R3,R2
        ORRS     R2,R2,R1, LSL #+8
        STRH     R2,[R0, #+32]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC4PolarityConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
        MOVW     R3,#+57343
        ANDS     R2,R3,R2
        ORRS     R2,R2,R1, LSL #+12
        STRH     R2,[R0, #+32]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_CCxCmd:
        PUSH     {R4,R5}
        LDRH     R3,[R0, #+32]
        MOVS     R4,#+1
        MOVS     R5,R1
        LSLS     R4,R4,R5
        MVNS     R4,R4
        ANDS     R3,R4,R3
        STRH     R3,[R0, #+32]
        LDRH     R3,[R0, #+32]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LSLS     R1,R2,R1
        ORRS     R1,R1,R3
        STRH     R1,[R0, #+32]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_CCxNCmd:
        PUSH     {R4,R5}
        LDRH     R3,[R0, #+32]
        MOVS     R4,#+4
        MOVS     R5,R1
        LSLS     R4,R4,R5
        MVNS     R4,R4
        ANDS     R3,R4,R3
        STRH     R3,[R0, #+32]
        LDRH     R3,[R0, #+32]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LSLS     R1,R2,R1
        ORRS     R1,R1,R3
        STRH     R1,[R0, #+32]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectOCxM:
        PUSH     {R4,R5}
        LDRH     R3,[R0, #+32]
        MOVS     R4,#+1
        MOVS     R5,R1
        LSLS     R4,R4,R5
        MVNS     R4,R4
        ANDS     R3,R4,R3
        STRH     R3,[R0, #+32]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??TIM_SelectOCxM_0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+8
        BNE.N    ??TIM_SelectOCxM_1
??TIM_SelectOCxM_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R3,R0,R1, ASR #+1
        LDR      R3,[R3, #+24]
        MOVW     R4,#+65423
        ANDS     R3,R4,R3
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R4,R0,R1, ASR #+1
        STR      R3,[R4, #+24]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R0,R1, ASR #+1
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        STR      R2,[R0, #+24]
        B.N      ??TIM_SelectOCxM_2
??TIM_SelectOCxM_1:
        SUBS     R3,R1,#+4
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        ADDS     R3,R0,R3, ASR #+1
        SUBS     R4,R1,#+4
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        ADDS     R4,R0,R4, ASR #+1
        LDR      R4,[R4, #+24]
        MOVW     R5,#+36863
        ANDS     R4,R5,R4
        STR      R4,[R3, #+24]
        SUBS     R1,R1,#+4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R0,R1, ASR #+1
        LSLS     R1,R2,#+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+24]
??TIM_SelectOCxM_2:
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_UpdateDisableConfig:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??TIM_UpdateDisableConfig_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x2
        STRH     R1,[R0, #+0]
        B.N      ??TIM_UpdateDisableConfig_1
??TIM_UpdateDisableConfig_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+1021
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??TIM_UpdateDisableConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_UpdateRequestConfig:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??TIM_UpdateRequestConfig_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x4
        STRH     R1,[R0, #+0]
        B.N      ??TIM_UpdateRequestConfig_1
??TIM_UpdateRequestConfig_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+1019
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??TIM_UpdateRequestConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectHallSensor:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??TIM_SelectHallSensor_0
        LDRH     R1,[R0, #+4]
        ORRS     R1,R1,#0x80
        STRH     R1,[R0, #+4]
        B.N      ??TIM_SelectHallSensor_1
??TIM_SelectHallSensor_0:
        LDRH     R1,[R0, #+4]
        BICS     R1,R1,#0x80
        STRH     R1,[R0, #+4]
??TIM_SelectHallSensor_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectOnePulseMode:
        LDRH     R2,[R0, #+0]
        MOVW     R3,#+1015
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+0]
        LDRH     R2,[R0, #+0]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectOutputTrigger:
        LDRH     R2,[R0, #+4]
        BICS     R2,R2,#0x70
        STRH     R2,[R0, #+4]
        LDRH     R2,[R0, #+4]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectSlaveMode:
        LDRH     R2,[R0, #+8]
        BICS     R2,R2,#0x7
        STRH     R2,[R0, #+8]
        LDRH     R2,[R0, #+8]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectMasterSlaveMode:
        LDRH     R2,[R0, #+8]
        BICS     R2,R2,#0x80
        STRH     R2,[R0, #+8]
        LDRH     R2,[R0, #+8]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetCounter:
        STRH     R1,[R0, #+36]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetAutoreload:
        STRH     R1,[R0, #+44]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetCompare1:
        STRH     R1,[R0, #+52]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetCompare2:
        STRH     R1,[R0, #+56]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetCompare3:
        STRH     R1,[R0, #+60]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetCompare4:
        STRH     R1,[R0, #+64]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetIC1Prescaler:
        LDRH     R2,[R0, #+24]
        BICS     R2,R2,#0xC
        STRH     R2,[R0, #+24]
        LDRH     R2,[R0, #+24]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetIC2Prescaler:
        LDRH     R2,[R0, #+24]
        BICS     R2,R2,#0xC00
        STRH     R2,[R0, #+24]
        LDRH     R2,[R0, #+24]
        ORRS     R1,R2,R1, LSL #+8
        STRH     R1,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetIC3Prescaler:
        LDRH     R2,[R0, #+28]
        BICS     R2,R2,#0xC
        STRH     R2,[R0, #+28]
        LDRH     R2,[R0, #+28]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetIC4Prescaler:
        LDRH     R2,[R0, #+28]
        BICS     R2,R2,#0xC00
        STRH     R2,[R0, #+28]
        LDRH     R2,[R0, #+28]
        ORRS     R1,R2,R1, LSL #+8
        STRH     R1,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetClockDivision:
        LDRH     R2,[R0, #+0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        STRH     R2,[R0, #+0]
        LDRH     R2,[R0, #+0]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_GetCapture1:
        LDRH     R0,[R0, #+52]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_GetCapture2:
        LDRH     R0,[R0, #+56]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_GetCapture3:
        LDRH     R0,[R0, #+60]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_GetCapture4:
        LDRH     R0,[R0, #+64]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_GetCounter:
        LDRH     R0,[R0, #+36]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_GetPrescaler:
        LDRH     R0,[R0, #+40]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_GetFlagStatus:
        MOVS     R2,R0
        MOVS     R0,#+0
        LDRH     R2,[R2, #+16]
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
TIM_ClearFlag:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R1,R1
        STRH     R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_GetITStatus:
        PUSH     {R4,R5}
        MOVS     R2,R0
        MOVS     R0,#+0
        MOVS     R3,#+0
        MOVS     R4,#+0
        LDRH     R5,[R2, #+16]
        ANDS     R5,R1,R5
        MOVS     R3,R5
        LDRH     R2,[R2, #+12]
        ANDS     R1,R1,R2
        MOVS     R4,R1
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        CMP      R3,#+0
        BEQ.N    ??TIM_GetITStatus_0
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        SUBS     R0,R0,#+1
        SBCS     R0,R0,R0
        MVNS     R0,R0
        LSRS     R0,R0,#+31
        B.N      ??TIM_GetITStatus_1
??TIM_GetITStatus_0:
        MOVS     R0,#+0
??TIM_GetITStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ClearITPendingBit:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R1,R1
        STRH     R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TI1_Config:
        PUSH     {R3-R6}
        MOVS     R4,#+0
        MOVS     R5,#+0
        LDRH     R6,[R0, #+32]
        BICS     R6,R6,#0x1
        STRH     R6,[R0, #+32]
        LDRH     R6,[R0, #+24]
        MOVS     R4,R6
        LDRH     R6,[R0, #+32]
        MOVS     R5,R6
        MOVW     R6,#+65292
        ANDS     R4,R6,R4
        ORRS     R2,R2,R3, LSL #+4
        ORRS     R4,R2,R4
        MOVW     R2,#+65533
        ANDS     R5,R2,R5
        ORRS     R1,R1,#0x1
        ORRS     R5,R1,R5
        STRH     R4,[R0, #+24]
        STRH     R5,[R0, #+32]
        POP      {R0,R4-R6}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TI2_Config:
        PUSH     {R4-R7}
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R6,#+0
        LDRH     R7,[R0, #+32]
        BICS     R7,R7,#0x10
        STRH     R7,[R0, #+32]
        LDRH     R7,[R0, #+24]
        MOVS     R4,R7
        LDRH     R7,[R0, #+32]
        MOVS     R5,R7
        LSLS     R1,R1,#+4
        MOVS     R6,R1
        MOVW     R1,#+3327
        ANDS     R4,R1,R4
        ORRS     R4,R4,R3, LSL #+12
        ORRS     R4,R4,R2, LSL #+8
        MOVW     R1,#+65503
        ANDS     R5,R1,R5
        ORRS     R1,R6,#0x10
        ORRS     R5,R1,R5
        STRH     R4,[R0, #+24]
        STRH     R5,[R0, #+32]
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TI3_Config:
        PUSH     {R4-R7}
        MOVS     R5,#+0
        MOVS     R6,#+0
        MOVS     R4,#+0
        LDRH     R7,[R0, #+32]
        BICS     R7,R7,#0x100
        STRH     R7,[R0, #+32]
        LDRH     R7,[R0, #+28]
        MOVS     R5,R7
        LDRH     R7,[R0, #+32]
        MOVS     R6,R7
        LSLS     R1,R1,#+8
        MOVS     R4,R1
        MOVW     R1,#+65292
        ANDS     R5,R1,R5
        ORRS     R1,R2,R3, LSL #+4
        ORRS     R5,R1,R5
        MOVW     R1,#+65023
        ANDS     R6,R1,R6
        ORRS     R1,R4,#0x100
        ORRS     R6,R1,R6
        STRH     R5,[R0, #+28]
        STRH     R6,[R0, #+32]
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TI4_Config:
        PUSH     {R4-R7}
        MOVS     R6,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
        LDRH     R7,[R0, #+32]
        BICS     R7,R7,#0x1000
        STRH     R7,[R0, #+32]
        LDRH     R7,[R0, #+28]
        MOVS     R6,R7
        LDRH     R7,[R0, #+32]
        MOVS     R4,R7
        LSLS     R1,R1,#+12
        MOVS     R5,R1
        MOVW     R1,#+3327
        ANDS     R6,R1,R6
        LSLS     R1,R3,#+12
        ORRS     R1,R1,R2, LSL #+8
        ORRS     R6,R1,R6
        MOVW     R1,#+57343
        ANDS     R4,R1,R4
        ORRS     R1,R5,#0x1000
        ORRS     R4,R1,R4
        STRH     R6,[R0, #+28]
        STRH     R4,[R0, #+32]
        POP      {R4-R7}
        BX       LR               ;; return

        END
// 
// 2 890 bytes in section .text
// 
// 2 890 bytes of CODE memory
//
//Errors: none
//Warnings: none
