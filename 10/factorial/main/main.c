#include <stdio.h>
#include <stdint.h>

extern uint32_t ufact32(uint32_t x);

void
app_main(void) {
		
	for ( unsigned ux=0; ux<=12; ++ux ) {
		uint32_t f = ufact32(ux);

		printf("%2u ! => %u 0x%08X\n",ux,f,f);
	}
	printf("Done.\n");
}
