	.global	ncr 	# C(n,r) calculation
	.text

# ARGUMENTS:
#	a0	uint64_t n of C(n,r)
#	a1	uint64_t r of C(n,r)
#
# RETURNS:
#	a0	uint64_t C(n,r) = n! / (r! * (n - r)!)
#
ncr:	mv	t5,a0		# t5 = n
	mv	t4,a1		# t4 = r
	sub	t6,t5,t4	# t6 = (n - r)

	# a0 still has n
	jalr	t0,fact		# a0 = n!
	mv	t5,a0		# t5 = n!

	mv	a0,t4
	jalr	t0,fact
	mv	t4,a0		# t4 = r!

	mv	a0,t6
	jalr	t0,fact
	mv	t6,a0		# t6 = (n - r)!

	mul	t3,t5,t6	# t3 = r! * (n-r)!
	div	a0,t5,t3	# a0 = n! / t3
	ret

fact:	li	t1,1		# t1 = 1
	mv	t2,a0

1:	addi	t2,t2,-1	# t2 = a0 - 1
	ble	t2,t1,2f	# Branch if t2 <= 1
	mul	a0,a0,t2	# a0 *= t2
	j	1b		# Loop until t1 <= 1

2:	ret	t0

