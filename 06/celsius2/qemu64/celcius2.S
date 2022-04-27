	.global	convtemp,temp_f10,temp_c10

	.text
convtemp:
	lui	t0,%hi(temp_f10)
	lw	t0,%lo(temp_f10)(t0)	# t0 = F * 10
	addi	t0,t0,-320		# t0 = (F * 10) - (32 * 10)
	li	t1,10			# t1 = 10
	mul	t0,t0,t1		# t0 *= 10
	li	t1,18			# t1 = 1.8 * 10
	div	t0,t0,t1		# t0 = F * 100 / 1.8 * 10
	lui	t1,%hi(temp_c10)
	sw	t0,%lo(temp_c10)(t1)	# t0 = Celsius * 10
	ret				
