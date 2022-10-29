
000000000001014c <test2>:
   1014c:	1101                	addi	sp,sp,-32
   1014e:	ec22                	sd	s0,24(sp)
   10150:	1000                	addi	s0,sp,32
   10152:	87aa                	mv	a5,a0
   10154:	fef42623          	sw	a5,-20(s0)
   10158:	fec42783          	lw	a5,-20(s0)
   1015c:	2785                	addiw	a5,a5,1
   1015e:	fef42623          	sw	a5,-20(s0)
   10162:	fec42783          	lw	a5,-20(s0)
   10166:	853e                	mv	a0,a5
   10168:	6462                	ld	s0,24(sp)
   1016a:	6105                	addi	sp,sp,32
   1016c:	8082                	ret

