	.global	identm
	.text

#	extern void identm(void *matrix,unsigned n)
#
# ARGUMENTS:
#	a0	Pointer to int matrix[n][n]
#	a1	unsigned n

identm:	mul	t1,a1,a1	# t1 = total elements
	li	t0,4		# sizeof(int) = 4
	mul	t1,t1,t0	# t1 *= sizeof(int)
	add	t2,a0,t1	# Ptr of end of matrix
	li	t5,1		# t5 = 1

put1:	sw	t5,0(a0)	# *ptr = 1
	addi	a0,a0,4		# ptr += 4

	mv	t3,a1		# t3 = n
loop:	bge	a0,t2,end	# At end of matrix?
	sw	x0,0(a0)	# *matrix + ptr = 0
	addi	a0,a0,4		# ptr += 4
	addi	t3,t3,-1	# --t3
	bnez	t3,loop
	blt	a0,t2,put1	# Loop again if not at  end

end:	ret
