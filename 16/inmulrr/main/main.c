#include <stdio.h>
#include <stdint.h>

// #pragma GCC optimize ("-O3")

void
app_main(void) {
	uint32_t a=33, b=75, m;

	asm volatile (
		" mul %[m],%[a],%[b]\n"		// m = a * b
		: [m] "=r" (m)			// Outputs
		: [a] "r" (a), [b] "r" (b) 	// Inputs
	);	// No clobbers

	printf("%u * %u => %u\n",a,b,m);
	fflush(stdout);
}
