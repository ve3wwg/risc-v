#include <stdio.h>
#include <stdint.h>

#pragma GCC optimize("-O3")

extern int odd_parity(int bits); // Assembler routine

void
app_main(void) {
	static int tests[] = { 0, 1, 2, 3, 5, 7, 9, 15, 
	  	31, 63, 64, 127, 1023, 1024, 2047, 2048,
		9999 };
	int oddpar, bits;
		
	for ( unsigned ux=0; tests[ux] < 9999; ++ux ) {
		bits = tests[ux];
		oddpar = odd_parity(bits);
		printf("odd_parity(%4d) (0x%04X) returned %d\n",
			bits, bits, oddpar);
	}
	printf("Done.\n");
}
