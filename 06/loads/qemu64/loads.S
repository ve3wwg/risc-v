	.global	loadb,loadh,loadw,loadd

	.text
loadb:	lb	a0,byte		# Load a byte
	ret
loadh:	lh	a0,hword	# Load half word
	ret
loadw:	lw	a0,word		# Load a word
	ret
loadd:	ld	a0,dword	# Load double word
	ret			# return value in a0

	.data
byte:	.byte	1
hword:	.half	0xF509
word:	.word	0x0708090A
dword:	.dword	0xCCBBAA99887766
