#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

extern bool ovf64_flag;
extern int64_t addi64(int64_t op1,int64_t op2);

static void
report(int64_t op1,int64_t op2) {
	int64_t r;

	r = addi64(op1,op2);
	printf("0x%016llX + 0x%016llX = %016llX, ovf64_flag=%d\n",
		op1,op2,r,(int)ovf64_flag);
}

int
main(int argc,char **argv) {
	int64_t x, y;
	int64_t r;

	report(0x4EEEEEEE99999999ll,0x2AAAAAAAABBBBBBBll);
	report(0x4EEEEEEE99999999ll,0x7AAAAAAAABBBBBBBll);

	return 0;
}
