	.global	strncpy32
	.text

#	extern char *strncpy32(char *dest,char const *src,size_t n);
#
# ARGUMENTS:
#	a0	char *dest (also returned)
#	a1	char const *src
#	a2	size_t n
#
# RETURNS:
#	a0	char *dest

strncpy32:
	mv	t6,a0		# t6 = dest ptr
	add	t5,a0,a2	# Points past end of dest buf

loop:	bge	t6,t5,end	# Branch if we passed dest buf end
	lbu	t4,0(a1)	# Load byte from source
	addi	a1,a1,1		# ++src
	beqz	t4,nul		# Branch if null byte
	sb	t4,0(t6)	# Copy byte to dest
	addi	t6,t6,1		# ++dest
	j	loop

nul:	sb	x0,0(t6)	# Store null byte
end:	ret
