	.global	ones
	.text
ones:	mv	t0,zero		# t0 = 0

loop:	beq	a0,zero,done	# Branch if a0 == 0
	bge	a0,zero,shift	# Skip next if sign is +
	addi	t0,t0,1		# t0 += 1
shift:	slli	a0,a0,1		# a0 <<= 1
	j	loop		# Repeat loop

done:	mv	a0,t0		# a0 = count in t0
	ret
