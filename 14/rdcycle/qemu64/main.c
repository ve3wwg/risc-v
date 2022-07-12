#include <stdio.h>
#include <stdint.h>

extern uint64_t measure(int mul);

int
main(int argc,char **argv) {
	uint64_t cycles;

	for ( int x=0; x<10; ++x ) {
		cycles = measure(1);
		printf("muliply cycles = %lu\n",cycles);
		cycles = measure(0);
		printf("mul10 cycles   = %lu\n",cycles);
	}
	return 0;
}
