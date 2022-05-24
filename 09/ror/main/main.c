#include <stdio.h>
#include <stdint.h>

#pragma GCC optimize("-O3")

extern uint32_t rotate_right(uint32_t bits); // Assembler routine

void
app_main(void) {
	uint32_t bits = 0xBEEF, ror;
		
	for ( unsigned ux=0; ux<32; ++ux, bits = ror ) {
		ror = rotate_right(bits);
		printf("rotate_right(0x%08X) returned 0x%08X\n",
			bits,ror);
	}
	printf("Done.\n");
}
