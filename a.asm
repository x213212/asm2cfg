
000000000000a6d8 <xmp3_PolyphaseStereo>:
 * Notes:       interleaves PCM samples LRLRLR...
 *
 * TODO:        add 32-bit version for platforms where 64-bit mul-acc is not supported
 **************************************************************************************/
void PolyphaseStereo(short *pcm, int *vbuf, const int *coefBase)
{
    a6d8:	7111                	c.addi16sp	sp,-256
    a6da:	fda2                	c.sdsp	s0,248(sp)
    a6dc:	0d05a403          	lw	s0,208(a1)
    a6e0:	f9a6                	c.sdsp	s1,240(sp)
    a6e2:	0905a483          	lw	s1,144(a1)
    a6e6:	f5ca                	c.sdsp	s2,232(sp)
    a6e8:	f1ce                	c.sdsp	s3,224(sp)
    a6ea:	edd2                	c.sdsp	s4,216(sp)
    a6ec:	e9d6                	c.sdsp	s5,208(sp)
    a6ee:	e5da                	c.sdsp	s6,200(sp)
    a6f0:	e1de                	c.sdsp	s7,192(sp)
    a6f2:	fd62                	c.sdsp	s8,184(sp)
    a6f4:	f966                	c.sdsp	s9,176(sp)
    a6f6:	f56a                	c.sdsp	s10,168(sp)
    a6f8:	f16e                	c.sdsp	s11,160(sp)
    a6fa:	e022                	c.sdsp	s0,0(sp)
    a6fc:	421c                	c.lw	a5,0(a2)
    a6fe:	00862f83          	lw	t6,8(a2)
    a702:	01062e83          	lw	t4,16(a2)
    a706:	01862303          	lw	t1,24(a2)
    a70a:	02062883          	lw	a7,32(a2)
    a70e:	02862803          	lw	a6,40(a2)
    a712:	5a14                	c.lw	a3,48(a2)
    a714:	03862a83          	lw	s5,56(a2)
    a718:	0805ae03          	lw	t3,128(a1)
    a71c:	0dc5a383          	lw	t2,220(a1)
    a720:	0845ad83          	lw	s11,132(a1)
    a724:	0d85ad03          	lw	s10,216(a1)
    a728:	0885ac83          	lw	s9,136(a1)
    a72c:	08c5ab83          	lw	s7,140(a1)
    ps0(pcm, vb1, coef);
#else
        sum1L = sum1R = rndVal;
        MC0S(0)
    a730:	00462283          	lw	t0,4(a2)
        MC0S(1)
    a734:	00c62f03          	lw	t5,12(a2)
    a738:	0d45ac03          	lw	s8,212(a1)
    a73c:	e426                	c.sdsp	s1,8(sp)
    a73e:	0cc5a703          	lw	a4,204(a1)
    a742:	0945ab03          	lw	s6,148(a1)
    a746:	0985a983          	lw	s3,152(a1)
    a74a:	e83a                	c.sdsp	a4,16(sp)
    a74c:	4198                	c.lw	a4,0(a1)
    a74e:	0c85aa03          	lw	s4,200(a1)
    a752:	0c45a903          	lw	s2,196(a1)
    a756:	ec5a                	c.sdsp	s6,24(sp)
    a758:	05c5ab03          	lw	s6,92(a1)
    a75c:	0c05a483          	lw	s1,192(a1)
    a760:	02f70733          	mul	a4,a4,a5
    a764:	405002bb          	negw	t0,t0
    a768:	f44e                	c.sdsp	s3,40(sp)
    a76a:	0045a983          	lw	s3,4(a1)
    a76e:	09c5a403          	lw	s0,156(a1)
    a772:	f052                	c.sdsp	s4,32(sp)
    a774:	f84a                	c.sdsp	s2,48(sp)
    a776:	025b0a33          	mul	s4,s6,t0
    a77a:	0585a903          	lw	s2,88(a1)
    a77e:	02fe07b3          	mul	a5,t3,a5
    a782:	03f989b3          	mul	s3,s3,t6
    a786:	01462e03          	lw	t3,20(a2)
    a78a:	41e00f3b          	negw	t5,t5
    a78e:	02000b37          	lui	s6,0x2000
    a792:	e0a6                	c.sdsp	s1,64(sp)
    a794:	4584                	c.lw	s1,8(a1)
    a796:	975a                	c.add	a4,s6
    a798:	03e90933          	mul	s2,s2,t5
    a79c:	fc22                	c.sdsp	s0,56(sp)
    a79e:	49e0                	c.lw	s0,84(a1)
    a7a0:	025382b3          	mul	t0,t2,t0
    a7a4:	03d484b3          	mul	s1,s1,t4
    a7a8:	41c00e3b          	negw	t3,t3
    a7ac:	9a3a                	c.add	s4,a4
    a7ae:	00c5a383          	lw	t2,12(a1)
    a7b2:	4e58                	c.lw	a4,28(a2)
    a7b4:	99d2                	c.add	s3,s4
    a7b6:	03fd8fb3          	mul	t6,s11,t6
    a7ba:	03c40433          	mul	s0,s0,t3
    a7be:	0505ad83          	lw	s11,80(a1)
    a7c2:	026383b3          	mul	t2,t2,t1
    a7c6:	40e00a3b          	negw	s4,a4
    a7ca:	994e                	c.add	s2,s3
    a7cc:	03ed0f33          	mul	t5,s10,t5
    a7d0:	03dc8eb3          	mul	t4,s9,t4
    a7d4:	0105ad03          	lw	s10,16(a1)
    a7d8:	02462c83          	lw	s9,36(a2)
    a7dc:	9b3e                	c.add	s6,a5
    a7de:	005b07b3          	add	a5,s6,t0
    a7e2:	04c5a983          	lw	s3,76(a1)
    a7e6:	009902b3          	add	t0,s2,s1
    a7ea:	034d8db3          	mul	s11,s11,s4
    a7ee:	49c4                	c.lw	s1,20(a1)
    a7f0:	4190093b          	negw	s2,s9
    a7f4:	9416                	c.add	s0,t0
    a7f6:	03cc0c33          	mul	s8,s8,t3
    a7fa:	031d0e33          	mul	t3,s10,a7
    a7fe:	00740733          	add	a4,s0,t2
    a802:	026b8333          	mul	t1,s7,t1
    a806:	6b02                	c.ldsp	s6,0(sp)
    a808:	03298bb3          	mul	s7,s3,s2
    a80c:	9fbe                	c.add	t6,a5
    a80e:	030482b3          	mul	t0,s1,a6
    a812:	0485ad03          	lw	s10,72(a1)
    a816:	02c62383          	lw	t2,44(a2)
    a81a:	0185ac83          	lw	s9,24(a1)
    a81e:	9f7e                	c.add	t5,t6
    a820:	67a2                	c.ldsp	a5,8(sp)
    a822:	9dba                	c.add	s11,a4
    a824:	034b0a33          	mul	s4,s6,s4
    a828:	9efa                	c.add	t4,t5
    a82a:	9e6e                	c.add	t3,s11
    a82c:	6442                	c.ldsp	s0,16(sp)
    a82e:	407009bb          	negw	s3,t2
    a832:	9c76                	c.add	s8,t4
    a834:	9bf2                	c.add	s7,t3
    a836:	031788b3          	mul	a7,a5,a7
    a83a:	5a44                	c.lw	s1,52(a2)
    a83c:	02dc8f33          	mul	t5,s9,a3
    a840:	005b8733          	add	a4,s7,t0
    a844:	006c0cb3          	add	s9,s8,t1
    a848:	033d0b33          	mul	s6,s10,s3
    a84c:	03240933          	mul	s2,s0,s2
    a850:	0445af83          	lw	t6,68(a1)
    a854:	6362                	c.ldsp	t1,24(sp)
    a856:	7282                	c.ldsp	t0,32(sp)
    a858:	014c87b3          	add	a5,s9,s4
    a85c:	40900d3b          	negw	s10,s1
    a860:	01c5a383          	lw	t2,28(a1)
    a864:	03c62a03          	lw	s4,60(a2)
    a868:	03af8eb3          	mul	t4,t6,s10
    a86c:	03328e33          	mul	t3,t0,s3
    a870:	03030833          	mul	a6,t1,a6
    a874:	98be                	c.add	a7,a5
    a876:	0405ad83          	lw	s11,64(a1)
    a87a:	79a2                	c.ldsp	s3,40(sp)
    a87c:	03538433          	mul	s0,t2,s5
    a880:	41400c3b          	negw	s8,s4
    a884:	01288fb3          	add	t6,a7,s2
    a888:	9b3a                	c.add	s6,a4
    a88a:	7942                	c.ldsp	s2,48(sp)
    a88c:	038d83b3          	mul	t2,s11,s8
    a890:	01eb04b3          	add	s1,s6,t5
    a894:	02d986b3          	mul	a3,s3,a3
    a898:	7be2                	c.ldsp	s7,56(sp)
    a89a:	010f8f33          	add	t5,t6,a6
    a89e:	01d48cb3          	add	s9,s1,t4
    a8a2:	03a90d33          	mul	s10,s2,s10
    a8a6:	6e86                	c.ldsp	t4,64(sp)
    a8a8:	01cf0333          	add	t1,t5,t3
    a8ac:	008c8833          	add	a6,s9,s0
    a8b0:	035b8ab3          	mul	s5,s7,s5
    a8b4:	038e8db3          	mul	s11,t4,s8
    a8b8:	00d307b3          	add	a5,t1,a3
    a8bc:	00780733          	add	a4,a6,t2
        MC0S(4)
        MC0S(5)
        MC0S(6)
        MC0S(7)
        *(pcm + 0) = ClipToShort((int)SAR64(sum1L, (32 - CSHIFT)), DEF_NFRACBITS);
    a8c0:	cd473a5b          	bfos	s4,a4,51,20
    a8c4:	01a78c33          	add	s8,a5,s10
    a8c8:	015c02b3          	add	t0,s8,s5
    sign = x >> 31;
    a8cc:	41fa5e1b          	sraiw	t3,s4,0x1f
    if (sign != (x >> 15))
    a8d0:	415a541b          	sraiw	s0,s4,0x15
    a8d4:	01b288b3          	add	a7,t0,s11
    a8d8:	5bc40663          	beq	s0,t3,ae84 <xmp3_PolyphaseStereo+0x7ac>
        x = sign ^ ((1 << 15) - 1);
    a8dc:	00008b37          	lui	s6,0x8
    a8e0:	fffb0993          	addi	s3,s6,-1 # 7fff <xmp3_UnpackScaleFactors+0x673>
        *(pcm + 1) = ClipToShort((int)SAR64(sum1R, (32 - CSHIFT)), DEF_NFRACBITS);
    a8e4:	cd48b3db          	bfos	t2,a7,51,20
        x = sign ^ ((1 << 15) - 1);
    a8e8:	013e46b3          	xor	a3,t3,s3
    sign = x >> 31;
    a8ec:	41f3df9b          	sraiw	t6,t2,0x1f
    if (sign != (x >> 15))
    a8f0:	4153d49b          	sraiw	s1,t2,0x15
    return (short)x;
    a8f4:	00d51023          	sh	a3,0(a0)
    if (sign != (x >> 15))
    a8f8:	5bf48263          	beq	s1,t6,ae9c <xmp3_PolyphaseStereo+0x7c4>
        x = sign ^ ((1 << 15) - 1);
    a8fc:	00008937          	lui	s2,0x8
    a900:	fff90d13          	addi	s10,s2,-1 # 7fff <xmp3_UnpackScaleFactors+0x673>
    a904:	01afccb3          	xor	s9,t6,s10
#if 0
    ps1(pcm, vb1, coef);
#else
    sum1L = sum1R = rndVal;
    MC1S(0)
    a908:	6f05                	c.lui	t5,0x1
    a90a:	01e58833          	add	a6,a1,t5
    a90e:	40062b83          	lw	s7,1024(a2)
    a912:	00082a83          	lw	s5,0(a6) # 1000 <xmp3_DequantChannel+0x3b4>
    a916:	00482303          	lw	t1,4(a6)
    a91a:	40462d83          	lw	s11,1028(a2)
    a91e:	00882783          	lw	a5,8(a6)
    a922:	037a8733          	mul	a4,s5,s7
    a926:	40862883          	lw	a7,1032(a2)
    a92a:	03b30eb3          	mul	t4,t1,s11
    a92e:	08082c03          	lw	s8,128(a6)
    a932:	00c82403          	lw	s0,12(a6)
    a936:	40c62283          	lw	t0,1036(a2)
    a93a:	08482a03          	lw	s4,132(a6)
    a93e:	01082983          	lw	s3,16(a6)
    a942:	03178e33          	mul	t3,a5,a7
    a946:	41062d03          	lw	s10,1040(a2)
    a94a:	02000b37          	lui	s6,0x2000
    a94e:	037c06b3          	mul	a3,s8,s7
    a952:	02540f33          	mul	t5,s0,t0
    a956:	08882483          	lw	s1,136(a6)
    a95a:	01482383          	lw	t2,20(a6)
    a95e:	41462a83          	lw	s5,1044(a2)
    a962:	01670bb3          	add	s7,a4,s6
    a966:	08c82303          	lw	t1,140(a6)
    a96a:	01882f83          	lw	t6,24(a6)
    a96e:	01db8733          	add	a4,s7,t4
    a972:	03ba0db3          	mul	s11,s4,s11
    a976:	41862903          	lw	s2,1048(a2)
    a97a:	03a98a33          	mul	s4,s3,s10
    a97e:	03538433          	mul	s0,t2,s5
    a982:	09082983          	lw	s3,144(a6)
    a986:	01c82e83          	lw	t4,28(a6)
    a98a:	01c707b3          	add	a5,a4,t3
    a98e:	031488b3          	mul	a7,s1,a7
    a992:	41c62c03          	lw	s8,1052(a2)
    a996:	032f84b3          	mul	s1,t6,s2
    a99a:	01e783b3          	add	t2,a5,t5
    a99e:	025302b3          	mul	t0,t1,t0
    a9a2:	09482e03          	lw	t3,148(a6)
    a9a6:	9b36                	c.add	s6,a3
    a9a8:	038e8f33          	mul	t5,t4,s8
    a9ac:	09882b83          	lw	s7,152(a6)
    a9b0:	03a98d33          	mul	s10,s3,s10
    a9b4:	01bb06b3          	add	a3,s6,s11
    a9b8:	01438db3          	add	s11,t2,s4
    a9bc:	09c82803          	lw	a6,156(a6)
    a9c0:	01168a33          	add	s4,a3,a7
    a9c4:	008d8333          	add	t1,s11,s0
    a9c8:	035e0ab3          	mul	s5,t3,s5
    a9cc:	005a0fb3          	add	t6,s4,t0
    a9d0:	009308b3          	add	a7,t1,s1
    a9d4:	032b8933          	mul	s2,s7,s2
    a9d8:	03880c33          	mul	s8,a6,s8
    a9dc:	01af8733          	add	a4,t6,s10
    a9e0:	01e88433          	add	s0,a7,t5
    MC1S(4)
    MC1S(5)
    MC1S(6)
    MC1S(7)
    *(pcm + 2 * 16 + 0) = ClipToShort((int)SAR64(sum1L, (32 - CSHIFT)), DEF_NFRACBITS);
    a9e4:	cd4439db          	bfos	s3,s0,51,20
    a9e8:	01570eb3          	add	t4,a4,s5
    a9ec:	012e87b3          	add	a5,t4,s2
    return (short)x;
    a9f0:	01951123          	sh	s9,2(a0)
    sign = x >> 31;
    a9f4:	41f9d29b          	sraiw	t0,s3,0x1f
    if (sign != (x >> 15))
    a9f8:	4159d49b          	sraiw	s1,s3,0x15
    a9fc:	01878cb3          	add	s9,a5,s8
    x >>= fracBits;
    aa00:	4069d39b          	sraiw	t2,s3,0x6
    if (sign != (x >> 15))
    aa04:	00548863          	beq	s1,t0,aa14 <xmp3_PolyphaseStereo+0x33c>
        x = sign ^ ((1 << 15) - 1);
    aa08:	00008e37          	lui	t3,0x8
    aa0c:	fffe0b13          	addi	s6,t3,-1 # 7fff <xmp3_UnpackScaleFact$ors+0x673>
    aa10:	0162c3b3          	xor	t2,t0,s6
    *(pcm + 2 * 16 + 1) = ClipToShort((int)SAR64(sum1R, (32 - CSHIFT)), DEF_NFRACBITS);
    aa14:	cd4cbd5b          	bfos	s10,s9,51,20
    sign = x >> 31;
    aa18:	41fd5f1b          	sraiw	t5,s10,0x1f
    if (sign != (x >> 15))
    aa1c:	415d5b9b          	sraiw	s7,s10,0x15
    return (short)x;
    aa20:	04751023          	sh	t2,64(a0)
    if (sign != (x >> 15))
    aa24:	49eb8063          	beq	s7,t5,aea4 <xmp3_PolyphaseStereo+0x7cc>
        x = sign ^ ((1 << 15) - 1);
    aa28:	000086b7          	lui	a3,0x8
    aa2c:	fff68d93          	addi	s11,a3,-1 # 7fff <xmp3_UnpackScaleFactors+0x673>
    aa30:	01bf4ab3          	xor	s5,t5,s11
    return (short)x;
    aa34:	6a05                	c.lui	s4,0x1
        x = sign ^ ((1 << 15) - 1);
    aa36:	6321                	c.lui	t1,0x8
#endif
    /* main convolution loop: sum1L = samples 1, 2, 3, ... 15   sum2L = samples 31, 30, ... 17 */
    coef = coefBase + 16;
    aa38:	04060b93          	addi	s7,a2,64
    vb1 = vbuf + 64;
    aa3c:	10058913          	addi	s2,a1,256
    pcm += 2;
    aa40:	00450613          	addi	a2,a0,4
    aa44:	07c50813          	addi	a6,a0,124
    aa48:	95d2                	c.add	a1,s4
        x = sign ^ ((1 << 15) - 1);
    aa4a:	fff30f93          	addi	t6,t1,-1 # 7fff <xmp3_UnpackScaleFactors+0x673>
    pcm += 2;
    aa4e:	e032                	c.sdsp	a2,0(sp)
    aa50:	e442                	c.sdsp	a6,8(sp)
    aa52:	ed2e                	c.sdsp	a1,152(sp)
        x = sign ^ ((1 << 15) - 1);
    aa54:	f47e                	c.sdsp	t6,40(sp)
    return (short)x;
    aa56:	05551123          	sh	s5,66(a0)
    /* right now, the compiler creates bad asm from this... */
    for (i = 15; i > 0; i--)
    aa5a:	a89d                	c.j	aad0 <xmp3_PolyphaseStereo+0x3f8>
        x = sign ^ ((1 << 15) - 1);
    aa5c:	72a2                	c.ldsp	t0,40(sp)
    return (short)x;
    aa5e:	6f02                	c.ldsp	t5,0(sp)
        MC2S(6)
        MC2S(7)
        vb1 += 64;
        *(pcm + 0)         = ClipToShort((int)SAR64(sum1L, (32 - CSHIFT)), DEF_NFRACBITS);
        *(pcm + 1)         = ClipToShort((int)SAR64(sum1R, (32 - CSHIFT)), DEF_NFRACBITS);
    aa60:	cd48bfdb          	bfos	t6,a7,51,20
        x = sign ^ ((1 << 15) - 1);
    aa64:	005b4a33          	xor	s4,s6,t0
    sign = x >> 31;
    aa68:	41ffd49b          	sraiw	s1,t6,0x1f
    if (sign != (x >> 15))
    aa6c:	415fd61b          	sraiw	a2,t6,0x15
    return (short)x;
    aa70:	014f1023          	sh	s4,0(t5) # 1000 <xmp3_DequantChannel+0x3b4>
    if (sign != (x >> 15))
    aa74:	3a960063          	beq	a2,s1,ae14 <xmp3_PolyphaseStereo+0x73c>
        x = sign ^ ((1 << 15) - 1);
    aa78:	02813803          	ld	a6,40(sp)
        *(pcm + 2 * 2 * i + 0) = ClipToShort((int)SAR64(sum2L, (32 - CSHIFT)), DEF_NFRACBITS);
    aa7c:	cd4c36db          	bfos	a3,s8,51,20
        x = sign ^ ((1 << 15) - 1);
    aa80:	0104c533          	xor	a0,s1,a6
    sign = x >> 31;
    aa84:	41f6d59b          	sraiw	a1,a3,0x1f
    if (sign != (x >> 15))
    aa88:	4156da9b          	sraiw	s5,a3,0x15
    return (short)x;
    aa8c:	00af1123          	sh	a0,2(t5)
    if (sign != (x >> 15))
    aa90:	38ba8e63          	beq	s5,a1,ae2c <xmp3_PolyphaseStereo+0x754>
        x = sign ^ ((1 << 15) - 1);
    aa94:	7da2                	c.ldsp	s11,40(sp)
    return (short)x;
    aa96:	6322                	c.ldsp	t1,8(sp)
        *(pcm + 2 * 2 * i + 1) = ClipToShort((int)SAR64(sum2R, (32 - CSHIFT)), DEF_NFRACBITS);
    aa98:	cd4cb9db          	bfos	s3,s9,51,20
        x = sign ^ ((1 << 15) - 1);
    aa9c:	01b5ceb3          	xor	t4,a1,s11
    sign = x >> 31;
    aaa0:	41f9de1b          	sraiw	t3,s3,0x1f
    if (sign != (x >> 15))
    aaa4:	4159d71b          	sraiw	a4,s3,0x15
    return (short)x;
    aaa8:	01d31023          	sh	t4,0(t1)
    if (sign != (x >> 15))
    aaac:	39c70e63          	beq	a4,t3,ae48 <xmp3_PolyphaseStereo+0x770>
        pcm += 2;
    aab0:	6b02                	c.ldsp	s6,0(sp)
        x = sign ^ ((1 << 15) - 1);
    aab2:	73a2                	c.ldsp	t2,40(sp)
    aab4:	8d1a                	c.mv	s10,t1
    aab6:	007e4433          	xor	s0,t3,t2
        pcm += 2;
    aaba:	004b0793          	addi	a5,s6,4 # 2000004 <_heap_end+0x1dbf974>
    for (i = 15; i > 0; i--)
    aabe:	ffcd0c13          	addi	s8,s10,-4
    aac2:	68ea                	c.ldsp	a7,152(sp)
    return (short)x;
    aac4:	008d1123          	sh	s0,2(s10)
        pcm += 2;
    aac8:	e03e                	c.sdsp	a5,0(sp)
    for (i = 15; i > 0; i--)
    aaca:	e462                	c.sdsp	s8,8(sp)
    aacc:	39288e63          	beq	a7,s2,ae68 <xmp3_PolyphaseStereo+0x790>
    aad0:	000ba883          	lw	a7,0(s7) # 2000000 <_heap_end+0x1dbf970>
    aad4:	00092503          	lw	a0,0(s2)
        MC2S(0)
    aad8:	004ba983          	lw	s3,4(s7)
    aadc:	02a88eb3          	mul	t4,a7,a0
    aae0:	008ba403          	lw	s0,8(s7)
        MC2S(1)
    aae4:	00cba303          	lw	t1,12(s7)
    aae8:	05c92383          	lw	t2,92(s2)
    aaec:	00492483          	lw	s1,4(s2)
    aaf0:	413002bb          	negw	t0,s3
    aaf4:	02000f37          	lui	t5,0x2000
        MC2S(2)
    aaf8:	014baa03          	lw	s4,20(s7)
    aafc:	027286b3          	mul	a3,t0,t2
    ab00:	02940ab3          	mul	s5,s0,s1
    ab04:	01ee8633          	add	a2,t4,t5
    ab08:	029304b3          	mul	s1,t1,s1
    ab0c:	00c92e83          	lw	t4,12(s2)
    ab10:	08092783          	lw	a5,128(s2)
    ab14:	0dc92d03          	lw	s10,220(s2)
    ab18:	08492e03          	lw	t3,132(s2)
    ab1c:	05492703          	lw	a4,84(s2)
    ab20:	05892c83          	lw	s9,88(s2)
    ab24:	e876                	c.sdsp	t4,16(sp)
    ab26:	41400ebb          	negw	t4,s4
    ab2a:	03178833          	mul	a6,a5,a7
    ab2e:	031383b3          	mul	t2,t2,a7
    ab32:	40600c3b          	negw	s8,t1
    ab36:	031d08b3          	mul	a7,s10,a7
    ab3a:	026e0333          	mul	t1,t3,t1
    ab3e:	9636                	c.add	a2,a3
    ab40:	fc26                	c.sdsp	s1,56(sp)
    ab42:	028e04b3          	mul	s1,t3,s0
    ab46:	02ee8e33          	mul	t3,t4,a4
    ab4a:	039c0db3          	mul	s11,s8,s9
    ab4e:	9656                	c.add	a2,s5
    ab50:	028c8cb3          	mul	s9,s9,s0
    ab54:	01092a83          	lw	s5,16(s2)
    ab58:	033785b3          	mul	a1,a5,s3
    ab5c:	0d892783          	lw	a5,216(s2)
    ab60:	e8c6                	c.sdsp	a7,80(sp)
    ab62:	eca6                	c.sdsp	s1,88(sp)
    ab64:	f89a                	c.sdsp	t1,112(sp)
    ab66:	e172                	c.sdsp	t3,128(sp)
    ab68:	f056                	c.sdsp	s5,32(sp)
    ab6a:	018baf03          	lw	t5,24(s7)
    ab6e:	020ba303          	lw	t1,32(s7)
    ab72:	010baf83          	lw	t6,16(s7)
    ab76:	08892683          	lw	a3,136(s2)
    ab7a:	05092883          	lw	a7,80(s2)
        MC2S(4)
    ab7e:	024ba483          	lw	s1,36(s7)
    ab82:	0d492e03          	lw	t3,212(s2)
    ab86:	00892b03          	lw	s6,8(s2)
    ab8a:	03878c33          	mul	s8,a5,s8
    ab8e:	02878433          	mul	s0,a5,s0
    ab92:	02a98533          	mul	a0,s3,a0
        MC2S(3)
    ab96:	01cba983          	lw	s3,28(s7)
    ab9a:	e0e6                	c.sdsp	s9,64(sp)
    ab9c:	67c2                	c.ldsp	a5,16(sp)
    ab9e:	025d02b3          	mul	t0,s10,t0
    aba2:	02ff0cb3          	mul	s9,t5,a5
    aba6:	41300abb          	negw	s5,s3
    abaa:	f0e2                	c.sdsp	s8,96(sp)
    abac:	e566                	c.sdsp	s9,136(sp)
    abae:	03f68cb3          	mul	s9,a3,t6
    abb2:	02000c37          	lui	s8,0x2000
    abb6:	036f8d33          	mul	s10,t6,s6
    abba:	9862                	c.add	a6,s8
    abbc:	036a0b33          	mul	s6,s4,s6
    abc0:	03468a33          	mul	s4,a3,s4
    abc4:	031a86b3          	mul	a3,s5,a7
    abc8:	92c2                	c.add	t0,a6
    abca:	9562                	c.add	a0,s8
    abcc:	7862                	c.ldsp	a6,56(sp)
    abce:	f4e6                	c.sdsp	s9,104(sp)
    abd0:	6ce6                	c.ldsp	s9,88(sp)
    abd2:	03f70733          	mul	a4,a4,t6
    abd6:	951e                	c.add	a0,t2
    abd8:	63c6                	c.ldsp	t2,80(sp)
    abda:	08c92783          	lw	a5,140(s2)
    abde:	95e2                	c.add	a1,s8
    abe0:	966e                	c.add	a2,s11
    abe2:	9542                	c.add	a0,a6
    abe4:	04c92d83          	lw	s11,76(s2)
    abe8:	6842                	c.ldsp	a6,16(sp)
    abea:	e936                	c.sdsp	a3,144(sp)
    abec:	019286b3          	add	a3,t0,s9
    abf0:	72c6                	c.ldsp	t0,112(sp)
    abf2:	959e                	c.add	a1,t2
    abf4:	03098833          	mul	a6,s3,a6
    abf8:	9596                	c.add	a1,t0
    abfa:	033789b3          	mul	s3,a5,s3
    abfe:	03e782b3          	mul	t0,a5,t5
    ac02:	ec6e                	c.sdsp	s11,24(sp)
    ac04:	e8ba                	c.sdsp	a4,80(sp)
    ac06:	67e2                	c.ldsp	a5,24(sp)
    ac08:	670a                	c.ldsp	a4,128(sp)
    ac0a:	966a                	c.add	a2,s10
    ac0c:	e4da                	c.sdsp	s6,72(sp)
    ac0e:	40900b3b          	negw	s6,s1
    ac12:	963a                	c.add	a2,a4
    ac14:	02fb0733          	mul	a4,s6,a5
    ac18:	ecce                	c.sdsp	s3,88(sp)
    ac1a:	7986                	c.ldsp	s3,96(sp)
        MC2S(5)
    ac1c:	02cba383          	lw	t2,44(s7)
    ac20:	09092c03          	lw	s8,144(s2)
    ac24:	0d092d83          	lw	s11,208(s2)
    ac28:	01492d03          	lw	s10,20(s2)
    ac2c:	04892c83          	lw	s9,72(s2)
    ac30:	03de0eb3          	mul	t4,t3,t4
    ac34:	03fe0fb3          	mul	t6,t3,t6
    ac38:	008587b3          	add	a5,a1,s0
    ac3c:	7e02                	c.ldsp	t3,32(sp)
    ac3e:	96ce                	c.add	a3,s3
    ac40:	fcd2                	c.sdsp	s4,120(sp)
    ac42:	f846                	c.sdsp	a7,48(sp)
    ac44:	0cc92a03          	lw	s4,204(s2)
    ac48:	028ba883          	lw	a7,40(s7)
    ac4c:	fc16                	c.sdsp	t0,56(sp)
    ac4e:	f8ba                	c.sdsp	a4,112(sp)
    ac50:	6286                	c.ldsp	t0,64(sp)
    ac52:	642a                	c.ldsp	s0,136(sp)
    ac54:	01892703          	lw	a4,24(s2)
    ac58:	79c2                	c.ldsp	s3,48(sp)
    ac5a:	e83a                	c.sdsp	a4,16(sp)
    ac5c:	03e98733          	mul	a4,s3,t5
    ac60:	035d8ab3          	mul	s5,s11,s5
    ac64:	03ed8db3          	mul	s11,s11,t5
    ac68:	03a88f33          	mul	t5,a7,s10
    ac6c:	69a6                	c.ldsp	s3,72(sp)
    ac6e:	f83a                	c.sdsp	a4,48(sp)
    ac70:	7766                	c.ldsp	a4,120(sp)
    ac72:	9516                	c.add	a0,t0
    ac74:	97ba                	c.add	a5,a4
    ac76:	f0fa                	c.sdsp	t5,96(sp)
    ac78:	7702                	c.ldsp	a4,32(sp)
    ac7a:	01350f33          	add	t5,a0,s3
    ac7e:	7526                	c.ldsp	a0,104(sp)
    ac80:	02e48733          	mul	a4,s1,a4
    ac84:	96aa                	c.add	a3,a0
    ac86:	96f6                	c.add	a3,t4
    ac88:	6ee2                	c.ldsp	t4,24(sp)
    ac8a:	f03a                	c.sdsp	a4,32(sp)
    ac8c:	026e8eb3          	mul	t4,t4,t1
    ac90:	026c0733          	mul	a4,s8,t1
    ac94:	03c30e33          	mul	t3,t1,t3
    ac98:	036a0b33          	mul	s6,s4,s6
    ac9c:	9622                	c.add	a2,s0
    ac9e:	026a0a33          	mul	s4,s4,t1
    aca2:	030ba403          	lw	s0,48(s7)
    aca6:	6342                	c.ldsp	t1,16(sp)
    aca8:	407002bb          	negw	t0,t2
    acac:	029c04b3          	mul	s1,s8,s1
    acb0:	e0ba                	c.sdsp	a4,64(sp)
    acb2:	03928c33          	mul	s8,t0,s9
    acb6:	6746                	c.ldsp	a4,80(sp)
    acb8:	ec76                	c.sdsp	t4,24(sp)
    acba:	02640eb3          	mul	t4,s0,t1
    acbe:	69ca                	c.ldsp	s3,144(sp)
    acc0:	03a38d33          	mul	s10,t2,s10
    acc4:	977a                	c.add	a4,t5
    acc6:	09492503          	lw	a0,148(s2)
        MC2S(7)
    acca:	038baf03          	lw	t5,56(s7)
    acce:	964e                	c.add	a2,s3
    acd0:	97fe                	c.add	a5,t6
    acd2:	9742                	c.add	a4,a6
    acd4:	0c892f83          	lw	t6,200(s2)
    acd8:	7862                	c.ldsp	a6,56(sp)
    acda:	f4e2                	c.sdsp	s8,104(sp)
    acdc:	e8f6                	c.sdsp	t4,80(sp)
    acde:	01c92c03          	lw	s8,28(s2)
    ace2:	7ec6                	c.ldsp	t4,112(sp)
    ace4:	9672                	c.add	a2,t3
        MC2S(6)
    ace6:	034ba583          	lw	a1,52(s7)
    acea:	04492983          	lw	s3,68(s2)
    acee:	6366                	c.ldsp	t1,88(sp)
    acf0:	031c8cb3          	mul	s9,s9,a7
    acf4:	025f82b3          	mul	t0,t6,t0
    acf8:	96c2                	c.add	a3,a6
    acfa:	031f8fb3          	mul	t6,t6,a7
    acfe:	9676                	c.add	a2,t4
    ad00:	e4a6                	c.sdsp	s1,72(sp)
    ad02:	09892e83          	lw	t4,152(s2)
        MC2S(7)
    ad06:	03cba483          	lw	s1,60(s7)
    ad0a:	04092803          	lw	a6,64(s2)
    ad0e:	fc6a                	c.sdsp	s10,56(sp)
    ad10:	03150d33          	mul	s10,a0,a7
    ad14:	038f08b3          	mul	a7,t5,s8
    ad18:	96d6                	c.add	a3,s5
    ad1a:	7a86                	c.ldsp	s5,96(sp)
    ad1c:	979a                	c.add	a5,t1
    ad1e:	7342                	c.ldsp	t1,48(sp)
    ad20:	9dbe                	c.add	s11,a5
    ad22:	9656                	c.add	a2,s5
    ad24:	7782                	c.ldsp	a5,32(sp)
    ad26:	6a86                	c.ldsp	s5,64(sp)
    ad28:	f846                	c.sdsp	a7,48(sp)
    ad2a:	68a6                	c.ldsp	a7,72(sp)
    ad2c:	971a                	c.add	a4,t1
    ad2e:	40b00e3b          	negw	t3,a1
    ad32:	96d6                	c.add	a3,s5
    ad34:	973e                	c.add	a4,a5
    ad36:	6ac2                	c.ldsp	s5,16(sp)
    ad38:	011d87b3          	add	a5,s11,a7
    ad3c:	7da6                	c.ldsp	s11,104(sp)
    ad3e:	027503b3          	mul	t2,a0,t2
    ad42:	033e0533          	mul	a0,t3,s3
    ad46:	0c492303          	lw	t1,196(s2)
    ad4a:	966e                	c.add	a2,s11
    ad4c:	03558db3          	mul	s11,a1,s5
    ad50:	09c92883          	lw	a7,156(s2)
    ad54:	028e8ab3          	mul	s5,t4,s0
    ad58:	9b36                	c.add	s6,a3
    ad5a:	02be8eb3          	mul	t4,t4,a1
    ad5e:	66c6                	c.ldsp	a3,80(sp)
    ad60:	65e2                	c.ldsp	a1,24(sp)
    ad62:	9a3e                	c.add	s4,a5
    ad64:	007a07b3          	add	a5,s4,t2
    ad68:	028989b3          	mul	s3,s3,s0
    ad6c:	03c30e33          	mul	t3,t1,t3
    ad70:	ecaa                	c.sdsp	a0,88(sp)
    ad72:	02830333          	mul	t1,t1,s0
    ad76:	4090053b          	negw	a0,s1
    ad7a:	7462                	c.ldsp	s0,56(sp)
    ad7c:	63e6                	c.ldsp	t2,88(sp)
    ad7e:	03848c33          	mul	s8,s1,s8
    ad82:	03e88a33          	mul	s4,a7,t5
    ad86:	9636                	c.add	a2,a3
    ad88:	029888b3          	mul	a7,a7,s1
    ad8c:	972e                	c.add	a4,a1
    ad8e:	e86e                	c.sdsp	s11,16(sp)
    ad90:	74c2                	c.ldsp	s1,48(sp)
    ad92:	03050db3          	mul	s11,a0,a6
    ad96:	0c092583          	lw	a1,192(s2)
    ad9a:	9722                	c.add	a4,s0
    ad9c:	9d5a                	c.add	s10,s6
    ad9e:	66c2                	c.ldsp	a3,16(sp)
    ada0:	00760b33          	add	s6,a2,t2
    ada4:	9cba                	c.add	s9,a4
    ada6:	92ea                	c.add	t0,s10
    ada8:	9fbe                	c.add	t6,a5
    adaa:	009b0633          	add	a2,s6,s1
    adae:	03e80833          	mul	a6,a6,t5
    adb2:	02a58533          	mul	a0,a1,a0
    adb6:	03e58f33          	mul	t5,a1,t5
    adba:	9a96                	c.add	s5,t0
    adbc:	00dc85b3          	add	a1,s9,a3
    adc0:	9efe                	c.add	t4,t6
    adc2:	9db2                	c.add	s11,a2
        *(pcm + 0)         = ClipToShort((int)SAR64(sum1L, (32 - CSHIFT)), DEF_NFRACBITS);
    adc4:	cd4db75b          	bfos	a4,s11,51,20
    adc8:	99ae                	c.add	s3,a1
    adca:	9e56                	c.add	t3,s5
    adcc:	9376                	c.add	t1,t4
    adce:	011303b3          	add	t2,t1,a7
    add2:	01898433          	add	s0,s3,s8
    add6:	014e0d33          	add	s10,t3,s4
    sign = x >> 31;
    adda:	41f75b1b          	sraiw	s6,a4,0x1f
    if (sign != (x >> 15))
    adde:	4157579b          	sraiw	a5,a4,0x15
    ade2:	040b8b93          	addi	s7,s7,64
    ade6:	01040c33          	add	s8,s0,a6
    adea:	00ad08b3          	add	a7,s10,a0
    adee:	01e38cb3          	add	s9,t2,t5
        vb1 += 64;
    adf2:	10090913          	addi	s2,s2,256
    if (sign != (x >> 15))
    adf6:	c76793e3          	bne	a5,s6,aa5c <xmp3_PolyphaseStereo+0x384>
    return (short)x;
    adfa:	6f02                	c.ldsp	t5,0(sp)
        *(pcm + 1)         = ClipToShort((int)SAR64(sum1R, (32 - CSHIFT)), DEF_NFRACBITS);
    adfc:	cd48bfdb          	bfos	t6,a7,51,20
    x >>= fracBits;
    ae00:	40675a1b          	sraiw	s4,a4,0x6
    sign = x >> 31;
    ae04:	41ffd49b          	sraiw	s1,t6,0x1f
    if (sign != (x >> 15))
    ae08:	415fd61b          	sraiw	a2,t6,0x15
    return (short)x;
    ae0c:	014f1023          	sh	s4,0(t5) # 2000000 <_heap_end+0x1dbf970>
    if (sign != (x >> 15))
    ae10:	c69614e3          	bne	a2,s1,aa78 <xmp3_PolyphaseStereo+0x3a0>
        *(pcm + 2 * 2 * i + 0) = ClipToShort((int)SAR64(sum2L, (32 - CSHIFT)), DEF_NFRACBITS);
    ae14:	cd4c36db          	bfos	a3,s8,51,20
    x >>= fracBits;
    ae18:	406fd51b          	sraiw	a0,t6,0x6
    sign = x >> 31;
    ae1c:	41f6d59b          	sraiw	a1,a3,0x1f
    if (sign != (x >> 15))
    ae20:	4156da9b          	sraiw	s5,a3,0x15
    return (short)x;
    ae24:	00af1123          	sh	a0,2(t5)
    if (sign != (x >> 15))
    ae28:	c6ba96e3          	bne	s5,a1,aa94 <xmp3_PolyphaseStereo+0x3bc>
    return (short)x;
    ae2c:	00813303          	ld	t1,8(sp)
        *(pcm + 2 * 2 * i + 1) = ClipToShort((int)SAR64(sum2R, (32 - CSHIFT)), DEF_NFRACBITS);
    ae30:	cd4cb9db          	bfos	s3,s9,51,20
    x >>= fracBits;
    ae34:	4066de9b          	sraiw	t4,a3,0x6
    sign = x >> 31;
    ae38:	41f9de1b          	sraiw	t3,s3,0x1f
    if (sign != (x >> 15))
    ae3c:	4159d71b          	sraiw	a4,s3,0x15
    return (short)x;
    ae40:	01d31023          	sh	t4,0(t1)
    if (sign != (x >> 15))
    ae44:	c7c716e3          	bne	a4,t3,aab0 <xmp3_PolyphaseStereo+0x3d8>
        pcm += 2;
    ae48:	6b02                	c.ldsp	s6,0(sp)
    ae4a:	8d1a                	c.mv	s10,t1
    x >>= fracBits;
    ae4c:	4069d41b          	sraiw	s0,s3,0x6
        pcm += 2;
    ae50:	004b0793          	addi	a5,s6,4
    for (i = 15; i > 0; i--)
    ae54:	ffcd0c13          	addi	s8,s10,-4
    ae58:	68ea                	c.ldsp	a7,152(sp)
    return (short)x;
    ae5a:	008d1123          	sh	s0,2(s10)
        pcm += 2;
    ae5e:	e03e                	c.sdsp	a5,0(sp)
    for (i = 15; i > 0; i--)
    ae60:	01813423          	sd	s8,8(sp)
    ae64:	c72896e3          	bne	a7,s2,aad0 <xmp3_PolyphaseStereo+0x3f8>
    }
}
    ae68:	746e                	c.ldsp	s0,248(sp)
    ae6a:	74ce                	c.ldsp	s1,240(sp)
    ae6c:	792e                	c.ldsp	s2,232(sp)
    ae6e:	798e                	c.ldsp	s3,224(sp)
    ae70:	6a6e                	c.ldsp	s4,216(sp)
    ae72:	6ace                	c.ldsp	s5,208(sp)
    ae74:	6b2e                	c.ldsp	s6,200(sp)
    ae76:	6b8e                	c.ldsp	s7,192(sp)
    ae78:	7c6a                	c.ldsp	s8,184(sp)
    ae7a:	7cca                	c.ldsp	s9,176(sp)
    ae7c:	7d2a                	c.ldsp	s10,168(sp)
    ae7e:	7d8a                	c.ldsp	s11,160(sp)
    ae80:	6111                	c.addi16sp	sp,256
    ae82:	8082                	c.jr	ra
        *(pcm + 1) = ClipToShort((int)SAR64(sum1R, (32 - CSHIFT)), DEF_NFRACBITS);
    ae84:	cd48b3db          	bfos	t2,a7,51,20
    x >>= fracBits;
    ae88:	406a569b          	sraiw	a3,s4,0x6
    sign = x >> 31;
    ae8c:	41f3df9b          	sraiw	t6,t2,0x1f
    if (sign != (x >> 15))
    ae90:	4153d49b          	sraiw	s1,t2,0x15
    return (short)x;
    ae94:	00d51023          	sh	a3,0(a0)
    if (sign != (x >> 15))
    ae98:	a7f492e3          	bne	s1,t6,a8fc <xmp3_PolyphaseStereo+0x224>
    x >>= fracBits;
    ae9c:	4063dc9b          	sraiw	s9,t2,0x6
    aea0:	a69ff06f          	j	a908 <xmp3_PolyphaseStereo+0x230>
    aea4:	406d5a9b          	sraiw	s5,s10,0x6
    aea8:	b671                c.j	aa34 <xmp3_PolyphaseStereo+0x35c>
