#include <stdio.h>
#include <stdint.h>

#pragma GCC optimize("-O3")

extern uint64_t rotate_left(uint64_t bits); // Assembler routine

void
main(int argc,char **argv) {
	uint64_t bits = 0xBEEF, rol;
		
	for ( unsigned ux=0; ux<64; ++ux, bits = rol ) {
		rol = rotate_left(bits);
		printf("rotate_left(0x%016X) returned 0x%016X\n",
			bits,rol);
	}
	return 0;
}
