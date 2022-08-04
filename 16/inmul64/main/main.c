#include <stdio.h>
#include <stdint.h>

void
app_main(void) {
	uint32_t a=9300000, b=7500000;
	union {
		uint64_t m64;
		uint32_t m32[2];
	} u;

	asm volatile (
		" lw a0,%[a]\n"			// a0 = a
		" lw a1,%[b]\n"			// a1 = b
		" mulh t1,a0,a1\n"		// t1 = high a0 * a1
		" mul t0,a0,a1\n"		// t0 = low a0 * a1
		" sw t0,%[low]\n"		// m = t0 (low word)
		" sw t1,%[hi]\n"		// m = t1 (high word)
		: [low] "=m" (u.m32[0]),	// Output: low
		  [hi] "=m" (u.m32[1]) 		// high
		: [a] "m" (a), [b] "m" (b) 	// Inputs
		: "a0", "a1", "t0", "t1"   	// Clobbers
	);

	printf("%u * %u => %llu\n",a,b,u.m64);
	fflush(stdout);
}
