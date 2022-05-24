	.global	rotate_left
	.text

rotate_left:
	sltz	t0,a0		# t0=1 if bit 32=1
	slli	a0,a0,1		# a0 <<= 1
	or	a0,a0,t0	# Or in shifted out bit
	ret
