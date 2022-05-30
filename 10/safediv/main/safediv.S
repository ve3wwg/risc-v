	.global	safediv
	.text

# ARGUMENTS:
#	a0	signed dividend
#	a1	signed divisor
#	a2	pointer to remainder
#	a3	pointer to bool (div by zero)
#	a4	pointer to bool (overflow)
#
# RETURNS:
#	a0	quotient
#	remainder by pointer
#	div by zero flag by pointer
#	overflow flag by pointer
#

safediv:
	mv	t3,a0		# t3 = dividend
	mv	t4,a1		# t4 = divisor

	li	t5,0		# t5 = true when overflow
	li	t6,0		# t6 = true if divisor zero
	bnez	t4,nzero
	li	t6,1		# t6 = true (div by zero)

nzero:	div	a0,t3,t4	# a0 = dividend / divisor
	rem	a1,t3,t4	# a1 = dividend % divisor
	sw	a1,0(a2)	# Return remainder

	li	t2,-1
	bne	t4,t2,noovf	# Divisor != -1 => no overflow

	slli	t2,t2,31	# t2 now maximally -ve
	bne	t2,t3,noovf	# Branch if dividend not max -ve
	li	t5,1		# Else set overflow t5 = true

noovf:	sb	t5,0(a4)	# Return overflow flag
	sb	t6,0(a3)	# Return div by zero flag
	ret
