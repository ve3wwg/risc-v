	.global	ufact32
	.text

# ARGUMENTS:
#	a0	uint32_t x
#
# RETURNS:
#	a0	uint32_t factorial x!
#

ufact32:li	t1,1		# t1 = 1
	mv	t0,a0

1:	addi	t0,t0,-1	# t0 = a0 - 1
	ble	t0,t1,2f	# Branch if t0 <= 1
	mul	a0,a0,t0	# a0 *= t0
	j	1b		# Loop until t1 <= 1

2:	ret
