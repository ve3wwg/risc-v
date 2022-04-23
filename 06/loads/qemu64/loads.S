	.global	loadb,loadh,loadw,loadd

	.text
loadb:	lb	a0,byte		# Load a byte
	ret
loadh:	lh	a0,hword	# Load half word
	ret
loadw:	lw	a0,word		# Load a word
	ret
loadd:	lw	a0,dword	# Load lower word of dword
	lw	a1,dword+4	# Load upper word of dword
	ret			# return value in a0

	.data
byte:	.byte	1
hword:	.half	0xF509
word:	.word	0x0708090A
dword:	.dword	0xCCBBAA99887766
