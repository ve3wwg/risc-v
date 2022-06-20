	.global		foo
	.text

foo:
#if __riscv_xlen == 32
	mulh  t2,a0,a1	# high order a0 * a1 into t2
	mul   a0,a0,a1	# low order a0 * a1
	mv    a1,t2	# a1 = high order a0 * a1
#elif __riscv_xlen == 64
	mul  a0,a0,a1	# return a0 * a1
#else
#error The budgie died: wrong RISC-V environment
#endif
	ret
