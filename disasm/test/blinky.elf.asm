
Disassembly of blinky.out:

DATA Section .cinit (Little Endian), 0x20 words at 0x000820f4 
000820f4   0001    .word 0x0001
000820f5   00db    .word 0x00db
000820f6   0001    .word 0x0001
000820f7   0000    .word 0x0000
000820f8   0002    .word 0x0002
000820f9   20e5    .word 0x20e5
000820fa   0008    .word 0x0008
000820fb   0010    .word 0x0010
000820fc   0001    .word 0x0001
000820fd   0003    .word 0x0003
000820fe   fff0    .word 0xfff0
000820ff   0000    .word 0x0000
00082100        __TI_Handler_Table_Base:
00082100   20b9    .word 0x20b9
00082101   0008    .word 0x0008
00082102   2000    .word 0x2000
00082103   0008    .word 0x0008
00082104   20e6    .word 0x20e6
00082105   0008    .word 0x0008
00082106        __TI_Handler_Table_Limit:
00082106   0000    .word 0x0000
00082107   0000    .word 0x0000
00082108   0001    .word 0x0001
00082109   0000    .word 0x0000
0008210a   0000    .word 0x0000
0008210b   0000    .word 0x0000
0008210c        __TI_CINIT_Base:
0008210c   20f4    .word 0x20f4
0008210d   0008    .word 0x0008
0008210e   0122    .word 0x0122
0008210f   0000    .word 0x0000
00082110   2106    .word 0x2106
00082111   0008    .word 0x0008
00082112   a800    .word 0xa800
00082113   0000    .word 0x0000

TEXT Section .text (Little Endian), 0xf1 words at 0x00082000 
00082000        __TI_decompress_lzss:
00082000   aabd   MOVL         *SP++, XAR2
00082001        $C$L1:
00082001   2f84   MOV          PH, *XAR4++
00082002   2bab   MOV          PL, #0
00082003   6f18   SB           24, UNC
00082004        $C$L2:
00082004   a0a9   MOVL         ACC, XAR5
00082005   01a0   SUBU         ACC, AR0
00082006   1901   SUBB         ACC, #1
00082007   1ea7   MOVL         XAR7, ACC
00082008   de81   SUBB         XAR6, #1
00082009        $C$L3:
00082009   5887   MOVZ         AR0, *XAR7++
0008200a   0200   MOVB         ACC, #0
0008200b   de81   SUBB         XAR6, #1
0008200c   1901   SUBB         ACC, #1
0008200d   7885   MOV          *XAR5++, AR0
0008200e   0fa6   CMPL         ACC, XAR6
0008200f   60fa   SB           -6, NEQ
00082010   6f03   SB           3, UNC
00082011        $C$L4:
00082011   9284   MOV          AL, *XAR4++
00082012   9685   MOV          *XAR5++, AL
00082013        $C$L5:
00082013   92aa   MOV          AL, PH
00082014   ffc0   LSR          AL, 1
00082015   2fa9   MOV          PH, AL
00082016   92ab   MOV          AL, PL
00082017   9c01   ADDB         AL, #1
00082018   27a9   MOV          PL, AL
00082019   5210   CMPB         AL, #0x10
0008201a   63e7   SB           -25, GEQ
0008201b        $C$L6:
0008201b   40aa   TBIT         PH, #0x0
0008201c   6df5   SB           -11, TC
0008201d   9284   MOV          AL, *XAR4++
0008201e   cda9   AND          AH, AL, #0xf
0008201f   000f
00082020   9d02   ADDB         AH, #2
00082021   ffc3   LSR          AL, 4
00082022   88a8   MOVZ         AR6, AH
00082023   58a9   MOVZ         AR0, AL
00082024   5311   CMPB         AH, #0x11
00082025   6004   SB           4, NEQ
00082026   06a6   MOVL         ACC, XAR6
00082027   0d84   ADDU         ACC, *XAR4++
00082028   1ea6   MOVL         XAR6, ACC
00082029        $C$L7:
00082029   5aa0   MOVZ         AR2, @AR0
0008202a   76c0   MOVL         XAR7, #0x000fff
0008202b   0fff
0008202c   06a7   MOVL         ACC, XAR7
0008202d   0fa2   CMPL         ACC, XAR2
0008202e   60d6   SB           -42, NEQ
0008202f   86be   MOVL         XAR2, *--SP
00082030   0006   LRETR        
00082031        __TI_auto_init_nobinit_nopinit:
00082031   b2bd   MOVL         *SP++, XAR1
00082032   8f08   MOVL         XAR4, #0x082106
00082033   2106
00082034   aabd   MOVL         *SP++, XAR2
00082035   a8a9   MOVL         ACC, XAR4
00082036   a2bd   MOVL         *SP++, XAR3
00082037   8dc8   MOVL         XAR3, #0x082100
00082038   2100
00082039   0fa3   CMPL         ACC, XAR3
0008203a   611c   SB           28, EQ
0008203b   8f08   MOVL         XAR4, #0x082114
0008203c   2114
0008203d   8d48   MOVL         XAR1, #0x08210c
0008203e   210c
0008203f   a8a9   MOVL         ACC, XAR4
00082040   0fa1   CMPL         ACC, XAR1
00082041   6115   SB           21, EQ
00082042   03a1   SUBL         ACC, XAR1
00082043   3b01   SETC         SXM
00082044   ff41   SFR          ACC, 2
00082045   1901   SUBB         ACC, #1
00082046   86a9   MOVL         XAR2, ACC
00082047        $C$L11:
00082047   8a81   MOVL         XAR4, *XAR1++
00082048   3b01   SETC         SXM
00082049   9284   MOV          AL, *XAR4++
0008204a   5603   MOV          ACC, AL << 1
0008204b   01a9
0008204c   07a3   ADDL         ACC, XAR3
0008204d   83a9   MOVL         XAR5, ACC
0008204e   c5c5   MOVL         XAR7, *+XAR5[0]
0008204f   8381   MOVL         XAR5, *XAR1++
00082050   3e67   LCR          *XAR7
00082051   da81   SUBB         XAR2, #1
00082052   0200   MOVB         ACC, #0
00082053   1901   SUBB         ACC, #1
00082054   0fa2   CMPL         ACC, XAR2
00082055   60f2   SB           -14, NEQ
00082056        $C$L12:
00082056   7648   LCR          0x0820f0
00082057   20f0
00082058   82be   MOVL         XAR3, *--SP
00082059   86be   MOVL         XAR2, *--SP
0008205a   8bbe   MOVL         XAR1, *--SP
0008205b   0006   LRETR        
0008205c        abort:
0008205c        C$$EXIT:
0008205c   7700   NOP          
0008205d        $C$L1:
0008205d   6f00   SB           0, UNC
0008205e        exit:
0008205e   b2bd   MOVL         *SP++, XAR1
0008205f   761f   MOVW         DP, #0x4
00082060   0004
00082061   59a9   MOVZ         AR1, AL
00082062   9222   MOV          AL, @0x22
00082063   610d   SB           13, EQ
00082064   28ab   MOV          PL, #0xffff
00082065   ffff
00082066   28aa   MOV          PH, #0xffff
00082067   ffff
00082068   28a9   MOV          AL, #0xffff
00082069   ffff
0008206a   28a8   MOV          AH, #0xffff
0008206b   ffff
0008206c   0fab   CMPL         ACC, P
0008206d   6103   SB           3, EQ
0008206e   767f   LCR          0x3fffff
0008206f   ffff
00082070        $C$L2:
00082070   761f   MOVW         DP, #0x4
00082071   0004
00082072   c528   MOVL         XAR7, @0x28
00082073   3e67   LCR          *XAR7
00082074   761f   MOVW         DP, #0x4
00082075   0004
00082076   0626   MOVL         ACC, @0x26
00082077   6104   SB           4, EQ
00082078   1ea7   MOVL         XAR7, ACC
00082079   92a1   MOV          AL, AR1
0008207a   3e67   LCR          *XAR7
0008207b        $C$L3:
0008207b   761f   MOVW         DP, #0x4
0008207c   0004
0008207d   0624   MOVL         ACC, @0x24
0008207e   6103   SB           3, EQ
0008207f   1ea7   MOVL         XAR7, ACC
00082080   3e67   LCR          *XAR7
00082081        $C$L4:
00082081   7648   LCR          0x08205c
00082082   205c
00082083   8bbe   MOVL         XAR1, *--SP
00082084   0006   LRETR        
00082085        memcpy:
00082085   5200   CMPB         AL, #0x0
00082086   a8ab   MOVL         P, XAR4
00082087   c5a4   MOVL         XAR7, XAR4
00082088   6107   SB           7, EQ
00082089   88a9   MOVZ         AR6, AL
0008208a   de81   SUBB         XAR6, #1
0008208b        $C$L1:
0008208b   5c85   MOVZ         AR4, *XAR5++
0008208c   7c87   MOV          *XAR7++, AR4
0008208d   000e   BANZ         -2,AR6--
0008208e   fffe
0008208f        $C$L2:
0008208f   88a9   MOVZ         AR6, AL
00082090   0fa6   CMPL         ACC, XAR6
00082091   610f   SB           15, EQ
00082092   5300   CMPB         AH, #0x0
00082093   610d   SB           13, EQ
00082094   9dff   ADDB         AH, #-1
00082095   5ca8   MOVZ         AR4, AH
00082096        $C$L3:
00082096   76bf   MOVL         XAR6, #0x3ffffe
00082097   fffe
00082098        $C$L4:
00082098   9285   MOV          AL, *XAR5++
00082099   9687   MOV          *XAR7++, AL
0008209a   000e   BANZ         -2,AR6--
0008209b   fffe
0008209c   9285   MOV          AL, *XAR5++
0008209d   9687   MOV          *XAR7++, AL
0008209e   000c   BANZ         -8,AR4--
0008209f   fff8
000820a0        $C$L5:
000820a0   a9a4   MOVL         XAR4, P
000820a1   0006   LRETR        
000820a2        _c_int00:
000820a2   28ad   MOV          SP, #0x0400
000820a3   0400
000820a4   ff69   SPM          #0
000820a5   561f   SETC         OBJMODE
000820a6   5616   CLRC         AMODE
000820a7   561a   SETC         M0M1MAP
000820a8   e610   SETFLG       RNDF32=1
000820a9   0200
000820aa   2940   CLRC         PAGE0
000820ab   761f   MOVW         DP, #0x0
000820ac   0000
000820ad   2902   CLRC         OVM
000820ae   761b   ASP          
000820af   7648   LCR          0x0820ee
000820b0   20ee
000820b1   5200   CMPB         AL, #0x0
000820b2   6103   SB           3, EQ
000820b3   7648   LCR          0x082031
000820b4   2031
000820b5        BYPASS_AUTO_INIT:
000820b5   7648   LCR          0x0820c6
000820b6   20c6
000820b7   7648   LCR          0x08205e
000820b8   205e
000820b9        __TI_zero_init_nomemset:
000820b9   8acc   MOVL         XAR4, *+XAR4[1]
000820ba   0200   MOVB         ACC, #0
000820bb   1901   SUBB         ACC, #1
000820bc   dc81   SUBB         XAR4, #1
000820bd   0fa4   CMPL         ACC, XAR4
000820be   6107   SB           7, EQ
000820bf        $C$L1:
000820bf   0200   MOVB         ACC, #0
000820c0   dc81   SUBB         XAR4, #1
000820c1   2b85   MOV          *XAR5++, #0
000820c2   1901   SUBB         ACC, #1
000820c3   0fa4   CMPL         ACC, XAR4
000820c4   60fb   SB           -5, NEQ
000820c5        $C$L2:
000820c5   0006   LRETR        
000820c6        _args_main:
000820c6   8f00   MOVL         XAR4, #0x000000
000820c7   0000
000820c8   a8a9   MOVL         ACC, XAR4
000820c9   6004   SB           4, NEQ
000820ca   9a00   MOVB         AL, #0x0
000820cb   d400   MOVB         XAR4, #0x0
000820cc   6f03   SB           3, UNC
000820cd        $C$L1:
000820cd   92c4   MOV          AL, *+XAR4[0]
000820ce   dc02   ADDB         XAR4, #2
000820cf        $C$L2:
000820cf   7648   LCR          0x0820d2
000820d0   20d2
000820d1   0006   LRETR        
000820d2        main:
000820d2   761f   MOVW         DP, #0x4
000820d3   0004
000820d4   922c   MOV          AL, @0x2c
000820d5   942d   ADD          AL, @0x2d
000820d6   2da9   MOV          T, AL
000820d7   122c   MPY          ACC, T, @0x2c
000820d8   761f   MOVW         DP, #0x2a0
000820d9   02a0
000820da   9600   MOV          @0x0, AL
000820db   9a00   MOVB         AL, #0x0
000820dc   0006   LRETR        
000820dd        _register_unlock:
000820dd   761f   MOVW         DP, #0x4
000820de   0004
000820df   a82a   MOVL         @0x2a, XAR4
000820e0   0006   LRETR        
000820e1        _register_lock:
000820e1   761f   MOVW         DP, #0x4
000820e2   0004
000820e3   a828   MOVL         @0x28, XAR4
000820e4   0006   LRETR        
000820e5        _nop:
000820e5   0006   LRETR        
000820e6        __TI_decompress_none:
000820e6   c4a5   MOVL         XAR6, XAR5
000820e7   83a4   MOVL         XAR5, XAR4
000820e8   06cd   MOVL         ACC, *+XAR5[1]
000820e9   8aa6   MOVL         XAR4, XAR6
000820ea   dd03   ADDB         XAR5, #3
000820eb   7648   LCR          0x082085
000820ec   2085
000820ed   0006   LRETR        
000820ee        _system_pre_init:
000820ee   9a01   MOVB         AL, #0x1
000820ef   0006   LRETR        
000820f0        _system_post_cinit:
000820f0   0006   LRETR        
