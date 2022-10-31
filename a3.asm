   100fe:	070000ef          	jal	ra,1016e <main>
   10102:	a0dd                	j	101e8 <exit>

000000000001016e <main>:
   1016e:	1101                	addi	sp,sp,-32
   10170:	ec06                	sd	ra,24(sp)
   10172:	e822                	sd	s0,16(sp)
   10174:	1000                	addi	s0,sp,32
   10176:	47a9                	li	a5,10
   10178:	fef42623          	sw	a5,-20(s0)
   1017c:	fec42783          	lw	a5,-20(s0)
   10180:	85be                	mv	a1,a5
   10182:	67f1                	lui	a5,0x1c
   10184:	2d078513          	addi	a0,a5,720 # 1c2d0 <__clzdi2+0x3a>
   10188:	1b4000ef          	jal	ra,1033c <printf>
   1018c:	fec42783          	lw	a5,-20(s0)
   10190:	853e                	mv	a0,a5
   10192:	fbbff0ef          	jal	ra,1014c <test2>
   10196:	87aa                	mv	a5,a0
   10198:	85be                	mv	a1,a5
   1019a:	67f1                	lui	a5,0x1c
   1019c:	2d078513          	addi	a0,a5,720 # 1c2d0 <__clzdi2+0x3a>
   101a0:	19c000ef          	jal	ra,1033c <printf>
   101a4:	fe842783          	lw	a5,-24(s0)
   101a8:	0007871b          	sext.w	a4,a5
   101ac:	47a9                	li	a5,10
   101ae:	00e7df63          	bge	a5,a4,101cc <main+0x5e>
   101b2:	fec42783          	lw	a5,-20(s0)
   101b6:	853e                	mv	a0,a5
   101b8:	f95ff0ef          	jal	ra,1014c <test2>
   101bc:	87aa                	mv	a5,a0
   101be:	85be                	mv	a1,a5
   101c0:	67f1                	lui	a5,0x1c
   101c2:	2d078513          	addi	a0,a5,720 # 1c2d0 <__clzdi2+0x3a>
   101c6:	176000ef          	jal	ra,1033c <printf>
   101ca:	a809                	j	101dc <main+0x6e>
   101cc:	fec42783          	lw	a5,-20(s0)
   101d0:	85be                	mv	a1,a5
   101d2:	67f1                	lui	a5,0x1c
   101d4:	2d078513          	addi	a0,a5,720 # 1c2d0 <__clzdi2+0x3a>
   101d8:	164000ef          	jal	ra,1033c <printf>
   101dc:	4781                	li	a5,0
   101de:	853e                	mv	a0,a5
   101e0:	60e2                	ld	ra,24(sp)
   101e2:	6442                	ld	s0,16(sp)
   101e4:	6105                	addi	sp,sp,32
   101e6:	8082                	ret

