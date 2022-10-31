
00000000000003a8 <whetstones>:
     3a8:	7111                	addi	sp,sp,-256
     3aa:	fd86                	sd	ra,248(sp)
     3ac:	f9a2                	sd	s0,240(sp)
     3ae:	f5a6                	sd	s1,232(sp)
     3b0:	f1ca                	sd	s2,224(sp)
     3b2:	edce                	sd	s3,216(sp)
     3b4:	e9d2                	sd	s4,208(sp)
     3b6:	e5d6                	sd	s5,200(sp)
     3b8:	e1da                	sd	s6,192(sp)
     3ba:	fd5e                	sd	s7,184(sp)
     3bc:	f962                	sd	s8,176(sp)
     3be:	f566                	sd	s9,168(sp)
     3c0:	f16a                	sd	s10,160(sp)
     3c2:	ed6e                	sd	s11,152(sp)
     3c4:	a922                	fsd	fs0,144(sp)
     3c6:	a526                	fsd	fs1,136(sp)
     3c8:	a14a                	fsd	fs2,128(sp)
     3ca:	bcce                	fsd	fs3,120(sp)
     3cc:	b8d2                	fsd	fs4,112(sp)
     3ce:	b4d6                	fsd	fs5,104(sp)
     3d0:	8c2a                	mv	s8,a0
     3d2:	07800513          	li	a0,120
     3d6:	02a584b3          	mul	s1,a1,a0
     3da:	8a2e                	mv	s4,a1
     3dc:	829f9a8b          	0x829f9a8b
     3e0:	0014a513          	slti	a0,s1,1
     3e4:	001c2593          	slti	a1,s8,1
     3e8:	89b2                	mv	s3,a2
     3ea:	00a5e433          	or	s0,a1,a0
     3ee:	000ab023          	sd	zero,0(s5)
     3f2:	642010ef          	jal	ra,1a34 <start_time>
     3f6:	fa0f958b          	0xfa0f958b
     3fa:	f98f990b          	0xf98f990b
     3fe:	fa8f9d8b          	0xfa8f9d8b
     402:	e42e                	sd	a1,8(sp)
     404:	22041a63          	bnez	s0,638 <whetstones+0x290>
     408:	2184                	fld	fs1,0(a1)
     40a:	00093007          	fld	ft0,0(s2)
     40e:	000db087          	fld	ft1,0(s11)
     412:	4501                	li	a0,0
     414:	220009d3          	fmv.d	fs3,ft0
     418:	22948a53          	fmv.d	fs4,fs1
     41c:	22948453          	fmv.d	fs0,fs1
     420:	009005b3          	add	a1,zero,s1
     424:	0334f153          	fadd.d	ft2,fs1,fs3
     428:	15e1                	addi	a1,a1,-8
     42a:	022a7153          	fadd.d	ft2,fs4,ft2
     42e:	0a817153          	fsub.d	ft2,ft2,fs0
     432:	1220f153          	fmul.d	ft2,ft1,ft2
     436:	0224f1d3          	fadd.d	ft3,fs1,ft2
     43a:	0b41f1d3          	fsub.d	ft3,ft3,fs4
     43e:	023471d3          	fadd.d	ft3,fs0,ft3
     442:	1230f1d3          	fmul.d	ft3,ft1,ft3
     446:	0a317253          	fsub.d	ft4,ft2,ft3
     44a:	0a21f2d3          	fsub.d	ft5,ft3,ft2
     44e:	0221f153          	fadd.d	ft2,ft3,ft2
     452:	024a7253          	fadd.d	ft4,fs4,ft4
     456:	02447253          	fadd.d	ft4,fs0,ft4
     45a:	1240f253          	fmul.d	ft4,ft1,ft4
     45e:	0242f2d3          	fadd.d	ft5,ft5,ft4
     462:	02227153          	fadd.d	ft2,ft4,ft2
     466:	025472d3          	fadd.d	ft5,fs0,ft5
     46a:	1250f2d3          	fmul.d	ft5,ft1,ft5
     46e:	0a517153          	fsub.d	ft2,ft2,ft5
     472:	1220f153          	fmul.d	ft2,ft1,ft2
     476:	0221f1d3          	fadd.d	ft3,ft3,ft2
     47a:	0a41f1d3          	fsub.d	ft3,ft3,ft4
     47e:	0232f1d3          	fadd.d	ft3,ft5,ft3
     482:	1230f1d3          	fmul.d	ft3,ft1,ft3
     486:	0a317353          	fsub.d	ft6,ft2,ft3
     48a:	02627253          	fadd.d	ft4,ft4,ft6
     48e:	0a21f353          	fsub.d	ft6,ft3,ft2
     492:	0221f153          	fadd.d	ft2,ft3,ft2
     496:	0242f253          	fadd.d	ft4,ft5,ft4
     49a:	1240f253          	fmul.d	ft4,ft1,ft4
     49e:	02437353          	fadd.d	ft6,ft6,ft4
     4a2:	02227153          	fadd.d	ft2,ft4,ft2
     4a6:	0262f2d3          	fadd.d	ft5,ft5,ft6
     4aa:	1250f2d3          	fmul.d	ft5,ft1,ft5
     4ae:	0a517153          	fsub.d	ft2,ft2,ft5
     4b2:	1220f153          	fmul.d	ft2,ft1,ft2
     4b6:	0221f1d3          	fadd.d	ft3,ft3,ft2
     4ba:	0a41f1d3          	fsub.d	ft3,ft3,ft4
     4be:	0232f1d3          	fadd.d	ft3,ft5,ft3
     4c2:	1230f1d3          	fmul.d	ft3,ft1,ft3
     4c6:	0a317353          	fsub.d	ft6,ft2,ft3
     4ca:	02627253          	fadd.d	ft4,ft4,ft6
     4ce:	0a21f353          	fsub.d	ft6,ft3,ft2
     4d2:	0221f153          	fadd.d	ft2,ft3,ft2
     4d6:	0242f253          	fadd.d	ft4,ft5,ft4
     4da:	1240f253          	fmul.d	ft4,ft1,ft4
     4de:	02437353          	fadd.d	ft6,ft6,ft4
     4e2:	02227153          	fadd.d	ft2,ft4,ft2
     4e6:	0262f2d3          	fadd.d	ft5,ft5,ft6
     4ea:	1250f2d3          	fmul.d	ft5,ft1,ft5
     4ee:	0a517153          	fsub.d	ft2,ft2,ft5
     4f2:	1220f153          	fmul.d	ft2,ft1,ft2
     4f6:	0221f1d3          	fadd.d	ft3,ft3,ft2
     4fa:	0a41f1d3          	fsub.d	ft3,ft3,ft4
     4fe:	0232f1d3          	fadd.d	ft3,ft5,ft3
     502:	1230f1d3          	fmul.d	ft3,ft1,ft3
     506:	0a317353          	fsub.d	ft6,ft2,ft3
     50a:	02627253          	fadd.d	ft4,ft4,ft6
     50e:	0a21f353          	fsub.d	ft6,ft3,ft2
     512:	0221f153          	fadd.d	ft2,ft3,ft2
     516:	0242f253          	fadd.d	ft4,ft5,ft4
     51a:	1240f253          	fmul.d	ft4,ft1,ft4
     51e:	02437353          	fadd.d	ft6,ft6,ft4
     522:	02227153          	fadd.d	ft2,ft4,ft2
     526:	0262f2d3          	fadd.d	ft5,ft5,ft6
     52a:	1250f2d3          	fmul.d	ft5,ft1,ft5
     52e:	0a517153          	fsub.d	ft2,ft2,ft5
     532:	1220f153          	fmul.d	ft2,ft1,ft2
     536:	0221f1d3          	fadd.d	ft3,ft3,ft2
     53a:	0a41f1d3          	fsub.d	ft3,ft3,ft4
     53e:	0232f1d3          	fadd.d	ft3,ft5,ft3
     542:	1230f1d3          	fmul.d	ft3,ft1,ft3
     546:	0a317353          	fsub.d	ft6,ft2,ft3
     54a:	02627253          	fadd.d	ft4,ft4,ft6
     54e:	0a21f353          	fsub.d	ft6,ft3,ft2
     552:	0221f153          	fadd.d	ft2,ft3,ft2
     556:	0242f253          	fadd.d	ft4,ft5,ft4
     55a:	1240f253          	fmul.d	ft4,ft1,ft4
     55e:	02437353          	fadd.d	ft6,ft6,ft4
     562:	02227153          	fadd.d	ft2,ft4,ft2
     566:	0262f2d3          	fadd.d	ft5,ft5,ft6
     56a:	1250f2d3          	fmul.d	ft5,ft1,ft5
     56e:	0a517153          	fsub.d	ft2,ft2,ft5
     572:	1220f153          	fmul.d	ft2,ft1,ft2
     576:	0221f1d3          	fadd.d	ft3,ft3,ft2
     57a:	0a41f1d3          	fsub.d	ft3,ft3,ft4
     57e:	0232f1d3          	fadd.d	ft3,ft5,ft3
     582:	1230f1d3          	fmul.d	ft3,ft1,ft3
     586:	0a317353          	fsub.d	ft6,ft2,ft3
     58a:	02627253          	fadd.d	ft4,ft4,ft6
     58e:	0a21f353          	fsub.d	ft6,ft3,ft2
     592:	0221f153          	fadd.d	ft2,ft3,ft2
     596:	0242f253          	fadd.d	ft4,ft5,ft4
     59a:	1240f253          	fmul.d	ft4,ft1,ft4
     59e:	02437353          	fadd.d	ft6,ft6,ft4
     5a2:	02227153          	fadd.d	ft2,ft4,ft2
     5a6:	0262f2d3          	fadd.d	ft5,ft5,ft6
     5aa:	1250f2d3          	fmul.d	ft5,ft1,ft5
     5ae:	0a517153          	fsub.d	ft2,ft2,ft5
     5b2:	1220f153          	fmul.d	ft2,ft1,ft2
     5b6:	0221f1d3          	fadd.d	ft3,ft3,ft2
     5ba:	0a41f1d3          	fsub.d	ft3,ft3,ft4
     5be:	0232f1d3          	fadd.d	ft3,ft5,ft3
     5c2:	1230f1d3          	fmul.d	ft3,ft1,ft3
     5c6:	0a317353          	fsub.d	ft6,ft2,ft3
     5ca:	02627253          	fadd.d	ft4,ft4,ft6
     5ce:	0a21f353          	fsub.d	ft6,ft3,ft2
     5d2:	0221f153          	fadd.d	ft2,ft3,ft2
     5d6:	0242f253          	fadd.d	ft4,ft5,ft4
     5da:	1240f253          	fmul.d	ft4,ft1,ft4
     5de:	02437353          	fadd.d	ft6,ft6,ft4
     5e2:	02227153          	fadd.d	ft2,ft4,ft2
     5e6:	0262f2d3          	fadd.d	ft5,ft5,ft6
     5ea:	1250f2d3          	fmul.d	ft5,ft1,ft5
     5ee:	0a517153          	fsub.d	ft2,ft2,ft5
     5f2:	1220f9d3          	fmul.d	fs3,ft1,ft2
     5f6:	0331f153          	fadd.d	ft2,ft3,fs3
     5fa:	0a417153          	fsub.d	ft2,ft2,ft4
     5fe:	0222f153          	fadd.d	ft2,ft5,ft2
     602:	1220f4d3          	fmul.d	fs1,ft1,ft2
     606:	0a99f153          	fsub.d	ft2,fs3,fs1
     60a:	0b34f1d3          	fsub.d	ft3,fs1,fs3
     60e:	02227153          	fadd.d	ft2,ft4,ft2
     612:	0222f153          	fadd.d	ft2,ft5,ft2
     616:	1220fa53          	fmul.d	fs4,ft1,ft2
     61a:	0341f153          	fadd.d	ft2,ft3,fs4
     61e:	0222f153          	fadd.d	ft2,ft5,ft2
     622:	1220f453          	fmul.d	fs0,ft1,ft2
     626:	de059fe3          	bnez	a1,424 <whetstones+0x7c>
     62a:	0a1070d3          	fsub.d	ft1,ft0,ft1
     62e:	0505                	addi	a0,a0,1
     630:	df8518e3          	bne	a0,s8,420 <whetstones+0x78>
     634:	0140006f          	j	648 <whetstones+0x2a0>
     638:	2180                	fld	fs0,0(a1)
     63a:	00093987          	fld	fs3,0(s2)
     63e:	22840a53          	fmv.d	fs4,fs0
     642:	228404d3          	fmv.d	fs1,fs0
     646:	0001                	nop
     648:	01802433          	sgtz	s0,s8
     64c:	408010ef          	jal	ra,1a54 <end_time>
     650:	fb0f950b          	0xfb0f950b
     654:	811f9d0b          	0x811f9d0b
     658:	00053007          	fld	ft0,0(a0)
     65c:	000d3087          	fld	ft1,0(s10)
     660:	891f9c8b          	0x891f9c8b
     664:	07400513          	li	a0,116
     668:	1a00f053          	fdiv.d	ft0,ft1,ft0
     66c:	819f9b8b          	0x819f9b8b
     670:	849f9b0b          	0x849f9b0b
     674:	d02c7953          	fcvt.s.l	fs2,s8
     678:	000d3027          	fsd	ft0,0(s10)
     67c:	000ab007          	fld	ft0,0(s5)
     680:	02ac9123          	sh	a0,34(s9)
     684:	03a31537          	lui	a0,0x3a31
     688:	b7b5051b          	addiw	a0,a0,-1157
     68c:	0532                	slli	a0,a0,0xc
     68e:	02047053          	fadd.d	ft0,fs0,ft0
     692:	63350513          	addi	a0,a0,1587 # 3a31633 <_stack+0x3811633>
     696:	0536                	slli	a0,a0,0xd
     698:	20350513          	addi	a0,a0,515
     69c:	0532                	slli	a0,a0,0xc
     69e:	000ab027          	fsd	ft0,0(s5)
     6a2:	14e50513          	addi	a0,a0,334
     6a6:	000d3a87          	fld	fs5,0(s10)
     6aa:	000bb007          	fld	ft0,0(s7)
     6ae:	00acb923          	sd	a0,18(s9)
     6b2:	0006e537          	lui	a0,0x6e
     6b6:	6975051b          	addiw	a0,a0,1687
     6ba:	053e                	slli	a0,a0,0xf
     6bc:	b8150513          	addi	a0,a0,-1151 # 6db81 <NDS_SAG_LMA_DATA+0x69ce1>
     6c0:	020af053          	fadd.d	ft0,fs5,ft0
     6c4:	0546                	slli	a0,a0,0x11
     6c6:	67750513          	addi	a0,a0,1655
     6ca:	00c51513          	slli	a0,a0,0xc
     6ce:	e6950513          	addi	a0,a0,-407
     6d2:	000bb027          	fsd	ft0,0(s7)
     6d6:	015b3427          	fsd	fs5,8(s6)
     6da:	00acbd23          	sd	a0,26(s9)
     6de:	00098f63          	beqz	s3,6fc <whetstones+0x354>
     6e2:	0019e55b          	0x19e55b
     6e6:	939f950b          	0x939f950b
     6ea:	a500                	fsd	fs0,8(a0)
     6ec:	348010ef          	jal	ra,1a34 <start_time>
     6f0:	fc0f950b          	0xfc0f950b
     6f4:	e0aa                	sd	a0,64(sp)
     6f6:	e03d                	bnez	s0,75c <whetstones+0x3b4>
     6f8:	2240006f          	j	91c <whetstones+0x574>
     6fc:	939f950b          	0x939f950b
     700:	6510                	ld	a2,8(a0)
     702:	f7db950b          	0xf7db950b
     706:	012c8593          	addi	a1,s9,18
     70a:	463020ef          	jal	ra,336c <iprintf>
     70e:	f2000053          	fmv.d.x	ft0,zero
     712:	a3501553          	flt.d	a0,ft0,fs5
     716:	c11d                	beqz	a0,73c <whetstones+0x394>
     718:	0c000513          	li	a0,192
     71c:	02aa0533          	mul	a0,s4,a0
     720:	d0257053          	fcvt.s.l	ft0,a0
     724:	fb8f950b          	0xfb8f950b
     728:	00053087          	fld	ft1,0(a0)
     72c:	10097053          	fmul.s	ft0,fs2,ft0
     730:	121af0d3          	fmul.d	ft1,fs5,ft1
     734:	42000053          	fcvt.d.s	ft0,ft0
     738:	1a107053          	fdiv.d	ft0,ft0,ft1
     73c:	008b3603          	ld	a2,8(s6)
     740:	820d950b          	0x820d950b
     744:	e20005d3          	fmv.x.d	a1,ft0
     748:	425020ef          	jal	ra,336c <iprintf>
     74c:	2e8010ef          	jal	ra,1a34 <start_time>
     750:	fc0f950b          	0xfc0f950b
     754:	e0aa                	sd	a0,64(sp)
     756:	1c040363          	beqz	s0,91c <whetstones+0x574>
     75a:	0001                	nop
     75c:	4539                	li	a0,14
     75e:	02aa0533          	mul	a0,s4,a0
     762:	4585                	li	a1,1
     764:	00a5c463          	blt	a1,a0,76c <whetstones+0x3c4>
     768:	00100513          	li	a0,1
     76c:	6606                	ld	a2,64(sp)
     76e:	00063087          	fld	ft1,0(a2)
     772:	000db007          	fld	ft0,0(s11)
     776:	00093107          	fld	ft2,0(s2)
     77a:	4581                	li	a1,0
     77c:	01402633          	sgtz	a2,s4
     780:	0100006f          	j	790 <whetstones+0x3e8>
     784:	0a017053          	fsub.d	ft0,ft2,ft0
     788:	00158593          	addi	a1,a1,1
     78c:	19858863          	beq	a1,s8,91c <whetstones+0x574>
     790:	da75                	beqz	a2,784 <whetstones+0x3dc>
     792:	86aa                	mv	a3,a0
     794:	0334f1d3          	fadd.d	ft3,fs1,fs3
     798:	16fd                	addi	a3,a3,-1
     79a:	023a71d3          	fadd.d	ft3,fs4,ft3
     79e:	0a81f1d3          	fsub.d	ft3,ft3,fs0
     7a2:	123071d3          	fmul.d	ft3,ft0,ft3
     7a6:	0234f253          	fadd.d	ft4,fs1,ft3
     7aa:	0b427253          	fsub.d	ft4,ft4,fs4
     7ae:	02447253          	fadd.d	ft4,fs0,ft4
     7b2:	12407253          	fmul.d	ft4,ft0,ft4
     7b6:	0a41f2d3          	fsub.d	ft5,ft3,ft4
     7ba:	0a327353          	fsub.d	ft6,ft4,ft3
     7be:	0241f1d3          	fadd.d	ft3,ft3,ft4
     7c2:	025a72d3          	fadd.d	ft5,fs4,ft5
     7c6:	025472d3          	fadd.d	ft5,fs0,ft5
     7ca:	125072d3          	fmul.d	ft5,ft0,ft5
     7ce:	02537353          	fadd.d	ft6,ft6,ft5
     7d2:	0251f1d3          	fadd.d	ft3,ft3,ft5
     7d6:	02647353          	fadd.d	ft6,fs0,ft6
     7da:	12137353          	fmul.d	ft6,ft6,ft1
     7de:	0a61f1d3          	fsub.d	ft3,ft3,ft6
     7e2:	123071d3          	fmul.d	ft3,ft0,ft3
     7e6:	02327253          	fadd.d	ft4,ft4,ft3
     7ea:	0a527253          	fsub.d	ft4,ft4,ft5
     7ee:	02437253          	fadd.d	ft4,ft6,ft4
     7f2:	12407253          	fmul.d	ft4,ft0,ft4
     7f6:	0a41f3d3          	fsub.d	ft7,ft3,ft4
     7fa:	0272f2d3          	fadd.d	ft5,ft5,ft7
     7fe:	0a3273d3          	fsub.d	ft7,ft4,ft3
     802:	0241f1d3          	fadd.d	ft3,ft3,ft4
     806:	025372d3          	fadd.d	ft5,ft6,ft5
     80a:	125072d3          	fmul.d	ft5,ft0,ft5
     80e:	0253f3d3          	fadd.d	ft7,ft7,ft5
     812:	0251f1d3          	fadd.d	ft3,ft3,ft5
     816:	02737353          	fadd.d	ft6,ft6,ft7
     81a:	12137353          	fmul.d	ft6,ft6,ft1
     81e:	0a61f1d3          	fsub.d	ft3,ft3,ft6
     822:	123071d3          	fmul.d	ft3,ft0,ft3
     826:	02327253          	fadd.d	ft4,ft4,ft3
     82a:	0a527253          	fsub.d	ft4,ft4,ft5
     82e:	02437253          	fadd.d	ft4,ft6,ft4
     832:	12407253          	fmul.d	ft4,ft0,ft4
     836:	0a41f3d3          	fsub.d	ft7,ft3,ft4
     83a:	0272f2d3          	fadd.d	ft5,ft5,ft7
     83e:	0a3273d3          	fsub.d	ft7,ft4,ft3
     842:	0241f1d3          	fadd.d	ft3,ft3,ft4
     846:	025372d3          	fadd.d	ft5,ft6,ft5
     84a:	125072d3          	fmul.d	ft5,ft0,ft5
     84e:	0253f3d3          	fadd.d	ft7,ft7,ft5
     852:	0251f1d3          	fadd.d	ft3,ft3,ft5
     856:	02737353          	fadd.d	ft6,ft6,ft7
     85a:	12137353          	fmul.d	ft6,ft6,ft1
     85e:	0a61f1d3          	fsub.d	ft3,ft3,ft6
     862:	123071d3          	fmul.d	ft3,ft0,ft3
     866:	02327253          	fadd.d	ft4,ft4,ft3
     86a:	0a527253          	fsub.d	ft4,ft4,ft5
     86e:	02437253          	fadd.d	ft4,ft6,ft4
     872:	12407253          	fmul.d	ft4,ft0,ft4
     876:	0a41f3d3          	fsub.d	ft7,ft3,ft4
     87a:	0272f2d3          	fadd.d	ft5,ft5,ft7
     87e:	0a3273d3          	fsub.d	ft7,ft4,ft3
     882:	0241f1d3          	fadd.d	ft3,ft3,ft4
     886:	025372d3          	fadd.d	ft5,ft6,ft5
     88a:	125072d3          	fmul.d	ft5,ft0,ft5
     88e:	0253f3d3          	fadd.d	ft7,ft7,ft5
     892:	0251f1d3          	fadd.d	ft3,ft3,ft5
     896:	02737353          	fadd.d	ft6,ft6,ft7
     89a:	12137353          	fmul.d	ft6,ft6,ft1
     89e:	0a61f1d3          	fsub.d	ft3,ft3,ft6
     8a2:	123071d3          	fmul.d	ft3,ft0,ft3
     8a6:	02327253          	fadd.d	ft4,ft4,ft3
     8aa:	0a527253          	fsub.d	ft4,ft4,ft5
     8ae:	02437253          	fadd.d	ft4,ft6,ft4
     8b2:	12407253          	fmul.d	ft4,ft0,ft4
     8b6:	0a41f3d3          	fsub.d	ft7,ft3,ft4
     8ba:	0272f2d3          	fadd.d	ft5,ft5,ft7
     8be:	0a3273d3          	fsub.d	ft7,ft4,ft3
     8c2:	0241f1d3          	fadd.d	ft3,ft3,ft4
     8c6:	025372d3          	fadd.d	ft5,ft6,ft5
     8ca:	125072d3          	fmul.d	ft5,ft0,ft5
     8ce:	0253f3d3          	fadd.d	ft7,ft7,ft5
     8d2:	0251f1d3          	fadd.d	ft3,ft3,ft5
     8d6:	02737353          	fadd.d	ft6,ft6,ft7
     8da:	12137353          	fmul.d	ft6,ft6,ft1
     8de:	0a61f1d3          	fsub.d	ft3,ft3,ft6
     8e2:	123079d3          	fmul.d	fs3,ft0,ft3
     8e6:	033271d3          	fadd.d	ft3,ft4,fs3
     8ea:	0a51f1d3          	fsub.d	ft3,ft3,ft5
     8ee:	023371d3          	fadd.d	ft3,ft6,ft3
     8f2:	123074d3          	fmul.d	fs1,ft0,ft3
     8f6:	0a99f1d3          	fsub.d	ft3,fs3,fs1
     8fa:	0b34f253          	fsub.d	ft4,fs1,fs3
     8fe:	0232f1d3          	fadd.d	ft3,ft5,ft3
     902:	023371d3          	fadd.d	ft3,ft6,ft3
     906:	12307a53          	fmul.d	fs4,ft0,ft3
     90a:	034271d3          	fadd.d	ft3,ft4,fs4
     90e:	023371d3          	fadd.d	ft3,ft6,ft3
     912:	1211f453          	fmul.d	fs0,ft3,ft1
     916:	e6069fe3          	bnez	a3,794 <whetstones+0x3ec>
     91a:	b5ad                	j	784 <whetstones+0x3dc>
     91c:	138010ef          	jal	ra,1a54 <end_time>
     920:	07400513          	li	a0,116
     924:	02ac9a23          	sh	a0,52(s9)
     928:	03a31537          	lui	a0,0x3a31
     92c:	b7b5051b          	addiw	a0,a0,-1157
     930:	0532                	slli	a0,a0,0xc
     932:	63350513          	addi	a0,a0,1587 # 3a31633 <_stack+0x3811633>
     936:	0536                	slli	a0,a0,0xd
     938:	20350513          	addi	a0,a0,515
     93c:	0532                	slli	a0,a0,0xc
     93e:	24e50513          	addi	a0,a0,590
     942:	000d3487          	fld	fs1,0(s10)
     946:	000ab007          	fld	ft0,0(s5)
     94a:	000bb087          	fld	ft1,0(s7)
     94e:	02acb223          	sd	a0,36(s9)
     952:	0006e537          	lui	a0,0x6e
     956:	6975051b          	addiw	a0,a0,1687
     95a:	053e                	slli	a0,a0,0xf
     95c:	b8150513          	addi	a0,a0,-1151 # 6db81 <NDS_SAG_LMA_DATA+0x69ce1>
     960:	02047053          	fadd.d	ft0,fs0,ft0
     964:	0214f0d3          	fadd.d	ft1,fs1,ft1
     968:	0546                	slli	a0,a0,0x11
     96a:	67750513          	addi	a0,a0,1655
     96e:	0532                	slli	a0,a0,0xc
     970:	e6950513          	addi	a0,a0,-407
     974:	000ab027          	fsd	ft0,0(s5)
     978:	009b3827          	fsd	fs1,16(s6)
     97c:	001bb027          	fsd	ft1,0(s7)
     980:	02acb623          	sd	a0,44(s9)
     984:	fc4a                	sd	s2,56(sp)
     986:	f06e                	sd	s11,32(sp)
     988:	00098863          	beqz	s3,998 <whetstones+0x5f0>
     98c:	0419ee5b          	0x419ee5b
     990:	939f950b          	0x939f950b
     994:	a900                	fsd	fs0,16(a0)
     996:	a889                	j	9e8 <whetstones+0x640>
     998:	939f950b          	0x939f950b
     99c:	6910                	ld	a2,16(a0)
     99e:	f7db950b          	0xf7db950b
     9a2:	024c8593          	addi	a1,s9,36
     9a6:	1c7020ef          	jal	ra,336c <iprintf>
     9aa:	f2000053          	fmv.d.x	ft0,zero
     9ae:	a2901553          	flt.d	a0,ft0,fs1
     9b2:	c11d                	beqz	a0,9d8 <whetstones+0x630>
     9b4:	54000513          	li	a0,1344
     9b8:	02aa0533          	mul	a0,s4,a0
     9bc:	d0257053          	fcvt.s.l	ft0,a0
     9c0:	fb8f950b          	0xfb8f950b
     9c4:	00053087          	fld	ft1,0(a0)
     9c8:	10097053          	fmul.s	ft0,fs2,ft0
     9cc:	1214f0d3          	fmul.d	ft1,fs1,ft1
     9d0:	42000053          	fcvt.d.s	ft0,ft0
     9d4:	1a107053          	fdiv.d	ft0,ft0,ft1
     9d8:	010b3603          	ld	a2,16(s6)
     9dc:	820d950b          	0x820d950b
     9e0:	e20005d3          	fmv.x.d	a1,ft0
     9e4:	189020ef          	jal	ra,336c <iprintf>
     9e8:	01402533          	sgtz	a0,s4
     9ec:	e822                	sd	s0,16(sp)
     9ee:	00a47db3          	and	s11,s0,a0
     9f2:	042010ef          	jal	ra,1a34 <start_time>
     9f6:	4485                	li	s1,1
     9f8:	001c7913          	andi	s2,s8,1
     9fc:	040d8663          	beqz	s11,a48 <whetstones+0x6a0>
     a00:	15900513          	li	a0,345
     a04:	02aa0533          	mul	a0,s4,a0
     a08:	4485                	li	s1,1
     a0a:	00a4c363          	blt	s1,a0,a10 <whetstones+0x668>
     a0e:	4505                	li	a0,1
     a10:	fff50813          	addi	a6,a0,-1
     a14:	341c605b          	0x341c605b
     a18:	02090863          	beqz	s2,a48 <whetstones+0x6a0>
     a1c:	00757613          	andi	a2,a0,7
     a20:	459d                	li	a1,7
     a22:	00b86b63          	bltu	a6,a1,a38 <whetstones+0x690>
     a26:	9961                	andi	a0,a0,-8
     a28:	40a00533          	neg	a0,a0
     a2c:	fff48593          	addi	a1,s1,-1
     a30:	0521                	addi	a0,a0,8
     a32:	0015b493          	seqz	s1,a1
     a36:	f97d                	bnez	a0,a2c <whetstones+0x684>
     a38:	00060863          	beqz	a2,a48 <whetstones+0x6a0>
     a3c:	fff48513          	addi	a0,s1,-1
     a40:	167d                	addi	a2,a2,-1
     a42:	00a034b3          	snez	s1,a0
     a46:	fa7d                	bnez	a2,a3c <whetstones+0x694>
     a48:	0d200413          	li	s0,210
     a4c:	008010ef          	jal	ra,1a54 <end_time>
     a50:	02000513          	li	a0,32
     a54:	04ac9323          	sh	a0,70(s9)
     a58:	0343a537          	lui	a0,0x343a
     a5c:	1035051b          	addiw	a0,a0,259
     a60:	0536                	slli	a0,a0,0xd
     a62:	66950513          	addi	a0,a0,1641 # 343a669 <_stack+0x321a669>
     a66:	0532                	slli	a0,a0,0xc
     a68:	20350513          	addi	a0,a0,515
     a6c:	0532                	slli	a0,a0,0xc
     a6e:	d224f053          	fcvt.d.l	ft0,s1
     a72:	34e50513          	addi	a0,a0,846
     a76:	000d3407          	fld	fs0,0(s10)
     a7a:	000ab087          	fld	ft1,0(s5)
     a7e:	000bb107          	fld	ft2,0(s7)
     a82:	02acbb23          	sd	a0,54(s9)
     a86:	02065537          	lui	a0,0x2065
     a8a:	7375051b          	addiw	a0,a0,1847
     a8e:	0532                	slli	a0,a0,0xc
     a90:	c6550513          	addi	a0,a0,-923 # 2064c65 <_stack+0x1e44c65>
     a94:	0200f0d3          	fadd.d	ft1,ft1,ft0
     a98:	02247153          	fadd.d	ft2,fs0,ft2
     a9c:	0532                	slli	a0,a0,0xc
     a9e:	20750513          	addi	a0,a0,519
     aa2:	00c51513          	slli	a0,a0,0xc
     aa6:	e6550513          	addi	a0,a0,-411
     aaa:	001ab027          	fsd	ft1,0(s5)
     aae:	008b3c27          	fsd	fs0,24(s6)
     ab2:	002bb027          	fsd	ft2,0(s7)
     ab6:	02acbf23          	sd	a0,62(s9)
     aba:	f86a                	sd	s10,48(sp)
     abc:	12098263          	beqz	s3,be0 <whetstones+0x838>
     ac0:	0019e65b          	0x19e65b
     ac4:	939f950b          	0x939f950b
     ac8:	00053c27          	fsd	ft0,24(a0)
     acc:	028a0d33          	mul	s10,s4,s0
     ad0:	765000ef          	jal	ra,1a34 <start_time>
     ad4:	fd8f940b          	0xfd8f940b
     ad8:	160d8463          	beqz	s11,c40 <whetstones+0x898>
     adc:	4585                	li	a1,1
     ade:	856a                	mv	a0,s10
     ae0:	01a5c463          	blt	a1,s10,ae8 <whetstones+0x740>
     ae4:	00100513          	li	a0,1
     ae8:	fff50813          	addi	a6,a0,-1
     aec:	2c1c665b          	0x2c1c665b
     af0:	f2000453          	fmv.d.x	fs0,zero
     af4:	228404d3          	fmv.d	fs1,fs0
     af8:	14090863          	beqz	s2,c48 <whetstones+0x8a0>
     afc:	00757593          	andi	a1,a0,7
     b00:	461d                	li	a2,7
     b02:	0ac86563          	bltu	a6,a2,bac <whetstones+0x804>
     b06:	fc8f960b          	0xfc8f960b
     b0a:	00063007          	fld	ft0,0(a2)
     b0e:	7662                	ld	a2,56(sp)
     b10:	00063087          	fld	ft1,0(a2)
     b14:	fd0f960b          	0xfd0f960b
     b18:	00063107          	fld	ft2,0(a2)
     b1c:	00043187          	fld	ft3,0(s0)
     b20:	ff857513          	andi	a0,a0,-8
     b24:	40a00533          	neg	a0,a0
     b28:	0214f253          	fadd.d	ft4,fs1,ft1
     b2c:	020472d3          	fadd.d	ft5,fs0,ft0
     b30:	0521                	addi	a0,a0,8
     b32:	02227253          	fadd.d	ft4,ft4,ft2
     b36:	0202f2d3          	fadd.d	ft5,ft5,ft0
     b3a:	02327253          	fadd.d	ft4,ft4,ft3
     b3e:	0202f2d3          	fadd.d	ft5,ft5,ft0
     b42:	02127253          	fadd.d	ft4,ft4,ft1
     b46:	0202f2d3          	fadd.d	ft5,ft5,ft0
     b4a:	02227253          	fadd.d	ft4,ft4,ft2
     b4e:	0202f2d3          	fadd.d	ft5,ft5,ft0
     b52:	02327253          	fadd.d	ft4,ft4,ft3
     b56:	0202f2d3          	fadd.d	ft5,ft5,ft0
     b5a:	02127253          	fadd.d	ft4,ft4,ft1
     b5e:	0202f2d3          	fadd.d	ft5,ft5,ft0
     b62:	02227253          	fadd.d	ft4,ft4,ft2
     b66:	0202f453          	fadd.d	fs0,ft5,ft0
     b6a:	02327253          	fadd.d	ft4,ft4,ft3
     b6e:	02127253          	fadd.d	ft4,ft4,ft1
     b72:	02227253          	fadd.d	ft4,ft4,ft2
     b76:	02327253          	fadd.d	ft4,ft4,ft3
     b7a:	02127253          	fadd.d	ft4,ft4,ft1
     b7e:	02227253          	fadd.d	ft4,ft4,ft2
     b82:	02327253          	fadd.d	ft4,ft4,ft3
     b86:	02127253          	fadd.d	ft4,ft4,ft1
     b8a:	02227253          	fadd.d	ft4,ft4,ft2
     b8e:	02327253          	fadd.d	ft4,ft4,ft3
     b92:	02127253          	fadd.d	ft4,ft4,ft1
     b96:	02227253          	fadd.d	ft4,ft4,ft2
     b9a:	02327253          	fadd.d	ft4,ft4,ft3
     b9e:	02127253          	fadd.d	ft4,ft4,ft1
     ba2:	02227253          	fadd.d	ft4,ft4,ft2
     ba6:	023274d3          	fadd.d	fs1,ft4,ft3
     baa:	fd3d                	bnez	a0,b28 <whetstones+0x780>
     bac:	cdd1                	beqz	a1,c48 <whetstones+0x8a0>
     bae:	fc8f950b          	0xfc8f950b
     bb2:	00053007          	fld	ft0,0(a0)
     bb6:	7562                	ld	a0,56(sp)
     bb8:	00053087          	fld	ft1,0(a0)
     bbc:	fd0f950b          	0xfd0f950b
     bc0:	00053107          	fld	ft2,0(a0)
     bc4:	00043187          	fld	ft3,0(s0)
     bc8:	0214f253          	fadd.d	ft4,fs1,ft1
     bcc:	02047453          	fadd.d	fs0,fs0,ft0
     bd0:	15fd                	addi	a1,a1,-1
     bd2:	02227253          	fadd.d	ft4,ft4,ft2
     bd6:	023274d3          	fadd.d	fs1,ft4,ft3
     bda:	f5fd                	bnez	a1,bc8 <whetstones+0x820>
     bdc:	06c0006f          	j	c48 <whetstones+0x8a0>
     be0:	939f950b          	0x939f950b
     be4:	6d10                	ld	a2,24(a0)
     be6:	f7db950b          	0xf7db950b
     bea:	036c8593          	addi	a1,s9,54
     bee:	77e020ef          	jal	ra,336c <iprintf>
     bf2:	f2000053          	fmv.d.x	ft0,zero
     bf6:	a2801553          	flt.d	a0,ft0,fs0
     bfa:	c11d                	beqz	a0,c20 <whetstones+0x878>
     bfc:	40b00513          	li	a0,1035
     c00:	02aa0533          	mul	a0,s4,a0
     c04:	d0257053          	fcvt.s.l	ft0,a0
     c08:	fb8f950b          	0xfb8f950b
     c0c:	00053087          	fld	ft1,0(a0)
     c10:	10097053          	fmul.s	ft0,fs2,ft0
     c14:	121470d3          	fmul.d	ft1,fs0,ft1
     c18:	42000053          	fcvt.d.s	ft0,ft0
     c1c:	1a107053          	fdiv.d	ft0,ft0,ft1
     c20:	018b3603          	ld	a2,24(s6)
     c24:	ebdb950b          	0xebdb950b
     c28:	e20005d3          	fmv.x.d	a1,ft0
     c2c:	740020ef          	jal	ra,336c <iprintf>
     c30:	028a0d33          	mul	s10,s4,s0
     c34:	601000ef          	jal	ra,1a34 <start_time>
     c38:	fd8f940b          	0xfd8f940b
     c3c:	ea0d90e3          	bnez	s11,adc <whetstones+0x734>
     c40:	f20004d3          	fmv.d.x	fs1,zero
     c44:	22948453          	fmv.d	fs0,fs1
     c48:	ec22                	sd	s0,24(sp)
     c4a:	60b000ef          	jal	ra,1a54 <end_time>
     c4e:	d22d70d3          	fcvt.d.l	ft1,s10
     c52:	0284f053          	fadd.d	ft0,fs1,fs0
     c56:	02000513          	li	a0,32
     c5a:	04ac9c23          	sh	a0,88(s9)
     c5e:	032335b7          	lui	a1,0x3233
     c62:	02020537          	lui	a0,0x2020
     c66:	1a107053          	fdiv.d	ft0,ft0,ft1
     c6a:	d22c70d3          	fcvt.d.l	ft1,s8
     c6e:	7d42                	ld	s10,48(sp)
     c70:	000d3407          	fld	fs0,0(s10)
     c74:	000ab107          	fld	ft2,0(s5)
     c78:	bc35859b          	addiw	a1,a1,-1085
     c7c:	7475051b          	addiw	a0,a0,1863
     c80:	05b2                	slli	a1,a1,0xc
     c82:	0532                	slli	a0,a0,0xc
     c84:	4b358593          	addi	a1,a1,1203 # 32334b3 <_stack+0x30134b3>
     c88:	e6950513          	addi	a0,a0,-407 # 201fe69 <_stack+0x1dffe69>
     c8c:	05b6                	slli	a1,a1,0xd
     c8e:	0532                	slli	a0,a0,0xc
     c90:	20358593          	addi	a1,a1,515
     c94:	6f750513          	addi	a0,a0,1783
     c98:	05b2                	slli	a1,a1,0xc
     c9a:	0532                	slli	a0,a0,0xc
     c9c:	44e58593          	addi	a1,a1,1102
     ca0:	02050513          	addi	a0,a0,32
     ca4:	028b3027          	fsd	fs0,32(s6)
     ca8:	04bcb423          	sd	a1,72(s9)
     cac:	04acb823          	sd	a0,80(s9)
     cb0:	1a107053          	fdiv.d	ft0,ft0,ft1
     cb4:	000bb087          	fld	ft1,0(s7)
     cb8:	021470d3          	fadd.d	ft1,fs0,ft1
     cbc:	001bb027          	fsd	ft1,0(s7)
     cc0:	02207153          	fadd.d	ft2,ft0,ft2
     cc4:	002ab027          	fsd	ft2,0(s5)
     cc8:	02098463          	beqz	s3,cf0 <whetstones+0x948>
     ccc:	0019e65b          	0x19e65b
     cd0:	939f950b          	0x939f950b
     cd4:	02053027          	fsd	ft0,32(a0)
     cd8:	55d000ef          	jal	ra,1a34 <start_time>
     cdc:	060d8863          	beqz	s11,d4c <whetstones+0x9a4>
     ce0:	005a1513          	slli	a0,s4,0x5
     ce4:	4589                	li	a1,2
     ce6:	24a5cf63          	blt	a1,a0,f44 <whetstones+0xb9c>
     cea:	4905                	li	s2,1
     cec:	25c0006f          	j	f48 <whetstones+0xba0>
     cf0:	939f950b          	0x939f950b
     cf4:	7110                	ld	a2,32(a0)
     cf6:	f7db950b          	0xf7db950b
     cfa:	048c8593          	addi	a1,s9,72
     cfe:	66e020ef          	jal	ra,336c <iprintf>
     d02:	f2000053          	fmv.d.x	ft0,zero
     d06:	a2801553          	flt.d	a0,ft0,fs0
     d0a:	c50d                	beqz	a0,d34 <whetstones+0x98c>
     d0c:	00001537          	lui	a0,0x1
     d10:	c4e5051b          	addiw	a0,a0,-946
     d14:	02aa0533          	mul	a0,s4,a0
     d18:	d0257053          	fcvt.s.l	ft0,a0
     d1c:	fb8f950b          	0xfb8f950b
     d20:	00053087          	fld	ft1,0(a0) # 1000 <whetstones+0xc58>
     d24:	10097053          	fmul.s	ft0,fs2,ft0
     d28:	121470d3          	fmul.d	ft1,fs0,ft1
     d2c:	42000053          	fcvt.d.s	ft0,ft0
     d30:	1a107053          	fdiv.d	ft0,ft0,ft1
     d34:	020b3603          	ld	a2,32(s6)
     d38:	ebdb950b          	0xebdb950b
     d3c:	e20005d3          	fmv.x.d	a1,ft0
     d40:	62c020ef          	jal	ra,336c <iprintf>
     d44:	4f1000ef          	jal	ra,1a34 <start_time>
     d48:	f80d9ce3          	bnez	s11,ce0 <whetstones+0x938>
     d4c:	6506                	ld	a0,64(sp)
     d4e:	2100                	fld	fs0,0(a0)
     d50:	2b00006f          	j	1000 <whetstones+0xc58>
     d54:	ff857593          	andi	a1,a0,-8
     d58:	00757613          	andi	a2,a0,7
     d5c:	40b005b3          	neg	a1,a1
     d60:	00783713          	sltiu	a4,a6,7
     d64:	ffec7793          	andi	a5,s8,-2
     d68:	00163413          	seqz	s0,a2
     d6c:	4485                	li	s1,1
     d6e:	a029                	j	d78 <whetstones+0x9d0>
     d70:	ffe78793          	addi	a5,a5,-2
     d74:	ca0782e3          	beqz	a5,a18 <whetstones+0x670>
     d78:	eb01                	bnez	a4,d88 <whetstones+0x9e0>
     d7a:	86ae                	mv	a3,a1
     d7c:	14fd                	addi	s1,s1,-1
     d7e:	06a1                	addi	a3,a3,8
     d80:	0014b493          	seqz	s1,s1
     d84:	fe069ce3          	bnez	a3,d7c <whetstones+0x9d4>
     d88:	e801                	bnez	s0,d98 <whetstones+0x9f0>
     d8a:	86b2                	mv	a3,a2
     d8c:	14fd                	addi	s1,s1,-1
     d8e:	16fd                	addi	a3,a3,-1
     d90:	009034b3          	snez	s1,s1
     d94:	fe069ce3          	bnez	a3,d8c <whetstones+0x9e4>
     d98:	86ae                	mv	a3,a1
     d9a:	e719                	bnez	a4,da8 <whetstones+0xa00>
     d9c:	14fd                	addi	s1,s1,-1
     d9e:	06a1                	addi	a3,a3,8
     da0:	0014b493          	seqz	s1,s1
     da4:	fe069ce3          	bnez	a3,d9c <whetstones+0x9f4>
     da8:	f461                	bnez	s0,d70 <whetstones+0x9c8>
     daa:	86b2                	mv	a3,a2
     dac:	14fd                	addi	s1,s1,-1
     dae:	16fd                	addi	a3,a3,-1
     db0:	009034b3          	snez	s1,s1
     db4:	fee5                	bnez	a3,dac <whetstones+0xa04>
     db6:	bf6d                	j	d70 <whetstones+0x9c8>
     db8:	ff857593          	andi	a1,a0,-8
     dbc:	40b004b3          	neg	s1,a1
     dc0:	fc8f958b          	0xfc8f958b
     dc4:	0005b007          	fld	ft0,0(a1)
     dc8:	75e2                	ld	a1,56(sp)
     dca:	0005b087          	fld	ft1,0(a1)
     dce:	fd0f958b          	0xfd0f958b
     dd2:	f2000453          	fmv.d.x	fs0,zero
     dd6:	0005b107          	fld	ft2,0(a1)
     dda:	00043187          	fld	ft3,0(s0)
     dde:	00757613          	andi	a2,a0,7
     de2:	00783713          	sltiu	a4,a6,7
     de6:	ffec7793          	andi	a5,s8,-2
     dea:	00163593          	seqz	a1,a2
     dee:	228404d3          	fmv.d	fs1,fs0
     df2:	a029                	j	dfc <whetstones+0xa54>
     df4:	ffe78793          	addi	a5,a5,-2
     df8:	d00780e3          	beqz	a5,af8 <whetstones+0x750>
     dfc:	e741                	bnez	a4,e84 <whetstones+0xadc>
     dfe:	86a6                	mv	a3,s1
     e00:	0214f253          	fadd.d	ft4,fs1,ft1
     e04:	020472d3          	fadd.d	ft5,fs0,ft0
     e08:	06a1                	addi	a3,a3,8
     e0a:	02227253          	fadd.d	ft4,ft4,ft2
     e0e:	0202f2d3          	fadd.d	ft5,ft5,ft0
     e12:	02327253          	fadd.d	ft4,ft4,ft3
     e16:	0202f2d3          	fadd.d	ft5,ft5,ft0
     e1a:	02127253          	fadd.d	ft4,ft4,ft1
     e1e:	0202f2d3          	fadd.d	ft5,ft5,ft0
     e22:	02227253          	fadd.d	ft4,ft4,ft2
     e26:	0202f2d3          	fadd.d	ft5,ft5,ft0
     e2a:	02327253          	fadd.d	ft4,ft4,ft3
     e2e:	0202f2d3          	fadd.d	ft5,ft5,ft0
     e32:	02127253          	fadd.d	ft4,ft4,ft1
     e36:	0202f2d3          	fadd.d	ft5,ft5,ft0
     e3a:	02227253          	fadd.d	ft4,ft4,ft2
     e3e:	0202f453          	fadd.d	fs0,ft5,ft0
     e42:	02327253          	fadd.d	ft4,ft4,ft3
     e46:	02127253          	fadd.d	ft4,ft4,ft1
     e4a:	02227253          	fadd.d	ft4,ft4,ft2
     e4e:	02327253          	fadd.d	ft4,ft4,ft3
     e52:	02127253          	fadd.d	ft4,ft4,ft1
     e56:	02227253          	fadd.d	ft4,ft4,ft2
     e5a:	02327253          	fadd.d	ft4,ft4,ft3
     e5e:	02127253          	fadd.d	ft4,ft4,ft1
     e62:	02227253          	fadd.d	ft4,ft4,ft2
     e66:	02327253          	fadd.d	ft4,ft4,ft3
     e6a:	02127253          	fadd.d	ft4,ft4,ft1
     e6e:	02227253          	fadd.d	ft4,ft4,ft2
     e72:	02327253          	fadd.d	ft4,ft4,ft3
     e76:	02127253          	fadd.d	ft4,ft4,ft1
     e7a:	02227253          	fadd.d	ft4,ft4,ft2
     e7e:	023274d3          	fadd.d	fs1,ft4,ft3
     e82:	febd                	bnez	a3,e00 <whetstones+0xa58>
     e84:	ed81                	bnez	a1,e9c <whetstones+0xaf4>
     e86:	86b2                	mv	a3,a2
     e88:	0214f253          	fadd.d	ft4,fs1,ft1
     e8c:	02047453          	fadd.d	fs0,fs0,ft0
     e90:	16fd                	addi	a3,a3,-1
     e92:	02227253          	fadd.d	ft4,ft4,ft2
     e96:	023274d3          	fadd.d	fs1,ft4,ft3
     e9a:	f6fd                	bnez	a3,e88 <whetstones+0xae0>
     e9c:	86a6                	mv	a3,s1
     e9e:	e359                	bnez	a4,f24 <whetstones+0xb7c>
     ea0:	0214f253          	fadd.d	ft4,fs1,ft1
     ea4:	020472d3          	fadd.d	ft5,fs0,ft0
     ea8:	06a1                	addi	a3,a3,8
     eaa:	02227253          	fadd.d	ft4,ft4,ft2
     eae:	0202f2d3          	fadd.d	ft5,ft5,ft0
     eb2:	02327253          	fadd.d	ft4,ft4,ft3
     eb6:	0202f2d3          	fadd.d	ft5,ft5,ft0
     eba:	02127253          	fadd.d	ft4,ft4,ft1
     ebe:	0202f2d3          	fadd.d	ft5,ft5,ft0
     ec2:	02227253          	fadd.d	ft4,ft4,ft2
     ec6:	0202f2d3          	fadd.d	ft5,ft5,ft0
     eca:	02327253          	fadd.d	ft4,ft4,ft3
     ece:	0202f2d3          	fadd.d	ft5,ft5,ft0
     ed2:	02127253          	fadd.d	ft4,ft4,ft1
     ed6:	0202f2d3          	fadd.d	ft5,ft5,ft0
     eda:	02227253          	fadd.d	ft4,ft4,ft2
     ede:	0202f453          	fadd.d	fs0,ft5,ft0
     ee2:	02327253          	fadd.d	ft4,ft4,ft3
     ee6:	02127253          	fadd.d	ft4,ft4,ft1
     eea:	02227253          	fadd.d	ft4,ft4,ft2
     eee:	02327253          	fadd.d	ft4,ft4,ft3
     ef2:	02127253          	fadd.d	ft4,ft4,ft1
     ef6:	02227253          	fadd.d	ft4,ft4,ft2
     efa:	02327253          	fadd.d	ft4,ft4,ft3
     efe:	02127253          	fadd.d	ft4,ft4,ft1
     f02:	02227253          	fadd.d	ft4,ft4,ft2
     f06:	02327253          	fadd.d	ft4,ft4,ft3
     f0a:	02127253          	fadd.d	ft4,ft4,ft1
     f0e:	02227253          	fadd.d	ft4,ft4,ft2
     f12:	02327253          	fadd.d	ft4,ft4,ft3
     f16:	02127253          	fadd.d	ft4,ft4,ft1
     f1a:	02227253          	fadd.d	ft4,ft4,ft2
     f1e:	023274d3          	fadd.d	fs1,ft4,ft3
     f22:	febd                	bnez	a3,ea0 <whetstones+0xaf8>
     f24:	ec0598e3          	bnez	a1,df4 <whetstones+0xa4c>
     f28:	00c006b3          	add	a3,zero,a2
     f2c:	0214f253          	fadd.d	ft4,fs1,ft1
     f30:	02047453          	fadd.d	fs0,fs0,ft0
     f34:	16fd                	addi	a3,a3,-1
     f36:	02227253          	fadd.d	ft4,ft4,ft2
     f3a:	023274d3          	fadd.d	fs1,ft4,ft3
     f3e:	f6fd                	bnez	a3,f2c <whetstones+0xb84>
     f40:	eb5ff06f          	j	df4 <whetstones+0xa4c>
     f44:	fff50913          	addi	s2,a0,-1
     f48:	6522                	ld	a0,8(sp)
     f4a:	00053987          	fld	fs3,0(a0)
     f4e:	6506                	ld	a0,64(sp)
     f50:	2100                	fld	fs0,0(a0)
     f52:	7502                	ld	a0,32(sp)
     f54:	00053a07          	fld	fs4,0(a0)
     f58:	7562                	ld	a0,56(sp)
     f5a:	00053a87          	fld	fs5,0(a0)
     f5e:	4481                	li	s1,0
     f60:	228404d3          	fmv.d	fs1,fs0
     f64:	01200433          	add	s0,zero,s2
     f68:	1088                	addi	a0,sp,96
     f6a:	08ac                	addi	a1,sp,88
     f6c:	22948553          	fmv.d	fa0,fs1
     f70:	134020ef          	jal	ra,30a4 <sincos>
     f74:	0888                	addi	a0,sp,80
     f76:	00ac                	addi	a1,sp,72
     f78:	22840553          	fmv.d	fa0,fs0
     f7c:	128020ef          	jal	ra,30a4 <sincos>
     f80:	0284f553          	fadd.d	fa0,fs1,fs0
     f84:	338010ef          	jal	ra,22bc <cos>
     f88:	0a84f053          	fsub.d	ft0,fs1,fs0
     f8c:	22a504d3          	fmv.d	fs1,fa0
     f90:	22000553          	fmv.d	fa0,ft0
     f94:	328010ef          	jal	ra,22bc <cos>
     f98:	3006                	fld	ft0,96(sp)
     f9a:	02a4f0d3          	fadd.d	ft1,fs1,fa0
     f9e:	2166                	fld	ft2,88(sp)
     fa0:	02007053          	fadd.d	ft0,ft0,ft0
     fa4:	0330f0d3          	fadd.d	ft1,ft1,fs3
     fa8:	12017053          	fmul.d	ft0,ft2,ft0
     fac:	1a107553          	fdiv.d	fa0,ft0,ft1
     fb0:	15c010ef          	jal	ra,210c <atan>
     fb4:	12aa74d3          	fmul.d	fs1,fs4,fa0
     fb8:	02947553          	fadd.d	fa0,fs0,fs1
     fbc:	300010ef          	jal	ra,22bc <cos>
     fc0:	0a84f053          	fsub.d	ft0,fs1,fs0
     fc4:	22a50453          	fmv.d	fs0,fa0
     fc8:	22000553          	fmv.d	fa0,ft0
     fcc:	2f0010ef          	jal	ra,22bc <cos>
     fd0:	2046                	fld	ft0,80(sp)
     fd2:	02a470d3          	fadd.d	ft1,fs0,fa0
     fd6:	2126                	fld	ft2,72(sp)
     fd8:	02007053          	fadd.d	ft0,ft0,ft0
     fdc:	0330f0d3          	fadd.d	ft1,ft1,fs3
     fe0:	12017053          	fmul.d	ft0,ft2,ft0
     fe4:	1a107553          	fdiv.d	fa0,ft0,ft1
     fe8:	124010ef          	jal	ra,210c <atan>
     fec:	12aa7453          	fmul.d	fs0,fs4,fa0
     ff0:	147d                	addi	s0,s0,-1
     ff2:	f83d                	bnez	s0,f68 <whetstones+0xbc0>
     ff4:	0b4afa53          	fsub.d	fs4,fs5,fs4
     ff8:	00148493          	addi	s1,s1,1
     ffc:	f78494e3          	bne	s1,s8,f64 <whetstones+0xbbc>
    1000:	255000ef          	jal	ra,1a54 <end_time>
    1004:	02000513          	li	a0,32
    1008:	06ac9523          	sh	a0,106(s9)
    100c:	0632c537          	lui	a0,0x632c
    1010:	6e75051b          	addiw	a0,a0,1767
    1014:	0532                	slli	a0,a0,0xc
    1016:	97350513          	addi	a0,a0,-1677 # 632b973 <_stack+0x610b973>
    101a:	0532                	slli	a0,a0,0xc
    101c:	20350513          	addi	a0,a0,515
    1020:	0532                	slli	a0,a0,0xc
    1022:	54e50513          	addi	a0,a0,1358
    1026:	000d3487          	fld	fs1,0(s10)
    102a:	000ab007          	fld	ft0,0(s5)
    102e:	000bb087          	fld	ft1,0(s7)
    1032:	04acbd23          	sd	a0,90(s9)
    1036:	0202e537          	lui	a0,0x202e
    103a:	6375051b          	addiw	a0,a0,1591
    103e:	0532                	slli	a0,a0,0xc
    1040:	46550513          	addi	a0,a0,1125 # 202e465 <_stack+0x1e0e465>
    1044:	02047053          	fadd.d	ft0,fs0,ft0
    1048:	0214f0d3          	fadd.d	ft1,fs1,ft1
    104c:	0532                	slli	a0,a0,0xc
    104e:	20750513          	addi	a0,a0,519
    1052:	00c51513          	slli	a0,a0,0xc
    1056:	36f50513          	addi	a0,a0,879
    105a:	000ab027          	fsd	ft0,0(s5)
    105e:	029b3427          	fsd	fs1,40(s6)
    1062:	001bb027          	fsd	ft1,0(s7)
    1066:	06acb123          	sd	a0,98(s9)
    106a:	14098b63          	beqz	s3,11c0 <whetstones+0xe18>
    106e:	6442                	ld	s0,16(sp)
    1070:	74e2                	ld	s1,56(sp)
    1072:	0019e55b          	0x19e55b
    1076:	939f950b          	0x939f950b
    107a:	b500                	fsd	fs0,40(a0)
    107c:	1b9000ef          	jal	ra,1a34 <start_time>
    1080:	fe0f990b          	0xfe0f990b
    1084:	180d8e63          	beqz	s11,1220 <whetstones+0xe78>
    1088:	38300513          	li	a0,899
    108c:	02aa0733          	mul	a4,s4,a0
    1090:	4505                	li	a0,1
    1092:	00e54363          	blt	a0,a4,1098 <whetstones+0xcf0>
    1096:	4705                	li	a4,1
    1098:	55fd                	li	a1,-1
    109a:	7782                	ld	a5,32(sp)
    109c:	15fe                	slli	a1,a1,0x3f
    109e:	2080                	fld	fs0,0(s1)
    10a0:	0007b007          	fld	ft0,0(a5)
    10a4:	6786                	ld	a5,64(sp)
    10a6:	00093087          	fld	ft1,0(s2)
    10aa:	0007b107          	fld	ft2,0(a5)
    10ae:	15e1                	addi	a1,a1,-8
    10b0:	8df9                	and	a1,a1,a4
    10b2:	00777613          	andi	a2,a4,7
    10b6:	177d                	addi	a4,a4,-1
    10b8:	4501                	li	a0,0
    10ba:	40b005b3          	neg	a1,a1
    10be:	00163693          	seqz	a3,a2
    10c2:	00773713          	sltiu	a4,a4,7
    10c6:	228401d3          	fmv.d	ft3,fs0
    10ca:	a029                	j	10d4 <whetstones+0xd2c>
    10cc:	00150513          	addi	a0,a0,1
    10d0:	15850a63          	beq	a0,s8,1224 <whetstones+0xe7c>
    10d4:	e761                	bnez	a4,119c <whetstones+0xdf4>
    10d6:	87ae                	mv	a5,a1
    10d8:	0281f1d3          	fadd.d	ft3,ft3,fs0
    10dc:	07a1                	addi	a5,a5,8
    10de:	1201f1d3          	fmul.d	ft3,ft3,ft0
    10e2:	02347253          	fadd.d	ft4,fs0,ft3
    10e6:	12127253          	fmul.d	ft4,ft4,ft1
    10ea:	0241f1d3          	fadd.d	ft3,ft3,ft4
    10ee:	1221f1d3          	fmul.d	ft3,ft3,ft2
    10f2:	02327253          	fadd.d	ft4,ft4,ft3
    10f6:	12027253          	fmul.d	ft4,ft4,ft0
    10fa:	0241f1d3          	fadd.d	ft3,ft3,ft4
    10fe:	1211f1d3          	fmul.d	ft3,ft3,ft1
    1102:	02327253          	fadd.d	ft4,ft4,ft3
    1106:	12227253          	fmul.d	ft4,ft4,ft2
    110a:	0241f1d3          	fadd.d	ft3,ft3,ft4
    110e:	1201f1d3          	fmul.d	ft3,ft3,ft0
    1112:	02327253          	fadd.d	ft4,ft4,ft3
    1116:	12127253          	fmul.d	ft4,ft4,ft1
    111a:	0241f1d3          	fadd.d	ft3,ft3,ft4
    111e:	1221f1d3          	fmul.d	ft3,ft3,ft2
    1122:	02327253          	fadd.d	ft4,ft4,ft3
    1126:	12027253          	fmul.d	ft4,ft4,ft0
    112a:	0241f1d3          	fadd.d	ft3,ft3,ft4
    112e:	1211f1d3          	fmul.d	ft3,ft3,ft1
    1132:	02327253          	fadd.d	ft4,ft4,ft3
    1136:	12227253          	fmul.d	ft4,ft4,ft2
    113a:	0241f1d3          	fadd.d	ft3,ft3,ft4
    113e:	1201f1d3          	fmul.d	ft3,ft3,ft0
    1142:	02327253          	fadd.d	ft4,ft4,ft3
    1146:	12127253          	fmul.d	ft4,ft4,ft1
    114a:	0241f1d3          	fadd.d	ft3,ft3,ft4
    114e:	1221f1d3          	fmul.d	ft3,ft3,ft2
    1152:	02327253          	fadd.d	ft4,ft4,ft3
    1156:	12027253          	fmul.d	ft4,ft4,ft0
    115a:	0241f1d3          	fadd.d	ft3,ft3,ft4
    115e:	1211f1d3          	fmul.d	ft3,ft3,ft1
    1162:	02327253          	fadd.d	ft4,ft4,ft3
    1166:	12227253          	fmul.d	ft4,ft4,ft2
    116a:	0241f1d3          	fadd.d	ft3,ft3,ft4
    116e:	1201f1d3          	fmul.d	ft3,ft3,ft0
    1172:	02327253          	fadd.d	ft4,ft4,ft3
    1176:	12127253          	fmul.d	ft4,ft4,ft1
    117a:	0241f1d3          	fadd.d	ft3,ft3,ft4
    117e:	1221f1d3          	fmul.d	ft3,ft3,ft2
    1182:	02327253          	fadd.d	ft4,ft4,ft3
    1186:	12027253          	fmul.d	ft4,ft4,ft0
    118a:	0241f1d3          	fadd.d	ft3,ft3,ft4
    118e:	1211f1d3          	fmul.d	ft3,ft3,ft1
    1192:	02327253          	fadd.d	ft4,ft4,ft3
    1196:	12227453          	fmul.d	fs0,ft4,ft2
    119a:	ff9d                	bnez	a5,10d8 <whetstones+0xd30>
    119c:	fa85                	bnez	a3,10cc <whetstones+0xd24>
    119e:	87b2                	mv	a5,a2
    11a0:	0281f1d3          	fadd.d	ft3,ft3,fs0
    11a4:	17fd                	addi	a5,a5,-1
    11a6:	1201f253          	fmul.d	ft4,ft3,ft0
    11aa:	024471d3          	fadd.d	ft3,fs0,ft4
    11ae:	1211f1d3          	fmul.d	ft3,ft3,ft1
    11b2:	02327253          	fadd.d	ft4,ft4,ft3
    11b6:	12227453          	fmul.d	fs0,ft4,ft2
    11ba:	f3fd                	bnez	a5,11a0 <whetstones+0xdf8>
    11bc:	f11ff06f          	j	10cc <whetstones+0xd24>
    11c0:	939f950b          	0x939f950b
    11c4:	7510                	ld	a2,40(a0)
    11c6:	f7db950b          	0xf7db950b
    11ca:	05ac8593          	addi	a1,s9,90
    11ce:	19e020ef          	jal	ra,336c <iprintf>
    11d2:	f2000053          	fmv.d.x	ft0,zero
    11d6:	a2901553          	flt.d	a0,ft0,fs1
    11da:	c11d                	beqz	a0,1200 <whetstones+0xe58>
    11dc:	34000513          	li	a0,832
    11e0:	02aa0533          	mul	a0,s4,a0
    11e4:	d0257053          	fcvt.s.l	ft0,a0
    11e8:	fb8f950b          	0xfb8f950b
    11ec:	00053087          	fld	ft1,0(a0)
    11f0:	10097053          	fmul.s	ft0,fs2,ft0
    11f4:	1214f0d3          	fmul.d	ft1,fs1,ft1
    11f8:	42000053          	fcvt.d.s	ft0,ft0
    11fc:	1a107053          	fdiv.d	ft0,ft0,ft1
    1200:	028b3603          	ld	a2,40(s6)
    1204:	ebdb950b          	0xebdb950b
    1208:	e20005d3          	fmv.x.d	a1,ft0
    120c:	160020ef          	jal	ra,336c <iprintf>
    1210:	6442                	ld	s0,16(sp)
    1212:	74e2                	ld	s1,56(sp)
    1214:	021000ef          	jal	ra,1a34 <start_time>
    1218:	fe0f990b          	0xfe0f990b
    121c:	e60d96e3          	bnez	s11,1088 <whetstones+0xce0>
    1220:	2080                	fld	fs0,0(s1)
    1222:	0001                	nop
    1224:	031000ef          	jal	ra,1a54 <end_time>
    1228:	07400513          	li	a0,116
    122c:	06ac9e23          	sh	a0,124(s9)
    1230:	03a31537          	lui	a0,0x3a31
    1234:	b7b5051b          	addiw	a0,a0,-1157
    1238:	0532                	slli	a0,a0,0xc
    123a:	63350513          	addi	a0,a0,1587 # 3a31633 <_stack+0x3811633>
    123e:	0536                	slli	a0,a0,0xd
    1240:	20350513          	addi	a0,a0,515
    1244:	0532                	slli	a0,a0,0xc
    1246:	64e50513          	addi	a0,a0,1614
    124a:	000d3487          	fld	fs1,0(s10)
    124e:	000ab007          	fld	ft0,0(s5)
    1252:	000bb087          	fld	ft1,0(s7)
    1256:	06acb623          	sd	a0,108(s9)
    125a:	0006e537          	lui	a0,0x6e
    125e:	6975051b          	addiw	a0,a0,1687
    1262:	053e                	slli	a0,a0,0xf
    1264:	b8150513          	addi	a0,a0,-1151 # 6db81 <NDS_SAG_LMA_DATA+0x69ce1>
    1268:	02047053          	fadd.d	ft0,fs0,ft0
    126c:	0214f0d3          	fadd.d	ft1,fs1,ft1
    1270:	0546                	slli	a0,a0,0x11
    1272:	67750513          	addi	a0,a0,1655
    1276:	00c51513          	slli	a0,a0,0xc
    127a:	e6950513          	addi	a0,a0,-407
    127e:	000ab027          	fsd	ft0,0(s5)
    1282:	029b3827          	fsd	fs1,48(s6)
    1286:	001bb027          	fsd	ft1,0(s7)
    128a:	06acba23          	sd	a0,116(s9)
    128e:	10098563          	beqz	s3,1398 <whetstones+0xff0>
    1292:	0019e55b          	0x19e55b
    1296:	939f950b          	0x939f950b
    129a:	b900                	fsd	fs0,48(a0)
    129c:	798000ef          	jal	ra,1a34 <start_time>
    12a0:	14040a63          	beqz	s0,13f4 <whetstones+0x104c>
    12a4:	26800513          	li	a0,616
    12a8:	02aa0633          	mul	a2,s4,a0
    12ac:	64e2                	ld	s1,24(sp)
    12ae:	8532                	mv	a0,a2
    12b0:	00c04463          	bgtz	a2,12b8 <whetstones+0xf10>
    12b4:	00000513          	li	a0,0
    12b8:	fd0f968b          	0xfd0f968b
    12bc:	0004b087          	fld	ft1,0(s1)
    12c0:	0006b007          	fld	ft0,0(a3)
    12c4:	003c7593          	andi	a1,s8,3
    12c8:	fffc0713          	addi	a4,s8,-1
    12cc:	00300793          	li	a5,3
    12d0:	00162613          	slti	a2,a2,1
    12d4:	08f76663          	bltu	a4,a5,1360 <whetstones+0xfb8>
    12d8:	ffcc7693          	andi	a3,s8,-4
    12dc:	e601                	bnez	a2,12e4 <whetstones+0xf3c>
    12de:	872a                	mv	a4,a0
    12e0:	1761                	addi	a4,a4,-8
    12e2:	ff7d                	bnez	a4,12e0 <whetstones+0xf38>
    12e4:	fff00713          	li	a4,-1
    12e8:	220001d3          	fmv.d	ft3,ft0
    12ec:	22108053          	fmv.d	ft0,ft1
    12f0:	87ba                	mv	a5,a4
    12f2:	0705                	addi	a4,a4,1
    12f4:	223180d3          	fmv.d	ft1,ft3
    12f8:	fef778e3          	bgeu	a4,a5,12e8 <whetstones+0xf40>
    12fc:	872a                	mv	a4,a0
    12fe:	e219                	bnez	a2,1304 <whetstones+0xf5c>
    1300:	1761                	addi	a4,a4,-8
    1302:	ff7d                	bnez	a4,1300 <whetstones+0xf58>
    1304:	fff00713          	li	a4,-1
    1308:	22318153          	fmv.d	ft2,ft3
    130c:	220001d3          	fmv.d	ft3,ft0
    1310:	87ba                	mv	a5,a4
    1312:	0705                	addi	a4,a4,1
    1314:	22210053          	fmv.d	ft0,ft2
    1318:	fef778e3          	bgeu	a4,a5,1308 <whetstones+0xf60>
    131c:	e601                	bnez	a2,1324 <whetstones+0xf7c>
    131e:	872a                	mv	a4,a0
    1320:	1761                	addi	a4,a4,-8
    1322:	ff7d                	bnez	a4,1320 <whetstones+0xf78>
    1324:	fff00713          	li	a4,-1
    1328:	222100d3          	fmv.d	ft1,ft2
    132c:	22318153          	fmv.d	ft2,ft3
    1330:	87ba                	mv	a5,a4
    1332:	0705                	addi	a4,a4,1
    1334:	221081d3          	fmv.d	ft3,ft1
    1338:	fef778e3          	bgeu	a4,a5,1328 <whetstones+0xf80>
    133c:	e601                	bnez	a2,1344 <whetstones+0xf9c>
    133e:	872a                	mv	a4,a0
    1340:	1761                	addi	a4,a4,-8
    1342:	ff7d                	bnez	a4,1340 <whetstones+0xf98>
    1344:	fff00713          	li	a4,-1
    1348:	22108053          	fmv.d	ft0,ft1
    134c:	222100d3          	fmv.d	ft1,ft2
    1350:	87ba                	mv	a5,a4
    1352:	0705                	addi	a4,a4,1
    1354:	22000153          	fmv.d	ft2,ft0
    1358:	fef778e3          	bgeu	a4,a5,1348 <whetstones+0xfa0>
    135c:	16f1                	addi	a3,a3,-4
    135e:	febd                	bnez	a3,12dc <whetstones+0xf34>
    1360:	22108453          	fmv.d	fs0,ft1
    1364:	08058a63          	beqz	a1,13f8 <whetstones+0x1050>
    1368:	e601                	bnez	a2,1370 <whetstones+0xfc8>
    136a:	86aa                	mv	a3,a0
    136c:	16e1                	addi	a3,a3,-8
    136e:	fefd                	bnez	a3,136c <whetstones+0xfc4>
    1370:	fff00693          	li	a3,-1
    1374:	22000453          	fmv.d	fs0,ft0
    1378:	22840053          	fmv.d	ft0,fs0
    137c:	22108453          	fmv.d	fs0,ft1
    1380:	8736                	mv	a4,a3
    1382:	0685                	addi	a3,a3,1
    1384:	220000d3          	fmv.d	ft1,ft0
    1388:	fee6f8e3          	bgeu	a3,a4,1378 <whetstones+0xfd0>
    138c:	15fd                	addi	a1,a1,-1
    138e:	228400d3          	fmv.d	ft1,fs0
    1392:	f9f9                	bnez	a1,1368 <whetstones+0xfc0>
    1394:	0640006f          	j	13f8 <whetstones+0x1050>
    1398:	939f950b          	0x939f950b
    139c:	7910                	ld	a2,48(a0)
    139e:	f7db950b          	0xf7db950b
    13a2:	06cc8593          	addi	a1,s9,108
    13a6:	7c7010ef          	jal	ra,336c <iprintf>
    13aa:	f2000053          	fmv.d.x	ft0,zero
    13ae:	a2901553          	flt.d	a0,ft0,fs1
    13b2:	c50d                	beqz	a0,13dc <whetstones+0x1034>
    13b4:	00001537          	lui	a0,0x1
    13b8:	5125051b          	addiw	a0,a0,1298
    13bc:	02aa0533          	mul	a0,s4,a0
    13c0:	d0257053          	fcvt.s.l	ft0,a0
    13c4:	fb8f950b          	0xfb8f950b
    13c8:	00053087          	fld	ft1,0(a0) # 1000 <whetstones+0xc58>
    13cc:	10097053          	fmul.s	ft0,fs2,ft0
    13d0:	1214f0d3          	fmul.d	ft1,fs1,ft1
    13d4:	42000053          	fcvt.d.s	ft0,ft0
    13d8:	1a107053          	fdiv.d	ft0,ft0,ft1
    13dc:	030b3603          	ld	a2,48(s6)
    13e0:	820d950b          	0x820d950b
    13e4:	e20005d3          	fmv.x.d	a1,ft0
    13e8:	785010ef          	jal	ra,336c <iprintf>
    13ec:	648000ef          	jal	ra,1a34 <start_time>
    13f0:	ea041ae3          	bnez	s0,12a4 <whetstones+0xefc>
    13f4:	6562                	ld	a0,24(sp)
    13f6:	2100                	fld	fs0,0(a0)
    13f8:	65c000ef          	jal	ra,1a54 <end_time>
    13fc:	02000513          	li	a0,32
    1400:	08ac9723          	sh	a0,142(s9)
    1404:	06769537          	lui	a0,0x6769
    1408:	7375051b          	addiw	a0,a0,1847
    140c:	0532                	slli	a0,a0,0xc
    140e:	36150513          	addi	a0,a0,865 # 6769361 <_stack+0x6549361>
    1412:	0532                	slli	a0,a0,0xc
    1414:	20350513          	addi	a0,a0,515
    1418:	0532                	slli	a0,a0,0xc
    141a:	74e50513          	addi	a0,a0,1870
    141e:	000d3487          	fld	fs1,0(s10)
    1422:	000ab007          	fld	ft0,0(s5)
    1426:	000bb087          	fld	ft1,0(s7)
    142a:	06acbf23          	sd	a0,126(s9)
    142e:	00404537          	lui	a0,0x404
    1432:	0e75051b          	addiw	a0,a0,231
    1436:	053a                	slli	a0,a0,0xe
    1438:	a3750513          	addi	a0,a0,-1481 # 403a37 <_stack+0x1e3a37>
    143c:	02047053          	fadd.d	ft0,fs0,ft0
    1440:	0214f0d3          	fadd.d	ft1,fs1,ft1
    1444:	0536                	slli	a0,a0,0xd
    1446:	65750513          	addi	a0,a0,1623
    144a:	0532                	slli	a0,a0,0xc
    144c:	d6e50513          	addi	a0,a0,-658
    1450:	000ab027          	fsd	ft0,0(s5)
    1454:	029b3c27          	fsd	fs1,56(s6)
    