	.global	extensions
	.text

# extern unsigned extensions(
#	char *buf,
#	unsigned bufsiz,
#	unsigned *bits);
#
# ARGUMENTS:
#	a0	char const *buf (text to return)
#	a1	unsigned buf size (bytes)
#	a2	pointer to unsigned int 'bits'
#
# RETURNS:
#	a0	unsigned value (extension bits)

extensions:
	mv	t6,a0		# t6 = buf ptr
	add	a6,t6,a1	# a6 = buf + buf_size
	csrr	t3,misa		# t3 = misa register
	li	t2,1		# t2 = 1
	sll	t2,t2,8		# t2 <<= 8 (Mask for 'I')	
	and	t4,t3,t2	# t4 = t3 & t2
	beq	x0,t4,3f	# Branch if not 'I'
	li	t1,'I'		# t1 = ascii 'I'
	jal	t0,putch	# Stuff 'I' into buf
	xor	t3,t3,t4	# Clear 'I' bit
#
#	Return 32/64/128 bits
#
3:	li	t4,32		# t4 = 32
	blt	t3,x0,7f	# Branch if t3 negative
	j	8f
7:	li	t4,64		# t4 = 64
	slli	t2,t3,1		# t2 = t3 << 1
	blt	t2,x0,9f
	j	8f
9:	li	t4,128		# t4 = 128
8:	sw	t4,0(a2)	# Return bits = xlen
#
#	Now mask out extensions only (exclude 'I')
#
	addi	a4,t4,-26	# a4 = xlen - 26
	li	a0,-1		# a0 = mask all 1's
	sll	a0,t3,a4	# a0 = t3 << (xlen - 26)
	srl	a0,a0,a4	# a0 >>= (xlen - 26)
#
#	Populate buf with extensions
#
	li	t1,'A'
	mv	t2,a0		# t2 = a0
loop:	andi	t5,t2,1		# Bit set?
	beq	t5,x0,4f	# Branch if zero bit
	jal	t0,putch	# Put character t1
4:	addi	t1,t1,1		# ++t1 (ascii char)
	srli	t2,t2,1		# t2 >>= 1
	bne	t2,x0,loop	# Loop until all bits
	li	t1,0		# Load nul byte
	jal	t0,putch	# Put nul byte
xit:	ret	
#
#	Internal routine: returns via t0
#	Put char in t1 to buffer pointed by t6
#
putch:	bgeu	t6,a6,5f	# If at end of buf...
	sb	t1,0(t6)	# else put byte
	addi	t6,t6,1		# ++ptr in t6
5:	jr	t0		# Return to caller
