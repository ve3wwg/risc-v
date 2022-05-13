	.global	odd_parity
	.text
odd_parity:
	li	t0,0		# t0 = 0

loop:	beq	a0,zero,done	# Branch if a0 == 0
	sltz	t1,a0		# t1 = a0 < 0 ? 1 : 0
	xor	t0,t0,t1	# t0 = t0 ^ t1
	slli	a0,a0,1		# a0 <<= 1
	j	loop		# Repeat loop

done:	mv	a0,t0		# a0 = count in t0
	ret
