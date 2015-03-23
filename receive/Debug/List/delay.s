///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.2.51295/W32 for ARM    11/Apr/2011  13:51:27 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\LiYang\Desktop\newest\Demo\source\delay.c      /
//    Command line =  C:\Users\LiYang\Desktop\newest\Demo\source\delay.c -lC  /
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
//                    ug\List\delay.s                                         /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME delay

        PUBLIC delay_us


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
delay_us:
??delay_us_0:
        MOV      R1,R0
        SUBS     R0,R1,#+1
        CMP      R1,#+0
        BNE.N    ??delay_us_0
        BX       LR               ;; return

        END
// 
// 10 bytes in section .text
// 
// 10 bytes of CODE memory
//
//Errors: none
//Warnings: none
