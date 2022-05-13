	.global	bigcall

	.struct	0
svfp:	.space	4		# Save register fp/s0
svra:	.space	4		# Save register ra
var1:	.space	4		# Sample stack variable
	.balign	8		# Make sz mod 8
sz	=	. - svfp

	.struct	0
sixpt2:	.space	4		# High order arg 6 (int64)
seven:	.space	4		# Arg 7 (int32)
eight:	.space	8		# Arg 8 (int64)
nine:	.space	4		# Arg 9 (int32)

	.text
bigcall:
	addi	sp,sp,-sz	# Set sp for stack frame
	sw	fp,svfp(sp)	# Save fp/s0
	sw	ra,svra(sp)	# Save ra
	addi	fp,sp,+sz	# Set fp = original sp

	add	a0,a0,a1	# Add low order arg2 (int64) to arg1
	add	a0,a0,a3	# Add arg3 to arg1
	add	a0,a0,a4	# Add low order arg4 (int64) to arg1
	add	a0,a0,a6	# Add arg5 to arg1
	add	a0,a0,a7	# Add low order arg6 (int64) to arg1

	lw	t0,seven(fp)	# Load arg7
	add	a0,a0,t0	# Add arg7 to arg1

	lw	t0,eight(fp)	# Load arg8 (low order of int64)
	add	a0,a0,t0	# a0 += arg8

	lw	t0,nine(fp)	# Load arg9
	add	a0,a0,t0	# Sum is return value

	sw	x0,var1(sp)	# Zero sample stack variable

	lw	ra,svra(sp)	# Restore ra
	lw	fp,svfp(sp)	# Restore fp/s0
	addi	sp,sp,+sz	# Restore sp
	ret
