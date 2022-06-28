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
#	a2	pointer to unsigned 'bits'
#
# RETURNS:
#	a0	unsigned value (extensions)
#

extensions:
	add	a6,a0,a1	# a6 = buf + buf_size
	csrr	t3,misa		# t3 = misa register
	li	t4,32		# t4 = 32
	blt	t3,x0,xlen64	# Branch if t3 negative
	j	setxl

xlen64:	li	t4,64		# t4 = 64
	slli	t2,t3,1		# t2 = t3 << 1
	blt	t2,x0,xlen128
	j	setxl

xlen128:
	li	t4,128		# t4 = 128
setxl:	sw	t4,0(a2)	# Return bits = xlen

#	Now return extensions

	mv	t0,a0		# t0 = buf ptr
	addi	a4,t4,-26	# a4 = xlen - 26
	li	a0,-1		# a0 = mask all 1's
	sll	a0,t3,a4	# a0 = t3 << (xlen - 26)
	srl	a0,a0,a4	# a0 >>= (xlen - 26)

	li	t1,'A'
	mv	t2,a0		# t2 = a0

loop:	bgeu	t0,a6,xit	# Branch if at end buf

	andi	t5,t2,1		# Bit set?
	beq	t5,x0,skip

	sb	t1,0(t0)	# Store char 
	addi	t0,t0,1		# ++buf ptr

skip:	addi	t1,t1,1		# ++t1
	srli	t2,t2,1		# t2 >>= 1
	bne	t2,x0,loop

	bgeu	t0,a6,xit	# Buf check
	sb	x0,0(t0)	# buf[x] = nul byte

xit:	ret	
	
