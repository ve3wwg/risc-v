	.global	addi64,ovf64_flag
	.text

# ARGUMENTS:
# 	a0	int64_t operand 1
# 	a1	int64_t operand 2
# RETURNS:
#	a0	int64_t sum
# 	ovf64_flag: (extern bool_t)
#		0	no overflow
#		1	overflow

addi64:
	lui	t6,%hi(ovf64_flag)
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
doret:	sb	t5,%lo(ovf64_flag)(t6) # Indicate overflow
	ret

	.data
ovf64_flag:
	.byte	1
