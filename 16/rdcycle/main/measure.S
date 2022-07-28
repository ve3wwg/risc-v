	.global	measure
	.text

	.equ	mpccr,0x7E2

# extern unsigned measure(bool mul)
#
# ARGUMENTS:
#	a0	true = use mul else shift
#
# RETURNS:
#	a0	unsigned count of cycles

measure:
	li	a1,99		# Some number
	beqz	a0,1f		# If mul is false, jump to 1
	li	a2,10		# ten
#
#	Multiply by ten with mul opcode
#
	csrr	t1,mpccr
	mul	t0,a1,a2	# 99 * 10
	csrr	t3,mpccr
	j	xit
#
#	Multiply by ten without mul opcode
#
1:	csrr	t1,mpccr
	sll	a2,a1,3		# a2 = a1 * 8
	sll	a1,a1,1		# a1 *= 2
	add	a0,a2,a1	# a0 = a1 * 10
	csrr	t3,mpccr

xit:	sub	a0,t3,t1
	ret
