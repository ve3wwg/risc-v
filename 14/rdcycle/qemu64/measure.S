	.global	measure
	.text

# extern unsigned measure(int mul)
#
# ARGUMENTS:
#	a0	When true, measure the mul instruction,
#		otherwise measure two shifts and one add.
# RETURNS:
#	a0	unsigned count of cycles

measure:
	beqz	a0,1f		# Branch if measuring by 10
	li	t5,10		# t5 = 10
	rdcycle	t1
	mul	a2,a0,t5	# a2 = a0 * 10
	rdcycle	t2
	sub	a0,t2,t1	# Difference in cycles
	ret

1:	rdcycle	t1
	sll	a2,a0,3		# a2 = a0 * 8
	sll	a1,a0,1		# a1 = a0 * 2
	add	a2,a2,a1	# a2 = a0 * 10
	rdcycle	t2
	sub	a0,t2,t1	# Difference in cycles
	ret

