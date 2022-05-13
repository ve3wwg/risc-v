#include <stdio.h>
#include <stdint.h>

#pragma GCC optimize("-O3")

extern int ones(int bits);	// Assembler routine

static int c_ones(int bits) {
	int count = 0;

	for ( ; bits != 0; bits <<= 1 ) {
		if ( bits < 0 )
			++count;
	}
	return count;
}

void
app_main(void) {
	static int tests[] = { 0, 1, 2, 3, 5, 7, 9, 15, 
	  	31, 63, 64, 127, 1023, 1024, 2047, 2048,
		9999 };
	int bcount, ccount, bits;
		
	for ( unsigned ux=0; tests[ux] < 9999; ++ux ) {
		bits = tests[ux];
		bcount = ones(bits);
		printf("ones(%4d) (0x%04X) returned %d\n",
			bits, bits,
			bcount);
		ccount = c_ones(bits);
		if ( ccount != bcount )
			printf("c_ones(%4d) did not agree with %d!\n",
				ccount,bcount);
	}
	printf("Done.\n");
}
