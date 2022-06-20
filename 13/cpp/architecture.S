	.global		foo
	.text

#ifndef __riscv
#error	This is not a RISC-V architecture!
#endif
foo:	ret
