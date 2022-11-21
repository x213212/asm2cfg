
0000000000001aec <matrix_test>:
matrix_test():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:131

        After the last step, matrix A is back to original contents.
*/
ee_s16
matrix_test(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B, MATDAT val)
{
    1aec:	7175                	c.addi16sp	sp,-144
    1aee:	e506                	c.sdsp	ra,136(sp)
    1af0:	e122                	c.sdsp	s0,128(sp)
    1af2:	fca6                	c.sdsp	s1,120(sp)
    1af4:	f8ca                	c.sdsp	s2,112(sp)
    1af6:	f4ce                	c.sdsp	s3,104(sp)
    1af8:	f0d2                	c.sdsp	s4,96(sp)
    1afa:	ecd6                	c.sdsp	s5,88(sp)
    1afc:	e8da                	c.sdsp	s6,80(sp)
    1afe:	e4de                	c.sdsp	s7,72(sp)
    1b00:	e0e2                	c.sdsp	s8,64(sp)
    1b02:	fc66                	c.sdsp	s9,56(sp)
    1b04:	f86a                	c.sdsp	s10,48(sp)
    1b06:	f46e                	c.sdsp	s11,40(sp)
matrix_add_const():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:288
*/
void
matrix_add_const(ee_u32 N, MATDAT *A, MATDAT val)
{
    ee_u32 i, j;
    for (i = 0; i < N; i++)
    1b08:	4ea052e3          	blez	a0,27ec <matrix_test+0xd00>
    1b0c:	89b6                	c.mv	s3,a3
    1b0e:	76fd                	c.lui	a3,0xfffff
    1b10:	00d76d33          	or	s10,a4,a3
    1b14:	4685                	c.li	a3,1
    1b16:	1682                	c.slli	a3,0x20
    1b18:	16e1                	c.addi	a3,-8
    1b1a:	00d57933          	and	s2,a0,a3
    1b1e:	56fd                	c.li	a3,-1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:288 (discriminator 2)
    1b20:	10a686db          	lea.b.ze	a3,a3,a0
    1b24:	0076ba93          	sltiu	s5,a3,7
    1b28:	02051693          	slli	a3,a0,0x20
    1b2c:	7c052b5b          	bfoz	s6,a0,31,0
    1b30:	891d                	c.andi	a0,7
    1b32:	8cba                	c.mv	s9,a4
    1b34:	8a2e                	c.mv	s4,a1
    1b36:	4881                	c.li	a7,0
    1b38:	4281                	c.li	t0,0
    1b3a:	01f6d813          	srli	a6,a3,0x1f
    1b3e:	f02a                	c.sdsp	a0,32(sp)
    1b40:	00153c13          	seqz	s8,a0
    1b44:	8532                	c.mv	a0,a2
    1b46:	a039                	c.j	1b54 <matrix_test+0x68>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:288 (discriminator 4)
    1b48:	116888db          	lea.b.ze	a7,a7,s6
    1b4c:	9542                	c.add	a0,a6
    1b4e:	0285                	c.addi	t0,1
    1b50:	09628663          	beq	t0,s6,1bdc <matrix_test+0xf0>
    1b54:	4701                	c.li	a4,0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:290
    {
        for (j = 0; j < N; j++)
    1b56:	060a9163          	bnez	s5,1bb8 <matrix_test+0xcc>
    1b5a:	87aa                	c.mv	a5,a0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:292
        {
            A[i * N + j] += val;
    1b5c:	00479583          	lh	a1,4(a5) # 1004 <core_list_init+0x310>
    1b60:	00279683          	lh	a3,2(a5)
    1b64:	00079483          	lh	s1,0(a5)
    1b68:	95e6                	c.add	a1,s9
    1b6a:	00b79223          	sh	a1,4(a5)
    1b6e:	019685b3          	add	a1,a3,s9
    1b72:	00e79683          	lh	a3,14(a5)
    1b76:	00b79123          	sh	a1,2(a5)
    1b7a:	00c79583          	lh	a1,12(a5)
    1b7e:	96e6                	c.add	a3,s9
    1b80:	00679403          	lh	s0,6(a5)
    1b84:	95e6                	c.add	a1,s9
    1b86:	00d79723          	sh	a3,14(a5)
    1b8a:	00a79683          	lh	a3,10(a5)
    1b8e:	00b79623          	sh	a1,12(a5)
    1b92:	00879583          	lh	a1,8(a5)
    1b96:	9466                	c.add	s0,s9
    1b98:	94e6                	c.add	s1,s9
    1b9a:	96e6                	c.add	a3,s9
    1b9c:	95e6                	c.add	a1,s9
    1b9e:	00879323          	sh	s0,6(a5)
    1ba2:	00d79523          	sh	a3,10(a5)
    1ba6:	00979023          	sh	s1,0(a5)
    1baa:	00b79423          	sh	a1,8(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:290 (discriminator 2)
        for (j = 0; j < N; j++)
    1bae:	07c1                	c.addi	a5,16
    1bb0:	00870713          	addi	a4,a4,8
    1bb4:	fae914e3          	bne	s2,a4,1b5c <matrix_test+0x70>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:290 (discriminator 4)
    1bb8:	f80c18e3          	bnez	s8,1b48 <matrix_test+0x5c>
    1bbc:	7782                	c.ldsp	a5,32(sp)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:290 (discriminator 6)
    1bbe:	011705b3          	add	a1,a4,a7
    1bc2:	0ab6075b          	lea.h	a4,a2,a1
    1bc6:	0001                	c.nop
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:292 (discriminator 2)
            A[i * N + j] += val;
    1bc8:	00071583          	lh	a1,0(a4)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:290 (discriminator 6)
        for (j = 0; j < N; j++)
    1bcc:	17fd                	c.addi	a5,-1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:292 (discriminator 2)
            A[i * N + j] += val;
    1bce:	95e6                	c.add	a1,s9
    1bd0:	00b71023          	sh	a1,0(a4)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:290 (discriminator 6)
        for (j = 0; j < N; j++)
    1bd4:	0709                	c.addi	a4,2
    1bd6:	fbed                	c.bnez	a5,1bc8 <matrix_test+0xdc>
    1bd8:	f71ff06f          	j	1b48 <matrix_test+0x5c>
matrix_test():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:290 (discriminator 6)
    1bdc:	4801                	c.li	a6,0
    1bde:	4581                	c.li	a1,0
matrix_mul_const():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:272
    for (i = 0; i < N; i++)
    1be0:	002b1393          	slli	t2,s6,0x2
    1be4:	001b1b93          	slli	s7,s6,0x1
    1be8:	88d2                	c.mv	a7,s4
    1bea:	82b2                	c.mv	t0,a2
    1bec:	0140006f          	j	1c00 <matrix_test+0x114>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:272 (discriminator 2)
    1bf0:	1168085b          	lea.b.ze	a6,a6,s6
    1bf4:	989e                	c.add	a7,t2
    1bf6:	92de                	c.add	t0,s7
    1bf8:	00158593          	addi	a1,a1,1 # 1009001 <_stack+0xde9001>
    1bfc:	09658a63          	beq	a1,s6,1c90 <matrix_test+0x1a4>
    1c00:	4701                	c.li	a4,0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:274
        for (j = 0; j < N; j++)
    1c02:	060a9363          	bnez	s5,1c68 <matrix_test+0x17c>
    1c06:	87c6                	c.mv	a5,a7
    1c08:	005006b3          	add	a3,zero,t0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:276
            C[i * N + j] = (MATRES)A[i * N + j] * (MATRES)val;
    1c0c:	00269503          	lh	a0,2(a3) # fffffffffffff002 <_stack+0xffffffffffddf002>
    1c10:	00069403          	lh	s0,0(a3)
    1c14:	00669483          	lh	s1,6(a3)
    1c18:	03950533          	mul	a0,a0,s9
    1c1c:	03940433          	mul	s0,s0,s9
    1c20:	039484b3          	mul	s1,s1,s9
    1c24:	c3c8                	c.sw	a0,4(a5)
    1c26:	00a69503          	lh	a0,10(a3)
    1c2a:	c380                	c.sw	s0,0(a5)
    1c2c:	00e69403          	lh	s0,14(a3)
    1c30:	03950533          	mul	a0,a0,s9
    1c34:	c7c4                	c.sw	s1,12(a5)
    1c36:	03940433          	mul	s0,s0,s9
    1c3a:	00469483          	lh	s1,4(a3)
    1c3e:	cbc8                	c.sw	a0,20(a5)
    1c40:	00869503          	lh	a0,8(a3)
    1c44:	cfc0                	c.sw	s0,28(a5)
    1c46:	00c69403          	lh	s0,12(a3)
    1c4a:	039484b3          	mul	s1,s1,s9
    1c4e:	03950533          	mul	a0,a0,s9
    1c52:	03940433          	mul	s0,s0,s9
    1c56:	c784                	c.sw	s1,8(a5)
    1c58:	cb88                	c.sw	a0,16(a5)
    1c5a:	cf80                	c.sw	s0,24(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:274 (discriminator 2)
        for (j = 0; j < N; j++)
    1c5c:	02078793          	addi	a5,a5,32
    1c60:	06c1                	c.addi	a3,16
    1c62:	0721                	c.addi	a4,8
    1c64:	fae914e3          	bne	s2,a4,1c0c <matrix_test+0x120>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:274 (discriminator 4)
    1c68:	f80c14e3          	bnez	s8,1bf0 <matrix_test+0x104>
    1c6c:	7782                	c.ldsp	a5,32(sp)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:274 (discriminator 6)
    1c6e:	01070533          	add	a0,a4,a6
    1c72:	0aa606db          	lea.h	a3,a2,a0
    1c76:	0caa075b          	lea.w	a4,s4,a0
    1c7a:	0001                	c.nop
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:276 (discriminator 2)
            C[i * N + j] = (MATRES)A[i * N + j] * (MATRES)val;
    1c7c:	00069503          	lh	a0,0(a3)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:274 (discriminator 6)
        for (j = 0; j < N; j++)
    1c80:	0689                	c.addi	a3,2
    1c82:	17fd                	c.addi	a5,-1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:276 (discriminator 2)
            C[i * N + j] = (MATRES)A[i * N + j] * (MATRES)val;
    1c84:	03950533          	mul	a0,a0,s9
    1c88:	c308                	c.sw	a0,0(a4)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:274 (discriminator 6)
        for (j = 0; j < N; j++)
    1c8a:	0711                	c.addi	a4,4
    1c8c:	fbe5                	c.bnez	a5,1c7c <matrix_test+0x190>
    1c8e:	b78d                	c.j	1bf0 <matrix_test+0x104>
matrix_test():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:274 (discriminator 6)
    1c90:	ec32                	c.sdsp	a2,24(sp)
    1c92:	4881                	c.li	a7,0
    1c94:	4281                	c.li	t0,0
    1c96:	4601                	c.li	a2,0
    1c98:	4781                	c.li	a5,0
    1c9a:	4501                	c.li	a0,0
    1c9c:	8852                	c.mv	a6,s4
    1c9e:	a809                	c.j	1cb0 <matrix_test+0x1c4>
matrix_sum():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:243 (discriminator 2)
    for (i = 0; i < N; i++)
    1ca0:	116888db          	lea.b.ze	a7,a7,s6
    1ca4:	981e                	c.add	a6,t2
    1ca6:	0285                	c.addi	t0,1
    1ca8:	00e007b3          	add	a5,zero,a4
    1cac:	1b628a63          	beq	t0,s6,1e60 <matrix_test+0x374>
    1cb0:	4301                	c.li	t1,0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245
        for (j = 0; j < N; j++)
    1cb2:	160a9763          	bnez	s5,1e20 <matrix_test+0x334>
    1cb6:	8742                	c.mv	a4,a6
    1cb8:	0140006f          	j	1ccc <matrix_test+0x1e0>
    1cbc:	00f4a633          	slt	a2,s1,a5
    1cc0:	962e                	c.add	a2,a1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 2)
    1cc2:	02070713          	addi	a4,a4,32
    1cc6:	0321                	c.addi	t1,8
    1cc8:	14690c63          	beq	s2,t1,1e20 <matrix_test+0x334>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247
            cur = C[i * N + j];
    1ccc:	430c                	c.lw	a1,0(a4)
    1cce:	4344                	c.lw	s1,4(a4)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248
            tmp += cur;
    1cd0:	00a586bb          	addw	a3,a1,a0
    1cd4:	04dd4863          	blt	s10,a3,1d24 <matrix_test+0x238>
    1cd8:	0007869b          	sext.w	a3,a5
    1cdc:	952e                	c.add	a0,a1
    1cde:	00b6a6b3          	slt	a3,a3,a1
    1ce2:	00c687b3          	add	a5,a3,a2
    1ce6:	0095053b          	addw	a0,a0,s1
    1cea:	4710                	c.lw	a2,8(a4)
    1cec:	0005069b          	sext.w	a3,a0
    1cf0:	04dd5263          	bge	s10,a3,1d34 <matrix_test+0x248>
    1cf4:	00a78593          	addi	a1,a5,10
    1cf8:	86b2                	c.mv	a3,a2
    1cfa:	4748                	c.lw	a0,12(a4)
    1cfc:	0006879b          	sext.w	a5,a3
    1d00:	04fd5463          	bge	s10,a5,1d48 <matrix_test+0x25c>
    1d04:	00a58793          	addi	a5,a1,10
    1d08:	00a005b3          	add	a1,zero,a0
    1d0c:	0005869b          	sext.w	a3,a1
    1d10:	04dd5663          	bge	s10,a3,1d5c <matrix_test+0x270>
    1d14:	00a78493          	addi	s1,a5,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247
            cur = C[i * N + j];
    1d18:	4b10                	c.lw	a2,16(a4)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248
            tmp += cur;
    1d1a:	87b2                	c.mv	a5,a2
    1d1c:	04dd4863          	blt	s10,a3,1d6c <matrix_test+0x280>
    1d20:	0640006f          	j	1d84 <matrix_test+0x298>
    1d24:	00a60793          	addi	a5,a2,10
    1d28:	8526                	c.mv	a0,s1
    1d2a:	4710                	c.lw	a2,8(a4)
    1d2c:	0005069b          	sext.w	a3,a0
    1d30:	fcdd42e3          	blt	s10,a3,1cf4 <matrix_test+0x208>
    1d34:	0095a5b3          	slt	a1,a1,s1
    1d38:	95be                	c.add	a1,a5
    1d3a:	00a606bb          	addw	a3,a2,a0
    1d3e:	4748                	c.lw	a0,12(a4)
    1d40:	0006879b          	sext.w	a5,a3
    1d44:	fcfd40e3          	blt	s10,a5,1d04 <matrix_test+0x218>
    1d48:	00c4a7b3          	slt	a5,s1,a2
    1d4c:	00b787b3          	add	a5,a5,a1
    1d50:	00d505bb          	addw	a1,a0,a3
    1d54:	0005869b          	sext.w	a3,a1
    1d58:	fadd4ee3          	blt	s10,a3,1d14 <matrix_test+0x228>
    1d5c:	00a62633          	slt	a2,a2,a0
    1d60:	00f604b3          	add	s1,a2,a5
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247
            cur = C[i * N + j];
    1d64:	4b10                	c.lw	a2,16(a4)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248
            tmp += cur;
    1d66:	87b2                	c.mv	a5,a2
    1d68:	00dd5e63          	bge	s10,a3,1d84 <matrix_test+0x298>
    1d6c:	0007869b          	sext.w	a3,a5
    1d70:	02dd4063          	blt	s10,a3,1d90 <matrix_test+0x2a4>
    1d74:	00c52533          	slt	a0,a0,a2
    1d78:	94aa                	c.add	s1,a0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247
            cur = C[i * N + j];
    1d7a:	4b48                	c.lw	a0,20(a4)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248
            tmp += cur;
    1d7c:	85aa                	c.mv	a1,a0
    1d7e:	00dd4f63          	blt	s10,a3,1d9c <matrix_test+0x2b0>
    1d82:	a81d                	c.j	1db8 <matrix_test+0x2cc>
    1d84:	00b607bb          	addw	a5,a2,a1
    1d88:	0007869b          	sext.w	a3,a5
    1d8c:	fedd54e3          	bge	s10,a3,1d74 <matrix_test+0x288>
    1d90:	04a9                	c.addi	s1,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247
            cur = C[i * N + j];
    1d92:	4b48                	c.lw	a0,20(a4)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248
            tmp += cur;
    1d94:	00a005b3          	add	a1,zero,a0
    1d98:	02dd5063          	bge	s10,a3,1db8 <matrix_test+0x2cc>
    1d9c:	0005869b          	sext.w	a3,a1
    1da0:	02dd4263          	blt	s10,a3,1dc4 <matrix_test+0x2d8>
    1da4:	00a62633          	slt	a2,a2,a0
    1da8:	009607b3          	add	a5,a2,s1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247
            cur = C[i * N + j];
    1dac:	4f04                	c.lw	s1,24(a4)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248
            tmp += cur;
    1dae:	8626                	c.mv	a2,s1
    1db0:	02dd4063          	blt	s10,a3,1dd0 <matrix_test+0x2e4>
    1db4:	0380006f          	j	1dec <matrix_test+0x300>
    1db8:	00f505bb          	addw	a1,a0,a5
    1dbc:	0005869b          	sext.w	a3,a1
    1dc0:	fedd52e3          	bge	s10,a3,1da4 <matrix_test+0x2b8>
    1dc4:	00a48793          	addi	a5,s1,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247
            cur = C[i * N + j];
    1dc8:	4f04                	c.lw	s1,24(a4)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248
            tmp += cur;
    1dca:	8626                	c.mv	a2,s1
    1dcc:	02dd5063          	bge	s10,a3,1dec <matrix_test+0x300>
    1dd0:	0006069b          	sext.w	a3,a2
    1dd4:	02dd4263          	blt	s10,a3,1df8 <matrix_test+0x30c>
    1dd8:	00952533          	slt	a0,a0,s1
    1ddc:	00f505b3          	add	a1,a0,a5
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247
            cur = C[i * N + j];
    1de0:	4f5c                	c.lw	a5,28(a4)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248
            tmp += cur;
    1de2:	853e                	c.mv	a0,a5
    1de4:	02dd5063          	bge	s10,a3,1e04 <matrix_test+0x318>
    1de8:	0200006f          	j	1e08 <matrix_test+0x31c>
    1dec:	00b4863b          	addw	a2,s1,a1
    1df0:	0006069b          	sext.w	a3,a2
    1df4:	fedd52e3          	bge	s10,a3,1dd8 <matrix_test+0x2ec>
    1df8:	00a78593          	addi	a1,a5,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247
            cur = C[i * N + j];
    1dfc:	4f5c                	c.lw	a5,28(a4)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248
            tmp += cur;
    1dfe:	853e                	c.mv	a0,a5
    1e00:	00dd4463          	blt	s10,a3,1e08 <matrix_test+0x31c>
    1e04:	00c7853b          	addw	a0,a5,a2
    1e08:	0005061b          	sext.w	a2,a0
    1e0c:	eacd58e3          	bge	s10,a2,1cbc <matrix_test+0x1d0>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:249
            if (tmp > clipval)
    1e10:	4501                	c.li	a0,0
    1e12:	00a58613          	addi	a2,a1,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 2)
        for (j = 0; j < N; j++)
    1e16:	02070713          	addi	a4,a4,32
    1e1a:	0321                	c.addi	t1,8
    1e1c:	ea6918e3          	bne	s2,t1,1ccc <matrix_test+0x1e0>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 4)
            cur = C[i * N + j];
    1e20:	873e                	c.mv	a4,a5
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 4)
        for (j = 0; j < N; j++)
    1e22:	e60c1fe3          	bnez	s8,1ca0 <matrix_test+0x1b4>
    1e26:	7482                	c.ldsp	s1,32(sp)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 6)
    1e28:	011305b3          	add	a1,t1,a7
    1e2c:	0cba06db          	lea.w	a3,s4,a1
    1e30:	0180006f          	j	1e48 <matrix_test+0x35c>
    1e34:	0007859b          	sext.w	a1,a5
    1e38:	00e5a5b3          	slt	a1,a1,a4
    1e3c:	962e                	c.add	a2,a1
    1e3e:	0691                	c.addi	a3,4
    1e40:	14fd                	c.addi	s1,-1
    1e42:	87ba                	c.mv	a5,a4
    1e44:	e4048ee3          	beqz	s1,1ca0 <matrix_test+0x1b4>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 2)
            cur = C[i * N + j];
    1e48:	4298                	c.lw	a4,0(a3)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 2)
            tmp += cur;
    1e4a:	9d39                	c.addw	a0,a4
    1e4c:	fead54e3          	bge	s10,a0,1e34 <matrix_test+0x348>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:249 (discriminator 2)
            if (tmp > clipval)
    1e50:	4501                	c.li	a0,0
    1e52:	0629                	c.addi	a2,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 6)
        for (j = 0; j < N; j++)
    1e54:	0691                	c.addi	a3,4
    1e56:	14fd                	c.addi	s1,-1
    1e58:	87ba                	c.mv	a5,a4
    1e5a:	f4fd                	c.bnez	s1,1e48 <matrix_test+0x35c>
    1e5c:	e45ff06f          	j	1ca0 <matrix_test+0x1b4>
matrix_test():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 6)
    1e60:	e81e                	c.sdsp	t2,16(sp)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:140
    crc = crc16(matrix_sum(N, C, clipval), crc);
    1e62:	3c06355b          	bfos	a0,a2,15,0
    1e66:	4581                	c.li	a1,0
    1e68:	478020ef          	jal	ra,42e0 <crc16>
    1e6c:	62e2                	c.ldsp	t0,24(sp)
    1e6e:	882a                	c.mv	a6,a0
    1e70:	4301                	c.li	t1,0
    1e72:	4381                	c.li	t2,0
    1e74:	0140006f          	j	1e88 <matrix_test+0x39c>
matrix_mul_vect():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:306 (discriminator 2)
*/
void
matrix_mul_vect(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B)
{
    ee_u32 i, j;
    for (i = 0; i < N; i++)
    1e78:	1163035b          	lea.b.ze	t1,t1,s6
    1e7c:	92de                	c.add	t0,s7
    1e7e:	0385                	c.addi	t2,1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:311 (discriminator 4)
    {
        C[i] = 0;
        for (j = 0; j < N; j++)
        {
            C[i] += (MATRES)A[i * N + j] * (MATRES)B[j];
    1e80:	00e8a023          	sw	a4,0(a7)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:306 (discriminator 2)
    for (i = 0; i < N; i++)
    1e84:	0d638463          	beq	t2,s6,1f4c <matrix_test+0x460>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:308
        C[i] = 0;
    1e88:	0c7a08db          	lea.w	a7,s4,t2
    1e8c:	0008a023          	sw	zero,0(a7)
    1e90:	4781                	c.li	a5,0
    1e92:	4701                	c.li	a4,0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:309
        for (j = 0; j < N; j++)
    1e94:	080a9663          	bnez	s5,1f20 <matrix_test+0x434>
    1e98:	84ce                	c.mv	s1,s3
    1e9a:	8616                	c.mv	a2,t0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:311
            C[i] += (MATRES)A[i * N + j] * (MATRES)B[j];
    1e9c:	00061f03          	lh	t5,0(a2)
    1ea0:	00049583          	lh	a1,0(s1)
    1ea4:	00261503          	lh	a0,2(a2)
    1ea8:	00249683          	lh	a3,2(s1)
    1eac:	03e585b3          	mul	a1,a1,t5
    1eb0:	00461e03          	lh	t3,4(a2)
    1eb4:	02a68533          	mul	a0,a3,a0
    1eb8:	00449f83          	lh	t6,4(s1)
    1ebc:	95ba                	c.add	a1,a4
    1ebe:	00661e83          	lh	t4,6(a2)
    1ec2:	00649f03          	lh	t5,6(s1)
    1ec6:	00b50db3          	add	s11,a0,a1
    1eca:	00861583          	lh	a1,8(a2)
    1ece:	00849703          	lh	a4,8(s1)
    1ed2:	03cf86b3          	mul	a3,t6,t3
    1ed6:	03df0533          	mul	a0,t5,t4
    1eda:	02b705b3          	mul	a1,a4,a1
    1ede:	01b686bb          	addw	a3,a3,s11
    1ee2:	9536                	c.add	a0,a3
    1ee4:	00a61e83          	lh	t4,10(a2)
    1ee8:	00a49f03          	lh	t5,10(s1)
    1eec:	00a58e33          	add	t3,a1,a0
    1ef0:	00c61f83          	lh	t6,12(a2)
    1ef4:	00c49503          	lh	a0,12(s1)
    1ef8:	00e61583          	lh	a1,14(a2)
    1efc:	00e49683          	lh	a3,14(s1)
    1f00:	03df0733          	mul	a4,t5,t4
    1f04:	03f50533          	mul	a0,a0,t6
    1f08:	02b685b3          	mul	a1,a3,a1
    1f0c:	01c706b3          	add	a3,a4,t3
    1f10:	9536                	c.add	a0,a3
    1f12:	00a5873b          	addw	a4,a1,a0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:309 (discriminator 2)
        for (j = 0; j < N; j++)
    1f16:	04c1                	c.addi	s1,16
    1f18:	0641                	c.addi	a2,16
    1f1a:	07a1                	c.addi	a5,8
    1f1c:	f8f910e3          	bne	s2,a5,1e9c <matrix_test+0x3b0>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:309 (discriminator 4)
    1f20:	f40c1ce3          	bnez	s8,1e78 <matrix_test+0x38c>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:309 (discriminator 6)
    1f24:	65e2                	c.ldsp	a1,24(sp)
    1f26:	7482                	c.ldsp	s1,32(sp)
    1f28:	00678533          	add	a0,a5,t1
    1f2c:	0af9865b          	lea.h	a2,s3,a5
    1f30:	0aa587db          	lea.h	a5,a1,a0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:311 (discriminator 2)
            C[i] += (MATRES)A[i * N + j] * (MATRES)B[j];
    1f34:	00079503          	lh	a0,0(a5)
    1f38:	00061583          	lh	a1,0(a2)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:309 (discriminator 6)
        for (j = 0; j < N; j++)
    1f3c:	0789                	c.addi	a5,2
    1f3e:	0609                	c.addi	a2,2
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:311 (discriminator 2)
            C[i] += (MATRES)A[i * N + j] * (MATRES)B[j];
    1f40:	02a58533          	mul	a0,a1,a0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:309 (discriminator 6)
        for (j = 0; j < N; j++)
    1f44:	14fd                	c.addi	s1,-1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:311 (discriminator 2)
            C[i] += (MATRES)A[i * N + j] * (MATRES)B[j];
    1f46:	9f29                	c.addw	a4,a0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:309 (discriminator 6)
        for (j = 0; j < N; j++)
    1f48:	f4f5                	c.bnez	s1,1f34 <matrix_test+0x448>
    1f4a:	b73d                	c.j	1e78 <matrix_test+0x38c>
matrix_test():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:309 (discriminator 6)
    1f4c:	6442                	c.ldsp	s0,16(sp)
    1f4e:	4281                	c.li	t0,0
    1f50:	4301                	c.li	t1,0
    1f52:	4681                	c.li	a3,0
    1f54:	4581                	c.li	a1,0
    1f56:	4501                	c.li	a0,0
    1f58:	88d2                	c.mv	a7,s4
    1f5a:	a809                	c.j	1f6c <matrix_test+0x480>
matrix_sum():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:243 (discriminator 6)
    for (i = 0; i < N; i++)
    1f5c:	116282db          	lea.b.ze	t0,t0,s6
    1f60:	98a2                	c.add	a7,s0
    1f62:	0305                	c.addi	t1,1
    1f64:	00f005b3          	add	a1,zero,a5
    1f68:	1b630663          	beq	t1,s6,2114 <matrix_test+0x628>
    1f6c:	4381                	c.li	t2,0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 8)
        for (j = 0; j < N; j++)
    1f6e:	160a9363          	bnez	s5,20d4 <matrix_test+0x5e8>
    1f72:	87c6                	c.mv	a5,a7
    1f74:	0140006f          	j	1f88 <matrix_test+0x49c>
    1f78:	00b4a6b3          	slt	a3,s1,a1
    1f7c:	96b2                	c.add	a3,a2
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 10)
    1f7e:	02078793          	addi	a5,a5,32
    1f82:	03a1                	c.addi	t2,8
    1f84:	14790863          	beq	s2,t2,20d4 <matrix_test+0x5e8>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 6)
            cur = C[i * N + j];
    1f88:	4390                	c.lw	a2,0(a5)
    1f8a:	43c4                	c.lw	s1,4(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 4)
            tmp += cur;
    1f8c:	00a6073b          	addw	a4,a2,a0
    1f90:	04ed4663          	blt	s10,a4,1fdc <matrix_test+0x4f0>
    1f94:	2581                	c.addiw	a1,0
    1f96:	9532                	c.add	a0,a2
    1f98:	00c5a5b3          	slt	a1,a1,a2
    1f9c:	96ae                	c.add	a3,a1
    1f9e:	0095053b          	addw	a0,a0,s1
    1fa2:	478c                	c.lw	a1,8(a5)
    1fa4:	0005071b          	sext.w	a4,a0
    1fa8:	04ed5263          	bge	s10,a4,1fec <matrix_test+0x500>
    1fac:	00a68613          	addi	a2,a3,10
    1fb0:	872e                	c.mv	a4,a1
    1fb2:	47c8                	c.lw	a0,12(a5)
    1fb4:	0007069b          	sext.w	a3,a4
    1fb8:	04dd5463          	bge	s10,a3,2000 <matrix_test+0x514>
    1fbc:	00a60693          	addi	a3,a2,10
    1fc0:	00a00633          	add	a2,zero,a0
    1fc4:	0006071b          	sext.w	a4,a2
    1fc8:	04ed5663          	bge	s10,a4,2014 <matrix_test+0x528>
    1fcc:	00a68493          	addi	s1,a3,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 6)
            cur = C[i * N + j];
    1fd0:	4b8c                	c.lw	a1,16(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 4)
            tmp += cur;
    1fd2:	86ae                	c.mv	a3,a1
    1fd4:	04ed4863          	blt	s10,a4,2024 <matrix_test+0x538>
    1fd8:	0640006f          	j	203c <matrix_test+0x550>
    1fdc:	06a9                	c.addi	a3,10
    1fde:	00900533          	add	a0,zero,s1
    1fe2:	478c                	c.lw	a1,8(a5)
    1fe4:	0005071b          	sext.w	a4,a0
    1fe8:	fced42e3          	blt	s10,a4,1fac <matrix_test+0x4c0>
    1fec:	00962633          	slt	a2,a2,s1
    1ff0:	9636                	c.add	a2,a3
    1ff2:	00a5873b          	addw	a4,a1,a0
    1ff6:	47c8                	c.lw	a0,12(a5)
    1ff8:	0007069b          	sext.w	a3,a4
    1ffc:	fcdd40e3          	blt	s10,a3,1fbc <matrix_test+0x4d0>
    2000:	00b4a6b3          	slt	a3,s1,a1
    2004:	00c686b3          	add	a3,a3,a2
    2008:	00e5063b          	addw	a2,a0,a4
    200c:	0006071b          	sext.w	a4,a2
    2010:	faed4ee3          	blt	s10,a4,1fcc <matrix_test+0x4e0>
    2014:	00a5a5b3          	slt	a1,a1,a0
    2018:	00d584b3          	add	s1,a1,a3
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 6)
            cur = C[i * N + j];
    201c:	4b8c                	c.lw	a1,16(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 4)
            tmp += cur;
    201e:	86ae                	c.mv	a3,a1
    2020:	00ed5e63          	bge	s10,a4,203c <matrix_test+0x550>
    2024:	0006871b          	sext.w	a4,a3
    2028:	02ed4063          	blt	s10,a4,2048 <matrix_test+0x55c>
    202c:	00b52533          	slt	a0,a0,a1
    2030:	94aa                	c.add	s1,a0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 6)
            cur = C[i * N + j];
    2032:	4bc8                	c.lw	a0,20(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 4)
            tmp += cur;
    2034:	862a                	c.mv	a2,a0
    2036:	00ed4f63          	blt	s10,a4,2054 <matrix_test+0x568>
    203a:	a80d                	c.j	206c <matrix_test+0x580>
    203c:	00c586bb          	addw	a3,a1,a2
    2040:	0006871b          	sext.w	a4,a3
    2044:	feed54e3          	bge	s10,a4,202c <matrix_test+0x540>
    2048:	04a9                	c.addi	s1,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 6)
            cur = C[i * N + j];
    204a:	4bc8                	c.lw	a0,20(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 4)
            tmp += cur;
    204c:	00a00633          	add	a2,zero,a0
    2050:	00ed5e63          	bge	s10,a4,206c <matrix_test+0x580>
    2054:	0006071b          	sext.w	a4,a2
    2058:	02ed4063          	blt	s10,a4,2078 <matrix_test+0x58c>
    205c:	00a5a5b3          	slt	a1,a1,a0
    2060:	95a6                	c.add	a1,s1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 6)
            cur = C[i * N + j];
    2062:	4f84                	c.lw	s1,24(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 4)
            tmp += cur;
    2064:	86a6                	c.mv	a3,s1
    2066:	00ed4f63          	blt	s10,a4,2084 <matrix_test+0x598>
    206a:	a81d                	c.j	20a0 <matrix_test+0x5b4>
    206c:	00d5063b          	addw	a2,a0,a3
    2070:	0006071b          	sext.w	a4,a2
    2074:	feed54e3          	bge	s10,a4,205c <matrix_test+0x570>
    2078:	00a48593          	addi	a1,s1,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 6)
            cur = C[i * N + j];
    207c:	4f84                	c.lw	s1,24(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 4)
            tmp += cur;
    207e:	86a6                	c.mv	a3,s1
    2080:	02ed5063          	bge	s10,a4,20a0 <matrix_test+0x5b4>
    2084:	0006871b          	sext.w	a4,a3
    2088:	02ed4263          	blt	s10,a4,20ac <matrix_test+0x5c0>
    208c:	00952533          	slt	a0,a0,s1
    2090:	00b50633          	add	a2,a0,a1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 6)
            cur = C[i * N + j];
    2094:	4fcc                	c.lw	a1,28(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 4)
            tmp += cur;
    2096:	852e                	c.mv	a0,a1
    2098:	02ed5063          	bge	s10,a4,20b8 <matrix_test+0x5cc>
    209c:	0200006f          	j	20bc <matrix_test+0x5d0>
    20a0:	00c486bb          	addw	a3,s1,a2
    20a4:	0006871b          	sext.w	a4,a3
    20a8:	feed52e3          	bge	s10,a4,208c <matrix_test+0x5a0>
    20ac:	00a58613          	addi	a2,a1,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 6)
            cur = C[i * N + j];
    20b0:	4fcc                	c.lw	a1,28(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 4)
            tmp += cur;
    20b2:	852e                	c.mv	a0,a1
    20b4:	00ed4463          	blt	s10,a4,20bc <matrix_test+0x5d0>
    20b8:	00d5853b          	addw	a0,a1,a3
    20bc:	0005069b          	sext.w	a3,a0
    20c0:	eadd5ce3          	bge	s10,a3,1f78 <matrix_test+0x48c>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:249 (discriminator 6)
            if (tmp > clipval)
    20c4:	4501                	c.li	a0,0
    20c6:	00a60693          	addi	a3,a2,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 10)
        for (j = 0; j < N; j++)
    20ca:	02078793          	addi	a5,a5,32
    20ce:	03a1                	c.addi	t2,8
    20d0:	ea791ce3          	bne	s2,t2,1f88 <matrix_test+0x49c>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 10)
            cur = C[i * N + j];
    20d4:	87ae                	c.mv	a5,a1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 12)
        for (j = 0; j < N; j++)
    20d6:	e80c13e3          	bnez	s8,1f5c <matrix_test+0x470>
    20da:	7482                	c.ldsp	s1,32(sp)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 14)
    20dc:	00538633          	add	a2,t2,t0
    20e0:	0cca075b          	lea.w	a4,s4,a2
    20e4:	0180006f          	j	20fc <matrix_test+0x610>
    20e8:	2581                	c.addiw	a1,0
    20ea:	00f5a5b3          	slt	a1,a1,a5
    20ee:	96ae                	c.add	a3,a1
    20f0:	0711                	c.addi	a4,4
    20f2:	14fd                	c.addi	s1,-1
    20f4:	00f005b3          	add	a1,zero,a5
    20f8:	e60482e3          	beqz	s1,1f5c <matrix_test+0x470>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 8)
            cur = C[i * N + j];
    20fc:	431c                	c.lw	a5,0(a4)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 6)
            tmp += cur;
    20fe:	9d3d                	c.addw	a0,a5
    2100:	fead54e3          	bge	s10,a0,20e8 <matrix_test+0x5fc>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:249 (discriminator 8)
            if (tmp > clipval)
    2104:	4501                	c.li	a0,0
    2106:	06a9                	c.addi	a3,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 14)
        for (j = 0; j < N; j++)
    2108:	0711                	c.addi	a4,4
    210a:	14fd                	c.addi	s1,-1
    210c:	85be                	c.mv	a1,a5
    210e:	f4fd                	c.bnez	s1,20fc <matrix_test+0x610>
    2110:	e4dff06f          	j	1f5c <matrix_test+0x470>
matrix_test():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:145
    crc = crc16(matrix_sum(N, C, clipval), crc);
    2114:	3c06b55b          	bfos	a0,a3,15,0
    2118:	85c2                	c.mv	a1,a6
    211a:	1c6020ef          	jal	ra,42e0 <crc16>
    211e:	62e2                	c.ldsp	t0,24(sp)
    2120:	e42a                	c.sdsp	a0,8(sp)
    2122:	4301                	c.li	t1,0
    2124:	4881                	c.li	a7,0
matrix_mul_matrix():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:325
*/
void
matrix_mul_matrix(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B)
{
    ee_u32 i, j, k;
    for (i = 0; i < N; i++)
    2126:	004b1d93          	slli	s11,s6,0x4
    212a:	a039                	c.j	2138 <matrix_test+0x64c>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:325 (discriminator 2)
    212c:	1163035b          	lea.b.ze	t1,t1,s6
    2130:	92de                	c.add	t0,s7
    2132:	0885                	c.addi	a7,1
    2134:	0f688c63          	beq	a7,s6,222c <matrix_test+0x740>
    2138:	4f01                	c.li	t5,0
    213a:	036883b3          	mul	t2,a7,s6
    213e:	8ece                	c.mv	t4,s3
    2140:	0100006f          	j	2150 <matrix_test+0x664>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:327 (discriminator 2)
    {
        for (j = 0; j < N; j++)
    2144:	0e89                	c.addi	t4,2
    2146:	0f05                	c.addi	t5,1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:332 (discriminator 2)
        {
            C[i * N + j] = 0;
            for (k = 0; k < N; k++)
            {
                C[i * N + j] += (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    2148:	00ce2023          	sw	a2,0(t3)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:327 (discriminator 2)
        for (j = 0; j < N; j++)
    214c:	ff6f00e3          	beq	t5,s6,212c <matrix_test+0x640>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:329
            C[i * N + j] = 0;
    2150:	007f0533          	add	a0,t5,t2
    2154:	0caa0e5b          	lea.w	t3,s4,a0
    2158:	000e2023          	sw	zero,0(t3)
    215c:	4501                	c.li	a0,0
    215e:	4601                	c.li	a2,0
    2160:	080a9e63          	bnez	s5,21fc <matrix_test+0x710>
    2164:	8716                	c.mv	a4,t0
    2166:	87f6                	c.mv	a5,t4
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:332 (discriminator 4)
                C[i * N + j] += (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    2168:	01778433          	add	s0,a5,s7
    216c:	00079683          	lh	a3,0(a5)
    2170:	00071f83          	lh	t6,0(a4)
    2174:	00271483          	lh	s1,2(a4)
    2178:	00041583          	lh	a1,0(s0)
    217c:	03f686b3          	mul	a3,a3,t6
    2180:	00471083          	lh	ra,4(a4)
    2184:	029585b3          	mul	a1,a1,s1
    2188:	9636                	c.add	a2,a3
    218a:	00671483          	lh	s1,6(a4)
    218e:	00c58fb3          	add	t6,a1,a2
    2192:	01740633          	add	a2,s0,s7
    2196:	00061683          	lh	a3,0(a2)
    219a:	965e                	c.add	a2,s7
    219c:	00061403          	lh	s0,0(a2)
    21a0:	965e                	c.add	a2,s7
    21a2:	00061583          	lh	a1,0(a2)
    21a6:	00871803          	lh	a6,8(a4)
    21aa:	021686b3          	mul	a3,a3,ra
    21ae:	02940433          	mul	s0,s0,s1
    21b2:	030585b3          	mul	a1,a1,a6
    21b6:	01f686bb          	addw	a3,a3,t6
    21ba:	965e                	c.add	a2,s7
    21bc:	96a2                	c.add	a3,s0
    21be:	00061f83          	lh	t6,0(a2)
    21c2:	00a71483          	lh	s1,10(a4)
    21c6:	965e                	c.add	a2,s7
    21c8:	00d58833          	add	a6,a1,a3
    21cc:	00061403          	lh	s0,0(a2)
    21d0:	00c71583          	lh	a1,12(a4)
    21d4:	965e                	c.add	a2,s7
    21d6:	00e71683          	lh	a3,14(a4)
    21da:	00061603          	lh	a2,0(a2)
    21de:	029f84b3          	mul	s1,t6,s1
    21e2:	02b405b3          	mul	a1,s0,a1
    21e6:	02d60633          	mul	a2,a2,a3
    21ea:	010486b3          	add	a3,s1,a6
    21ee:	95b6                	c.add	a1,a3
    21f0:	9e2d                	c.addw	a2,a1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:330 (discriminator 6)
            for (k = 0; k < N; k++)
    21f2:	97ee                	c.add	a5,s11
    21f4:	0741                	c.addi	a4,16
    21f6:	0521                	c.addi	a0,8
    21f8:	f6a918e3          	bne	s2,a0,2168 <matrix_test+0x67c>
    21fc:	f40c14e3          	bnez	s8,2144 <matrix_test+0x658>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:330 (discriminator 4)
    2200:	02ab0733          	mul	a4,s6,a0
    2204:	65e2                	c.ldsp	a1,24(sp)
    2206:	951a                	c.add	a0,t1
    2208:	977a                	c.add	a4,t5
    220a:	0ae987db          	lea.h	a5,s3,a4
    220e:	7702                	c.ldsp	a4,32(sp)
    2210:	0aa5855b          	lea.h	a0,a1,a0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:332
                C[i * N + j] += (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    2214:	00079583          	lh	a1,0(a5)
    2218:	00051483          	lh	s1,0(a0) # 1000 <core_list_init+0x30c>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:330 (discriminator 4)
            for (k = 0; k < N; k++)
    221c:	97de                	c.add	a5,s7
    221e:	0509                	c.addi	a0,2
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:332
                C[i * N + j] += (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    2220:	029585b3          	mul	a1,a1,s1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:330 (discriminator 4)
            for (k = 0; k < N; k++)
    2224:	177d                	c.addi	a4,-1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:332
                C[i * N + j] += (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    2226:	9e2d                	c.addw	a2,a1
    2228:	f775                	c.bnez	a4,2214 <matrix_test+0x728>
    222a:	bf29                	c.j	2144 <matrix_test+0x658>
matrix_test():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:332
    222c:	6442                	c.ldsp	s0,16(sp)
    222e:	4281                	c.li	t0,0
    2230:	4301                	c.li	t1,0
    2232:	4681                	c.li	a3,0
    2234:	4581                	c.li	a1,0
    2236:	4501                	c.li	a0,0
    2238:	88d2                	c.mv	a7,s4
    223a:	a809                	c.j	224c <matrix_test+0x760>
matrix_sum():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:243 (discriminator 10)
    for (i = 0; i < N; i++)
    223c:	116282db          	lea.b.ze	t0,t0,s6
    2240:	98a2                	c.add	a7,s0
    2242:	0305                	c.addi	t1,1
    2244:	00f005b3          	add	a1,zero,a5
    2248:	1b630663          	beq	t1,s6,23f4 <matrix_test+0x908>
    224c:	4381                	c.li	t2,0
    224e:	160a9363          	bnez	s5,23b4 <matrix_test+0x8c8>
    2252:	87c6                	c.mv	a5,a7
    2254:	0140006f          	j	2268 <matrix_test+0x77c>
    2258:	00b4a6b3          	slt	a3,s1,a1
    225c:	96b2                	c.add	a3,a2
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 18)
        for (j = 0; j < N; j++)
    225e:	02078793          	addi	a5,a5,32
    2262:	03a1                	c.addi	t2,8
    2264:	14790863          	beq	s2,t2,23b4 <matrix_test+0x8c8>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 12)
            cur = C[i * N + j];
    2268:	4390                	c.lw	a2,0(a5)
    226a:	43c4                	c.lw	s1,4(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 8)
            tmp += cur;
    226c:	00a6073b          	addw	a4,a2,a0
    2270:	04ed4663          	blt	s10,a4,22bc <matrix_test+0x7d0>
    2274:	2581                	c.addiw	a1,0
    2276:	9532                	c.add	a0,a2
    2278:	00c5a5b3          	slt	a1,a1,a2
    227c:	96ae                	c.add	a3,a1
    227e:	0095053b          	addw	a0,a0,s1
    2282:	478c                	c.lw	a1,8(a5)
    2284:	0005071b          	sext.w	a4,a0
    2288:	04ed5263          	bge	s10,a4,22cc <matrix_test+0x7e0>
    228c:	00a68613          	addi	a2,a3,10
    2290:	872e                	c.mv	a4,a1
    2292:	47c8                	c.lw	a0,12(a5)
    2294:	0007069b          	sext.w	a3,a4
    2298:	04dd5463          	bge	s10,a3,22e0 <matrix_test+0x7f4>
    229c:	00a60693          	addi	a3,a2,10
    22a0:	00a00633          	add	a2,zero,a0
    22a4:	0006071b          	sext.w	a4,a2
    22a8:	04ed5663          	bge	s10,a4,22f4 <matrix_test+0x808>
    22ac:	00a68493          	addi	s1,a3,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 12)
            cur = C[i * N + j];
    22b0:	4b8c                	c.lw	a1,16(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 8)
            tmp += cur;
    22b2:	86ae                	c.mv	a3,a1
    22b4:	04ed4863          	blt	s10,a4,2304 <matrix_test+0x818>
    22b8:	0640006f          	j	231c <matrix_test+0x830>
    22bc:	06a9                	c.addi	a3,10
    22be:	00900533          	add	a0,zero,s1
    22c2:	478c                	c.lw	a1,8(a5)
    22c4:	0005071b          	sext.w	a4,a0
    22c8:	fced42e3          	blt	s10,a4,228c <matrix_test+0x7a0>
    22cc:	00962633          	slt	a2,a2,s1
    22d0:	9636                	c.add	a2,a3
    22d2:	00a5873b          	addw	a4,a1,a0
    22d6:	47c8                	c.lw	a0,12(a5)
    22d8:	0007069b          	sext.w	a3,a4
    22dc:	fcdd40e3          	blt	s10,a3,229c <matrix_test+0x7b0>
    22e0:	00b4a6b3          	slt	a3,s1,a1
    22e4:	00c686b3          	add	a3,a3,a2
    22e8:	00e5063b          	addw	a2,a0,a4
    22ec:	0006071b          	sext.w	a4,a2
    22f0:	faed4ee3          	blt	s10,a4,22ac <matrix_test+0x7c0>
    22f4:	00a5a5b3          	slt	a1,a1,a0
    22f8:	00d584b3          	add	s1,a1,a3
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 12)
            cur = C[i * N + j];
    22fc:	4b8c                	c.lw	a1,16(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 8)
            tmp += cur;
    22fe:	86ae                	c.mv	a3,a1
    2300:	00ed5e63          	bge	s10,a4,231c <matrix_test+0x830>
    2304:	0006871b          	sext.w	a4,a3
    2308:	02ed4063          	blt	s10,a4,2328 <matrix_test+0x83c>
    230c:	00b52533          	slt	a0,a0,a1
    2310:	94aa                	c.add	s1,a0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 12)
            cur = C[i * N + j];
    2312:	4bc8                	c.lw	a0,20(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 8)
            tmp += cur;
    2314:	862a                	c.mv	a2,a0
    2316:	00ed4f63          	blt	s10,a4,2334 <matrix_test+0x848>
    231a:	a80d                	c.j	234c <matrix_test+0x860>
    231c:	00c586bb          	addw	a3,a1,a2
    2320:	0006871b          	sext.w	a4,a3
    2324:	feed54e3          	bge	s10,a4,230c <matrix_test+0x820>
    2328:	04a9                	c.addi	s1,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 12)
            cur = C[i * N + j];
    232a:	4bc8                	c.lw	a0,20(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 8)
            tmp += cur;
    232c:	00a00633          	add	a2,zero,a0
    2330:	00ed5e63          	bge	s10,a4,234c <matrix_test+0x860>
    2334:	0006071b          	sext.w	a4,a2
    2338:	02ed4063          	blt	s10,a4,2358 <matrix_test+0x86c>
    233c:	00a5a5b3          	slt	a1,a1,a0
    2340:	95a6                	c.add	a1,s1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 12)
            cur = C[i * N + j];
    2342:	4f84                	c.lw	s1,24(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 8)
            tmp += cur;
    2344:	86a6                	c.mv	a3,s1
    2346:	00ed4f63          	blt	s10,a4,2364 <matrix_test+0x878>
    234a:	a81d                	c.j	2380 <matrix_test+0x894>
    234c:	00d5063b          	addw	a2,a0,a3
    2350:	0006071b          	sext.w	a4,a2
    2354:	feed54e3          	bge	s10,a4,233c <matrix_test+0x850>
    2358:	00a48593          	addi	a1,s1,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 12)
            cur = C[i * N + j];
    235c:	4f84                	c.lw	s1,24(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 8)
            tmp += cur;
    235e:	86a6                	c.mv	a3,s1
    2360:	02ed5063          	bge	s10,a4,2380 <matrix_test+0x894>
    2364:	0006871b          	sext.w	a4,a3
    2368:	02ed4263          	blt	s10,a4,238c <matrix_test+0x8a0>
    236c:	00952533          	slt	a0,a0,s1
    2370:	00b50633          	add	a2,a0,a1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 12)
            cur = C[i * N + j];
    2374:	4fcc                	c.lw	a1,28(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 8)
            tmp += cur;
    2376:	852e                	c.mv	a0,a1
    2378:	02ed5063          	bge	s10,a4,2398 <matrix_test+0x8ac>
    237c:	0200006f          	j	239c <matrix_test+0x8b0>
    2380:	00c486bb          	addw	a3,s1,a2
    2384:	0006871b          	sext.w	a4,a3
    2388:	feed52e3          	bge	s10,a4,236c <matrix_test+0x880>
    238c:	00a58613          	addi	a2,a1,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 12)
            cur = C[i * N + j];
    2390:	4fcc                	c.lw	a1,28(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 8)
            tmp += cur;
    2392:	852e                	c.mv	a0,a1
    2394:	00ed4463          	blt	s10,a4,239c <matrix_test+0x8b0>
    2398:	00d5853b          	addw	a0,a1,a3
    239c:	0005069b          	sext.w	a3,a0
    23a0:	eadd5ce3          	bge	s10,a3,2258 <matrix_test+0x76c>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:249 (discriminator 12)
            if (tmp > clipval)
    23a4:	4501                	c.li	a0,0
    23a6:	00a60693          	addi	a3,a2,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 18)
        for (j = 0; j < N; j++)
    23aa:	02078793          	addi	a5,a5,32
    23ae:	03a1                	c.addi	t2,8
    23b0:	ea791ce3          	bne	s2,t2,2268 <matrix_test+0x77c>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 16)
            cur = C[i * N + j];
    23b4:	87ae                	c.mv	a5,a1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 20)
        for (j = 0; j < N; j++)
    23b6:	e80c13e3          	bnez	s8,223c <matrix_test+0x750>
    23ba:	7482                	c.ldsp	s1,32(sp)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 22)
    23bc:	00538633          	add	a2,t2,t0
    23c0:	0cca075b          	lea.w	a4,s4,a2
    23c4:	0180006f          	j	23dc <matrix_test+0x8f0>
    23c8:	2581                	c.addiw	a1,0
    23ca:	00f5a5b3          	slt	a1,a1,a5
    23ce:	96ae                	c.add	a3,a1
    23d0:	0711                	c.addi	a4,4
    23d2:	14fd                	c.addi	s1,-1
    23d4:	00f005b3          	add	a1,zero,a5
    23d8:	e60482e3          	beqz	s1,223c <matrix_test+0x750>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 14)
            cur = C[i * N + j];
    23dc:	431c                	c.lw	a5,0(a4)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 10)
            tmp += cur;
    23de:	9d3d                	c.addw	a0,a5
    23e0:	fead54e3          	bge	s10,a0,23c8 <matrix_test+0x8dc>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:249 (discriminator 14)
            if (tmp > clipval)
    23e4:	4501                	c.li	a0,0
    23e6:	06a9                	c.addi	a3,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 22)
        for (j = 0; j < N; j++)
    23e8:	0711                	c.addi	a4,4
    23ea:	14fd                	c.addi	s1,-1
    23ec:	85be                	c.mv	a1,a5
    23ee:	f4fd                	c.bnez	s1,23dc <matrix_test+0x8f0>
    23f0:	e4dff06f          	j	223c <matrix_test+0x750>
matrix_test():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:150
    crc = crc16(matrix_sum(N, C, clipval), crc);
    23f4:	65a2                	c.ldsp	a1,8(sp)
    23f6:	3c06b55b          	bfos	a0,a3,15,0
    23fa:	6e7010ef          	jal	ra,42e0 <crc16>
    23fe:	62e2                	c.ldsp	t0,24(sp)
    2400:	882a                	c.mv	a6,a0
    2402:	4301                	c.li	t1,0
    2404:	4881                	c.li	a7,0
    2406:	a039                	c.j	2414 <matrix_test+0x928>
matrix_mul_matrix_bitextract():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:347 (discriminator 2)
*/
void
matrix_mul_matrix_bitextract(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B)
{
    ee_u32 i, j, k;
    for (i = 0; i < N; i++)
    2408:	1163035b          	lea.b.ze	t1,t1,s6
    240c:	92de                	c.add	t0,s7
    240e:	0885                	c.addi	a7,1
    2410:	17688063          	beq	a7,s6,2570 <matrix_test+0xa84>
    2414:	4f01                	c.li	t5,0
    2416:	036883b3          	mul	t2,a7,s6
    241a:	8ece                	c.mv	t4,s3
    241c:	0100006f          	j	242c <matrix_test+0x940>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:349 (discriminator 2)
    {
        for (j = 0; j < N; j++)
    2420:	0e89                	c.addi	t4,2
    2422:	0f05                	c.addi	t5,1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:355 (discriminator 2)
        {
            C[i * N + j] = 0;
            for (k = 0; k < N; k++)
            {
                MATRES tmp = (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
                C[i * N + j] += bit_extract(tmp, 2, 4) * bit_extract(tmp, 5, 7);
    2424:	00ae2023          	sw	a0,0(t3)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:349 (discriminator 2)
        for (j = 0; j < N; j++)
    2428:	ff6f00e3          	beq	t5,s6,2408 <matrix_test+0x91c>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:351
            C[i * N + j] = 0;
    242c:	007f0533          	add	a0,t5,t2
    2430:	0caa0e5b          	lea.w	t3,s4,a0
    2434:	000e2023          	sw	zero,0(t3)
    2438:	4f81                	c.li	t6,0
    243a:	4501                	c.li	a0,0
    243c:	0e0a9a63          	bnez	s5,2530 <matrix_test+0xa44>
    2440:	8796                	c.mv	a5,t0
    2442:	85f6                	c.mv	a1,t4
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:354 (discriminator 2)
                MATRES tmp = (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    2444:	0007d483          	lhu	s1,0(a5)
    2448:	0005d403          	lhu	s0,0(a1)
    244c:	0027d603          	lhu	a2,2(a5)
    2450:	0047d083          	lhu	ra,4(a5)
    2454:	029404b3          	mul	s1,s0,s1
    2458:	01758433          	add	s0,a1,s7
    245c:	00045703          	lhu	a4,0(s0)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:355 (discriminator 4)
                C[i * N + j] += bit_extract(tmp, 2, 4) * bit_extract(tmp, 5, 7);
    2460:	2c54a6db          	bfoz	a3,s1,11,5
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:354 (discriminator 2)
                MATRES tmp = (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    2464:	945e                	c.add	s0,s7
    2466:	02c70633          	mul	a2,a4,a2
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:355 (discriminator 4)
                C[i * N + j] += bit_extract(tmp, 2, 4) * bit_extract(tmp, 5, 7);
    246a:	1424a75b          	bfoz	a4,s1,5,2
    246e:	02d706b3          	mul	a3,a4,a3
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:354 (discriminator 2)
                MATRES tmp = (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    2472:	00045483          	lhu	s1,0(s0)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:355 (discriminator 4)
                C[i * N + j] += bit_extract(tmp, 2, 4) * bit_extract(tmp, 5, 7);
    2476:	2c56275b          	bfoz	a4,a2,11,5
    247a:	1426265b          	bfoz	a2,a2,5,2
    247e:	02e60633          	mul	a2,a2,a4
    2482:	9536                	c.add	a0,a3
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:354 (discriminator 2)
                MATRES tmp = (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    2484:	017406b3          	add	a3,s0,s7
    2488:	02148733          	mul	a4,s1,ra
    248c:	0006d403          	lhu	s0,0(a3)
    2490:	0067d483          	lhu	s1,6(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:355 (discriminator 4)
                C[i * N + j] += bit_extract(tmp, 2, 4) * bit_extract(tmp, 5, 7);
    2494:	9532                	c.add	a0,a2
    2496:	2c57265b          	bfoz	a2,a4,11,5
    249a:	1427275b          	bfoz	a4,a4,5,2
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:354 (discriminator 2)
                MATRES tmp = (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    249e:	96de                	c.add	a3,s7
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:355 (discriminator 4)
                C[i * N + j] += bit_extract(tmp, 2, 4) * bit_extract(tmp, 5, 7);
    24a0:	02c70633          	mul	a2,a4,a2
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:354 (discriminator 2)
                MATRES tmp = (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    24a4:	02940733          	mul	a4,s0,s1
    24a8:	0006d403          	lhu	s0,0(a3)
    24ac:	0087d483          	lhu	s1,8(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:355 (discriminator 4)
                C[i * N + j] += bit_extract(tmp, 2, 4) * bit_extract(tmp, 5, 7);
    24b0:	9d31                	c.addw	a0,a2
    24b2:	2c57265b          	bfoz	a2,a4,11,5
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:354 (discriminator 2)
                MATRES tmp = (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    24b6:	02940433          	mul	s0,s0,s1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:355 (discriminator 4)
                C[i * N + j] += bit_extract(tmp, 2, 4) * bit_extract(tmp, 5, 7);
    24ba:	1427275b          	bfoz	a4,a4,5,2
    24be:	02c70633          	mul	a2,a4,a2
    24c2:	2c54275b          	bfoz	a4,s0,11,5
    24c6:	1424245b          	bfoz	s0,s0,5,2
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:354 (discriminator 2)
                MATRES tmp = (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    24ca:	96de                	c.add	a3,s7
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:355 (discriminator 4)
                C[i * N + j] += bit_extract(tmp, 2, 4) * bit_extract(tmp, 5, 7);
    24cc:	02e40733          	mul	a4,s0,a4
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:354 (discriminator 2)
                MATRES tmp = (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    24d0:	0006d403          	lhu	s0,0(a3)
    24d4:	00a7d483          	lhu	s1,10(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:355 (discriminator 4)
                C[i * N + j] += bit_extract(tmp, 2, 4) * bit_extract(tmp, 5, 7);
    24d8:	9532                	c.add	a0,a2
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:354 (discriminator 2)
                MATRES tmp = (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    24da:	96de                	c.add	a3,s7
    24dc:	02940633          	mul	a2,s0,s1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:355 (discriminator 4)
                C[i * N + j] += bit_extract(tmp, 2, 4) * bit_extract(tmp, 5, 7);
    24e0:	953a                	c.add	a0,a4
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:354 (discriminator 2)
                MATRES tmp = (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    24e2:	0006d703          	lhu	a4,0(a3)
    24e6:	00c7d403          	lhu	s0,12(a5)
    24ea:	96de                	c.add	a3,s7
    24ec:	0006d683          	lhu	a3,0(a3)
    24f0:	02870733          	mul	a4,a4,s0
    24f4:	00e7d403          	lhu	s0,14(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:355 (discriminator 4)
                C[i * N + j] += bit_extract(tmp, 2, 4) * bit_extract(tmp, 5, 7);
    24f8:	2c5624db          	bfoz	s1,a2,11,5
    24fc:	1426265b          	bfoz	a2,a2,5,2
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:354 (discriminator 2)
                MATRES tmp = (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    2500:	028686b3          	mul	a3,a3,s0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:355 (discriminator 4)
                C[i * N + j] += bit_extract(tmp, 2, 4) * bit_extract(tmp, 5, 7);
    2504:	02960633          	mul	a2,a2,s1
    2508:	2c5724db          	bfoz	s1,a4,11,5
    250c:	1427275b          	bfoz	a4,a4,5,2
    2510:	2c56a45b          	bfoz	s0,a3,11,5
    2514:	1426a6db          	bfoz	a3,a3,5,2
    2518:	02970733          	mul	a4,a4,s1
    251c:	028686b3          	mul	a3,a3,s0
    2520:	9532                	c.add	a0,a2
    2522:	953a                	c.add	a0,a4
    2524:	9d35                	c.addw	a0,a3
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:352 (discriminator 6)
            for (k = 0; k < N; k++)
    2526:	95ee                	c.add	a1,s11
    2528:	07c1                	c.addi	a5,16
    252a:	0fa1                	c.addi	t6,8
    252c:	f1f91ce3          	bne	s2,t6,2444 <matrix_test+0x958>
    2530:	ee0c18e3          	bnez	s8,2420 <matrix_test+0x934>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:352 (discriminator 4)
    2534:	03fb07b3          	mul	a5,s6,t6
    2538:	6662                	c.ldsp	a2,24(sp)
    253a:	01f305b3          	add	a1,t1,t6
    253e:	00ff06b3          	add	a3,t5,a5
    2542:	7782                	c.ldsp	a5,32(sp)
    2544:	0ab605db          	lea.h	a1,a2,a1
    2548:	0ad986db          	lea.h	a3,s3,a3
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:354
                MATRES tmp = (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    254c:	0005d483          	lhu	s1,0(a1)
    2550:	0006d403          	lhu	s0,0(a3)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:352 (discriminator 4)
            for (k = 0; k < N; k++)
    2554:	96de                	c.add	a3,s7
    2556:	0589                	c.addi	a1,2
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:354
                MATRES tmp = (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
    2558:	029404b3          	mul	s1,s0,s1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:352 (discriminator 4)
            for (k = 0; k < N; k++)
    255c:	17fd                	c.addi	a5,-1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:355
                C[i * N + j] += bit_extract(tmp, 2, 4) * bit_extract(tmp, 5, 7);
    255e:	2c54a45b          	bfoz	s0,s1,11,5
    2562:	1424a4db          	bfoz	s1,s1,5,2
    2566:	028484b3          	mul	s1,s1,s0
    256a:	9d25                	c.addw	a0,s1
    256c:	f3e5                	c.bnez	a5,254c <matrix_test+0xa60>
    256e:	bd4d                	c.j	2420 <matrix_test+0x934>
matrix_test():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:355
    2570:	6442                	c.ldsp	s0,16(sp)
    2572:	4281                	c.li	t0,0
    2574:	4301                	c.li	t1,0
    2576:	4681                	c.li	a3,0
    2578:	4581                	c.li	a1,0
    257a:	4501                	c.li	a0,0
    257c:	88d2                	c.mv	a7,s4
    257e:	a809                	c.j	2590 <matrix_test+0xaa4>
matrix_sum():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:243 (discriminator 14)
    for (i = 0; i < N; i++)
    2580:	116282db          	lea.b.ze	t0,t0,s6
    2584:	98a2                	c.add	a7,s0
    2586:	0305                	c.addi	t1,1
    2588:	00f005b3          	add	a1,zero,a5
    258c:	1b630663          	beq	t1,s6,2738 <matrix_test+0xc4c>
    2590:	4381                	c.li	t2,0
    2592:	160a9363          	bnez	s5,26f8 <matrix_test+0xc0c>
    2596:	87c6                	c.mv	a5,a7
    2598:	0140006f          	j	25ac <matrix_test+0xac0>
    259c:	00b4a6b3          	slt	a3,s1,a1
    25a0:	96b2                	c.add	a3,a2
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 26)
        for (j = 0; j < N; j++)
    25a2:	02078793          	addi	a5,a5,32
    25a6:	03a1                	c.addi	t2,8
    25a8:	14790863          	beq	s2,t2,26f8 <matrix_test+0xc0c>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 18)
            cur = C[i * N + j];
    25ac:	4390                	c.lw	a2,0(a5)
    25ae:	43c4                	c.lw	s1,4(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 12)
            tmp += cur;
    25b0:	00a6073b          	addw	a4,a2,a0
    25b4:	04ed4663          	blt	s10,a4,2600 <matrix_test+0xb14>
    25b8:	2581                	c.addiw	a1,0
    25ba:	9532                	c.add	a0,a2
    25bc:	00c5a5b3          	slt	a1,a1,a2
    25c0:	96ae                	c.add	a3,a1
    25c2:	0095053b          	addw	a0,a0,s1
    25c6:	478c                	c.lw	a1,8(a5)
    25c8:	0005071b          	sext.w	a4,a0
    25cc:	04ed5263          	bge	s10,a4,2610 <matrix_test+0xb24>
    25d0:	00a68613          	addi	a2,a3,10
    25d4:	872e                	c.mv	a4,a1
    25d6:	47c8                	c.lw	a0,12(a5)
    25d8:	0007069b          	sext.w	a3,a4
    25dc:	04dd5463          	bge	s10,a3,2624 <matrix_test+0xb38>
    25e0:	00a60693          	addi	a3,a2,10
    25e4:	00a00633          	add	a2,zero,a0
    25e8:	0006071b          	sext.w	a4,a2
    25ec:	04ed5663          	bge	s10,a4,2638 <matrix_test+0xb4c>
    25f0:	00a68493          	addi	s1,a3,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 18)
            cur = C[i * N + j];
    25f4:	4b8c                	c.lw	a1,16(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 12)
            tmp += cur;
    25f6:	86ae                	c.mv	a3,a1
    25f8:	04ed4863          	blt	s10,a4,2648 <matrix_test+0xb5c>
    25fc:	0640006f          	j	2660 <matrix_test+0xb74>
    2600:	06a9                	c.addi	a3,10
    2602:	00900533          	add	a0,zero,s1
    2606:	478c                	c.lw	a1,8(a5)
    2608:	0005071b          	sext.w	a4,a0
    260c:	fced42e3          	blt	s10,a4,25d0 <matrix_test+0xae4>
    2610:	00962633          	slt	a2,a2,s1
    2614:	9636                	c.add	a2,a3
    2616:	00a5873b          	addw	a4,a1,a0
    261a:	47c8                	c.lw	a0,12(a5)
    261c:	0007069b          	sext.w	a3,a4
    2620:	fcdd40e3          	blt	s10,a3,25e0 <matrix_test+0xaf4>
    2624:	00b4a6b3          	slt	a3,s1,a1
    2628:	00c686b3          	add	a3,a3,a2
    262c:	00e5063b          	addw	a2,a0,a4
    2630:	0006071b          	sext.w	a4,a2
    2634:	faed4ee3          	blt	s10,a4,25f0 <matrix_test+0xb04>
    2638:	00a5a5b3          	slt	a1,a1,a0
    263c:	00d584b3          	add	s1,a1,a3
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 18)
            cur = C[i * N + j];
    2640:	4b8c                	c.lw	a1,16(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 12)
            tmp += cur;
    2642:	86ae                	c.mv	a3,a1
    2644:	00ed5e63          	bge	s10,a4,2660 <matrix_test+0xb74>
    2648:	0006871b          	sext.w	a4,a3
    264c:	02ed4063          	blt	s10,a4,266c <matrix_test+0xb80>
    2650:	00b52533          	slt	a0,a0,a1
    2654:	94aa                	c.add	s1,a0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 18)
            cur = C[i * N + j];
    2656:	4bc8                	c.lw	a0,20(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 12)
            tmp += cur;
    2658:	862a                	c.mv	a2,a0
    265a:	00ed4f63          	blt	s10,a4,2678 <matrix_test+0xb8c>
    265e:	a80d                	c.j	2690 <matrix_test+0xba4>
    2660:	00c586bb          	addw	a3,a1,a2
    2664:	0006871b          	sext.w	a4,a3
    2668:	feed54e3          	bge	s10,a4,2650 <matrix_test+0xb64>
    266c:	04a9                	c.addi	s1,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 18)
            cur = C[i * N + j];
    266e:	4bc8                	c.lw	a0,20(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 12)
            tmp += cur;
    2670:	00a00633          	add	a2,zero,a0
    2674:	00ed5e63          	bge	s10,a4,2690 <matrix_test+0xba4>
    2678:	0006071b          	sext.w	a4,a2
    267c:	02ed4063          	blt	s10,a4,269c <matrix_test+0xbb0>
    2680:	00a5a5b3          	slt	a1,a1,a0
    2684:	95a6                	c.add	a1,s1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 18)
            cur = C[i * N + j];
    2686:	4f84                	c.lw	s1,24(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 12)
            tmp += cur;
    2688:	86a6                	c.mv	a3,s1
    268a:	00ed4f63          	blt	s10,a4,26a8 <matrix_test+0xbbc>
    268e:	a81d                	c.j	26c4 <matrix_test+0xbd8>
    2690:	00d5063b          	addw	a2,a0,a3
    2694:	0006071b          	sext.w	a4,a2
    2698:	feed54e3          	bge	s10,a4,2680 <matrix_test+0xb94>
    269c:	00a48593          	addi	a1,s1,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 18)
            cur = C[i * N + j];
    26a0:	4f84                	c.lw	s1,24(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 12)
            tmp += cur;
    26a2:	86a6                	c.mv	a3,s1
    26a4:	02ed5063          	bge	s10,a4,26c4 <matrix_test+0xbd8>
    26a8:	0006871b          	sext.w	a4,a3
    26ac:	02ed4263          	blt	s10,a4,26d0 <matrix_test+0xbe4>
    26b0:	00952533          	slt	a0,a0,s1
    26b4:	00b50633          	add	a2,a0,a1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 18)
            cur = C[i * N + j];
    26b8:	4fcc                	c.lw	a1,28(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 12)
            tmp += cur;
    26ba:	852e                	c.mv	a0,a1
    26bc:	02ed5063          	bge	s10,a4,26dc <matrix_test+0xbf0>
    26c0:	0200006f          	j	26e0 <matrix_test+0xbf4>
    26c4:	00c486bb          	addw	a3,s1,a2
    26c8:	0006871b          	sext.w	a4,a3
    26cc:	feed52e3          	bge	s10,a4,26b0 <matrix_test+0xbc4>
    26d0:	00a58613          	addi	a2,a1,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 18)
            cur = C[i * N + j];
    26d4:	4fcc                	c.lw	a1,28(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 12)
            tmp += cur;
    26d6:	852e                	c.mv	a0,a1
    26d8:	00ed4463          	blt	s10,a4,26e0 <matrix_test+0xbf4>
    26dc:	00d5853b          	addw	a0,a1,a3
    26e0:	0005069b          	sext.w	a3,a0
    26e4:	eadd5ce3          	bge	s10,a3,259c <matrix_test+0xab0>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:249 (discriminator 18)
            if (tmp > clipval)
    26e8:	4501                	c.li	a0,0
    26ea:	00a60693          	addi	a3,a2,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 26)
        for (j = 0; j < N; j++)
    26ee:	02078793          	addi	a5,a5,32
    26f2:	03a1                	c.addi	t2,8
    26f4:	ea791ce3          	bne	s2,t2,25ac <matrix_test+0xac0>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 22)
            cur = C[i * N + j];
    26f8:	87ae                	c.mv	a5,a1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 28)
        for (j = 0; j < N; j++)
    26fa:	e80c13e3          	bnez	s8,2580 <matrix_test+0xa94>
    26fe:	7482                	c.ldsp	s1,32(sp)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 30)
    2700:	00538633          	add	a2,t2,t0
    2704:	0cca075b          	lea.w	a4,s4,a2
    2708:	0180006f          	j	2720 <matrix_test+0xc34>
    270c:	2581                	c.addiw	a1,0
    270e:	00f5a5b3          	slt	a1,a1,a5
    2712:	96ae                	c.add	a3,a1
    2714:	0711                	c.addi	a4,4
    2716:	14fd                	c.addi	s1,-1
    2718:	00f005b3          	add	a1,zero,a5
    271c:	e60482e3          	beqz	s1,2580 <matrix_test+0xa94>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:247 (discriminator 20)
            cur = C[i * N + j];
    2720:	431c                	c.lw	a5,0(a4)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:248 (discriminator 14)
            tmp += cur;
    2722:	9d3d                	c.addw	a0,a5
    2724:	fead54e3          	bge	s10,a0,270c <matrix_test+0xc20>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:249 (discriminator 20)
            if (tmp > clipval)
    2728:	4501                	c.li	a0,0
    272a:	06a9                	c.addi	a3,10
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:245 (discriminator 30)
        for (j = 0; j < N; j++)
    272c:	0711                	c.addi	a4,4
    272e:	14fd                	c.addi	s1,-1
    2730:	85be                	c.mv	a1,a5
    2732:	f4fd                	c.bnez	s1,2720 <matrix_test+0xc34>
    2734:	e4dff06f          	j	2580 <matrix_test+0xa94>
matrix_test():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:155 (discriminator 2)
    crc = crc16(matrix_sum(N, C, clipval), crc);
    2738:	3c06b55b          	bfos	a0,a3,15,0
    273c:	85c2                	c.mv	a1,a6
    273e:	3a3010ef          	jal	ra,42e0 <crc16>
    2742:	62e2                	c.ldsp	t0,24(sp)
    2744:	4801                	c.li	a6,0
    2746:	4601                	c.li	a2,0
    2748:	8896                	c.mv	a7,t0
    274a:	a039                	c.j	2758 <matrix_test+0xc6c>
matrix_add_const():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:288 (discriminator 10)
    for (i = 0; i < N; i++)
    274c:	1168085b          	lea.b.ze	a6,a6,s6
    2750:	98de                	c.add	a7,s7
    2752:	0605                	c.addi	a2,1
    2754:	0b660c63          	beq	a2,s6,280c <matrix_test+0xd20>
    2758:	4701                	c.li	a4,0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:290 (discriminator 8)
        for (j = 0; j < N; j++)
    275a:	060a9763          	bnez	s5,27c8 <matrix_test+0xcdc>
    275e:	87c6                	c.mv	a5,a7
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:292 (discriminator 4)
            A[i * N + j] += val;
    2760:	00279583          	lh	a1,2(a5)
    2764:	00479683          	lh	a3,4(a5)
    2768:	00079483          	lh	s1,0(a5)
    276c:	419585b3          	sub	a1,a1,s9
    2770:	419686b3          	sub	a3,a3,s9
    2774:	00d79223          	sh	a3,4(a5)
    2778:	00e79683          	lh	a3,14(a5)
    277c:	00b79123          	sh	a1,2(a5)
    2780:	00c79583          	lh	a1,12(a5)
    2784:	419686b3          	sub	a3,a3,s9
    2788:	00679403          	lh	s0,6(a5)
    278c:	419585b3          	sub	a1,a1,s9
    2790:	00d79723          	sh	a3,14(a5)
    2794:	00a79683          	lh	a3,10(a5)
    2798:	00b79623          	sh	a1,12(a5)
    279c:	00879583          	lh	a1,8(a5)
    27a0:	41940433          	sub	s0,s0,s9
    27a4:	419484b3          	sub	s1,s1,s9
    27a8:	419686b3          	sub	a3,a3,s9
    27ac:	419585b3          	sub	a1,a1,s9
    27b0:	00879323          	sh	s0,6(a5)
    27b4:	00d79523          	sh	a3,10(a5)
    27b8:	00979023          	sh	s1,0(a5)
    27bc:	00b79423          	sh	a1,8(a5)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:290 (discriminator 10)
        for (j = 0; j < N; j++)
    27c0:	07c1                	c.addi	a5,16
    27c2:	0721                	c.addi	a4,8
    27c4:	f8e91ee3          	bne	s2,a4,2760 <matrix_test+0xc74>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:290 (discriminator 12)
    27c8:	f80c12e3          	bnez	s8,274c <matrix_test+0xc60>
    27cc:	7782                	c.ldsp	a5,32(sp)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:290 (discriminator 14)
    27ce:	010705b3          	add	a1,a4,a6
    27d2:	0ab2875b          	lea.h	a4,t0,a1
    27d6:	0001                	c.nop
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:292 (discriminator 6)
            A[i * N + j] += val;
    27d8:	00071583          	lh	a1,0(a4)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:290 (discriminator 14)
        for (j = 0; j < N; j++)
    27dc:	17fd                	c.addi	a5,-1
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:292 (discriminator 6)
            A[i * N + j] += val;
    27de:	419585b3          	sub	a1,a1,s9
    27e2:	00b71023          	sh	a1,0(a4)
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:290 (discriminator 14)
        for (j = 0; j < N; j++)
    27e6:	0709                	c.addi	a4,2
    27e8:	fbe5                	c.bnez	a5,27d8 <matrix_test+0xcec>
    27ea:	b78d                	c.j	274c <matrix_test+0xc60>
matrix_test():
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:140 (discriminator 2)
    crc = crc16(matrix_sum(N, C, clipval), crc);
    27ec:	4501                	c.li	a0,0
    27ee:	4581                	c.li	a1,0
    27f0:	2f1010ef          	jal	ra,42e0 <crc16>
    27f4:	85aa                	c.mv	a1,a0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:145 (discriminator 2)
    crc = crc16(matrix_sum(N, C, clipval), crc);
    27f6:	4501                	c.li	a0,0
    27f8:	2e9010ef          	jal	ra,42e0 <crc16>
    27fc:	85aa                	c.mv	a1,a0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:150 (discriminator 2)
    crc = crc16(matrix_sum(N, C, clipval), crc);
    27fe:	4501                	c.li	a0,0
    2800:	2e1010ef          	jal	ra,42e0 <crc16>
    2804:	85aa                	c.mv	a1,a0
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:155
    crc = crc16(matrix_sum(N, C, clipval), crc);
    2806:	4501                	c.li	a0,0
    2808:	2d9010ef          	jal	ra,42e0 <crc16>
/home/users3/rex603/automation/CoreMark-V5/demo/core_matrix.c:161
    return crc;
    280c:	7da2                	c.ldsp	s11,40(sp)
    280e:	7d42                	c.ldsp	s10,48(sp)
    2810:	7ce2                	c.ldsp	s9,56(sp)
    2812:	6c06                	c.ldsp	s8,64(sp)
    2814:	6ba6                	c.ldsp	s7,72(sp)
    2816:	6b46                	c.ldsp	s6,80(sp)
    2818:	6ae6                	c.ldsp	s5,88(sp)
    281a:	7a06                	c.ldsp	s4,96(sp)
    281c:	79a6                	c.ldsp	s3,104(sp)
    281e:	7946                	c.ldsp	s2,112(sp)
    2820:	74e6                	c.ldsp	s1,120(sp)
    2822:	640a                	c.ldsp	s0,128(sp)
    2824:	60aa                	c.ldsp	ra,136(sp)
    2826:	3c05355b          	bfos	a0,a0,15,0
    282a:	6149                	c.addi16sp	sp,144
    282c:	00008067          	ret
