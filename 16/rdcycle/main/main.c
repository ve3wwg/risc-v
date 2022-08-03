#include <stdio.h>
#include <stdint.h>

extern uint32_t measure(int mul);

void
app_main(void) {
	uint32_t cycles;
	uint32_t ninety5;

	asm volatile (
		" li t1,95\n"
		" sw t1,%0\n"
		" sw x0,%1\n"
		: "=m" (ninety5), "=m" (cycles)
		:
	);

	printf("ninety5 = %u, cycles = %u\n",ninety5,cycles);

	for ( int x=0; x<10; ++x ) {
		cycles = measure(1);
		printf("muliply cycles = %u\n",cycles);
		cycles = measure(0);
		printf("shift   cycles = %u\n",cycles);
	}
	fflush(stdout);
}
