#include <stdio.h>
#include <stdint.h>

extern uint64_t measure();

int
main(int argc,char **argv) {
	uint64_t cycles;

	cycles = measure();

	printf("cycles = %lu (0x%08lX)\n",cycles,cycles);
	return 0;
}
