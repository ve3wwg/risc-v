#	The floating-point version of conftemp (fconvtemp)
	.global	fconvtemp
	.text

	.equ	rtz,0x1			# Round to zero
	.equ	rmm,0x4			# Round to Nearest
	.equ	dyn,0x7			# Dynamic rounding mode
#
#	Macro to save current fscr status to register 'save',
#	and set the default rounding mode to 'round' (round to
#	nearest, by default), and clear exceptions:
#
	.macro	fpinit save=t2 round=0x4
#if __riscv_flen > 0
	frcsr	\save			# save = original fcsr
	fsrmi	x0,\round		# Set rnd mode to RMM
	fsflagsi x0,0			# Clear exceptions
#else
#error	No RISC-V hardware floating point support
#endif
	.endm

#
#	extern double fconvtemp(double fahrenheit,unsigned *pflags)
#
# ARGUMENTS:
#	fa0	temperature in Fahrenheit
#	a0	pointer to int to return flags
#
# RETURNS:
#	fa0	temperature in Celsius
#	flags through ptr in a0

fconvtemp:
	fpinit	save=a7 round=rmm
	la	t4,f18
	fld	ft0,0(t4)		# ft0 = 1.8
	addi	t0,x0,32		# t0 = 32
	fcvt.d.lu ft1,t0,rtz		# ft1 = 32.0

conv:	fsub.d	fa0,fa0,ft1,rtz		# fa0 -= 32.0
	fdiv.d	fa0,fa0,ft0,rmm		# fa0 /= 1.8

	frflags	t0			# t0 = fcsr.flags
	sw	t0,0(a0)		# Store fcsr.flags

	fscsr	x0,a7			# Restore fscr
	ret	

	.section .rodata
f18:	.double	1.8
