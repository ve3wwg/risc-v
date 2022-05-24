	.global	rotate_right
	.text

rotate_right:
	andi	a1,a0,1		# a1=1 if bit 0 of a0 is true
	slli	a1,a1,31	# Set bit 31 of a1 if bit=1
	srli	a0,a0,1		# a0 >>= 1 (logical)
	or	a0,a0,a1	# or in sign bit	
	ret
