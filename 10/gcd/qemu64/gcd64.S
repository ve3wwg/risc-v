	.global	gcd64
	.text

# ARGUMENTS:
#	a0	Number a
#	a1	Number b
#
# RETURNS:
#	a0	Returned GCD(a,b)

gcd64:	bge	a0,a1,1f	# Branch if a >= b

#	swap a0 and a1

	mv	t0,a0
	mv	a0,a1
	mv	a1,t0

1:	beqz	a0,retb		# If a == 0 return b
	beqz	a1,reta		# If b == 0 return a

#	Compute r such that a = b x q + r

	rem	t1,a0,a1	# t1 (r) = a % b

#	GCD(b,r)

	mv	a0,a1		# a = b
	mv	a1,t1		# b = r
	j	gcd64

retb:	mv a0,a1		# Return b
reta:	ret
