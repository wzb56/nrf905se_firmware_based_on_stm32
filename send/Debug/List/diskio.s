///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.2.51295/W32 for ARM    11/Apr/2011  13:51:25 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\LiYang\Desktop\newest\Demo\fatfs\diskio.c      /
//    Command line =  C:\Users\LiYang\Desktop\newest\Demo\fatfs\diskio.c -lC  /
//                    C:\Users\LiYang\Desktop\newest\Demo\project\EWARMv5\Deb /
//                    ug\List\ -lb C:\Users\LiYang\Desktop\newest\Demo\projec /
//                    t\EWARMv5\Debug\List\ -o C:\Users\LiYang\Desktop\newest /
//                    \Demo\project\EWARMv5\Debug\Obj\ --debug                /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "E:\Program Files\IAR Systems\Embedded    /
//                    Workbench 5.4\arm\INC\DLib_Config_Full.h" -I            /
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
//                    ug\List\diskio.s                                        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME diskio

        EXTERN GPIO_ReadInputDataBit
        EXTERN SD_EnableWideBusOperation
        EXTERN SD_GetCardInfo
        EXTERN SD_Init
        EXTERN SD_ReadBlock
        EXTERN SD_ReadMultiBlocks
        EXTERN SD_SelectDeselect
        EXTERN SD_SetDeviceMode
        EXTERN SD_WriteBlock
        EXTERN SD_WriteMultiBlocks
        EXTERN gEquipStatus

        PUBLIC SD_Insert_Serve
        PUBLIC disk_initialize
        PUBLIC disk_ioctl
        PUBLIC disk_read
        PUBLIC disk_status
        PUBLIC disk_write
        PUBLIC get_fattime


        SECTION `.text`:CODE:NOROOT(2)
        THUMB
SD_Insert_Serve:
        PUSH     {R3-R5,LR}
        LDR.N    R4,??SD_Insert_Serve_0  ;; gEquipStatus
        LDR.N    R5,??SD_Insert_Serve_0+0x4  ;; 0x40011000
        BL       ?Subroutine0
??CrossCallReturnLabel_1:
        CMP      R0,#+1
        BNE.N    ??SD_Insert_Serve_1
        MOVS     R0,#+2
        STRB     R0,[R4, #+0]
        POP      {R0,R4,R5,PC}
??SD_Insert_Serve_1:
        BL       ?Subroutine0
??CrossCallReturnLabel_0:
        CMP      R0,#+0
        BNE.N    ??SD_Insert_Serve_2
        BL       disk_initialize
        STRB     R0,[R4, #+0]
        LDRB     R0,[R4, #+0]
??SD_Insert_Serve_2:
        POP      {R0,R4,R5,PC}    ;; return
        Nop      
        DATA
??SD_Insert_Serve_0:
        DC32     gEquipStatus
        DC32     0x40011000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine0:
        MOV      R1,#+8192
        MOV      R0,R5
        B.W      GPIO_ReadInputDataBit

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
disk_initialize:
        PUSH     {LR}
        SUB      SP,SP,#+84
        BL       SD_Init
        CMP      R0,#+42
        BNE.N    ??disk_initialize_0
        ADD      R0,SP,#+0
        BL       SD_GetCardInfo
        CMP      R0,#+42
        BNE.N    ??disk_initialize_0
        LDRH     R0,[SP, #+76]
        LSLS     R0,R0,#+16
        BL       SD_SelectDeselect
        CMP      R0,#+42
        BNE.N    ??disk_initialize_0
        MOV      R0,#+2048
        BL       SD_EnableWideBusOperation
        CMP      R0,#+42
        BNE.N    ??disk_initialize_0
        MOVS     R0,#+0
        BL       SD_SetDeviceMode
        CMP      R0,#+42
        BNE.N    ??disk_initialize_0
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
??disk_initialize_0:
        MOVS     R0,#+1
??disk_initialize_1:
        ADD      SP,SP,#+84
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
disk_status:
        MOVS     R1,R0
        BEQ.N    ??disk_status_0
        MOVS     R0,#+1
??disk_status_0:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
disk_read:
        PUSH     {R7,LR}
        CMP      R0,#+0
        BNE.N    ??disk_read_0
        CMP      R3,#+0
        BNE.N    ??disk_read_1
??disk_read_0:
        MOVS     R0,#+4
        POP      {R1,PC}
??disk_read_1:
        LSLS     R0,R2,#+9
        CMP      R3,#+1
        MOV      R2,#+512
        BNE.N    ??disk_read_2
        BL       SD_ReadBlock
        B.N      ??disk_read_3
??disk_read_2:
        BL       SD_ReadMultiBlocks
??disk_read_3:
        CMP      R0,#+42
        BNE.N    ??disk_read_4
        MOVS     R0,#+0
        POP      {R1,PC}
??disk_read_4:
        MOVS     R0,#+1
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
disk_write:
        PUSH     {R7,LR}
        CMP      R0,#+0
        BNE.N    ??disk_write_0
        CMP      R3,#+0
        BNE.N    ??disk_write_1
??disk_write_0:
        MOVS     R0,#+4
        POP      {R1,PC}
??disk_write_1:
        LSLS     R0,R2,#+9
        CMP      R3,#+1
        MOV      R2,#+512
        BNE.N    ??disk_write_2
        BL       SD_WriteBlock
        B.N      ??disk_write_3
??disk_write_2:
        BL       SD_WriteMultiBlocks
??disk_write_3:
        CMP      R0,#+42
        BNE.N    ??disk_write_4
        MOVS     R0,#+0
        POP      {R1,PC}
??disk_write_4:
        MOVS     R0,#+1
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
disk_ioctl:
        MOVS     R0,#+0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_fattime:
        MOVS     R0,#+0
        BX       LR               ;; return

        END
// 
// 234 bytes in section .text
// 
// 234 bytes of CODE memory
//
//Errors: none
//Warnings: none
