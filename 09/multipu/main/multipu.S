	.global	add64
	.text

# ARGUMENTS:
#	a0, a1	uint64_t operand 1
#	a2, a3	uint64_t operand 2
#
# RETURNS:
#	a0, a1	uint64_t sum
#
add64:	add	a0,a0,a2	# Add low order 32 bits
	sltu	a7,a0,a2	# a7 = a0 < a2 ? 1 : 0
	add	a1,a1,a3	# Add high order 32 bits
	add	a1,a1,a7	# Add carry
	ret
