0000000000000050 <whetstones.constprop.0>:
    
     2d2:	716020ef          	jal	ra,29e8 <start_time>
     2d6:	0001                	nop
     2d8:	16905863          	blez	s1,448 <whetstones.constprop.0+0x3f8>
     2dc:	2aa2                	fld	fs5,8(sp)
     2de:	4c81                	li	s9,0
     2e0:	00201617          	auipc	a2,0x201
     2e4:	6e863687          	fld	fa3,1768(a2) # 2019c8 <__digits+0x1f8>
     2e8:	00201617          	auipc	a2,0x201
     2ec:	71863d07          	fld	fs10,1816(a2) # 201a00 <__digits+0x230>
     2f0:	57800093          	li	ra,1400
     2f4:	10fd                	addi	ra,ra,-1
     2f6:	03547e53          	fadd.d	ft8,fs0,fs5
     2fa:	034e7ed3          	fadd.d	ft9,ft8,fs4
     2fe:	0b3eff53          	fsub.d	ft10,ft9,fs3
     302:	42df7443          	fmadd.d	fs0,ft10,fa3,fs0
     306:	0b447fd3          	fsub.d	ft11,fs0,fs4
     30a:	033ff053          	fadd.d	ft0,ft11,fs3
     30e:	12d070d3          	fmul.d	ft1,ft0,fa3
     312:	0adf7147          	fmsub.d	ft2,ft10,fa3,ft1
     316:	0adf71cb          	fnmsub.d	ft3,ft10,fa3,ft1
     31a:	0adf7743          	fmadd.d	fa4,ft10,fa3,ft1
     31e:	03417a53          	fadd.d	fs4,ft2,fs4
     322:	033a7253          	fadd.d	ft4,fs4,fs3
     326:	1ad272c3          	fmadd.d	ft5,ft4,fa3,ft3
     32a:	72d277c3          	fmadd.d	fa5,ft4,fa3,fa4
     32e:	0332f9d3          	fadd.d	fs3,ft5,fs3
     332:	7ba9f64b          	fnmsub.d	fa2,fs3,fs10,fa5
     336:	0ad67ac3          	fmadd.d	fs5,fa2,fa3,ft1
     33a:	aad2754b          	fnmsub.d	fa0,ft4,fa3,fs5
     33e:	53a9f343          	fmadd.d	ft6,fs3,fs10,fa0
     342:	12d373d3          	fmul.d	ft7,ft6,fa3
     346:	3ad67847          	fmsub.d	fa6,fa2,fa3,ft7
     34a:	3ad675cb          	fnmsub.d	fa1,fa2,fa3,ft7
     34e:	3ad678c3          	fmadd.d	fa7,fa2,fa3,ft7
     352:	82d27b43          	fmadd.d	fs6,ft4,fa3,fa6
     356:	b3a9fbc3          	fmadd.d	fs7,fs3,fs10,fs6
     35a:	5adbfc43          	fmadd.d	fs8,fs7,fa3,fa1
     35e:	8adbfcc3          	fmadd.d	fs9,fs7,fa3,fa7
     362:	c3a9fe43          	fmadd.d	ft8,fs3,fs10,fs8
     366:	cbae7ecb          	fnmsub.d	ft9,ft8,fs10,fs9
     36a:	3adeff43          	fmadd.d	ft10,ft9,fa3,ft7
     36e:	f2dbf44b          	fnmsub.d	fs0,fs7,fa3,ft10
     372:	43ae7fc3          	fmadd.d	ft11,ft8,fs10,fs0
     376:	12dff153          	fmul.d	ft2,ft11,fa3
     37a:	12def0c7          	fmsub.d	ft1,ft9,fa3,ft2
     37e:	12def04b          	fnmsub.d	ft0,ft9,fa3,ft2
     382:	12def1c3          	fmadd.d	ft3,ft9,fa3,ft2
     386:	0adbf743          	fmadd.d	fa4,fs7,fa3,ft1
     38a:	73ae7a43          	fmadd.d	fs4,ft8,fs10,fa4
     38e:	02da7243          	fmadd.d	ft4,fs4,fa3,ft0
     392:	1ada72c3          	fmadd.d	ft5,fs4,fa3,ft3
     396:	23ae79c3          	fmadd.d	fs3,ft8,fs10,ft4
     39a:	2ba9f64b          	fnmsub.d	fa2,fs3,fs10,ft5
     39e:	12d677c3          	fmadd.d	fa5,fa2,fa3,ft2
     3a2:	7ada7acb          	fnmsub.d	fs5,fs4,fa3,fa5
     3a6:	aba9f543          	fmadd.d	fa0,fs3,fs10,fs5
     3aa:	12d57353          	fmul.d	ft6,fa0,fa3
     3ae:	32d673c7          	fmsub.d	ft7,fa2,fa3,ft6
     3b2:	32d6784b          	fnmsub.d	fa6,fa2,fa3,ft6
     3b6:	32d675c3          	fmadd.d	fa1,fa2,fa3,ft6
     3ba:	3ada78c3          	fmadd.d	fa7,fs4,fa3,ft7
     3be:	8ba9fb43          	fmadd.d	fs6,fs3,fs10,fa7
     3c2:	82db7bc3          	fmadd.d	fs7,fs6,fa3,fa6
     3c6:	5adb7c43          	fmadd.d	fs8,fs6,fa3,fa1
     3ca:	bba9fcc3          	fmadd.d	fs9,fs3,fs10,fs7
     3ce:	c3acfe4b          	fnmsub.d	ft8,fs9,fs10,fs8
     3d2:	32de7ec3          	fmadd.d	ft9,ft8,fa3,ft6
     3d6:	eadb7f4b          	fnmsub.d	ft10,fs6,fa3,ft9
     3da:	f3acf443          	fmadd.d	fs0,fs9,fs10,ft10
     3de:	12d47fd3          	fmul.d	ft11,fs0,fa3
     3e2:	fade7147          	fmsub.d	ft2,ft8,fa3,ft11
     3e6:	fade70cb          	fnmsub.d	ft1,ft8,fa3,ft11
     3ea:	fade71c3          	fmadd.d	ft3,ft8,fa3,ft11
     3ee:	12db7043          	fmadd.d	ft0,fs6,fa3,ft2
     3f2:	03acfa43          	fmadd.d	fs4,fs9,fs10,ft0
     3f6:	0ada7243          	fmadd.d	ft4,fs4,fa3,ft1
     3fa:	1ada7743          	fmadd.d	fa4,fs4,fa3,ft3
     3fe:	23acf2c3          	fmadd.d	ft5,fs9,fs10,ft4
     402:	73a2f9cb          	fnmsub.d	fs3,ft5,fs10,fa4
     406:	1336fad3          	fmul.d	fs5,fa3,fs3
     40a:	035ff653          	fadd.d	fa2,ft11,fs5
     40e:	62da77cb          	fnmsub.d	fa5,fs4,fa3,fa2
     412:	7ba2f543          	fmadd.d	fa0,ft5,fs10,fa5
     416:	12a6f453          	fmul.d	fs0,fa3,fa0
     41a:	0a8af353          	fsub.d	ft6,fs5,fs0
     41e:	0b5473d3          	fsub.d	ft7,fs0,fs5
     422:	32da7843          	fmadd.d	fa6,fs4,fa3,ft6
     426:	83a2f5c3          	fmadd.d	fa1,ft5,fs10,fa6
     42a:	12b6fa53          	fmul.d	fs4,fa3,fa1
     42e:	0343f8d3          	fadd.d	fa7,ft7,fs4
     432:	8ba2fb43          	fmadd.d	fs6,ft5,fs10,fa7
     436:	13ab79d3          	fmul.d	fs3,fs6,fs10
     43a:	ea009de3          	bnez	ra,2f4 <whetstones.constprop.0+0x2a4>
     43e:	0c85                	addi	s9,s9,1
     440:	0ad4f6d3          	fsub.d	fa3,fs1,fa3
     444:	eb9496e3          	bne	s1,s9,2f0 <whetstones.constprop.0+0x2a0>
     448:	5c8020ef          	jal	ra,2a10 <end_time>
    
    10c0:	000a3507          	fld	fa0,0(s4)
    10c4:	000b3907          	fld	fs2,0(s6)
    10b8:	131010ef          	jal	ra,29e8 <start_time>
    10bc:	155010ef          	jal	ra,2a10 <end_time>
    10c8:	0009ba87          	fld	fs5,0(s3)
    10cc:	00201497          	auipc	s1,0x201
    10d0:	91c4b707          	fld	fa4,-1764(s1) # 2019e8 <__digits+0x218>
    10d4:	032573d3          	fadd.d	ft7,fa0,fs2
    10d8:	08895e83          	lhu	t4,136(s2)
    10dc:	02eaf353          	fadd.d	ft6,fs5,fa4
    10e0:	07893483          	ld	s1,120(s2)
    10e4:	08093903          	ld	s2,128(s2)
    10e8:	05243027          	fsd	fs2,64(s0)
    10ec:	ec64                	sd	s1,216(s0)
    10ee:	0069b027          	fsd	ft6,0(s3)
    10f2:	0f243023          	sd	s2,224(s0)
    10f6:	0fd41423          	sh	t4,232(s0)
    10fa:	007a3027          	fsd	ft7,0(s4)
    10fe:	bd8d                	j	f70 <whetstones.constprop.0+0xf20>
    1100:	111010ef          	jal	ra,2a10 <end_time>
  