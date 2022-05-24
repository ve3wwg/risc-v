#include <stdio.h>
#include <stdint.h>

#pragma GCC optimize("-O3")

extern int odd_parity(int64_t bits); // Assembler routine

int
main(int argc,char **argv) {
	static int64_t tests[] = { 0, 1, 2, 3, 5, 7, 9, 15, 
	  	31, 63, 64, 127, 1023, 1024, 2047, 2048,
	  	65535, 65536, 0xF0F0900000000001ll, 999999 };
	int64_t bits;
	int oddpar;
		
	for ( unsigned ux=0; tests[ux] != 999999ll; ++ux ) {
		bits = tests[ux];
		oddpar = odd_parity(bits);
		printf("odd_parity(%20lld) (0x%016llX) returned %d\n",
			bits, bits, oddpar);
	}
	printf("Done.\n");
}
