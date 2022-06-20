	.global	struint
	.text

#	extern unsigned struint(char const *text,bool *ok)
#
# ARGUMENTS:
#	a0	char const *text (text to convert)
#	a1	pointer to bool
#
# RETURNS:
#	a0	unsigned value (when ok is true)
#	ok:
#		true, conversion successful
#		false, conversion failed

struint:
	mv	t6,a0		# t6 = ptr to test
	li	a0,0		# Accumulator for uint
	li	t2,0		# Digit count
	li	t4,'0'
	li	t3,'9'
	li	t1,' '
	li	t0,10

loop:	lbu	t5,0(t6)	# Load text char
	beqz	t5,nulbyt	# Branch if null byte
	beq	t5,t1,skip	# Skip white space
	bgt	t5,t3,fail	# char > '9'?
	blt	t5,t4,fail	# char < '0'?	
	andi	t5,t5,0x0F	# Mask out 0x00 to 0x09
#ifdef __riscv_mul
	mul	a0,a0,t0	# a0 *= 10
#else
	sll     a6,a0,3		# a6 = a0 * 8
	sll     a0,a0,1		# a0 *= 2
	add     a0,a0,a6	# a0 += a6
#endif
	add	a0,a0,t5	# a0 += t5
	addi	t2,t2,1		# Bump digit count
skip:	addi	t6,t6,1		# ++text ptr
	j	loop

nulbyt:	beqz	t2,fail		# Fail if no digits
	li	t0,1
	sb	t0,0(a1)	# ok = true
	ret

fail:	li	t0,0
exit:	sb	t0,0(a1)	# ok = false
	ret
