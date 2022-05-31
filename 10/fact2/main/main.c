#include <stdio.h>
#include <stdint.h>

extern uint64_t ufact64(uint32_t x);

void
app_main(void) {
		
	for ( unsigned ux=0; ux<=18; ++ux ) {
		uint64_t f = ufact64(ux);

		printf("%2u ! => %llu 0x%016llX\n",ux,f,f);
	}
	printf("Done.\n");
}
