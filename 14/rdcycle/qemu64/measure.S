	.global	measure
	.text

# extern unsigned measure()
#
# ARGUMENTS:
#	none
#
# RETURNS:
#	a0	unsigned count of cycles

measure:
	rdcycle	t1
	nop
	rdcycle	t2
	sub	a0,t2,t1
	ret
