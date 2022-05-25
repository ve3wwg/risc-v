#include <stdio.h>
#include <stdint.h>

#pragma GCC optimize("-O3")

extern int32_t s32ovf(int32_t op1,int32_t op2);

static void
report(int32_t x,int32_t y) {
	int z;

	z = s32ovf(x,y);
	printf("0x%08X (%d) + 0x%08X (%d) = 0x%08X (%d): %soverflow\n",
		x,x,y,y,x+y,x+y,z?"":"no ");
}

void
app_main(void) {

	report(0x7FFFFFFE,1);
	report(0x7FFFFFFE,46);
	report(-3,46);
	report(-3,0x80000000);
}
