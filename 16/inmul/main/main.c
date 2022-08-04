#include <stdio.h>
#include <stdint.h>

void
app_main(void) {
	uint32_t a=33, b=75, m;

	asm volatile (
		" lw a0,%1\n"		// a0 = a
		" lw a1,%2\n"		// a1 = b
		" mul t0,a0,a1\n"	// t0 = a0 * a1
		" sw t0,%0\n"		// m = t0
		: "=m" (m)		// Outputs
		: "m" (a), "m" (b)	// Inputs
		: "a0", "a1", "t0"	// Clobbers
	);

	printf("%u * %u => %u\n",a,b,m);
	fflush(stdout);
}
