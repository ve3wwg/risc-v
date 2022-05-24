#include <stdio.h>
#include <stdint.h>

#pragma GCC optimize("-O3")

extern uint32_t rotate_left(uint32_t bits); // Assembler routine

void
app_main(void) {
	uint32_t bits = 0xBEEF, rol;
		
	for ( unsigned ux=0; ux<32; ++ux, bits = rol ) {
		rol = rotate_left(bits);
		printf("rotate_left(0x%08X) returned 0x%08X\n",
			bits,rol);
	}
	printf("Done.\n");
}
