#include <stdio.h>
#include <stdint.h>

#pragma GCC optimize("-O3")

extern uint64_t add64(uint64_t op1,uint64_t op2);

void
app_main(void) {
	volatile uint64_t x=0x7FFFFFFFF, y=0x3000011115, z;

	z = add64(x,y);
	printf("0x%016llX + 0x%016llX = 0x%016llX\n",x,y,z);
}
