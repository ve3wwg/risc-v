	.global	cgoto
	.text

#	Computed goto example:
#	extern int cgoto(unsigned func,int a,int b);
#
# ARGUMENTS:
#	a0	function
#	a1	int a
#	a2	int b
#
# RETURNS:
#	a0	result

cgoto:	li	t6,4
	bgt	a0,t6,null	# Branch and return if > 4
	sll	a0,a0,2		# Turn into a byte address
	la	t5,table	# Establish t5 as table address
	add	t4,a0,t5	# Address table entry
	lw	t4,0(t4)	# Load routine address
	jr	t4		# Jump to code

add:	add	a0,a1,a2
	ret
sub:	sub	a0,a1,a2
	ret
mul:	mul	a0,a1,a2
	ret
div:	div	a0,a1,a2
	ret
rem:	rem	a0,a1,a2
	ret

null:	li	a0,-1		# Bad function
	ret

table:	.word	add
	.word	sub
	.word	mul
	.word	div
	.word	rem
