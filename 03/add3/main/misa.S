	.global	rd_misa

rd_misa:
	csrr	a0,misa
	ret
