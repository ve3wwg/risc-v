	.global	strlen32
	.text

#	extern int strlen(char const *s)
#
# ARGUMENTS:
#	a0	Pointer to string
#
# RETURNS:
#	a0 (int) string length

strlen32:
	mv	t0,a0		# t0 = char const *ptr
	li	a0,0		# Zero strlen

loop:	lb	t1,0(t0)	# t1 = *ptr
	beqz	t1,end		# Branch if Null byte
	addi	a0,a0,1		# Increment strlen
	addi	t0,t0,1		# ++ptr
	j	loop

end:	ret
