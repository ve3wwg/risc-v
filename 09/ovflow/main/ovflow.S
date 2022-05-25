	.global	s32ovf
	.text

# ARGUMENTS:
#	a0	int32_t operand 1
#	a1	int32_t operand 2
#
# RETURNS:
#	a0	flag:
#		0 = no overflow
#		1 = overflow
#
s32ovf:	slti	t1,a0,0		# t1 = a0 < 0 ? 1 : 0
	slti	t2,a1,0		# t2 = a1 < 0 ? 1 : 0
	bne	t1,t2,noovfl	# Signs differ: no overflow

#	Signs equal

	add	t0,a0,a1	# t0 = a0 + a1 (sum)
	slti	t0,t0,0		# t0 = t0 < 0 ? 1 : 0
	bne	t0,t1,ovfl	# Branch if overflowed

noovfl:	li	a0,0		# No overflow
	ret

ovfl:	li	a0,1		# Overflow
	ret
