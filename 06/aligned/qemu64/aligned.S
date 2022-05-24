	.global	loadb,loadh,loadw,loadd

	.text
loadb:	lb	a0,byte		# Load a byte
	ret
loadh:	lh	a0,hword	# Load half word
	ret
loadw:	lw	a0,word		# Load a word
	ret
loadd:	ld	a0,dword	# Load double word
	ret

	.data
byte:	.byte	1
	.balign	2
hword:	.half	0xF509
	.balign	4
word:	.word	0x0708090A
	.balign 8
dword:	.dword	0xCCBBAA99887766
