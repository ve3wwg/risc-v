	.global	uintstr
	.text

#	extern char *uintstr(unsigned u,char const *buf,unsigned buflen)
#
# ARGUMENTS:
#	a0	unsigned value to convert to text
#	a1	pointer to buf
#	a2	max length for buf
#
# RETURNS:
#	a0	pointer to buf

uintstr:
	add	t5,a1,a2	# ptr past end of buffer
	beqz	a2,smlbuf	# Branch if zero length buffer
	sb	x0,-1(t5)	# Put nul byte
	addi	t5,t5,-1	# --ep
	li	t1,10		# t1 = 10

loop:	div	t4,a0,t1	# t4 = a0 / 10
	rem	t3,a0,t1	# t3 = a0 % 10
	mv	a0,t4		# now a0 /= 10
	addi	t3,t3,'0'	# Make ascii digit
	ble	t5,a1,smlbuf	# Branch if past start of buf
	addi	t5,t5,-1	# --ep
	sb	t3,0(t5)	# *ep = char
	bnez	a0,loop

smlbuf:	mv	a0,t5		# Return addr of first char
	ret
