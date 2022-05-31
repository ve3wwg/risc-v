	.global	ufact64
	.text

# extern int64_t ufact64(int32_t x)
#
# ARGUMENTS:
#	a0	uint32_t x
#
# RETURNS:
#	a0	uint32_t low order factorial x!
#	a1	uint32_t high order factorial x!

ufact32:li	t1,1		# t1 = 1
	mv	t0,a0

1:	addi	t0,t0,-1	# t0 = a0 - 1
	ble	t0,t1,2f	# Branch if t0 <= 1
	mulh	a1,a0,t0	# a1 *= t0 (high order)
	mul	a0,a0,t0	# a0 *= t0 (low order)
	j	1b		# Loop until t1 <= 1

2:	ret
