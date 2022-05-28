	.global	addi64,neg64
	.text

# ARGUMENTS:
# 	a0	int64_t operand 1
# 	a1	int64_t operand 2
#	a2	ptr to bool_t
# RETURNS:
#	a0	int64_t sum
# 	bool_t return values:
#		0	no overflow
#		1	overflow

addi64:
	li	t5,0		# Flag = false
	slti	t2,a0,0		# t2 = a0 < 0 ? 1 : 0 (sign 1)
	slti	t3,a1,0		# t3 = a1 < 0 ? 1 : 0 (sign 2)
	add	a0,a0,a1	# Sum opr 1 + opr 2
	bne	t2,t3,doret	# No overflow possible: signs differ

#	Signs equal: test result sign

	slti	t3,a0,0		# t3 = sum < 0 ? 1 : 0
	beq	t3,t2,doret	# Signs equal: no overflow

#	Overflowed

	li	t5,1		# flag = true
doret:	sb	t5,0(a2) 	# Update bool value by ptr
	ret

# ARGUMENTS:
# 	a0	int64_t operand 1
#	a1	ptr to bool_t
# RETURNS:
#	a0	int64_t sum
# 	bool_t return values:
#		0	no overflow
#		1	overflow

neg64:	li	t5,0		# Flag = false
	li	t4,1		# t4 = 1
	slli	t3,t4,63	# t3 = max negative value
	bne	a0,t3,noprob	# Branch if arg is not maximally negative
	sb	t4,0(a1)	# *ptr = true (overflow)	
	ret			# a0 remains the same value

noprob:	neg	a0,a0		# Negate argument (a0)
	sb	t5,0(a1)	# *ptr = false (no overflow)
	ret
