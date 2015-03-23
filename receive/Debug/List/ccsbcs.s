///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V5.30.2.51295/W32 for ARM    11/Apr/2011  13:51:27 /
// Copyright 1999-2009 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\LiYang\Desktop\newest\Demo\fatfs\ccsbcs.c      /
//    Command line =  C:\Users\LiYang\Desktop\newest\Demo\fatfs\ccsbcs.c -lC  /
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
//                    ug\List\ccsbcs.s                                        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ccsbcs

        PUBLIC ff_convert
        PUBLIC ff_wtoupper


        SECTION `.rodata`:CONST:NOROOT(2)
Tbl:
        DATA
        DC16 199, 252, 233, 226, 228, 224, 229, 231, 234, 235, 232, 239, 238
        DC16 236, 196, 197, 201, 230, 198, 244, 246, 242, 251, 249, 255, 214
        DC16 220, 162, 163, 165, 8359, 402, 225, 237, 243, 250, 241, 209, 170
        DC16 186, 191, 8976, 172, 189, 188, 161, 171, 187, 9617, 9618, 9619
        DC16 9474, 9508, 9569, 9570, 9558, 9557, 9571, 9553, 9559, 9565, 9564
        DC16 9563, 9488, 9492, 9524, 9516, 9500, 9472, 9532, 9566, 9567, 9562
        DC16 9556, 9577, 9574, 9568, 9552, 9580, 9575, 9576, 9572, 9573, 9561
        DC16 9560, 9554, 9555, 9579, 9578, 9496, 9484, 9608, 9604, 9612, 9616
        DC16 9600, 945, 223, 915, 960, 931, 963, 181, 964, 934, 920, 937, 948
        DC16 8734, 966, 949, 8745, 8801, 177, 8805, 8804, 8992, 8993, 247, 8776
        DC16 176, 8729, 183, 8730, 8319, 178, 9632, 160

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
ff_convert:
        CMP      R0,#+128
        BCC.N    ??ff_convert_0
        LDR.N    R2,??ff_convert_1  ;; Tbl
        CBZ      R1,??ff_convert_2
        MOV      R1,#+256
        CMP      R0,R1
        BCC.N    ??ff_convert_3
        MOVS     R0,#+0
        BX       LR
??ff_convert_3:
        ADD      R0,R2,R0, LSL #+1
        SUB      R0,R0,#+256
        LDRH     R0,[R0, #+0]
        BX       LR
??ff_convert_2:
        LDRH     R3,[R2, R1, LSL #+1]
        CMP      R0,R3
        BEQ.N    ??ff_convert_4
        ADDS     R1,R1,#+1
        UXTH     R1,R1
        CMP      R1,#+128
        BCC.N    ??ff_convert_2
??ff_convert_4:
        ADD      R0,R1,#+128
        UXTB     R0,R0
??ff_convert_0:
        BX       LR               ;; return
        DATA
??ff_convert_1:
        DC32     Tbl

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
ff_wtoupper:
        MOVS     R1,#+0
        LDR.N    R2,??ff_wtoupper_0  ;; ??tbl_lower
        B.N      ??ff_wtoupper_1
??ff_wtoupper_2:
        ADDS     R1,R1,#+1
??ff_wtoupper_1:
        LDRH     R3,[R2, R1, LSL #+1]
        CBZ      R3,??ff_wtoupper_3
        CMP      R0,R3
        BNE.N    ??ff_wtoupper_2
        ADD      R0,R2,R1, LSL #+1
        LDRH     R0,[R0, #+480]
??ff_wtoupper_3:
        BX       LR               ;; return
        DATA
??ff_wtoupper_0:
        DC32     ??tbl_lower

        SECTION `.rodata`:CONST:NOROOT(2)
??tbl_lower:
        DATA
        DC16 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110
        DC16 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 161
        DC16 162, 163, 165, 172, 175, 224, 225, 226, 227, 228, 229, 230, 231
        DC16 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244
        DC16 245, 246, 248, 249, 250, 251, 252, 253, 254, 255, 257, 259, 261
        DC16 263, 265, 267, 269, 271, 273, 275, 277, 279, 281, 283, 285, 287
        DC16 289, 291, 293, 295, 297, 299, 301, 303, 305, 307, 309, 311, 314
        DC16 316, 318, 320, 322, 324, 326, 328, 331, 333, 335, 337, 339, 341
        DC16 343, 345, 347, 349, 351, 353, 355, 357, 359, 361, 363, 365, 367
        DC16 369, 371, 373, 375, 378, 380, 382, 402, 945, 946, 947, 948, 949
        DC16 950, 951, 952, 953, 954, 955, 956, 957, 958, 959, 960, 961, 963
        DC16 964, 965, 966, 967, 968, 969, 970, 1072, 1073, 1074, 1075, 1076
        DC16 1077, 1078, 1079, 1080, 1081, 1082, 1083, 1084, 1085, 1086, 1087
        DC16 1088, 1089, 1090, 1091, 1092, 1093, 1094, 1095, 1096, 1097, 1098
        DC16 1099, 1100, 1101, 1102, 1103, 1105, 1106, 1107, 1108, 1109, 1110
        DC16 1111, 1112, 1113, 1114, 1115, 1116, 1118, 1119, 8560, 8561, 8562
        DC16 8563, 8564, 8565, 8566, 8567, 8568, 8569, 8570, 8571, 8572, 8573
        DC16 8574, 8575, 65345, 65346, 65347, 65348, 65349, 65350, 65351, 65352
        DC16 65353, 65354, 65355, 65356, 65357, 65358, 65359, 65360, 65361
        DC16 65362, 65363, 65364, 65365, 65366, 65367, 65368, 65369, 65370, 0
        DC16 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81
        DC16 82, 83, 84, 85, 86, 87, 88, 89, 90, 33, 65504, 65505, 65509, 65506
        DC16 65507, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203
        DC16 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 216, 217
        DC16 218, 219, 220, 221, 222, 376, 256, 258, 260, 262, 264, 266, 268
        DC16 270, 272, 274, 276, 278, 280, 282, 284, 286, 288, 290, 292, 294
        DC16 296, 298, 300, 302, 304, 306, 308, 310, 313, 315, 317, 319, 321
        DC16 323, 325, 327, 330, 332, 334, 336, 338, 340, 342, 344, 346, 348
        DC16 350, 352, 354, 356, 358, 360, 362, 364, 366, 368, 370, 372, 374
        DC16 377, 379, 381, 401, 913, 914, 915, 916, 917, 918, 919, 920, 921
        DC16 922, 923, 924, 925, 926, 927, 928, 929, 931, 932, 933, 934, 935
        DC16 936, 937, 938, 1040, 1041, 1042, 1043, 1044, 1045, 1046, 1047
        DC16 1048, 1049, 1050, 1051, 1052, 1053, 1054, 1055, 1056, 1057, 1058
        DC16 1059, 1060, 1061, 1062, 1063, 1064, 1065, 1066, 1067, 1068, 1069
        DC16 1070, 1071, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033
        DC16 1034, 1035, 1036, 1038, 1039, 8544, 8545, 8546, 8547, 8548, 8549
        DC16 8550, 8551, 8552, 8553, 8554, 8555, 8556, 8557, 8558, 8559, 65313
        DC16 65314, 65315, 65316, 65317, 65318, 65319, 65320, 65321, 65322
        DC16 65323, 65324, 65325, 65326, 65327, 65328, 65329, 65330, 65331
        DC16 65332, 65333, 65334, 65335, 65336, 65337, 65338, 0

        END
// 
// 1 216 bytes in section .rodata
//    92 bytes in section .text
// 
//    92 bytes of CODE  memory
// 1 216 bytes of CONST memory
//
//Errors: none
//Warnings: none
