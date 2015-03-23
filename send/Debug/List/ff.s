///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.2.51295/W32 for ARM    11/Apr/2011  13:51:29 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\LiYang\Desktop\newest\Demo\fatfs\ff.c          /
//    Command line =  C:\Users\LiYang\Desktop\newest\Demo\fatfs\ff.c -lC      /
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
//                    ug\List\ff.s                                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ff

        EXTERN disk_initialize
        EXTERN disk_ioctl
        EXTERN disk_read
        EXTERN disk_status
        EXTERN disk_write
        EXTERN ff_convert
        EXTERN ff_wtoupper
        EXTERN get_fattime

        PUBLIC chk_mounted
        PUBLIC clust2sect
        PUBLIC f_chmod
        PUBLIC f_close
        PUBLIC f_getfree
        PUBLIC f_gets
        PUBLIC f_lseek
        PUBLIC f_mkdir
        PUBLIC f_mount
        PUBLIC f_open
        PUBLIC f_opendir
        PUBLIC f_printf
        PUBLIC f_putc
        PUBLIC f_puts
        PUBLIC f_read
        PUBLIC f_readdir
        PUBLIC f_rename
        PUBLIC f_stat
        PUBLIC f_sync
        PUBLIC f_truncate
        PUBLIC f_unlink
        PUBLIC f_utime
        PUBLIC f_write
        PUBLIC gen_numname
        PUBLIC get_fat
        PUBLIC put_fat


        SECTION `.bss`:DATA:NOROOT(2)
Fsid:
        DS8 2
        DS8 2
        DS8 4

        SECTION `.bss`:DATA:NOROOT(2)
LfnBuf:
        DS8 512

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
mem_cpy:
        B.N      ??mem_cpy_0
??mem_cpy_1:
        LDRB     R3,[R1], #+1
        STRB     R3,[R0], #+1
??mem_cpy_0:
        MOV      R3,R2
        SUBS     R2,R3,#+1
        CMP      R3,#+0
        BNE.N    ??mem_cpy_1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
mem_set:
        B.N      ??mem_set_0
??mem_set_1:
        STRB     R1,[R0], #+1
??mem_set_0:
        MOV      R3,R2
        SUBS     R2,R3,#+1
        CMP      R3,#+0
        BNE.N    ??mem_set_1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
chk_chr:
        B.N      ??chk_chr_0
??chk_chr_1:
        ADDS     R0,R0,#+1
??chk_chr_0:
        LDRB     R2,[R0, #+0]
        CBZ      R2,??chk_chr_2
        CMP      R2,R1
        BNE.N    ??chk_chr_1
??chk_chr_2:
        MOV      R0,R2
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
move_window:
        PUSH     {R3-R7,LR}
        MOV      R5,R0
        MOV      R6,R1
        LDR      R4,[R5, #+44]
        CMP      R4,R6
        BEQ.N    ??move_window_0
        LDRB     R0,[R5, #+4]
        CBZ      R0,??move_window_1
        BL       ?Subroutine4
??CrossCallReturnLabel_14:
        CMP      R0,#+0
        BEQ.N    ??move_window_2
??move_window_3:
        MOVS     R0,#+1
        POP      {R1,R4-R7,PC}
??move_window_2:
        STRB     R0,[R5, #+4]
        LDR      R0,[R5, #+32]
        LDR      R1,[R5, #+24]
        ADDS     R0,R1,R0
        CMP      R4,R0
        BCS.N    ??move_window_1
        LDRB     R7,[R5, #+3]
        B.N      ??move_window_4
??move_window_5:
        LDR      R0,[R5, #+24]
        ADDS     R4,R0,R4
        BL       ?Subroutine4
??CrossCallReturnLabel_13:
        SUBS     R7,R7,#+1
        UXTB     R7,R7
??move_window_4:
        CMP      R7,#+2
        BCS.N    ??move_window_5
??move_window_1:
        CMP      R6,#+0
        BEQ.N    ??move_window_0
        MOVS     R3,#+1
        MOV      R2,R6
        ADD      R1,R5,#+48
        LDRB     R0,[R5, #+1]
        BL       disk_read
        CMP      R0,#+0
        BNE.N    ??move_window_3
        STR      R6,[R5, #+44]
??move_window_0:
        MOVS     R0,#+0
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine4:
        MOVS     R3,#+1
        MOV      R2,R4
        ADD      R1,R5,#+48
        LDRB     R0,[R5, #+1]
        B.W      disk_write

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sync:
        PUSH     {R3-R5,LR}
        MOV      R4,R0
        MOVS     R1,#+0
        BL       move_window
        MOVS     R5,R0
        BNE.N    ??sync_0
        LDRB     R0,[R4, #+0]
        CMP      R0,#+3
        BNE.N    ??sync_1
        LDRB     R0,[R4, #+5]
        CMP      R0,#+0
        BEQ.N    ??sync_1
        MOVS     R0,#+0
        STR      R0,[R4, #+44]
        MOV      R2,#+512
        MOVS     R1,#+0
        ADD      R0,R4,#+48
        BL       mem_set
        ADD      R0,R4,#+532
        MOVS     R1,#+85
        STRB     R1,[R0, #+26]
        MOVS     R1,#+170
        STRB     R1,[R0, #+27]
        MOVS     R1,#+82
        STRB     R1,[R4, #+48]
        ADD      R1,R4,#+48
        MOVS     R2,#+82
        STRB     R2,[R1, #+1]
        MOVS     R2,#+97
        STRB     R2,[R1, #+2]
        MOVS     R2,#+65
        STRB     R2,[R1, #+3]
        MOVS     R1,#+114
        STRB     R1,[R4, #+532]
        STRB     R1,[R0, #+1]
        STRB     R2,[R0, #+2]
        MOVS     R1,#+97
        STRB     R1,[R0, #+3]
        LDR      R1,[R4, #+16]
        STRB     R1,[R0, #+4]
        LDR      R1,[R4, #+16]
        LSLS     R1,R1,#+16
        LSRS     R1,R1,#+24
        STRB     R1,[R0, #+5]
        LDR      R1,[R4, #+16]
        LSRS     R1,R1,#+16
        STRB     R1,[R0, #+6]
        LDR      R1,[R4, #+16]
        LSRS     R1,R1,#+24
        STRB     R1,[R0, #+7]
        LDR      R1,[R4, #+12]
        STRB     R1,[R0, #+8]
        LDR      R1,[R4, #+12]
        LSLS     R1,R1,#+16
        LSRS     R1,R1,#+24
        STRB     R1,[R0, #+9]
        LDR      R1,[R4, #+12]
        LSRS     R1,R1,#+16
        STRB     R1,[R0, #+10]
        LDR      R1,[R4, #+12]
        LSRS     R1,R1,#+24
        STRB     R1,[R0, #+11]
        MOVS     R3,#+1
        LDR      R2,[R4, #+20]
        ADD      R1,R4,#+48
        LDRB     R0,[R4, #+1]
        BL       disk_write
        MOVS     R0,#+0
        STRB     R0,[R4, #+5]
??sync_1:
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDRB     R0,[R4, #+1]
        BL       disk_ioctl
        CBZ      R0,??sync_0
        MOVS     R5,#+1
??sync_0:
        MOV      R0,R5
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_fat:
        PUSH     {R4-R8,LR}
        MOV      R4,R0
        MOV      R5,R1
        CMP      R5,#+2
        BCC.N    ??get_fat_0
        LDR      R0,[R4, #+28]
        CMP      R5,R0
        BCC.N    ??get_fat_1
??get_fat_0:
        MOVS     R0,#+1
        B.N      ??get_fat_2
??get_fat_1:
        LDR      R6,[R4, #+32]
        LDRB     R0,[R4, #+0]
        CMP      R0,#+1
        BEQ.N    ??get_fat_3
        CMP      R0,#+2
        BEQ.N    ??get_fat_4
        CMP      R0,#+3
        BEQ.N    ??get_fat_5
        B.N      ??get_fat_6
??get_fat_3:
        ADD      R7,R5,R5, LSR #+1
        BL       ?Subroutine8
??CrossCallReturnLabel_42:
        CMP      R0,#+0
        BNE.N    ??get_fat_6
        LSLS     R0,R7,#+23
        LSRS     R0,R0,#+23
        ADDS     R0,R0,R4
        LDRB     R8,[R0, #+48]
        ADDS     R7,R7,#+1
        BL       ?Subroutine8
??CrossCallReturnLabel_41:
        CMP      R0,#+0
        BNE.N    ??get_fat_6
        LSLS     R0,R7,#+23
        LSRS     R0,R0,#+23
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+48]
        ORR      R1,R8,R0, LSL #+8
        TST      R5,#0x1
        BEQ.N    ??get_fat_7
        LSRS     R0,R1,#+4
??get_fat_2:
        POP      {R4-R8,PC}
??get_fat_7:
        LSLS     R0,R1,#+20
        LSRS     R0,R0,#+20
        B.N      ??get_fat_2
??get_fat_4:
        ADD      R1,R6,R5, LSR #+8
        BL       ??Subroutine21_0
??CrossCallReturnLabel_40:
        CMP      R0,#+0
        BNE.N    ??get_fat_6
        LSLS     R0,R5,#+1
        LSLS     R0,R0,#+23
        LSRS     R0,R0,#+23
        ADDS     R0,R0,R4
        ADD      R1,R0,#+48
        LDRB     R1,[R1, #+1]
        LDRB     R0,[R0, #+48]
        ORR      R0,R0,R1, LSL #+8
        B.N      ??get_fat_2
??get_fat_5:
        ADD      R1,R6,R5, LSR #+7
        BL       ??Subroutine21_0
??CrossCallReturnLabel_39:
        CMP      R0,#+0
        BNE.N    ??get_fat_6
        LSLS     R0,R5,#+2
        LSLS     R0,R0,#+23
        LSRS     R0,R0,#+23
        ADDS     R0,R0,R4
        ADD      R1,R0,#+48
        LDRB     R2,[R1, #+3]
        LDRB     R3,[R1, #+2]
        LSLS     R3,R3,#+16
        ORR      R2,R3,R2, LSL #+24
        LDRB     R1,[R1, #+1]
        ORR      R1,R2,R1, LSL #+8
        LDRB     R0,[R0, #+48]
        ORRS     R0,R0,R1
        LSLS     R0,R0,#+4
        LSRS     R0,R0,#+4
        B.N      ??get_fat_2
??get_fat_6:
        MOV      R0,#-1
        B.N      ??get_fat_2

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine8:
        ADD      R1,R6,R7, LSR #+9
        REQUIRE ??Subroutine21_0
        ;; // Fall through to label ??Subroutine21_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
??Subroutine21_0:
        MOV      R0,R4
        B.N      move_window

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
put_fat:
        PUSH     {R4-R8,LR}
        MOV      R5,R0
        MOV      R6,R1
        MOV      R4,R2
        CMP      R6,#+2
        BCC.N    ??put_fat_0
        LDR      R0,[R5, #+28]
        CMP      R6,R0
        BCC.N    ??put_fat_1
??put_fat_0:
        MOVS     R0,#+2
        B.N      ??put_fat_2
??put_fat_1:
        LDR      R8,[R5, #+32]
        LSLS     R0,R4,#+16
        LSRS     R7,R0,#+24
        LDRB     R0,[R5, #+0]
        CMP      R0,#+1
        BEQ.N    ??put_fat_3
        CMP      R0,#+2
        BEQ.N    ??put_fat_4
        CMP      R0,#+3
        BEQ.N    ??put_fat_5
        B.N      ??put_fat_6
??put_fat_3:
        ADD      R7,R6,R6, LSR #+1
        BL       ?Subroutine9
??CrossCallReturnLabel_46:
        CMP      R0,#+0
        BNE.N    ??put_fat_7
        LSLS     R0,R7,#+23
        LSRS     R0,R0,#+23
        ADDS     R0,R0,R5
        ADD      R1,R0,#+48
        TST      R6,#0x1
        ITTTE    NE 
        LDRBNE   R0,[R1, #+0]
        ANDNE    R0,R0,#0xF
        ORRNE    R0,R0,R4, LSL #+4
        MOVEQ    R0,R4
        STRB     R0,[R1, #+0]
        ADDS     R7,R7,#+1
        MOVS     R0,#+1
        STRB     R0,[R5, #+4]
        BL       ?Subroutine9
??CrossCallReturnLabel_45:
        CMP      R0,#+0
        BNE.N    ??put_fat_7
        LSLS     R1,R7,#+23
        LSRS     R1,R1,#+23
        ADDS     R1,R1,R5
        ADDS     R1,R1,#+48
        TST      R6,#0x1
        BEQ.N    ??put_fat_8
        LSRS     R2,R4,#+4
        B.N      ??put_fat_9
??put_fat_8:
        LDRB     R2,[R1, #+0]
        AND      R2,R2,#0xF0
        LSRS     R3,R4,#+8
        AND      R3,R3,#0xF
        ORRS     R2,R3,R2
??put_fat_9:
        STRB     R2,[R1, #+0]
        B.N      ??put_fat_7
??put_fat_4:
        ADD      R1,R8,R6, LSR #+8
        BL       ??Subroutine22_0
??CrossCallReturnLabel_44:
        CMP      R0,#+0
        BNE.N    ??put_fat_7
        LSLS     R1,R6,#+1
        LSLS     R1,R1,#+23
        LSRS     R1,R1,#+23
        ADDS     R1,R1,R5
        STRB     R4,[R1, #+48]
        ADDS     R1,R1,#+48
        STRB     R7,[R1, #+1]
        B.N      ??put_fat_7
??put_fat_5:
        ADD      R1,R8,R6, LSR #+7
        BL       ??Subroutine22_0
??CrossCallReturnLabel_43:
        CMP      R0,#+0
        BNE.N    ??put_fat_7
        LSLS     R1,R6,#+2
        LSLS     R1,R1,#+23
        LSRS     R1,R1,#+23
        ADDS     R1,R1,R5
        STRB     R4,[R1, #+48]
        ADDS     R1,R1,#+48
        STRB     R7,[R1, #+1]
        LSRS     R2,R4,#+16
        STRB     R2,[R1, #+2]
        LSRS     R2,R4,#+24
        STRB     R2,[R1, #+3]
        B.N      ??put_fat_7
??put_fat_6:
        MOVS     R0,#+2
??put_fat_7:
        MOVS     R1,#+1
        STRB     R1,[R5, #+4]
??put_fat_2:
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine9:
        ADD      R1,R8,R7, LSR #+9
        REQUIRE ??Subroutine22_0
        ;; // Fall through to label ??Subroutine22_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
??Subroutine22_0:
        MOV      R0,R5
        B.N      move_window

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
remove_chain:
        PUSH     {R3-R7,LR}
        MOV      R5,R0
        MOV      R4,R1
        CMP      R4,#+2
        BCC.N    ??remove_chain_0
        LDR      R0,[R5, #+28]
        CMP      R4,R0
        BCC.N    ??remove_chain_1
??remove_chain_0:
        MOVS     R7,#+2
        B.N      ??remove_chain_2
??remove_chain_1:
        MOVS     R7,#+0
??remove_chain_3:
        MOV      R1,R4
        MOV      R0,R5
        BL       get_fat
        MOVS     R6,R0
        BEQ.N    ??remove_chain_2
        CMP      R6,#+1
        BEQ.N    ??remove_chain_0
        MOV      R0,#-1
        CMP      R6,R0
        BNE.N    ??remove_chain_4
        MOVS     R7,#+1
        B.N      ??remove_chain_2
??remove_chain_4:
        MOVS     R2,#+0
        MOV      R1,R4
        MOV      R0,R5
        BL       put_fat
        MOVS     R7,R0
        BNE.N    ??remove_chain_2
        LDR      R0,[R5, #+16]
        MOV      R1,#-1
        CMP      R0,R1
        BEQ.N    ??remove_chain_5
        ADDS     R0,R0,#+1
        STR      R0,[R5, #+16]
        MOVS     R0,#+1
        STRB     R0,[R5, #+5]
??remove_chain_5:
        MOV      R4,R6
        LDR      R0,[R5, #+28]
        CMP      R4,R0
        BCC.N    ??remove_chain_3
??remove_chain_2:
        MOV      R0,R7
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
create_chain:
        PUSH     {R4-R8,LR}
        MOV      R4,R0
        MOVS     R6,R1
        LDR      R8,[R4, #+28]
        BNE.N    ??create_chain_0
        LDR      R7,[R4, #+12]
        CBZ      R7,??create_chain_1
        CMP      R7,R8
        BCC.N    ??create_chain_2
??create_chain_1:
        MOVS     R7,#+1
        B.N      ??create_chain_2
??create_chain_0:
        BL       get_fat
        CMP      R0,#+2
        BCS.N    ??create_chain_3
        MOVS     R0,#+1
        B.N      ??create_chain_4
??create_chain_3:
        CMP      R0,R8
        BCC.N    ??create_chain_4
        MOV      R7,R6
??create_chain_2:
        MOV      R5,R7
        B.N      ??create_chain_5
??create_chain_6:
        MOV      R1,#-1
        CMP      R0,R1
        BEQ.N    ??create_chain_4
        CMP      R0,#+1
        BEQ.N    ??create_chain_4
        CMP      R5,R7
        BEQ.N    ??create_chain_7
??create_chain_5:
        ADDS     R5,R5,#+1
        CMP      R5,R8
        BCC.N    ??create_chain_8
        MOVS     R5,#+2
        CMP      R7,#+2
        BCS.N    ??create_chain_8
??create_chain_7:
        MOVS     R0,#+0
??create_chain_4:
        POP      {R4-R8,PC}
??create_chain_8:
        MOV      R1,R5
        MOV      R0,R4
        BL       get_fat
        CMP      R0,#+0
        BNE.N    ??create_chain_6
        MVN      R2,#-268435456
        MOV      R1,R5
        MOV      R0,R4
        BL       put_fat
        CMP      R0,#+0
        BEQ.N    ??create_chain_9
??create_chain_10:
        MOV      R0,#-1
        B.N      ??create_chain_4
??create_chain_9:
        CBZ      R6,??create_chain_11
        MOV      R2,R5
        MOV      R1,R6
        MOV      R0,R4
        BL       put_fat
        CMP      R0,#+0
        BNE.N    ??create_chain_10
??create_chain_11:
        STR      R5,[R4, #+12]
        LDR      R0,[R4, #+16]
        MOV      R1,#-1
        CMP      R0,R1
        BEQ.N    ??create_chain_12
        SUBS     R0,R0,#+1
        STR      R0,[R4, #+16]
        MOVS     R0,#+1
        STRB     R0,[R4, #+5]
??create_chain_12:
        MOV      R0,R5
??create_chain_13:
        B.N      ??create_chain_4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
clust2sect:
        SUBS     R1,R1,#+2
        LDR      R2,[R0, #+28]
        SUBS     R2,R2,#+2
        CMP      R1,R2
        BCC.N    ??clust2sect_0
        MOVS     R0,#+0
        BX       LR
??clust2sect_0:
        LDRB     R2,[R0, #+2]
        LDR      R0,[R0, #+40]
        MLA      R0,R1,R2,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dir_seek:
        PUSH     {R4-R6,LR}
        MOV      R4,R0
        MOV      R5,R1
        STRH     R5,[R4, #+6]
        LDR      R0,[R4, #+8]
        CMP      R0,#+1
        BEQ.N    ??dir_seek_0
        LDR      R1,[R4, #+0]
        LDR      R2,[R1, #+28]
        CMP      R0,R2
        BCC.N    ??dir_seek_1
??dir_seek_0:
        MOVS     R0,#+2
        POP      {R4-R6,PC}
??dir_seek_1:
        CBNZ     R0,??dir_seek_2
        LDRB     R0,[R1, #+0]
        CMP      R0,#+3
        BNE.N    ??dir_seek_3
        LDR      R0,[R1, #+36]
??dir_seek_2:
        CBNZ     R0,??dir_seek_4
??dir_seek_3:
        MOVS     R0,#+0
        STR      R0,[R4, #+12]
        LDRH     R0,[R1, #+8]
        CMP      R5,R0
        BCS.N    ??dir_seek_0
        LDR      R0,[R1, #+36]
        B.N      ??dir_seek_5
??dir_seek_4:
        LDRB     R1,[R1, #+2]
        LSLS     R6,R1,#+4
        B.N      ??dir_seek_6
??dir_seek_7:
        CMP      R0,#+2
        BCC.N    ??dir_seek_0
        LDR      R1,[R4, #+0]
        LDR      R1,[R1, #+28]
        CMP      R0,R1
        BCS.N    ??dir_seek_0
        SUBS     R5,R5,R6
??dir_seek_6:
        LDR      R2,[R4, #+0]
        UXTH     R5,R5
        CMP      R5,R6
        BCC.N    ??dir_seek_8
        MOV      R1,R0
        MOV      R0,R2
        BL       get_fat
        MOV      R1,#-1
        CMP      R0,R1
        BNE.N    ??dir_seek_7
        MOVS     R0,#+1
        POP      {R4-R6,PC}
??dir_seek_8:
        STR      R0,[R4, #+12]
        MOV      R1,R0
        MOV      R0,R2
        BL       clust2sect
??dir_seek_5:
        ADD      R0,R0,R5, LSR #+4
        STR      R0,[R4, #+16]
        AND      R0,R5,#0xF
        LDR      R1,[R4, #+0]
        ADD      R0,R1,R0, LSL #+5
        ADDS     R0,R0,#+48
        STR      R0,[R4, #+20]
        MOVS     R0,#+0
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dir_next:
        PUSH     {R3-R7,LR}
        MOV      R4,R0
        MOV      R7,R1
        LDRH     R0,[R4, #+6]
        ADDS     R5,R0,#+1
        UXTH     R5,R5
        MOVS     R0,R5
        BEQ.N    ??dir_next_0
        LDR      R0,[R4, #+16]
        CMP      R0,#+0
        BNE.N    ??dir_next_1
??dir_next_0:
        MOVS     R0,#+4
        POP      {R1,R4-R7,PC}
??dir_next_1:
        TST      R5,#0xF
        BNE.N    ??dir_next_2
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+16]
        LDR      R1,[R4, #+12]
        LDR      R0,[R4, #+0]
        CBNZ     R1,??dir_next_3
        LDRH     R0,[R0, #+8]
        CMP      R5,R0
        BCC.N    ??dir_next_2
        B.N      ??dir_next_0
??dir_next_3:
        LDRB     R2,[R0, #+2]
        SUBS     R2,R2,#+1
        TST      R2,R5, LSR #+4
        BNE.N    ??dir_next_2
        BL       get_fat
        MOV      R6,R0
        CMP      R6,#+2
        BCS.N    ??dir_next_4
??dir_next_5:
        MOVS     R0,#+2
        POP      {R1,R4-R7,PC}
??dir_next_4:
        MOV      R0,#-1
        CMP      R6,R0
        BNE.N    ??dir_next_6
??dir_next_7:
        MOVS     R0,#+1
        POP      {R1,R4-R7,PC}
??dir_next_6:
        LDR      R0,[R4, #+0]
        LDR      R1,[R0, #+28]
        CMP      R6,R1
        BCC.N    ??dir_next_8
        CMP      R7,#+0
        BEQ.N    ??dir_next_0
        LDR      R1,[R4, #+12]
        BL       create_chain
        MOVS     R6,R0
        BNE.N    ??dir_next_9
        MOVS     R0,#+7
        POP      {R1,R4-R7,PC}
??dir_next_9:
        CMP      R6,#+1
        BEQ.N    ??dir_next_5
        MOV      R0,#-1
        CMP      R6,R0
        BEQ.N    ??dir_next_7
        MOVS     R1,#+0
        BL       ??Subroutine23_0
??CrossCallReturnLabel_50:
        CMP      R0,#+0
        BNE.N    ??dir_next_7
        MOV      R2,#+512
        MOVS     R1,#+0
        LDR      R0,[R4, #+0]
        ADDS     R0,R0,#+48
        BL       mem_set
        BL       ?Subroutine11
??CrossCallReturnLabel_59:
        LDR      R1,[R4, #+0]
        STR      R0,[R1, #+44]
        MOVS     R7,#+0
        B.N      ??dir_next_10
??dir_next_11:
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
        MOVS     R1,#+0
        BL       ??Subroutine23_0
??CrossCallReturnLabel_49:
        CMP      R0,#+0
        BNE.N    ??dir_next_7
        LDR      R0,[R4, #+0]
        LDR      R1,[R0, #+44]
        ADDS     R1,R1,#+1
        STR      R1,[R0, #+44]
        ADDS     R7,R7,#+1
        UXTB     R7,R7
??dir_next_10:
        LDR      R0,[R4, #+0]
        LDRB     R2,[R0, #+2]
        CMP      R7,R2
        BCC.N    ??dir_next_11
        LDR      R1,[R0, #+44]
        SUBS     R1,R1,R7
        STR      R1,[R0, #+44]
??dir_next_8:
        STR      R6,[R4, #+12]
        BL       ?Subroutine11
??CrossCallReturnLabel_58:
        STR      R0,[R4, #+16]
??dir_next_2:
        STRH     R5,[R4, #+6]
        AND      R0,R5,#0xF
        LDR      R1,[R4, #+0]
        ADD      R0,R1,R0, LSL #+5
        ADDS     R0,R0,#+48
        STR      R0,[R4, #+20]
        MOVS     R0,#+0
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
gen_numname:
        PUSH     {R2-R6,LR}
        MOV      R5,R0
        MOV      R6,R2
        MOV      R4,R3
        MOVS     R2,#+11
        BL       mem_cpy
        CMP      R4,#+6
        BCC.N    ??gen_numname_0
??gen_numname_1:
        UXTH     R4,R4
        LSLS     R0,R4,#+15
        ADD      R0,R0,R4, LSR #+1
        LDRH     R1,[R6, #+0]
        ADDS     R4,R1,R0
        LDRH     R0,[R6, #+2]!
        CMP      R0,#+0
        BNE.N    ??gen_numname_1
??gen_numname_0:
        MOVS     R1,#+7
        MOVS     R2,#+10
        ADD      R3,SP,#+0
??gen_numname_2:
        UXTH     R4,R4
        SDIV     R0,R4,R2
        MLS      R4,R0,R2,R4
        ADDS     R4,R4,#+48
        STRB     R4,[R1, R3]
        SUBS     R1,R1,#+1
        UXTH     R4,R0
        CMP      R4,#+0
        BNE.N    ??gen_numname_2
        MOVS     R0,#+126
        STRB     R0,[R1, R3]
        MOVS     R0,#+0
        B.N      ??gen_numname_3
??gen_numname_4:
        ADDS     R0,R0,#+1
??gen_numname_3:
        CMP      R0,R1
        BGE.N    ??gen_numname_5
        LDRB     R2,[R0, R5]
        CMP      R2,#+32
        BNE.N    ??gen_numname_4
??gen_numname_5:
        MOV      R2,R0
        ADDS     R0,R2,#+1
        CMP      R1,#+8
        ITTE     LT 
        LDRBLT   R4,[R1, R3]
        ADDLT    R1,R1,#+1
        MOVGE    R4,#+32
        STRB     R4,[R2, R5]
        CMP      R0,#+8
        BLT.N    ??gen_numname_5
        POP      {R0,R1,R4-R6,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sum_sfn:
        MOV      R1,R0
        MOVS     R0,#+0
        MOVS     R2,#+11
??sum_sfn_0:
        MOV      R3,R0
        LSLS     R0,R0,#+7
        ADD      R0,R0,R3, LSR #+1
        LDRB     R3,[R1], #+1
        ADDS     R0,R3,R0
        UXTB     R0,R0
        SUBS     R2,R2,#+1
        BNE.N    ??sum_sfn_0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dir_find:
        PUSH     {R3-R11,LR}
        MOV      R4,R0
        MOVS     R1,#+0
        BL       dir_seek
        MOVS     R9,R0
        BEQ.N    ??dir_find_0
??dir_find_1:
        MOV      R0,R9
        POP      {R1,R4-R11,PC}   ;; return
??dir_find_0:
        MOV      R11,#+255
        MOVS     R5,#+255
        B.N      ??dir_find_2
??dir_find_3:
        UXTB     R5,R5
        CBNZ     R5,??dir_find_4
        MOV      R0,R6
        BL       sum_sfn
        CMP      R11,R0
        BEQ.N    ??dir_find_1
??dir_find_4:
        MOVS     R5,#+255
        MOVW     R0,#+65535
        STRH     R0,[R4, #+32]
        LDR      R0,[R4, #+24]
        LDRB     R1,[R0, #+11]
        TST      R1,#0x1
        BNE.N    ??dir_find_5
        MOVS     R1,#+11
        MOVS     R2,#+0
??dir_find_6:
        MOV      R3,R1
        SUBS     R1,R3,#+1
        CBZ      R3,??dir_find_7
        LDRB     R2,[R6], #+1
        LDRB     R3,[R0], #+1
        SUBS     R2,R2,R3
        BEQ.N    ??dir_find_6
??dir_find_7:
        CMP      R2,#+0
        BEQ.N    ??dir_find_1
??dir_find_5:
        BL       ?Subroutine0
??CrossCallReturnLabel_4:
        MOVS     R9,R0
        BNE.N    ??dir_find_1
??dir_find_2:
        BL       ?Subroutine7
??CrossCallReturnLabel_55:
        MOVS     R9,R0
        BNE.N    ??dir_find_1
        LDR      R6,[R4, #+20]
        LDRB     R0,[R6, #+0]
        MOVS     R1,R0
        BNE.N    ??dir_find_8
        MOV      R9,#+4
        B.N      ??dir_find_1
??dir_find_8:
        LDRB     R1,[R6, #+11]
        AND      R1,R1,#0x3F
        CMP      R0,#+229
        BEQ.N    ??dir_find_9
        TST      R1,#0x8
        BEQ.N    ??dir_find_10
        CMP      R1,#+15
        BEQ.N    ??dir_find_11
??dir_find_9:
        MOVS     R5,#+255
        B.N      ??dir_find_5
??dir_find_10:
        CMP      R1,#+15
        BNE.N    ??dir_find_3
??dir_find_11:
        LDR      R9,[R4, #+28]
        CMP      R9,#+0
        BEQ.N    ??dir_find_5
        TST      R0,#0x40
        BEQ.N    ??dir_find_12
        LDRB     R11,[R6, #+13]
        AND      R0,R0,#0xBF
        MOV      R5,R0
        LDRH     R1,[R4, #+6]
        STRH     R1,[R4, #+32]
??dir_find_12:
        UXTB     R5,R5
        CMP      R0,R5
        BNE.N    ??dir_find_9
        LDRB     R1,[R6, #+13]
        CMP      R11,R1
        BNE.N    ??dir_find_9
        LDRB     R0,[R6, #+0]
        AND      R0,R0,#0xBF
        SUBS     R0,R0,#+1
        MOVS     R1,#+13
        MUL      R8,R0,R1
        MOVS     R7,#+0
        MOV      R10,#+1
??dir_find_13:
        LDR.N    R0,??DataTable2  ;; LfnOfs
        LDRB     R0,[R7, R0]
        ADDS     R1,R0,R6
        LDRB     R1,[R1, #+1]
        LDRB     R0,[R0, R6]
        ORR      R0,R0,R1, LSL #+8
        MOV      R1,R10
        CBZ      R1,??dir_find_14
        BL       ff_wtoupper
        MOV      R10,R0
        CMP      R8,#+255
        BGE.N    ??dir_find_9
        LDRH     R0,[R9, R8, LSL #+1]
        BL       ff_wtoupper
        ADD      R8,R8,#+1
        CMP      R10,R0
        BEQ.N    ??dir_find_15
        B.N      ??dir_find_9
??dir_find_14:
        MOVW     R1,#+65535
        CMP      R0,R1
        BNE.N    ??dir_find_9
??dir_find_15:
        ADDS     R7,R7,#+1
        CMP      R7,#+13
        BLT.N    ??dir_find_13
        LDRB     R0,[R6, #+0]
        TST      R0,#0x40
        BEQ.N    ??dir_find_16
        CMP      R10,#+0
        BEQ.N    ??dir_find_16
        LDRH     R0,[R9, R8, LSL #+1]
        CMP      R0,#+0
        BNE.N    ??dir_find_9
??dir_find_16:
        SUBS     R5,R5,#+1
        B.N      ??dir_find_5

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine7:
        LDR      R1,[R4, #+16]
        Nop      
        REQUIRE ??Subroutine23_0
        ;; // Fall through to label ??Subroutine23_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
??Subroutine23_0:
        LDR      R0,[R4, #+0]
        B.N      move_window

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dir_read:
        PUSH     {R3-R7,R9,R10,LR}
        MOV      R4,R0
        MOVS     R6,#+255
        MOVS     R7,#+255
        MOVS     R5,#+4
        LDR.W    R10,??DataTable2  ;; LfnOfs
        MOVW     R9,#+65535
??dir_read_0:
        LDR      R1,[R4, #+16]
        CBZ      R1,??dir_read_1
        BL       ??Subroutine23_0
??CrossCallReturnLabel_48:
        MOV      R5,R0
        CBNZ     R0,??dir_read_1
        LDR      R0,[R4, #+20]
        LDRB     R1,[R0, #+0]
        MOVS     R2,R1
        BNE.N    ??dir_read_2
        MOVS     R5,#+4
        B.N      ??dir_read_1
??dir_read_2:
        LDRB     R2,[R0, #+11]
        AND      R2,R2,#0x3F
        CMP      R1,#+229
        BEQ.N    ??dir_read_3
        CMP      R1,#+46
        BEQ.N    ??dir_read_3
        TST      R2,#0x8
        BEQ.N    ??dir_read_4
        CMP      R2,#+15
        BEQ.N    ??dir_read_5
??dir_read_3:
        MOVS     R6,#+255
??dir_read_6:
        BL       ?Subroutine0
??CrossCallReturnLabel_3:
        MOV      R5,R0
        CMP      R0,#+0
        BEQ.N    ??dir_read_0
??dir_read_1:
        CMP      R5,#+0
        BEQ.N    ??dir_read_7
        MOVS     R0,#+0
        STR      R0,[R4, #+16]
??dir_read_7:
        MOV      R0,R5
        POP      {R1,R4-R7,R9,R10,PC}  ;; return
??dir_read_4:
        CMP      R2,#+15
        BNE.N    ??dir_read_8
??dir_read_5:
        TST      R1,#0x40
        BEQ.N    ??dir_read_9
        LDRB     R7,[R0, #+13]
        AND      R1,R1,#0xBF
        MOV      R6,R1
        LDRH     R2,[R4, #+6]
        STRH     R2,[R4, #+32]
??dir_read_9:
        UXTB     R6,R6
        CMP      R1,R6
        BNE.N    ??dir_read_3
        LDRB     R2,[R0, #+13]
        CMP      R7,R2
        BNE.N    ??dir_read_3
        LDR      R1,[R4, #+28]
        LDRB     R2,[R0, #+0]
        AND      R2,R2,#0x3F
        SUBS     R2,R2,#+1
        MOVS     R3,#+13
        MULS     R2,R2,R3
        MOVS     R3,#+0
        MOV      R12,#+1
??dir_read_10:
        LDRB     LR,[R3, R10]
        ADD      R5,LR,R0
        LDRB     R5,[R5, #+1]
        LDRB     LR,[LR, R0]
        ORR      R5,LR,R5, LSL #+8
        CMP      R12,#+0
        BEQ.N    ??dir_read_11
        CMP      R2,#+255
        BGE.N    ??dir_read_3
        MOV      R12,R5
        STRH     R12,[R1, R2, LSL #+1]
        ADDS     R2,R2,#+1
        B.N      ??dir_read_12
??dir_read_11:
        CMP      R5,R9
        BNE.N    ??dir_read_3
??dir_read_12:
        ADDS     R3,R3,#+1
        CMP      R3,#+13
        BLT.N    ??dir_read_10
        LDRB     R0,[R0, #+0]
        TST      R0,#0x40
        BEQ.N    ??dir_read_13
        CMP      R2,#+255
        BGE.N    ??dir_read_3
        MOVS     R0,#+0
        STRH     R0,[R1, R2, LSL #+1]
??dir_read_13:
        SUBS     R6,R6,#+1
        B.N      ??dir_read_6
??dir_read_8:
        UXTB     R6,R6
        CBNZ     R6,??dir_read_14
        BL       sum_sfn
        CMP      R7,R0
        BEQ.N    ??dir_read_1
??dir_read_14:
        STRH     R9,[R4, #+32]
        B.N      ??dir_read_1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dir_register:
        PUSH     {R1-R11,LR}
        MOV      R4,R0
        LDR      R5,[R4, #+24]
        LDR      R6,[R4, #+28]
        MOVS     R2,#+12
        MOV      R1,R5
        ADD      R0,SP,#+0
        BL       mem_cpy
        ADD      R9,SP,#+0
        LDRB     R0,[R9, #+11]
        TST      R0,#0x1
        BEQ.N    ??dir_register_0
        MOVS     R0,#+0
        STRB     R0,[R5, #+11]
        STR      R0,[R4, #+28]
        MOVS     R7,#+1
??dir_register_1:
        UXTH     R3,R7
        MOV      R2,R6
        ADD      R1,SP,#+0
        MOV      R0,R5
        BL       gen_numname
        MOV      R0,R4
        BL       dir_find
        MOV      R8,R0
        CBNZ     R0,??dir_register_2
        ADDS     R7,R7,#+1
        UXTH     R0,R7
        CMP      R0,#+100
        BCC.N    ??dir_register_1
??dir_register_2:
        UXTH     R7,R7
        CMP      R7,#+100
        BNE.N    ??dir_register_3
        MOVS     R0,#+7
        B.N      ??dir_register_4
??dir_register_3:
        MOV      R0,R8
        CMP      R0,#+4
        BEQ.N    ??dir_register_5
??dir_register_6:
        MOV      R0,R8
??dir_register_4:
        POP      {R1-R11,PC}
??dir_register_5:
        LDRB     R0,[R9, #+11]
        STRB     R0,[R5, #+11]
        STR      R6,[R4, #+28]
??dir_register_0:
        MOV      R10,#+13
        LDRB     R0,[R9, #+11]
        TST      R0,#0x2
        BEQ.N    ??dir_register_7
        MOVS     R0,#+0
        B.N      ??dir_register_8
??dir_register_9:
        ADDS     R0,R0,#+1
        UXTH     R0,R0
??dir_register_8:
        MOV      R1,R0
        LDRH     R2,[R6, R1, LSL #+1]
        CMP      R2,#+0
        BNE.N    ??dir_register_9
        ADD      R0,R1,#+25
        SDIV     R5,R0,R10
        UXTH     R5,R5
        B.N      ??dir_register_10
??dir_register_7:
        MOVS     R5,#+1
??dir_register_10:
        BL       ?Subroutine3
??CrossCallReturnLabel_12:
        MOV      R8,R0
        CMP      R0,#+0
        BNE.N    ??dir_register_6
        MOVS     R6,#+0
        MOVS     R7,#+0
??dir_register_11:
        BL       ?Subroutine7
??CrossCallReturnLabel_54:
        MOV      R8,R0
        CBNZ     R0,??dir_register_12
        LDR      R0,[R4, #+20]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+229
        BEQ.N    ??dir_register_13
        CBNZ     R0,??dir_register_14
??dir_register_13:
        MOVS     R0,R7
        BNE.N    ??dir_register_15
        LDRH     R6,[R4, #+6]
??dir_register_15:
        ADDS     R7,R7,#+1
        UXTH     R7,R7
        CMP      R7,R5
        BNE.N    ??dir_register_16
        B.N      ??dir_register_12
??dir_register_14:
        MOVS     R7,#+0
??dir_register_16:
        MOVS     R1,#+1
        MOV      R0,R4
        BL       dir_next
        MOV      R8,R0
        CMP      R0,#+0
        BEQ.N    ??dir_register_11
??dir_register_12:
        MOV      R0,R8
        CMP      R0,#+0
        BNE.N    ??dir_register_17
        CMP      R5,#+2
        BCC.N    ??dir_register_17
        MOV      R1,R6
        MOV      R0,R4
        BL       dir_seek
        MOV      R8,R0
        CMP      R0,#+0
        BNE.N    ??dir_register_17
        LDR      R0,[R4, #+24]
        BL       sum_sfn
        MOV      R6,R0
        MOVW     R7,#+65535
        ADDS     R5,R7,R5
        UXTH     R5,R5
        LDR.W    R9,??DataTable2  ;; LfnOfs
??dir_register_18:
        BL       ?Subroutine7
??CrossCallReturnLabel_53:
        MOV      R8,R0
        CMP      R0,#+0
        BNE.N    ??dir_register_17
        LDR      R1,[R4, #+20]
        LDR      R2,[R4, #+28]
        STRB     R6,[R1, #+13]
        MOVS     R3,#+15
        STRB     R3,[R1, #+11]
        MOVS     R3,#+0
        STRB     R3,[R1, #+12]
        STRB     R3,[R1, #+26]
        STRB     R3,[R1, #+27]
        UXTB     R0,R5
        SUBS     R3,R0,#+1
        MUL      R3,R3,R10
        MOV      R12,#+0
        B.N      ??dir_register_19
??dir_register_20:
        CMP      LR,R7
        BEQ.N    ??dir_register_21
??dir_register_19:
        LDRH     LR,[R2, R3, LSL #+1]
        ADDS     R3,R3,#+1
??dir_register_21:
        LDRB     R8,[R12, R9]
        STRB     LR,[R8, R1]
        ADD      R8,R8,R1
        LSR      R11,LR,#+8
        STRB     R11,[R8, #+1]
        CMP      LR,#+0
        BNE.N    ??dir_register_22
        MOV      LR,R7
??dir_register_22:
        ADD      R12,R12,#+1
        CMP      R12,#+13
        BLT.N    ??dir_register_20
        CMP      LR,R7
        BEQ.N    ??dir_register_23
        LDRH     R2,[R2, R3, LSL #+1]
        CBNZ     R2,??dir_register_24
??dir_register_23:
        ORR      R0,R0,#0x40
??dir_register_24:
        STRB     R0,[R1, #+0]
        LDR      R0,[R4, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
        BL       ?Subroutine0
??CrossCallReturnLabel_2:
        MOV      R8,R0
        CBNZ     R0,??dir_register_17
        ADDS     R5,R7,R5
        UXTH     R5,R5
        MOVS     R0,R5
        BNE.N    ??dir_register_18
??dir_register_17:
        MOV      R0,R8
        CMP      R0,#+0
        BNE.N    ??dir_register_25
        BL       ?Subroutine7
??CrossCallReturnLabel_52:
        MOV      R8,R0
        CMP      R0,#+0
        BNE.N    ??dir_register_25
        LDR      R5,[R4, #+20]
        MOVS     R2,#+32
        BL       ??Subroutine25_0
??CrossCallReturnLabel_60:
        MOVS     R2,#+11
        LDR      R1,[R4, #+24]
        MOV      R0,R5
        BL       mem_cpy
        LDR      R0,[R4, #+24]
        LDRB     R0,[R0, #+11]
        AND      R0,R0,#0x18
        STRB     R0,[R5, #+12]
        LDR      R0,[R4, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
??dir_register_25:
        B.N      ??dir_register_6

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable2:
        DC32     LfnOfs

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine0:
        MOVS     R1,#+0
        MOV      R0,R4
        B.N      dir_next

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dir_remove:
        PUSH     {R3-R5,LR}
        MOV      R4,R0
        LDRH     R5,[R4, #+6]
        LDRH     R1,[R4, #+32]
        MOVW     R0,#+65535
        CMP      R1,R0
        BNE.N    ??dir_remove_0
        MOV      R1,R5
??dir_remove_0:
        MOV      R0,R4
        BL       dir_seek
        MOVS     R1,R0
        BNE.N    ??dir_remove_1
??dir_remove_2:
        BL       ?Subroutine7
??CrossCallReturnLabel_51:
        MOVS     R1,R0
        BNE.N    ??dir_remove_3
        LDR      R1,[R4, #+20]
        MOVS     R2,#+229
        STRB     R2,[R1, #+0]
        LDR      R1,[R4, #+0]
        MOVS     R2,#+1
        STRB     R2,[R1, #+4]
        LDRH     R1,[R4, #+6]
        CMP      R1,R5
        BCS.N    ??dir_remove_3
        BL       ?Subroutine0
??CrossCallReturnLabel_1:
        MOVS     R1,R0
        BEQ.N    ??dir_remove_2
??dir_remove_3:
        CMP      R0,#+4
        BNE.N    ??dir_remove_1
        MOVS     R0,#+2
??dir_remove_1:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
create_name:
        PUSH     {R0,R4-R11,LR}
        MOV      R5,R1
        MOVS     R4,#+0
        MOVS     R6,#+0
        LDR      R7,[R5, #+0]
        LDR      R11,[R0, #+28]
        B.N      ??create_name_0
??create_name_1:
        MOVS     R1,#+1
        BL       ff_convert
        MOV      R9,R0
        CMP      R0,#+0
        BEQ.N    ??create_name_2
        CMP      R0,#+128
        BCS.N    ??create_name_3
        MOV      R1,R9
        LDR.N    R0,??create_name_4  ;; ??cvt + 128
        BL       chk_chr
        CMP      R0,#+0
        BNE.N    ??create_name_2
??create_name_3:
        STRH     R9,[R11, R4, LSL #+1]
        ADDS     R4,R4,#+1
??create_name_0:
        LDRB     R1,[R6, R7]
        ADDS     R6,R6,#+1
        MOV      R0,R1
        CMP      R0,#+32
        BCC.N    ??create_name_5
        CMP      R0,#+47
        BEQ.N    ??create_name_5
        CMP      R0,#+92
        BNE.N    ??create_name_6
??create_name_5:
        ADDS     R0,R6,R7
        STR      R0,[R5, #+0]
        CMP      R1,#+32
        BCS.N    ??create_name_7
        MOVS     R5,#+4
        B.N      ??create_name_8
??create_name_6:
        CMP      R4,#+255
        BLT.N    ??create_name_1
??create_name_2:
        MOVS     R0,#+6
        B.N      ??create_name_9
??create_name_7:
        MOVS     R5,#+0
        B.N      ??create_name_8
??create_name_10:
        SUBS     R4,R4,#+1
??create_name_8:
        CMP      R4,#+0
        BEQ.N    ??create_name_2
        ADD      R0,R11,R4, LSL #+1
        LDRH     R1,[R0, #-2]
        CMP      R1,#+32
        BEQ.N    ??create_name_10
        CMP      R1,#+46
        BEQ.N    ??create_name_10
        MOVS     R0,#+0
        STRH     R0,[R11, R4, LSL #+1]
        MOVS     R2,#+11
        MOVS     R1,#+32
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
        BL       mem_set
        MOVS     R6,#+0
        B.N      ??create_name_11
??create_name_12:
        ADDS     R6,R6,#+1
??create_name_11:
        LDRH     R0,[R11, R6, LSL #+1]
        CMP      R0,#+32
        BEQ.N    ??create_name_12
        CMP      R0,#+46
        BEQ.N    ??create_name_12
        CBZ      R6,??create_name_13
        ORR      R5,R5,#0x3
??create_name_13:
        ADD      R0,R11,R4, LSL #+1
        LDRH     R0,[R0, #-2]
        CMP      R0,#+46
        BEQ.N    ??create_name_14
        SUBS     R4,R4,#+1
        BNE.N    ??create_name_13
??create_name_14:
        MOVS     R7,#+0
        MOV      R8,R7
        MOV      R10,#+8
        B.N      ??create_name_15
??create_name_16:
        MOV      R5,R1
??create_name_15:
        LDRH     R9,[R11, R6, LSL #+1]
        ADDS     R6,R6,#+1
        LSL      R0,R8,#+2
        UXTB     R0,R0
        MOV      R1,R9
        CBZ      R1,??create_name_17
        ORR      R1,R5,#0x3
        UXTB     R1,R1
        MOV      R2,R9
        CMP      R2,#+32
        BEQ.N    ??create_name_16
        CMP      R2,#+46
        BNE.N    ??create_name_18
        CMP      R6,R4
        BNE.N    ??create_name_16
??create_name_18:
        CMP      R7,R10
        BGE.N    ??create_name_19
        CMP      R6,R4
        BNE.N    ??create_name_20
??create_name_19:
        CMP      R10,#+11
        BNE.N    ??create_name_21
        MOV      R5,R1
??create_name_17:
        LDR      R1,[SP, #+0]
        LDR      R1,[R1, #+24]
        LDRB     R2,[R1, #+0]
        CMP      R2,#+229
        BNE.N    ??create_name_22
        MOVS     R2,#+5
        STRB     R2,[R1, #+0]
??create_name_22:
        CMP      R10,#+8
        BNE.N    ??create_name_23
        MOV      R8,R0
??create_name_23:
        AND      R0,R8,#0xC
        CMP      R0,#+12
        BEQ.N    ??create_name_24
        AND      R0,R8,#0x3
        CMP      R0,#+3
        BNE.N    ??create_name_25
??create_name_24:
        ORR      R5,R5,#0x2
        UXTB     R5,R5
??create_name_25:
        TST      R5,#0x2
        BNE.N    ??create_name_26
        AND      R0,R8,#0x3
        CMP      R0,#+1
        BNE.N    ??create_name_27
        ORR      R5,R5,#0x10
        UXTB     R5,R5
??create_name_27:
        AND      R0,R8,#0xC
        CMP      R0,#+4
        BNE.N    ??create_name_26
        ORR      R5,R5,#0x8
        UXTB     R5,R5
??create_name_26:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
        STRB     R5,[R0, #+11]
        MOVS     R0,#+0
??create_name_9:
        POP      {R1,R4-R11,PC}   ;; return
??create_name_21:
        CMP      R6,R4
        BEQ.N    ??create_name_28
        MOV      R5,R1
??create_name_28:
        CMP      R4,R6
        BLT.N    ??create_name_17
        MOV      R6,R4
        MOVS     R7,#+8
        MOV      R10,#+11
        MOV      R8,R0
        B.N      ??create_name_15
??create_name_20:
        MOV      R0,R9
        CMP      R0,#+128
        BCC.N    ??create_name_29
        MOVS     R1,#+0
        BL       ff_convert
        MOV      R9,R0
        CBZ      R0,??create_name_30
        LDR.N    R0,??create_name_4+0x4  ;; ??cvt
        ADD      R0,R9,R0
        LDRB     R9,[R0, #-128]
??create_name_30:
        ORR      R5,R5,#0x2
        UXTB     R5,R5
??create_name_29:
        MOV      R0,R9
        CBZ      R0,??create_name_31
        MOV      R1,R9
        LDR.N    R0,??create_name_4+0x8  ;; ??cvt + 140
        BL       chk_chr
        CBZ      R0,??create_name_32
??create_name_31:
        MOV      R9,#+95
        ORR      R5,R5,#0x3
        UXTB     R5,R5
        B.N      ??create_name_33
??create_name_32:
        MOV      R0,R9
        CMP      R0,#+65
        BCC.N    ??create_name_34
        CMP      R0,#+91
        BCS.N    ??create_name_34
        ORR      R8,R8,#0x2
        B.N      ??create_name_33
??create_name_34:
        CMP      R0,#+97
        BCC.N    ??create_name_33
        CMP      R0,#+123
        BCS.N    ??create_name_33
        ORR      R0,R8,#0x1
        UXTB     R8,R0
        SUB      R9,R9,#+32
??create_name_33:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
        STRB     R9,[R7, R0]
        ADDS     R7,R7,#+1
        B.N      ??create_name_15
        Nop      
        DATA
??create_name_4:
        DC32     ??cvt + 128
        DC32     ??cvt
        DC32     ??cvt + 140

        SECTION `.rodata`:CONST:NOROOT(2)
??cvt:
        DATA
        DC8 128, 154, 144, 65, 142, 65, 143, 128, 69, 69, 69, 73, 73, 73, 142
        DC8 143, 144, 146, 146, 79, 153, 79, 85, 85, 89, 153, 154, 155, 156
        DC8 157, 158, 159, 65, 73, 79, 85, 165, 165, 166, 167, 168, 169, 170
        DC8 171, 172, 33, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184
        DC8 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197
        DC8 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210
        DC8 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223
        DC8 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236
        DC8 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249
        DC8 250, 251, 252, 253, 254, 255
        DC8 "\"*:<>?|\177"
        DC8 0, 0, 0
        DC8 "+,;[=]"
        DC8 0

        SECTION `.rodata`:CONST:NOROOT(2)
LfnOfs:
        DATA
        DC8 1, 3, 5, 7, 9, 14, 16, 18, 20, 22, 24, 28, 30, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_fileinfo:
        PUSH     {R3-R7,LR}
        MOV      R4,R1
        ADD      R1,R4,#+9
        LDR      R2,[R0, #+16]
        CMP      R2,#+0
        BEQ.N    ??get_fileinfo_0
        LDR      R2,[R0, #+20]
        LDRB     R3,[R2, #+12]
        MOVS     R5,#+0
??get_fileinfo_1:
        LDRB     R6,[R5, R2]
        CMP      R6,#+32
        BEQ.N    ??get_fileinfo_2
        CMP      R6,#+5
        BNE.N    ??get_fileinfo_3
        MOVS     R6,#+229
??get_fileinfo_3:
        TST      R3,#0x8
        BL       ?Subroutine10
??CrossCallReturnLabel_17:
        CMP      R5,#+8
        BLT.N    ??get_fileinfo_1
??get_fileinfo_2:
        LDRB     R5,[R2, #+8]
        CMP      R5,#+32
        BEQ.N    ??get_fileinfo_4
        MOVS     R5,#+46
        STRB     R5,[R1], #+1
        MOVS     R5,#+8
??get_fileinfo_5:
        LDRB     R6,[R5, R2]
        CMP      R6,#+32
        BEQ.N    ??get_fileinfo_4
        TST      R3,#0x10
        BL       ?Subroutine10
??CrossCallReturnLabel_18:
        CMP      R5,#+11
        BLT.N    ??get_fileinfo_5
??get_fileinfo_4:
        LDRB     R3,[R2, #+11]
        STRB     R3,[R4, #+8]
        LDRB     R3,[R2, #+31]
        LDRB     R5,[R2, #+30]
        LSLS     R5,R5,#+16
        ORR      R3,R5,R3, LSL #+24
        LDRB     R5,[R2, #+29]
        ORR      R3,R3,R5, LSL #+8
        LDRB     R5,[R2, #+28]
        ORRS     R3,R5,R3
        STR      R3,[R4, #+0]
        LDRB     R3,[R2, #+25]
        LDRB     R5,[R2, #+24]
        ORR      R3,R5,R3, LSL #+8
        STRH     R3,[R4, #+4]
        LDRB     R3,[R2, #+23]
        LDRB     R2,[R2, #+22]
        ORR      R2,R2,R3, LSL #+8
        STRH     R2,[R4, #+6]
??get_fileinfo_0:
        MOVS     R2,#+0
        STRB     R2,[R1, #+0]
        LDR      R6,[R4, #+24]
        CBZ      R6,??get_fileinfo_6
        MOVS     R5,#+0
        LDR      R1,[R0, #+16]
        CBZ      R1,??get_fileinfo_7
        LDRH     R1,[R0, #+32]
        MOVW     R2,#+65535
        CMP      R1,R2
        BEQ.N    ??get_fileinfo_7
        LDR      R7,[R0, #+28]
        B.N      ??get_fileinfo_8
??get_fileinfo_9:
        LDR      R1,[R4, #+28]
        SUBS     R1,R1,#+1
        CMP      R5,R1
        BGE.N    ??get_fileinfo_10
        STRB     R0,[R5, R6]
        ADDS     R5,R5,#+1
??get_fileinfo_8:
        LDRH     R0,[R7], #+2
        MOVS     R1,R0
        BEQ.N    ??get_fileinfo_7
        MOVS     R1,#+0
        BL       ff_convert
        MOVS     R1,R0
        BNE.N    ??get_fileinfo_9
??get_fileinfo_10:
        MOVS     R5,#+0
??get_fileinfo_7:
        MOVS     R0,#+0
        STRB     R0,[R5, R6]
??get_fileinfo_6:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine10:
        BEQ.N    ??Subroutine10_0
        CMP      R6,#+65
        BCC.N    ??Subroutine10_0
        CMP      R6,#+91
        BCS.N    ??Subroutine10_0
        ADDS     R6,R6,#+32
        UXTB     R6,R6
??Subroutine10_0:
        STRB     R6,[R1], #+1
        ADDS     R5,R5,#+1
        BX       LR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
follow_path:
        PUSH     {R0,R1,R4,LR}
        MOV      R4,R0
        LDRB     R0,[R1, #+0]
        CMP      R0,#+47
        BEQ.N    ??follow_path_0
        CMP      R0,#+92
        BNE.N    ??follow_path_1
??follow_path_0:
        ADDS     R0,R1,#+1
        STR      R0,[SP, #+4]
??follow_path_1:
        MOVS     R0,#+0
        STR      R0,[R4, #+8]
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+32
        BCS.N    ??follow_path_2
        BL       ?Subroutine3
??CrossCallReturnLabel_11:
        MOVS     R1,#+0
        STR      R1,[R4, #+20]
        POP      {R1,R2,R4,PC}
??follow_path_3:
        LDRB     R1,[R0, #+21]
        LDRB     R2,[R0, #+20]
        ORR      R1,R2,R1, LSL #+8
        LDRB     R2,[R0, #+27]
        LDRB     R0,[R0, #+26]
        ORR      R0,R0,R2, LSL #+8
        ORR      R0,R0,R1, LSL #+16
        STR      R0,[R4, #+8]
??follow_path_2:
        ADD      R1,SP,#+4
        MOV      R0,R4
        BL       create_name
        CMP      R0,#+0
        BNE.N    ??follow_path_4
        MOV      R0,R4
        BL       dir_find
        LDR      R1,[R4, #+24]
        LDRB     R1,[R1, #+11]
        AND      R1,R1,#0x4
        CBZ      R0,??follow_path_5
        CMP      R0,#+4
        BNE.N    ??follow_path_4
        CMP      R1,#+0
        BNE.N    ??follow_path_4
        B.N      ??follow_path_6
??follow_path_5:
        CMP      R1,#+0
        BNE.N    ??follow_path_4
        LDR      R0,[R4, #+20]
        LDRB     R1,[R0, #+11]
        TST      R1,#0x10
        BNE.N    ??follow_path_3
??follow_path_6:
        MOVS     R0,#+5
??follow_path_4:
        POP      {R1,R2,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
check_fs:
        PUSH     {R4,LR}
        MOV      R4,R0
        MOVS     R3,#+1
        MOV      R2,R1
        ADD      R1,R4,#+48
        LDRB     R0,[R4, #+1]
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??check_fs_0
        MOVS     R0,#+3
        POP      {R4,PC}
??check_fs_0:
        ADDW     R0,R4,#+558
        LDRB     R0,[R0, #+1]
        LDRB     R1,[R4, #+558]
        ORR      R0,R1,R0, LSL #+8
        MOVW     R1,#+43605
        CMP      R0,R1
        BEQ.N    ??check_fs_1
        MOVS     R0,#+2
        POP      {R4,PC}
??check_fs_1:
        ADD      R1,R4,#+102
        LDR.N    R0,??check_fs_2  ;; 0x544146
        LDRB     R2,[R1, #+2]
        LDRB     R3,[R1, #+1]
        LSLS     R3,R3,#+8
        ORR      R2,R3,R2, LSL #+16
        LDRB     R3,[R4, #+102]
        ORRS     R2,R3,R2
        CMP      R2,R0
        BNE.N    ??check_fs_3
??check_fs_4:
        MOVS     R0,#+0
        POP      {R4,PC}
??check_fs_3:
        LDRB     R2,[R1, #+30]
        LDRB     R3,[R1, #+29]
        LSLS     R3,R3,#+8
        ORR      R2,R3,R2, LSL #+16
        LDRB     R1,[R1, #+28]
        ORRS     R1,R1,R2
        CMP      R1,R0
        BEQ.N    ??check_fs_4
        MOVS     R0,#+1
        POP      {R4,PC}          ;; return
        DATA
??check_fs_2:
        DC32     0x544146

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
chk_mounted:
        PUSH     {R4-R8,LR}
        MOV      R4,R2
        LDR      R2,[R0, #+0]
        LDRB     R3,[R2, #+0]
        SUBS     R3,R3,#+48
        CMP      R3,#+10
        BCS.N    ??chk_mounted_0
        LDRB     R5,[R2, #+1]
        CMP      R5,#+58
        BNE.N    ??chk_mounted_0
        ADDS     R2,R2,#+2
        STR      R2,[R0, #+0]
        CMP      R3,#+0
        BEQ.N    ??chk_mounted_0
        MOVS     R0,#+11
        B.N      ??chk_mounted_1
??chk_mounted_0:
        LDR.N    R5,??chk_mounted_2  ;; Fsid
        LDR      R6,[R5, #+4]
        STR      R6,[R1, #+0]
        CMP      R6,#+0
        BNE.N    ??chk_mounted_3
        MOVS     R0,#+12
??chk_mounted_1:
        POP      {R4-R8,PC}
??chk_mounted_3:
        LDRB     R0,[R6, #+0]
        CBZ      R0,??chk_mounted_4
        LDRB     R0,[R6, #+1]
        BL       disk_status
        TST      R0,#0x1
        BNE.N    ??chk_mounted_4
        CMP      R4,#+0
        BEQ.N    ??chk_mounted_5
        TST      R0,#0x4
??chk_mounted_5:
        BEQ.W    ??chk_mounted_6
??chk_mounted_7:
        MOVS     R0,#+10
        B.N      ??chk_mounted_1
??chk_mounted_4:
        MOVS     R0,#+0
        STRB     R0,[R6, #+0]
        STRB     R0,[R6, #+1]
        BL       disk_initialize
        TST      R0,#0x1
        BEQ.N    ??chk_mounted_8
        MOVS     R0,#+3
        B.N      ??chk_mounted_1
??chk_mounted_8:
        CMP      R4,#+0
        BEQ.N    ??chk_mounted_9
        TST      R0,#0x4
        BNE.N    ??chk_mounted_7
??chk_mounted_9:
        MOV      R8,#+0
        MOVS     R1,#+0
        MOV      R0,R6
        BL       check_fs
        MOV      R4,R0
        CMP      R0,#+1
        BNE.N    ??chk_mounted_10
        ADD      R0,R6,#+494
        LDRB     R1,[R0, #+4]
        CBZ      R1,??chk_mounted_10
        LDRB     R1,[R0, #+11]
        LDRB     R2,[R0, #+10]
        LSLS     R2,R2,#+16
        ORR      R1,R2,R1, LSL #+24
        LDRB     R2,[R0, #+9]
        ORR      R1,R1,R2, LSL #+8
        LDRB     R0,[R0, #+8]
        ORR      R8,R0,R1
        MOV      R1,R8
        MOV      R0,R6
        BL       check_fs
        MOV      R4,R0
??chk_mounted_10:
        CMP      R4,#+3
        BNE.N    ??chk_mounted_11
        MOVS     R0,#+1
        B.N      ??chk_mounted_1
??chk_mounted_11:
        CMP      R4,#+0
        BNE.N    ??chk_mounted_12
        ADD      R7,R6,#+48
        LDRB     R0,[R7, #+12]
        LDRB     R1,[R7, #+11]
        ORR      R0,R1,R0, LSL #+8
        MOV      R1,#+512
        CMP      R0,R1
        BEQ.N    ??chk_mounted_13
??chk_mounted_12:
        MOVS     R0,#+13
        B.N      ??chk_mounted_1
??chk_mounted_13:
        LDRB     R0,[R7, #+23]
        LDRB     R1,[R7, #+22]
        ORR      R1,R1,R0, LSL #+8
        ADD      R0,R6,#+80
        CBNZ     R1,??chk_mounted_14
        LDRB     R1,[R0, #+7]
        LDRB     R2,[R0, #+6]
        LSLS     R2,R2,#+16
        ORR      R1,R2,R1, LSL #+24
        LDRB     R2,[R0, #+5]
        ORR      R1,R1,R2, LSL #+8
        LDRB     R2,[R0, #+4]
        ORRS     R1,R2,R1
??chk_mounted_14:
        STR      R1,[R6, #+24]
        LDRB     R2,[R7, #+16]
        STRB     R2,[R6, #+3]
        MULS     R1,R1,R2
        LDRB     R2,[R7, #+15]
        LDRB     R3,[R7, #+14]
        ORR      R2,R3,R2, LSL #+8
        ADD      R2,R2,R8
        STR      R2,[R6, #+32]
        LDRB     R2,[R7, #+13]
        STRB     R2,[R6, #+2]
        LDRB     R3,[R7, #+18]
        LDRB     R4,[R7, #+17]
        ORR      R3,R4,R3, LSL #+8
        STRH     R3,[R6, #+8]
        LDRB     R4,[R7, #+20]
        LDRB     R12,[R7, #+19]
        ORRS     R4,R12,R4, LSL #+8
        BNE.N    ??chk_mounted_15
        LDRB     R4,[R0, #+3]
        LDRB     R12,[R0, #+2]
        LSL      R12,R12,#+16
        ORR      R4,R12,R4, LSL #+24
        LDRB     R12,[R0, #+1]
        ORR      R4,R4,R12, LSL #+8
        LDRB     R12,[R6, #+80]
        ORR      R4,R12,R4
??chk_mounted_15:
        LSRS     R3,R3,#+4
        LDRB     R12,[R7, #+15]
        LDRB     LR,[R7, #+14]
        ORR      R12,LR,R12, LSL #+8
        SUB      R4,R4,R12
        SUBS     R4,R4,R1
        SUBS     R4,R4,R3
        UDIV     R2,R4,R2
        ADDS     R2,R2,#+2
        STR      R2,[R6, #+28]
        MOVS     R4,#+1
        MOVW     R12,#+4087
        CMP      R2,R12
        BCC.N    ??chk_mounted_16
        MOVS     R4,#+2
??chk_mounted_16:
        MOVW     R12,#+65527
        CMP      R2,R12
        BCC.N    ??chk_mounted_17
        MOVS     R4,#+3
        B.N      ??chk_mounted_18
??chk_mounted_17:
        CMP      R4,#+3
        BNE.N    ??chk_mounted_19
??chk_mounted_18:
        LDRB     R2,[R0, #+15]
        LDRB     R12,[R0, #+14]
        LSL      R12,R12,#+16
        ORR      R2,R12,R2, LSL #+24
        LDRB     R12,[R0, #+13]
        ORR      R2,R2,R12, LSL #+8
        LDRB     R12,[R0, #+12]
        ORR      R2,R12,R2
        B.N      ??chk_mounted_20
??chk_mounted_19:
        LDR      R2,[R6, #+32]
        ADDS     R2,R1,R2
??chk_mounted_20:
        STR      R2,[R6, #+36]
        LDR      R2,[R6, #+32]
        ADDS     R1,R1,R2
        ADDS     R1,R3,R1
        STR      R1,[R6, #+40]
        MOV      R1,#-1
        STR      R1,[R6, #+16]
        MOVS     R1,#+0
        STRB     R1,[R6, #+4]
        CMP      R4,#+3
        BNE.N    ??chk_mounted_21
        STRB     R1,[R6, #+5]
        LDRB     R1,[R0, #+17]
        LDRB     R0,[R0, #+16]
        ORR      R0,R0,R1, LSL #+8
        ADD      R2,R0,R8
        STR      R2,[R6, #+20]
        MOVS     R3,#+1
        ADD      R1,R6,#+48
        LDRB     R0,[R6, #+1]
        BL       disk_read
        CMP      R0,#+0
        BNE.N    ??chk_mounted_21
        ADD      R0,R6,#+532
        LDRB     R1,[R0, #+27]
        LDRB     R2,[R0, #+26]
        ORR      R1,R2,R1, LSL #+8
        MOVW     R2,#+43605
        CMP      R1,R2
        BNE.N    ??chk_mounted_21
        LDRB     R1,[R7, #+3]
        LDRB     R2,[R7, #+2]
        LSLS     R2,R2,#+16
        ORR      R1,R2,R1, LSL #+24
        LDRB     R2,[R7, #+1]
        ORR      R1,R1,R2, LSL #+8
        LDRB     R2,[R6, #+48]
        ORRS     R1,R2,R1
        LDR.N    R2,??chk_mounted_2+0x4  ;; 0x41615252
        CMP      R1,R2
        BNE.N    ??chk_mounted_21
        LDRB     R1,[R0, #+3]
        LDRB     R2,[R0, #+2]
        LSLS     R2,R2,#+16
        ORR      R1,R2,R1, LSL #+24
        LDRB     R2,[R0, #+1]
        ORR      R1,R1,R2, LSL #+8
        LDRB     R2,[R6, #+532]
        ORRS     R1,R2,R1
        LDR.N    R2,??chk_mounted_2+0x8  ;; 0x61417272
        CMP      R1,R2
        BNE.N    ??chk_mounted_21
        LDRB     R1,[R0, #+11]
        LDRB     R2,[R0, #+10]
        LSLS     R2,R2,#+16
        ORR      R1,R2,R1, LSL #+24
        LDRB     R2,[R0, #+9]
        ORR      R1,R1,R2, LSL #+8
        LDRB     R2,[R0, #+8]
        ORRS     R1,R2,R1
        STR      R1,[R6, #+12]
        LDRB     R1,[R0, #+7]
        LDRB     R2,[R0, #+6]
        LSLS     R2,R2,#+16
        ORR      R1,R2,R1, LSL #+24
        LDRB     R2,[R0, #+5]
        ORR      R1,R1,R2, LSL #+8
        LDRB     R0,[R0, #+4]
        ORRS     R0,R0,R1
        STR      R0,[R6, #+16]
??chk_mounted_21:
        STRB     R4,[R6, #+0]
        MOVS     R0,#+0
        STR      R0,[R6, #+44]
        LDRH     R0,[R5, #+0]
        ADDS     R0,R0,#+1
        STRH     R0,[R5, #+0]
        STRH     R0,[R6, #+6]
??chk_mounted_6:
        MOVS     R0,#+0
        B.N      ??chk_mounted_1
        DATA
??chk_mounted_2:
        DC32     Fsid
        DC32     0x41615252
        DC32     0x61417272

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
validate:
        PUSH     {R7,LR}
        CMP      R0,#+0
        BEQ.N    ??validate_0
        LDRB     R2,[R0, #+0]
        CMP      R2,#+0
        BEQ.N    ??validate_0
        LDRH     R2,[R0, #+6]
        CMP      R2,R1
        BEQ.N    ??validate_1
??validate_0:
        MOVS     R0,#+9
        POP      {R1,PC}
??validate_1:
        LDRB     R0,[R0, #+1]
        BL       disk_status
        TST      R0,#0x1
        BEQ.N    ??validate_2
        MOVS     R0,#+3
        POP      {R1,PC}
??validate_2:
        MOVS     R0,#+0
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
f_mount:
        CMP      R0,#+0
        BEQ.N    ??f_mount_0
        MOVS     R0,#+11
        BX       LR
??f_mount_0:
        LDR.N    R0,??f_mount_1   ;; Fsid
        LDR      R2,[R0, #+4]
        CBZ      R2,??f_mount_2
        MOVS     R3,#+0
        STRB     R3,[R2, #+0]
??f_mount_2:
        CMP      R1,#+0
        BEQ.N    ??f_mount_3
        MOVS     R2,#+0
        STRB     R2,[R1, #+0]
??f_mount_3:
        STR      R1,[R0, #+4]
        MOVS     R0,#+0
        BX       LR               ;; return
        DATA
??f_mount_1:
        DC32     Fsid

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
f_open:
        PUSH     {R1,R4-R8,LR}
        SUB      SP,SP,#+52
        MOV      R5,R0
        MOVS     R0,#+0
        STR      R0,[R5, #+0]
        AND      R6,R2,#0x1F
        AND      R2,R6,#0x1E
        ADD      R1,SP,#+0
        ADD      R0,SP,#+52
        BL       chk_mounted
        MOVS     R1,R0
        BNE.N    ??f_open_0
        BL       ?Subroutine15
??CrossCallReturnLabel_25:
        LDR      R1,[SP, #+52]
        ADD      R0,SP,#+0
        BL       follow_path
        TST      R6,#0x1C
        BEQ.N    ??f_open_1
        MOVS     R1,R0
        BEQ.N    ??f_open_2
        CMP      R0,#+4
        BNE.N    ??f_open_3
        ADD      R0,SP,#+0
        BL       dir_register
??f_open_3:
        MOVS     R1,R0
        BNE.N    ??f_open_0
        ORR      R6,R6,#0x8
        LDR      R7,[SP, #+20]
        B.N      ??f_open_4
??f_open_2:
        TST      R6,#0x4
        BEQ.N    ??f_open_5
        MOVS     R0,#+8
        B.N      ??f_open_0
??f_open_5:
        LDR      R7,[SP, #+20]
        CMP      R7,#+0
        BEQ.N    ??f_open_6
        LDRB     R0,[R7, #+11]
        BICS     R0,R0,#0xEE
        BEQ.N    ??f_open_7
??f_open_6:
        MOVS     R0,#+7
??f_open_0:
        ADD      SP,SP,#+56
        POP      {R4-R8,PC}
??f_open_7:
        TST      R6,#0x8
        BEQ.N    ??f_open_8
        LDRB     R0,[R7, #+21]
        LDRB     R1,[R7, #+20]
        ORR      R0,R1,R0, LSL #+8
        LDRB     R1,[R7, #+27]
        LDRB     R2,[R7, #+26]
        ORR      R1,R2,R1, LSL #+8
        ORR      R4,R1,R0, LSL #+16
        MOVS     R0,#+0
        STRB     R0,[R7, #+20]
        STRB     R0,[R7, #+21]
        STRB     R0,[R7, #+26]
        STRB     R0,[R7, #+27]
        STRB     R0,[R7, #+28]
        STRB     R0,[R7, #+29]
        STRB     R0,[R7, #+30]
        STRB     R0,[R7, #+31]
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
        LDR      R0,[SP, #+0]
        LDR      R8,[R0, #+44]
        CBZ      R4,??f_open_9
        MOV      R1,R4
        BL       remove_chain
        MOVS     R1,R0
        BNE.N    ??f_open_0
        LDR      R0,[SP, #+0]
        SUBS     R1,R4,#+1
        STR      R1,[R0, #+12]
??f_open_9:
        MOV      R1,R8
        LDR      R0,[SP, #+0]
        BL       move_window
        MOVS     R1,R0
        BNE.N    ??f_open_0
??f_open_4:
        TST      R6,#0x8
        BEQ.N    ??f_open_8
        MOVS     R0,#+0
        STRB     R0,[R7, #+11]
        BL       get_fattime
        MOV      R1,R0
        STRB     R1,[R7, #+14]
        LSLS     R0,R0,#+16
        LSRS     R0,R0,#+24
        STRB     R0,[R7, #+15]
        LSRS     R0,R1,#+16
        STRB     R0,[R7, #+16]
        LSRS     R0,R1,#+24
        STRB     R0,[R7, #+17]
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
        ORR      R6,R6,#0x20
        B.N      ??f_open_8
??f_open_1:
        MOVS     R1,R0
        BNE.N    ??f_open_0
        LDR      R7,[SP, #+20]
        CMP      R7,#+0
        BEQ.N    ??f_open_10
        LDRB     R0,[R7, #+11]
        TST      R0,#0x10
        BEQ.N    ??f_open_11
??f_open_10:
        MOVS     R0,#+4
        B.N      ??f_open_0
??f_open_11:
        TST      R6,#0x2
        BEQ.N    ??f_open_8
        TST      R0,#0x1
        BNE.N    ??f_open_6
??f_open_8:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+44]
        STR      R0,[R5, #+28]
        LDR      R0,[SP, #+20]
        STR      R0,[R5, #+32]
        STRB     R6,[R5, #+6]
        LDRB     R0,[R7, #+21]
        LDRB     R1,[R7, #+20]
        ORR      R0,R1,R0, LSL #+8
        LDRB     R1,[R7, #+27]
        LDRB     R2,[R7, #+26]
        ORR      R1,R2,R1, LSL #+8
        ORR      R0,R1,R0, LSL #+16
        STR      R0,[R5, #+16]
        LDRB     R0,[R7, #+31]
        LDRB     R1,[R7, #+30]
        LSLS     R1,R1,#+16
        ORR      R0,R1,R0, LSL #+24
        LDRB     R1,[R7, #+29]
        ORR      R0,R0,R1, LSL #+8
        LDRB     R1,[R7, #+28]
        ORRS     R0,R1,R0
        STR      R0,[R5, #+12]
        MOVS     R0,#+0
        STR      R0,[R5, #+8]
        MOVS     R0,#+255
        STRB     R0,[R5, #+7]
        MOVS     R0,#+0
        STR      R0,[R5, #+24]
        LDR      R0,[SP, #+0]
        STR      R0,[R5, #+0]
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+6]
        STRH     R0,[R5, #+4]
        MOVS     R0,#+0
        B.N      ??f_open_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
f_read:
        PUSH     {R3-R9,LR}
        MOV      R4,R0
        MOV      R5,R2
        BL       ?Subroutine19
??CrossCallReturnLabel_35:
        BL       ?Subroutine16
??CrossCallReturnLabel_29:
        MOVS     R1,R0
        BNE.N    ??f_read_0
        LDRB     R0,[R4, #+6]
        TST      R0,#0x80
        BEQ.N    ??f_read_1
??f_read_2:
        MOVS     R0,#+2
        B.N      ??f_read_0
??f_read_1:
        TST      R0,#0x1
        BNE.N    ??f_read_3
        MOVS     R0,#+7
??f_read_0:
        POP      {R1,R4-R9,PC}
??f_read_3:
        LDR      R0,[R4, #+12]
        LDR      R1,[R4, #+8]
        SUBS     R0,R0,R1
        CMP      R0,R5
        BHI.N    ??f_read_4
        MOV      R5,R0
        B.N      ??f_read_4
??f_read_5:
        LDRB     R0,[R4, #+6]
        TST      R0,#0x40
        BEQ.N    ??CrossCallReturnLabel_30
        BL       ?Subroutine2
??CrossCallReturnLabel_8:
        CMP      R0,#+0
        BNE.N    ??f_read_6
        BL       ?Subroutine17
??CrossCallReturnLabel_30:
        LDR      R0,[R4, #+24]
        CMP      R0,R6
        BEQ.N    ??f_read_7
        BL       ?Subroutine1
??CrossCallReturnLabel_6:
        CMP      R0,#+0
        BNE.N    ??f_read_6
??f_read_7:
        STR      R6,[R4, #+24]
        LDRB     R0,[R4, #+7]
        ADDS     R0,R0,#+1
        STRB     R0,[R4, #+7]
??f_read_8:
        LDR      R0,[R4, #+8]
        LSLS     R0,R0,#+23
        LSRS     R0,R0,#+23
        RSB      R1,R0,#+512
        MOV      R6,R5
        CMP      R5,R1
        BLS.N    ??f_read_9
        MOV      R6,R1
??f_read_9:
        MOV      R2,R6
        ADDS     R0,R0,R4
        ADD      R1,R0,#+36
        MOV      R0,R8
        BL       mem_cpy
??f_read_10:
        ADD      R8,R6,R8
        LDR      R0,[R4, #+8]
        ADDS     R0,R6,R0
        STR      R0,[R4, #+8]
        LDR      R0,[R9, #+0]
        ADDS     R0,R6,R0
        STR      R0,[R9, #+0]
        SUBS     R5,R5,R6
??f_read_4:
        CMP      R5,#+0
        BEQ.N    ??f_read_11
        LDR      R1,[R4, #+8]
        LSLS     R0,R1,#+23
        BNE.N    ??f_read_8
        LDR      R0,[R4, #+0]
        LDRB     R2,[R4, #+7]
        LDRB     R3,[R0, #+2]
        CMP      R2,R3
        BCC.N    ??f_read_12
        CMP      R1,#+0
        ITEE     EQ 
        LDREQ    R0,[R4, #+16]
        LDRNE    R1,[R4, #+20]
        BLNE     get_fat
        CMP      R0,#+2
        BCS.N    ??f_read_13
??f_read_14:
        LDRB     R0,[R4, #+6]
        ORR      R0,R0,#0x80
        STRB     R0,[R4, #+6]
        B.N      ??f_read_2
??f_read_13:
        MOV      R1,#-1
        CMP      R0,R1
        BNE.N    ??f_read_15
??f_read_6:
        LDRB     R0,[R4, #+6]
        ORR      R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+1
        B.N      ??f_read_0
??f_read_15:
        STR      R0,[R4, #+20]
        MOVS     R0,#+0
        STRB     R0,[R4, #+7]
??f_read_12:
        LDR      R1,[R4, #+20]
        BL       ??Subroutine24_0
??CrossCallReturnLabel_57:
        MOVS     R6,R0
        BEQ.N    ??f_read_14
        LDRB     R1,[R4, #+7]
        ADDS     R6,R1,R0
        LSRS     R7,R5,#+9
        BEQ.N    ??f_read_5
        LDR      R0,[R4, #+0]
        BL       ?Subroutine18
??CrossCallReturnLabel_33:
        MOV      R2,R6
        MOV      R1,R8
        LDRB     R0,[R0, #+1]
        BL       disk_read
        CMP      R0,#+0
        BNE.N    ??f_read_6
        LDRB     R0,[R4, #+6]
        TST      R0,#0x40
        BEQ.N    ??f_read_16
        LDR      R0,[R4, #+24]
        SUBS     R0,R0,R6
        CMP      R0,R7
        BCS.N    ??f_read_16
        MOV      R2,#+512
        ADD      R1,R4,#+36
        ADD      R0,R8,R0, LSL #+9
        BL       mem_cpy
??f_read_16:
        LDRB     R0,[R4, #+7]
        ADDS     R0,R7,R0
        STRB     R0,[R4, #+7]
        LSLS     R6,R7,#+9
        B.N      ??f_read_10
??f_read_11:
        MOVS     R0,#+0
        B.N      ??f_read_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
f_write:
        PUSH     {R3-R9,LR}
        MOV      R5,R0
        MOV      R6,R2
        BL       ?Subroutine19
??CrossCallReturnLabel_36:
        LDRH     R1,[R5, #+4]
        LDR      R0,[R5, #+0]
        BL       validate
        MOVS     R1,R0
        BNE.N    ??f_write_0
        LDRB     R0,[R5, #+6]
        TST      R0,#0x80
        BEQ.N    ??f_write_1
??f_write_2:
        MOVS     R0,#+2
        B.N      ??f_write_0
??f_write_1:
        TST      R0,#0x2
        BNE.N    ??f_write_3
        MOVS     R0,#+7
??f_write_0:
        POP      {R1,R4-R9,PC}
??f_write_3:
        LDR      R0,[R5, #+12]
        ADDS     R1,R6,R0
        CMP      R1,R0
        BCS.N    ??f_write_4
??f_write_5:
        LDR      R0,[R5, #+12]
        LDR      R1,[R5, #+8]
        CMP      R0,R1
        BCS.N    ??f_write_6
        MOV      R0,R1
??f_write_6:
        STR      R0,[R5, #+12]
        LDRB     R0,[R5, #+6]
        ORR      R0,R0,#0x20
        STRB     R0,[R5, #+6]
        MOVS     R0,#+0
        B.N      ??f_write_0
??f_write_7:
        LDR      R0,[R5, #+24]
        CMP      R0,R4
        BEQ.N    ??f_write_8
        LDR      R0,[R5, #+8]
        LDR      R1,[R5, #+12]
        CMP      R0,R1
        BCS.N    ??f_write_8
        MOVS     R3,#+1
        MOV      R2,R4
        ADD      R1,R5,#+36
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+1]
        BL       disk_read
        CMP      R0,#+0
        BNE.N    ??f_write_9
??f_write_8:
        STR      R4,[R5, #+24]
        LDRB     R0,[R5, #+7]
        ADDS     R0,R0,#+1
        STRB     R0,[R5, #+7]
??f_write_10:
        LDR      R0,[R5, #+8]
        LSLS     R0,R0,#+23
        LSRS     R0,R0,#+23
        RSB      R1,R0,#+512
        MOV      R7,R6
        CMP      R6,R1
        BLS.N    ??f_write_11
        MOV      R7,R1
??f_write_11:
        MOV      R2,R7
        MOV      R1,R8
        ADDS     R0,R0,R5
        ADDS     R0,R0,#+36
        BL       mem_cpy
        LDRB     R0,[R5, #+6]
        ORR      R0,R0,#0x40
        STRB     R0,[R5, #+6]
??f_write_12:
        ADD      R8,R7,R8
        LDR      R0,[R5, #+8]
        ADDS     R0,R7,R0
        STR      R0,[R5, #+8]
        LDR      R0,[R9, #+0]
        ADDS     R0,R7,R0
        STR      R0,[R9, #+0]
        SUBS     R6,R6,R7
??f_write_4:
        CMP      R6,#+0
        BEQ.N    ??f_write_5
        LDR      R0,[R5, #+8]
        LSLS     R1,R0,#+23
        BNE.N    ??f_write_10
        LDR      R2,[R5, #+0]
        LDRB     R1,[R5, #+7]
        LDRB     R3,[R2, #+2]
        CMP      R1,R3
        BCC.N    ??f_write_13
        CBNZ     R0,??f_write_14
        LDR      R0,[R5, #+16]
        CBNZ     R0,??f_write_15
        MOVS     R1,#+0
        MOV      R0,R2
        BL       create_chain
        STR      R0,[R5, #+16]
        B.N      ??f_write_15
??f_write_14:
        LDR      R1,[R5, #+20]
        MOV      R0,R2
        BL       create_chain
??f_write_15:
        CMP      R0,#+0
        BEQ.N    ??f_write_5
        CMP      R0,#+1
        BNE.N    ??f_write_16
??f_write_17:
        LDRB     R0,[R5, #+6]
        ORR      R0,R0,#0x80
        STRB     R0,[R5, #+6]
        B.N      ??f_write_2
??f_write_16:
        MOV      R1,#-1
        CMP      R0,R1
        BNE.N    ??f_write_18
??f_write_9:
        LDRB     R0,[R5, #+6]
        ORR      R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_write_0
??f_write_18:
        STR      R0,[R5, #+20]
        MOVS     R0,#+0
        STRB     R0,[R5, #+7]
??f_write_13:
        LDRB     R0,[R5, #+6]
        TST      R0,#0x40
        BEQ.N    ??f_write_19
        MOVS     R3,#+1
        LDR      R2,[R5, #+24]
        ADD      R1,R5,#+36
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+1]
        BL       disk_write
        CMP      R0,#+0
        BNE.N    ??f_write_9
        LDRB     R0,[R5, #+6]
        BIC      R0,R0,#0x40
        STRB     R0,[R5, #+6]
??f_write_19:
        LDR      R1,[R5, #+20]
        LDR      R0,[R5, #+0]
        BL       clust2sect
        CMP      R0,#+0
        BEQ.N    ??f_write_17
        LDRB     R1,[R5, #+7]
        ADDS     R4,R1,R0
        LSRS     R7,R6,#+9
        BEQ.N    ??f_write_7
        LDR      R0,[R5, #+0]
        BL       ?Subroutine18
??CrossCallReturnLabel_34:
        MOV      R2,R4
        MOV      R1,R8
        LDRB     R0,[R0, #+1]
        BL       disk_write
        CMP      R0,#+0
        BNE.N    ??f_write_9
        LDR      R0,[R5, #+24]
        SUBS     R0,R0,R4
        CMP      R0,R7
        BCS.N    ??f_write_20
        MOV      R2,#+512
        ADD      R1,R8,R0, LSL #+9
        ADD      R0,R5,#+36
        BL       mem_cpy
        LDRB     R0,[R5, #+6]
        BIC      R0,R0,#0x40
        STRB     R0,[R5, #+6]
??f_write_20:
        LDRB     R0,[R5, #+7]
        ADDS     R0,R7,R0
        STRB     R0,[R5, #+7]
        LSLS     R7,R7,#+9
        B.N      ??f_write_12

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine19:
        MOV      R9,R3
        MOV      R8,R1
        MOVS     R0,#+0
        STR      R0,[R9, #+0]
        BX       LR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine18:
        LDRB     R3,[R0, #+2]
        ADDS     R2,R7,R1
        CMP      R3,R2
        BCS.N    ??Subroutine18_0
        SUBS     R7,R3,R1
??Subroutine18_0:
        UXTB     R3,R7
        BX       LR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
f_sync:
        PUSH     {R3-R5,LR}
        BL       ?Subroutine6
??CrossCallReturnLabel_16:
        MOVS     R1,R0
        BNE.N    ??f_sync_0
        LDRB     R1,[R4, #+6]
        TST      R1,#0x20
        BEQ.N    ??f_sync_0
        TST      R1,#0x40
        BEQ.N    ??CrossCallReturnLabel_31
        BL       ?Subroutine2
??CrossCallReturnLabel_7:
        CMP      R0,#+0
        BEQ.N    ??f_sync_1
        MOVS     R0,#+1
        POP      {R1,R4,R5,PC}
??f_sync_1:
        BL       ?Subroutine17
??CrossCallReturnLabel_31:
        LDR      R1,[R4, #+28]
        BL       ??Subroutine23_0
??CrossCallReturnLabel_47:
        MOVS     R1,R0
        BNE.N    ??f_sync_0
        LDR      R5,[R4, #+32]
        LDRB     R0,[R5, #+11]
        ORR      R0,R0,#0x20
        STRB     R0,[R5, #+11]
        LDR      R0,[R4, #+12]
        STRB     R0,[R5, #+28]
        LDR      R0,[R4, #+12]
        LSLS     R0,R0,#+16
        LSRS     R0,R0,#+24
        STRB     R0,[R5, #+29]
        LDR      R0,[R4, #+12]
        LSRS     R0,R0,#+16
        STRB     R0,[R5, #+30]
        LDR      R0,[R4, #+12]
        LSRS     R0,R0,#+24
        STRB     R0,[R5, #+31]
        LDR      R0,[R4, #+16]
        STRB     R0,[R5, #+26]
        LDR      R0,[R4, #+16]
        LSLS     R0,R0,#+16
        LSRS     R0,R0,#+24
        STRB     R0,[R5, #+27]
        LDR      R0,[R4, #+16]
        LSRS     R0,R0,#+16
        STRB     R0,[R5, #+20]
        LDR      R0,[R4, #+16]
        LSRS     R0,R0,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R5, #+21]
        BL       get_fattime
        STRB     R0,[R5, #+22]
        LSLS     R1,R0,#+16
        LSRS     R1,R1,#+24
        STRB     R1,[R5, #+23]
        LSRS     R1,R0,#+16
        STRB     R1,[R5, #+24]
        LSRS     R0,R0,#+24
        STRB     R0,[R5, #+25]
        LDRB     R0,[R4, #+6]
        BIC      R0,R0,#0x20
        STRB     R0,[R4, #+6]
        LDR      R0,[R4, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
        LDR      R0,[R4, #+0]
        BL       sync
??f_sync_0:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine17:
        LDRB     R0,[R4, #+6]
        BIC      R0,R0,#0x40
        STRB     R0,[R4, #+6]
        BX       LR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine2:
        MOVS     R3,#+1
        LDR      R2,[R4, #+24]
        ADD      R1,R4,#+36
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+1]
        B.W      disk_write

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
f_close:
        PUSH     {R4,LR}
        MOV      R4,R0
        BL       f_sync
        MOVS     R1,R0
        BNE.N    ??f_close_0
        MOVS     R1,#+0
        STR      R1,[R4, #+0]
??f_close_0:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
f_lseek:
        PUSH     {R4-R8,LR}
        MOV      R4,R0
        MOV      R7,R1
        BL       ?Subroutine16
??CrossCallReturnLabel_28:
        MOVS     R8,R0
        BEQ.N    ??f_lseek_0
??f_lseek_1:
        MOV      R0,R8
        B.N      ??f_lseek_2
??f_lseek_0:
        LDRB     R0,[R4, #+6]
        TST      R0,#0x80
        BEQ.N    ??f_lseek_3
??f_lseek_4:
        MOVS     R0,#+2
??f_lseek_2:
        POP      {R4-R8,PC}
??f_lseek_3:
        LDR      R1,[R4, #+12]
        CMP      R1,R7
        BCS.N    ??f_lseek_5
        TST      R0,#0x2
        BNE.N    ??f_lseek_5
        MOV      R7,R1
??f_lseek_5:
        LDR      R1,[R4, #+8]
        MOVS     R6,#+0
        STR      R6,[R4, #+8]
        MOVS     R0,#+255
        STRB     R0,[R4, #+7]
        CMP      R7,#+0
        BEQ.N    ??f_lseek_6
        LDR      R0,[R4, #+0]
        LDRB     R2,[R0, #+2]
        LSLS     R5,R2,#+9
        CBZ      R1,??f_lseek_7
        SUBS     R1,R1,#+1
        UDIV     R2,R1,R5
        SUBS     R3,R7,#+1
        UDIV     R3,R3,R5
        CMP      R3,R2
        BCC.N    ??f_lseek_7
        SUBS     R0,R5,#+1
        MVNS     R0,R0
        ANDS     R0,R0,R1
        STR      R0,[R4, #+8]
        SUBS     R7,R7,R0
        LDR      R1,[R4, #+20]
        B.N      ??f_lseek_8
??f_lseek_7:
        LDR      R1,[R4, #+16]
        CBNZ     R1,??f_lseek_9
        BL       create_chain
        MOV      R1,R0
        CMP      R1,#+1
        BNE.N    ??f_lseek_10
??f_lseek_11:
        LDRB     R0,[R4, #+6]
        ORR      R0,R0,#0x80
        STRB     R0,[R4, #+6]
        B.N      ??f_lseek_4
??f_lseek_10:
        MOV      R0,#-1
        CMP      R1,R0
        BNE.N    ??f_lseek_12
??f_lseek_13:
        LDRB     R0,[R4, #+6]
        ORR      R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+1
        B.N      ??f_lseek_2
??f_lseek_12:
        STR      R1,[R4, #+16]
??f_lseek_9:
        STR      R1,[R4, #+20]
??f_lseek_8:
        CBNZ     R1,??f_lseek_14
        B.N      ??f_lseek_6
??f_lseek_15:
        BL       get_fat
        MOV      R1,R0
??f_lseek_16:
        MOV      R0,#-1
        CMP      R1,R0
        BEQ.N    ??f_lseek_13
        CMP      R1,#+2
        BCC.N    ??f_lseek_11
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+28]
        CMP      R1,R0
        BCS.N    ??f_lseek_11
        STR      R1,[R4, #+20]
        LDR      R0,[R4, #+8]
        ADDS     R0,R5,R0
        STR      R0,[R4, #+8]
        SUBS     R7,R7,R5
??f_lseek_14:
        CMP      R5,R7
        BCS.N    ??f_lseek_17
        LDR      R0,[R4, #+0]
        LDRB     R2,[R4, #+6]
        TST      R2,#0x2
        BEQ.N    ??f_lseek_15
        BL       create_chain
        MOVS     R1,R0
        BNE.N    ??f_lseek_16
        MOV      R7,R5
??f_lseek_17:
        LDR      R0,[R4, #+8]
        ADDS     R0,R7,R0
        STR      R0,[R4, #+8]
        LSRS     R0,R7,#+9
        STRB     R0,[R4, #+7]
        LSLS     R0,R7,#+23
        BEQ.N    ??f_lseek_6
        BL       ??Subroutine24_0
??CrossCallReturnLabel_56:
        MOVS     R6,R0
        BEQ.N    ??f_lseek_11
        LDRB     R0,[R4, #+7]
        ADDS     R6,R0,R6
        ADDS     R0,R0,#+1
        STRB     R0,[R4, #+7]
??f_lseek_6:
        LDR      R0,[R4, #+8]
        LSLS     R0,R0,#+23
        BEQ.N    ??f_lseek_18
        LDR      R2,[R4, #+24]
        CMP      R6,R2
        BEQ.N    ??f_lseek_18
        LDRB     R0,[R4, #+6]
        TST      R0,#0x40
        BEQ.N    ??CrossCallReturnLabel_32
        MOVS     R3,#+1
        ADD      R1,R4,#+36
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+1]
        BL       disk_write
        CMP      R0,#+0
        BNE.N    ??f_lseek_13
        BL       ?Subroutine17
??CrossCallReturnLabel_32:
        BL       ?Subroutine1
??CrossCallReturnLabel_5:
        CMP      R0,#+0
        BNE.N    ??f_lseek_13
        STR      R6,[R4, #+24]
??f_lseek_18:
        LDR      R0,[R4, #+8]
        LDR      R1,[R4, #+12]
        CMP      R1,R0
        BCS.N    ??f_lseek_19
        STR      R0,[R4, #+12]
        LDRB     R0,[R4, #+6]
        ORR      R0,R0,#0x20
        STRB     R0,[R4, #+6]
??f_lseek_19:
        B.N      ??f_lseek_1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine16:
        LDRH     R1,[R4, #+4]
        LDR      R0,[R4, #+0]
        B.N      validate

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine11:
        MOV      R1,R6
        Nop      
        REQUIRE ??Subroutine24_0
        ;; // Fall through to label ??Subroutine24_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
??Subroutine24_0:
        LDR      R0,[R4, #+0]
        B.W      clust2sect

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine1:
        MOVS     R3,#+1
        MOV      R2,R6
        ADD      R1,R4,#+36
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+1]
        B.W      disk_read

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
f_opendir:
        PUSH     {R1,R4,LR}
        SUB      SP,SP,#+12
        MOV      R4,R0
        MOVS     R2,#+0
        MOV      R1,R4
        ADD      R0,SP,#+12
        BL       chk_mounted
        MOVS     R1,R0
        BNE.N    ??f_opendir_0
        BL       ?Subroutine14
??CrossCallReturnLabel_23:
        LDR      R1,[SP, #+12]
        MOV      R0,R4
        BL       follow_path
        MOVS     R1,R0
        BNE.N    ??CrossCallReturnLabel_10
        LDR      R1,[R4, #+20]
        CBZ      R1,??f_opendir_1
        LDRB     R2,[R1, #+11]
        TST      R2,#0x10
        BEQ.N    ??f_opendir_2
        LDRB     R2,[R1, #+21]
        LDRB     R3,[R1, #+20]
        ORR      R2,R3,R2, LSL #+8
        LDRB     R3,[R1, #+27]
        LDRB     R1,[R1, #+26]
        ORR      R1,R1,R3, LSL #+8
        ORR      R1,R1,R2, LSL #+16
        STR      R1,[R4, #+8]
        B.N      ??f_opendir_1
??f_opendir_2:
        MOVS     R0,#+5
??f_opendir_1:
        MOVS     R1,R0
        BNE.N    ??CrossCallReturnLabel_10
        LDR      R0,[R4, #+0]
        LDRH     R0,[R0, #+6]
        STRH     R0,[R4, #+4]
        BL       ?Subroutine3
??CrossCallReturnLabel_10:
        CMP      R0,#+4
        BNE.N    ??f_opendir_0
        MOVS     R0,#+5
??f_opendir_0:
        ADD      SP,SP,#+16
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine3:
        MOVS     R1,#+0
        MOV      R0,R4
        B.W      dir_seek

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
f_readdir:
        PUSH     {R1-R5,LR}
        MOV      R4,R0
        MOV      R5,R1
        BL       ?Subroutine16
??CrossCallReturnLabel_27:
        CMP      R0,#+0
        BNE.N    ??f_readdir_0
        BL       ?Subroutine14
??CrossCallReturnLabel_24:
        CBNZ     R5,??f_readdir_1
        BL       ?Subroutine3
??CrossCallReturnLabel_9:
        POP      {R1-R5,PC}
??f_readdir_1:
        MOV      R0,R4
        BL       dir_read
        CMP      R0,#+4
        BNE.N    ??f_readdir_2
        MOVS     R0,#+0
        STR      R0,[R4, #+16]
        B.N      ??f_readdir_3
??f_readdir_2:
        CMP      R0,#+0
        BNE.N    ??f_readdir_0
??f_readdir_3:
        MOV      R1,R5
        MOV      R0,R4
        BL       get_fileinfo
        BL       ?Subroutine0
??CrossCallReturnLabel_0:
        CMP      R0,#+4
        BNE.N    ??f_readdir_0
        MOVS     R0,#+0
        STR      R0,[R4, #+16]
??f_readdir_0:
        POP      {R1-R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine14:
        ADD      R0,SP,#+0
        STR      R0,[R4, #+24]
        LDR.N    R0,??Subroutine14_0  ;; LfnBuf
        STR      R0,[R4, #+28]
        BX       LR
        Nop      
        DATA
??Subroutine14_0:
        DC32     LfnBuf

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
f_stat:
        PUSH     {R0,R4,R5,LR}
        SUB      SP,SP,#+48
        MOV      R4,R1
        MOVS     R2,#+0
        ADD      R1,SP,#+12
        ADD      R0,SP,#+48
        BL       chk_mounted
        MOVS     R5,R0
        BNE.N    ??f_stat_0
        BL       ?Subroutine13
??CrossCallReturnLabel_22:
        MOVS     R5,R0
        BNE.N    ??f_stat_0
        LDR      R0,[SP, #+32]
        CBZ      R0,??f_stat_1
        MOV      R1,R4
        ADD      R0,SP,#+12
        BL       get_fileinfo
        B.N      ??f_stat_0
??f_stat_1:
        MOVS     R5,#+6
??f_stat_0:
        MOV      R0,R5
        ADD      SP,SP,#+52
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
f_getfree:
        PUSH     {R0,R4-R10,LR}
        SUB      SP,SP,#+4
        MOV      R9,R1
        MOV      R6,R2
        MOVS     R2,#+0
        MOV      R1,R6
        ADD      R0,SP,#+4
        BL       chk_mounted
        MOVS     R1,R0
        BNE.N    ??f_getfree_0
        LDR      R0,[R6, #+0]
        LDR      R1,[R0, #+28]
        SUBS     R1,R1,#+2
        LDR      R2,[R0, #+16]
        CMP      R1,R2
        BCC.N    ??f_getfree_1
        STR      R2,[R9, #+0]
        B.N      ??f_getfree_2
??f_getfree_1:
        LDRB     R7,[R0, #+0]
        MOVS     R4,#+0
        CMP      R7,#+1
        BNE.N    ??f_getfree_3
        MOVS     R5,#+2
        B.N      ??f_getfree_4
??f_getfree_5:
        CBNZ     R0,??f_getfree_6
        ADDS     R4,R4,#+1
??f_getfree_6:
        ADDS     R5,R5,#+1
        LDR      R0,[R6, #+0]
        LDR      R0,[R0, #+28]
        CMP      R5,R0
        BCS.N    ??f_getfree_7
??f_getfree_4:
        MOV      R1,R5
        LDR      R0,[R6, #+0]
        BL       get_fat
        MOV      R1,#-1
        CMP      R0,R1
        BNE.N    ??f_getfree_8
        MOVS     R0,#+1
        B.N      ??f_getfree_0
??f_getfree_8:
        CMP      R0,#+1
        BNE.N    ??f_getfree_5
        MOVS     R0,#+2
??f_getfree_0:
        POP      {R1,R2,R4-R10,PC}
??f_getfree_3:
        LDR      R5,[R0, #+28]
        LDR      R8,[R0, #+32]
        B.N      ??f_getfree_9
??f_getfree_10:
        CBNZ     R1,??f_getfree_11
??f_getfree_9:
        MOV      R1,R8
        LDR      R0,[R6, #+0]
        BL       move_window
        ADD      R8,R8,#+1
        MOVS     R1,R0
        BNE.N    ??f_getfree_0
        LDR      R0,[R6, #+0]
        ADDS     R0,R0,#+48
        MOV      R1,#+512
??f_getfree_11:
        LDRB     R3,[R0, #+1]
        ADDS     R2,R4,#+1
        LDRB     R12,[R0, #+0]
        CMP      R7,#+2
        BNE.N    ??f_getfree_12
        ORRS     R3,R12,R3, LSL #+8
        BNE.N    ??f_getfree_13
        MOV      R4,R2
??f_getfree_13:
        ADDS     R0,R0,#+2
        SUBS     R1,R1,#+2
        B.N      ??f_getfree_14
??f_getfree_12:
        LDRB     LR,[R0, #+3]
        LDRB     R10,[R0, #+2]
        LSL      R10,R10,#+16
        ORR      LR,R10,LR, LSL #+24
        ORR      R3,LR,R3, LSL #+8
        ORR      R3,R12,R3
        LSLS     R3,R3,#+4
        BNE.N    ??f_getfree_15
        MOV      R4,R2
??f_getfree_15:
        ADDS     R0,R0,#+4
        SUBS     R1,R1,#+4
??f_getfree_14:
        SUBS     R5,R5,#+1
        BNE.N    ??f_getfree_10
??f_getfree_7:
        LDR      R0,[R6, #+0]
        STR      R4,[R0, #+16]
        CMP      R7,#+3
        BNE.N    ??f_getfree_16
        MOVS     R1,#+1
        STRB     R1,[R0, #+5]
??f_getfree_16:
        STR      R4,[R9, #+0]
??f_getfree_2:
        MOVS     R0,#+0
??f_getfree_17:
        B.N      ??f_getfree_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
f_truncate:
        PUSH     {R4-R6,LR}
        BL       ?Subroutine6
??CrossCallReturnLabel_15:
        MOVS     R5,R0
        BEQ.N    ??f_truncate_0
??f_truncate_1:
        MOV      R0,R5
        POP      {R4-R6,PC}       ;; return
??f_truncate_0:
        LDRB     R0,[R4, #+6]
        TST      R0,#0x80
        BEQ.N    ??f_truncate_2
        MOVS     R0,#+2
        POP      {R4-R6,PC}
??f_truncate_2:
        TST      R0,#0x2
        BNE.N    ??f_truncate_3
        MOVS     R0,#+7
        POP      {R4-R6,PC}
??f_truncate_3:
        LDR      R1,[R4, #+8]
        LDR      R2,[R4, #+12]
        CMP      R1,R2
        BCS.N    ??f_truncate_1
        STR      R1,[R4, #+12]
        ORR      R0,R0,#0x20
        STRB     R0,[R4, #+6]
        LDR      R0,[R4, #+0]
        CBNZ     R1,??f_truncate_4
        LDR      R1,[R4, #+16]
        BL       remove_chain
        MOV      R5,R0
        MOVS     R0,#+0
        STR      R0,[R4, #+16]
        B.N      ??f_truncate_5
??f_truncate_4:
        LDR      R1,[R4, #+20]
        BL       get_fat
        MOV      R6,R0
        MOV      R0,#-1
        CMP      R6,R0
        BNE.N    ??f_truncate_6
        MOVS     R5,#+1
        B.N      ??f_truncate_7
??f_truncate_6:
        CMP      R6,#+1
        BNE.N    ??f_truncate_8
        MOVS     R5,#+2
        B.N      ??f_truncate_7
??f_truncate_8:
        LDR      R0,[R4, #+0]
        LDR      R1,[R0, #+28]
        CMP      R6,R1
        BCS.N    ??f_truncate_1
        MVN      R2,#-268435456
        LDR      R1,[R4, #+20]
        BL       put_fat
        MOVS     R5,R0
        BNE.N    ??f_truncate_5
        MOV      R1,R6
        LDR      R0,[R4, #+0]
        BL       remove_chain
        MOV      R5,R0
??f_truncate_5:
        CMP      R5,#+0
        BEQ.N    ??f_truncate_1
??f_truncate_7:
        LDRB     R0,[R4, #+6]
        ORR      R0,R0,#0x80
        STRB     R0,[R4, #+6]
        B.N      ??f_truncate_1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine6:
        MOV      R4,R0
        LDRH     R1,[R4, #+4]
        LDR      R0,[R4, #+0]
        B.W      validate

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
f_unlink:
        PUSH     {R0,R4,LR}
        SUB      SP,SP,#+84
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        ADD      R0,SP,#+84
        BL       chk_mounted
        MOVS     R1,R0
        BNE.N    ??f_unlink_0
??f_unlink_1:
        BL       ?Subroutine15
??CrossCallReturnLabel_26:
        LDR      R1,[SP, #+84]
        ADD      R0,SP,#+0
        BL       follow_path
        MOVS     R1,R0
        BNE.N    ??f_unlink_0
        LDR      R0,[SP, #+20]
        CMP      R0,#+0
        BNE.N    ??f_unlink_2
        MOVS     R0,#+6
??f_unlink_0:
        ADD      SP,SP,#+88
        POP      {R4,PC}
??f_unlink_2:
        LDRB     R1,[R0, #+11]
        TST      R1,#0x1
        BEQ.N    ??f_unlink_3
??f_unlink_4:
        MOVS     R0,#+7
        B.N      ??f_unlink_0
??f_unlink_3:
        LDRB     R2,[R0, #+21]
        LDRB     R3,[R0, #+20]
        ORR      R2,R3,R2, LSL #+8
        LDRB     R3,[R0, #+27]
        LDRB     R0,[R0, #+26]
        ORR      R0,R0,R3, LSL #+8
        ORR      R4,R0,R2, LSL #+16
        TST      R1,#0x10
        BEQ.N    ??f_unlink_5
        CMP      R4,#+2
        BCS.N    ??f_unlink_6
        MOVS     R0,#+2
        B.N      ??f_unlink_0
??f_unlink_6:
        MOVS     R2,#+36
        ADD      R1,SP,#+0
        ADD      R0,SP,#+48
        BL       mem_cpy
        STR      R4,[SP, #+56]
        MOVS     R1,#+2
        ADD      R0,SP,#+48
        BL       dir_seek
        MOVS     R1,R0
        BNE.N    ??f_unlink_0
        ADD      R0,SP,#+48
        BL       dir_read
        MOVS     R1,R0
        BEQ.N    ??f_unlink_4
        CMP      R0,#+4
        BNE.N    ??f_unlink_0
??f_unlink_5:
        ADD      R0,SP,#+0
        BL       dir_remove
        MOVS     R1,R0
        BNE.N    ??f_unlink_0
        CMP      R4,#+0
        BEQ.N    ??f_unlink_7
        MOV      R1,R4
        LDR      R0,[SP, #+0]
        BL       remove_chain
??f_unlink_7:
        MOVS     R1,R0
        BNE.N    ??f_unlink_0
        LDR      R0,[SP, #+0]
        BL       sync
        B.N      ??f_unlink_0

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine15:
        ADD      R0,SP,#+36
        STR      R0,[SP, #+24]
        LDR.N    R0,??Subroutine15_0  ;; LfnBuf
        STR      R0,[SP, #+28]
        BX       LR
        Nop      
        DATA
??Subroutine15_0:
        DC32     LfnBuf

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
f_mkdir:
        PUSH     {R0,R4-R11,LR}
        SUB      SP,SP,#+56
        MOVS     R2,#+1
        ADD      R1,SP,#+4
        ADD      R0,SP,#+56
        BL       chk_mounted
        MOV      R7,R0
        CBZ      R0,??f_mkdir_0
??f_mkdir_1:
        MOV      R0,R7
        ADD      SP,SP,#+60
        POP      {R4-R11,PC}      ;; return
??f_mkdir_0:
        ADD      R0,SP,#+40
        STR      R0,[SP, #+28]
        LDR.N    R0,??f_mkdir_2   ;; LfnBuf
        STR      R0,[SP, #+32]
        LDR      R1,[SP, #+56]
        ADD      R0,SP,#+4
        BL       follow_path
        MOV      R7,R0
        CBNZ     R0,??f_mkdir_3
        MOVS     R7,#+8
        B.N      ??f_mkdir_1
??f_mkdir_3:
        CMP      R0,#+4
        BNE.N    ??f_mkdir_1
        MOVS     R1,#+0
        LDR      R0,[SP, #+4]
        BL       create_chain
        MOVS     R4,R0
        BNE.N    ??f_mkdir_4
        MOVS     R7,#+7
??f_mkdir_5:
        CMP      R7,#+0
        BNE.N    ??f_mkdir_6
??f_mkdir_7:
        MOVS     R1,#+0
        LDR      R0,[SP, #+4]
        BL       move_window
        MOV      R7,R0
??f_mkdir_6:
        CMP      R7,#+0
        BNE.N    ??f_mkdir_1
        MOV      R1,R4
        LDR      R0,[SP, #+4]
        BL       clust2sect
        MOV      R8,R0
        LDR      R0,[SP, #+4]
        ADD      R5,R0,#+48
        BL       ?Subroutine5
??CrossCallReturnLabel_62:
        MOVS     R2,#+11
        MOVS     R1,#+32
        MOV      R0,R5
        BL       mem_set
        MOVS     R0,#+46
        STRB     R0,[R5, #+0]
        MOVS     R0,#+16
        STRB     R0,[R5, #+11]
        BL       get_fattime
        MOV      R6,R0
        STRB     R6,[R5, #+22]
        LSLS     R0,R0,#+16
        LSRS     R0,R0,#+24
        STRB     R0,[SP, #+1]
        BL       ?Subroutine20
??CrossCallReturnLabel_37:
        LSLS     R0,R4,#+16
        LSRS     R0,R0,#+24
        STRB     R0,[SP, #+0]
        STRB     R0,[R5, #+27]
        LSR      R10,R4,#+16
        STRB     R10,[R5, #+20]
        LSR      R11,R10,#+8
        STRB     R11,[R5, #+21]
        MOVS     R2,#+32
        MOV      R1,R5
        ADD      R0,R5,#+32
        BL       mem_cpy
        MOVS     R0,#+46
        STRB     R0,[R5, #+33]
        LDR      R0,[SP, #+12]
        LDR      R1,[SP, #+4]
        LDRB     R1,[R1, #+0]
        CMP      R1,#+3
        BNE.N    ??f_mkdir_8
        LDR      R1,[SP, #+4]
        LDR      R1,[R1, #+36]
        CMP      R0,R1
        BNE.N    ??f_mkdir_8
        MOVS     R0,#+0
??f_mkdir_8:
        ADD      R1,R5,#+33
        STRB     R0,[R1, #+25]
        LSLS     R2,R0,#+16
        LSRS     R2,R2,#+24
        STRB     R2,[R1, #+26]
        LSRS     R0,R0,#+16
        STRB     R0,[R1, #+19]
        LSRS     R0,R0,#+8
        STRB     R0,[R1, #+20]
        MOV      R9,#+0
        B.N      ??f_mkdir_9
??f_mkdir_4:
        CMP      R4,#+1
        BNE.N    ??f_mkdir_10
        MOVS     R7,#+2
        B.N      ??f_mkdir_5
??f_mkdir_10:
        MOV      R0,#-1
        CMP      R4,R0
        BNE.N    ??f_mkdir_7
        MOVS     R7,#+1
??f_mkdir_11:
        B.N      ??f_mkdir_1
??f_mkdir_12:
        LDR      R0,[SP, #+4]
        STR      R8,[R0, #+44]
        ADD      R8,R8,#+1
        LDR      R0,[SP, #+4]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
        MOVS     R1,#+0
        LDR      R0,[SP, #+4]
        BL       move_window
        MOV      R7,R0
        CMP      R0,#+0
        BNE.N    ??f_mkdir_11
        BL       ?Subroutine5
??CrossCallReturnLabel_61:
        ADD      R0,R9,#+1
        UXTB     R9,R0
??f_mkdir_9:
        LDR      R1,[SP, #+4]
        LDRB     R1,[R1, #+2]
        CMP      R9,R1
        BCC.N    ??f_mkdir_12
        ADD      R0,SP,#+4
        BL       dir_register
        MOV      R7,R0
        CBZ      R0,??f_mkdir_13
        MOV      R1,R4
        LDR      R0,[SP, #+4]
        BL       remove_chain
        B.N      ??f_mkdir_1
??f_mkdir_13:
        LDR      R5,[SP, #+24]
        MOVS     R0,#+16
        STRB     R0,[R5, #+11]
        STRB     R6,[R5, #+22]
        LDRB     R0,[SP, #+1]
        BL       ?Subroutine20
??CrossCallReturnLabel_38:
        LDRB     R0,[SP, #+0]
        STRB     R0,[R5, #+27]
        STRB     R10,[R5, #+20]
        STRB     R11,[R5, #+21]
        LDR      R0,[SP, #+4]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
        LDR      R0,[SP, #+4]
        BL       sync
        MOV      R7,R0
        B.N      ??f_mkdir_1
        DATA
??f_mkdir_2:
        DC32     LfnBuf

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine20:
        STRB     R0,[R5, #+23]
        LSRS     R0,R6,#+16
        STRB     R0,[R5, #+24]
        LSRS     R0,R6,#+24
        STRB     R0,[R5, #+25]
        STRB     R4,[R5, #+26]
        BX       LR

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine5:
        MOV      R2,#+512
        REQUIRE ??Subroutine25_0
        ;; // Fall through to label ??Subroutine25_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
??Subroutine25_0:
        MOVS     R1,#+0
        MOV      R0,R5
        B.W      mem_set

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
f_chmod:
        PUSH     {R0,R4,R5,LR}
        SUB      SP,SP,#+48
        MOV      R4,R1
        MOV      R5,R2
        MOVS     R2,#+1
        ADD      R1,SP,#+12
        ADD      R0,SP,#+48
        BL       chk_mounted
        CMP      R0,#+0
        BNE.N    ??CrossCallReturnLabel_20
        BL       ?Subroutine13
??CrossCallReturnLabel_21:
        CMP      R0,#+0
        BNE.N    ??CrossCallReturnLabel_20
        LDR      R0,[SP, #+32]
        CMP      R0,#+0
        BNE.N    ??f_chmod_0
        MOVS     R0,#+6
        B.N      ??CrossCallReturnLabel_20
??f_chmod_0:
        AND      R5,R5,#0x27
        AND      R1,R5,R4
        LDRB     R2,[R0, #+11]
        MVNS     R3,R5
        ANDS     R2,R3,R2
        ORRS     R1,R2,R1
        STRB     R1,[R0, #+11]
        BL       ?Subroutine12
??CrossCallReturnLabel_20:
        ADD      SP,SP,#+52
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
?Subroutine13:
        ADD      R0,SP,#+0
        STR      R0,[SP, #+36]
        LDR.N    R0,??Subroutine13_0  ;; LfnBuf
        STR      R0,[SP, #+40]
        LDR      R1,[SP, #+48]
        ADD      R0,SP,#+12
        B.W      follow_path
        DATA
??Subroutine13_0:
        DC32     LfnBuf

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
f_utime:
        PUSH     {R0,R4,LR}
        SUB      SP,SP,#+52
        MOV      R4,R1
        MOVS     R2,#+1
        ADD      R1,SP,#+12
        ADD      R0,SP,#+52
        BL       chk_mounted
        CMP      R0,#+0
        BNE.N    ??CrossCallReturnLabel_19
        ADD      R0,SP,#+0
        STR      R0,[SP, #+36]
        LDR.N    R0,??f_utime_0   ;; LfnBuf
        STR      R0,[SP, #+40]
        LDR      R1,[SP, #+52]
        ADD      R0,SP,#+12
        BL       follow_path
        CMP      R0,#+0
        BNE.N    ??CrossCallReturnLabel_19
        LDR      R0,[SP, #+32]
        CMP      R0,#+0
        BNE.N    ??f_utime_1
        MOVS     R0,#+6
        B.N      ??CrossCallReturnLabel_19
??f_utime_1:
        LDRH     R1,[R4, #+6]
        STRB     R1,[R0, #+22]
        LDRH     R1,[R4, #+6]
        LSRS     R1,R1,#+8
        STRB     R1,[R0, #+23]
        LDRH     R1,[R4, #+4]
        STRB     R1,[R0, #+24]
        LDRH     R1,[R4, #+4]
        LSRS     R1,R1,#+8
        STRB     R1,[R0, #+25]
        BL       ?Subroutine12
??CrossCallReturnLabel_19:
        ADD      SP,SP,#+56
        POP      {R4,PC}          ;; return
        Nop      
        DATA
??f_utime_0:
        DC32     LfnBuf

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine12:
        LDR      R0,[SP, #+12]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
        LDR      R0,[SP, #+12]
        B.W      sync

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
f_rename:
        PUSH     {R0,R4,R5,LR}
        SUB      SP,SP,#+112
        MOV      R4,R1
        ADD      R0,SP,#+96
        STR      R0,[SP, #+60]
        LDR.N    R0,??f_rename_0  ;; LfnBuf
        STR      R0,[SP, #+64]
        MOVS     R2,#+1
        ADD      R1,SP,#+36
        ADD      R0,SP,#+112
        BL       chk_mounted
        MOVS     R5,R0
        BNE.N    ??f_rename_1
        LDR      R0,[SP, #+36]
        STR      R0,[SP, #+0]
        LDR      R1,[SP, #+112]
        ADD      R0,SP,#+36
        BL       follow_path
        MOV      R5,R0
??f_rename_1:
        MOVS     R0,R5
        BEQ.N    ??f_rename_2
??f_rename_3:
        MOV      R0,R5
        B.N      ??f_rename_4
??f_rename_2:
        LDR      R0,[SP, #+56]
        CMP      R0,#+0
        BNE.N    ??f_rename_5
        MOVS     R0,#+4
??f_rename_4:
        ADD      SP,SP,#+116
        POP      {R4,R5,PC}
??f_rename_5:
        MOVS     R2,#+21
        ADD      R1,R0,#+11
        ADD      R0,SP,#+72
        BL       mem_cpy
        MOVS     R2,#+36
        ADD      R1,SP,#+36
        ADD      R0,SP,#+0
        BL       mem_cpy
        MOV      R1,R4
        ADD      R0,SP,#+0
        BL       follow_path
        MOVS     R5,R0
        BNE.N    ??f_rename_6
        MOVS     R5,#+8
        B.N      ??f_rename_3
??f_rename_6:
        CMP      R0,#+4
        BNE.N    ??f_rename_3
        ADD      R0,SP,#+0
        BL       dir_register
        MOVS     R5,R0
        BNE.N    ??f_rename_3
        LDR      R4,[SP, #+20]
        MOVS     R2,#+19
        ADD      R1,SP,#+74
        ADD      R0,R4,#+13
        BL       mem_cpy
        LDRB     R0,[SP, #+72]
        ORR      R0,R0,#0x20
        STRB     R0,[R4, #+11]
        LDR      R0,[SP, #+36]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
        LDRB     R0,[R4, #+11]
        TST      R0,#0x10
        BEQ.N    ??f_rename_7
        LDRB     R0,[R4, #+21]
        LDRB     R1,[R4, #+20]
        ORR      R0,R1,R0, LSL #+8
        LDRB     R1,[R4, #+27]
        LDRB     R2,[R4, #+26]
        ORR      R1,R2,R1, LSL #+8
        ORRS     R1,R1,R0
        LDR      R0,[SP, #+0]
        BL       clust2sect
        CMP      R0,#+0
        BNE.N    ??f_rename_8
        MOVS     R5,#+2
        B.N      ??f_rename_7
??f_rename_8:
        MOV      R1,R0
        LDR      R0,[SP, #+0]
        BL       move_window
        MOV      R5,R0
        LDR      R0,[SP, #+0]
        ADD      R4,R0,#+80
        MOVS     R0,R5
        BNE.N    ??f_rename_7
        LDRB     R0,[R4, #+1]
        CMP      R0,#+46
        BNE.N    ??f_rename_7
        LDR      R0,[SP, #+8]
        LDR      R1,[SP, #+0]
        LDRB     R1,[R1, #+0]
        CMP      R1,#+3
        BNE.N    ??f_rename_9
        LDR      R1,[SP, #+0]
        LDR      R1,[R1, #+36]
        CMP      R0,R1
        BNE.N    ??f_rename_9
        MOVS     R0,#+0
??f_rename_9:
        STRB     R0,[R4, #+26]
        LSLS     R1,R0,#+16
        LSRS     R1,R1,#+24
        STRB     R1,[R4, #+27]
        LSRS     R0,R0,#+16
        STRB     R0,[R4, #+20]
        LSRS     R0,R0,#+8
        STRB     R0,[R4, #+21]
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
??f_rename_7:
        MOVS     R0,R5
        BNE.N    ??f_rename_3
        ADD      R0,SP,#+36
        BL       dir_remove
        MOVS     R5,R0
        BNE.N    ??f_rename_3
        LDR      R0,[SP, #+36]
        BL       sync
        MOV      R5,R0
        B.N      ??f_rename_3
        Nop      
        DATA
??f_rename_0:
        DC32     LfnBuf

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
f_gets:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+8
        MOV      R4,R0
        MOV      R5,R1
        MOV      R8,R2
        MOVS     R7,#+0
        MOV      R6,R4
??f_gets_0:
        SUBS     R0,R5,#+1
        CMP      R7,R0
        BGE.N    ??f_gets_1
        ADD      R3,SP,#+0
        MOVS     R2,#+1
        MOV      R1,R6
        MOV      R0,R8
        BL       f_read
        LDR      R0,[SP, #+0]
        CMP      R0,#+1
        BNE.N    ??f_gets_1
        ADDS     R7,R7,#+1
        LDRB     R0,[R6], #+1
        CMP      R0,#+10
        BNE.N    ??f_gets_0
??f_gets_1:
        MOVS     R0,#+0
        STRB     R0,[R6, #+0]
        CBZ      R7,??f_gets_2
        MOV      R0,R4
??f_gets_2:
        POP      {R1,R2,R4-R8,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
f_putc:
        PUSH     {R2-R4,LR}
        MOV      R4,R0
        MOVS     R0,R1
        BEQ.N    ??f_putc_0
        ADD      R1,SP,#+4
        STRB     R4,[R1, #+0]
        ADD      R3,SP,#+0
        MOVS     R2,#+1
        BL       f_write
        LDR      R0,[SP, #+0]
        CBNZ     R0,??f_putc_0
        MOV      R4,#-1
??f_putc_0:
        MOV      R0,R4
        POP      {R1,R2,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
f_puts:
        PUSH     {R4-R6,LR}
        MOV      R5,R0
        MOV      R4,R1
        MOVS     R6,#+0
        B.N      ??f_puts_0
??f_puts_1:
        ADDS     R6,R6,#+1
??f_puts_0:
        LDRB     R0,[R5, #+0]
        CMP      R0,#+0
        BEQ.N    ??f_puts_2
        MOV      R1,R4
        LDRB     R0,[R5], #+1
        BL       f_putc
        MOV      R1,#-1
        CMP      R0,R1
        BNE.N    ??f_puts_1
        MOV      R0,R1
        POP      {R4-R6,PC}
??f_puts_2:
        MOV      R0,R6
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
f_printf:
        PUSH     {R2,R3}
        PUSH     {R4-R9,LR}
        SUB      SP,SP,#+20
        MOV      R5,R0
        MOV      R6,R1
        ADD      R8,SP,#+48
        MOVS     R4,#+0
        ADD      R7,SP,#+0
??f_printf_0:
        LDRB     R0,[R6], #+1
        MOVS     R1,R0
        BEQ.N    ??f_printf_1
        CMP      R0,#+37
        BEQ.N    ??f_printf_2
??f_printf_3:
        MOV      R1,R5
        BL       f_putc
        MOV      R1,#-1
        CMP      R0,R1
        BEQ.N    ??f_printf_4
        MOVS     R0,#+1
        B.N      ??f_printf_4
??f_printf_2:
        MOVS     R1,#+0
        MOVS     R3,#+0
        LDRB     R0,[R6], #+1
        CMP      R0,#+48
        BNE.N    ??f_printf_5
        MOVS     R1,#+1
        B.N      ??f_printf_6
??f_printf_7:
        MOVS     R2,#+10
        MLA      R0,R3,R2,R0
        SUB      R3,R0,#+48
??f_printf_6:
        LDRB     R0,[R6], #+1
??f_printf_5:
        CMP      R0,#+48
        BCC.N    ??f_printf_8
        CMP      R0,#+58
        BCC.N    ??f_printf_7
??f_printf_8:
        CMP      R0,#+108
        BNE.N    ??f_printf_9
        ORR      R1,R1,#0x2
        LDRB     R0,[R6], #+1
??f_printf_9:
        CMP      R0,#+115
        BNE.N    ??f_printf_10
        LDR      R0,[R8], #+4
        MOV      R1,R5
        BL       f_puts
        B.N      ??f_printf_4
??f_printf_10:
        CMP      R0,#+99
        BNE.N    ??f_printf_11
        LDR      R0,[R8], #+4
        B.N      ??f_printf_3
??f_printf_11:
        MOV      R12,#+0
        CMP      R0,#+100
        BNE.N    ??f_printf_12
        MOV      R12,#+10
??f_printf_12:
        CMP      R0,#+117
        BNE.N    ??f_printf_13
        MOV      R12,#+10
??f_printf_13:
        CMP      R0,#+88
        BNE.N    ??f_printf_14
        MOV      R12,#+16
        B.N      ??f_printf_15
??f_printf_14:
        CMP      R12,#+0
??f_printf_1:
        BEQ.N    ??f_printf_16
??f_printf_15:
        LDR      LR,[R8], #+4
        CMP      R0,#+100
        BNE.N    ??f_printf_17
        TST      LR,#0x80000000
        BEQ.N    ??f_printf_17
        RSB      LR,LR,#+0
        ORR      R1,R1,#0x4
        UXTB     R1,R1
??f_printf_17:
        MOVS     R2,#+15
        MOVS     R0,#+0
        STRB     R0,[R7, #+15]
??f_printf_18:
        UDIV     R9,LR,R12
        MLS      R0,R9,R12,LR
        ADDS     R0,R0,#+48
        UXTB     R0,R0
        CMP      R0,#+58
        BCC.N    ??f_printf_19
        ADDS     R0,R0,#+7
        UXTB     R0,R0
??f_printf_19:
        SUBS     R2,R2,#+1
        STRB     R0,[R2, R7]
        MOV      LR,R9
        BEQ.N    ??f_printf_20
        CMP      LR,#+0
        BNE.N    ??f_printf_18
        TST      R1,#0x4
        BEQ.N    ??f_printf_20
        SUBS     R2,R2,#+1
        MOVS     R0,#+45
        STRB     R0,[R2, R7]
??f_printf_20:
        RSB      R3,R3,#+15
        B.N      ??f_printf_21
??f_printf_22:
        MOVS     R0,#+32
??f_printf_23:
        STRB     R0,[R12, R7]
??f_printf_21:
        CBZ      R2,??f_printf_24
        CMP      R3,R2
        BGE.N    ??f_printf_24
        SUB      R12,R2,#+1
        MOV      R2,R12
        TST      R1,#0x1
        BEQ.N    ??f_printf_22
        MOVS     R0,#+48
        B.N      ??f_printf_23
??f_printf_24:
        MOV      R1,R5
        ADD      R0,SP,#+0
        ADDS     R0,R2,R0
        BL       f_puts
??f_printf_4:
        ADDS     R4,R0,R4
        MOV      R1,#-1
        CMP      R0,R1
        BNE.W    ??f_printf_0
        MOV      R0,R1
        B.N      ??f_printf_25
??f_printf_16:
        MOV      R0,R4
??f_printf_25:
        ADD      SP,SP,#+20
        POP      {R4-R9}
        LDR      PC,[SP], #+12    ;; return

        END
// 
//   520 bytes in section .bss
//   164 bytes in section .rodata
// 7 918 bytes in section .text
// 
// 7 918 bytes of CODE  memory
//   164 bytes of CONST memory
//   520 bytes of DATA  memory
//
//Errors: none
//Warnings: 1
