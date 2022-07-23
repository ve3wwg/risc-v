#include <stdio.h>
#include <stdint.h>

extern uint32_t measure(int mul);

void
app_main(void) {
	uint32_t cycles;

	for ( int x=0; x<10; ++x ) {
		cycles = measure(1);
		printf("muliply cycles = %u\n",cycles);
		cycles = measure(0);
		printf("shift   cycles = %u\n",cycles);
	}
	fflush(stdout);
}
