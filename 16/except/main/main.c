#include <stdio.h>
#include <stdint.h>

void
app_main(void) {
	uint32_t a=315, b=75, r=0;

	asm volatile goto (
		" lw a1,%[b]\n"			// a1 = b
		" beqz a1,%l[excep]\n"		// Jump if b=zero
		: /* no outputs allowed for goto */
		: [b] "m" (b)		 	// Inputs
		: "a1"		 	  	// Clobbers
		: excep
	);

	asm volatile (
		" lw a0,%[a]\n"			// a0 = a
		" lw a1,%[b]\n"			// a1 = b
		" div a0,a0,a1\n"		// a0 /= a1
		" sw  a0,%[r]\n"		// r = result
		: [r] "=m" (r)			// Outputs
		: [a] "m" (a), [b] "m" (b) 	// Inputs
		: "a0", "a1"		   	// Clobbers
	);

	printf("%u / %u => %u\n",a,b,r);
	fflush(stdout);
	return;

excep:
	printf("Division by zero!\n");
	fflush(stdout);
}
