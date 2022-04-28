	.global	callme

	.text
callme:	li	a0,13		# a0 = 13
	jal	t1,intern	# Call internal
retn:	jr	ra
	ret

intern:	li	a0,7		# a0 = 7 (success rc)
	jr	t1		# Return to retn
