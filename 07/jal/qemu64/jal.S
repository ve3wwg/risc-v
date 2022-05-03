	.global	callme

	.text
callme:	li	a0,1		# a0 = 1
	call	t0,intern	# Call internal
	ret

intern:	addi	a0,a0,2		# a0 += 2
	jr	t0		# Return to retn
