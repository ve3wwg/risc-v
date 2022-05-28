#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

extern int64_t addi64(int64_t op1,int64_t op2,bool *pbool);
extern int64_t neg64(int64_t op1,bool *pbool);

static void
report(int64_t op1,int64_t op2) {
	bool overflow;
	int64_t r;

	r = addi64(op1,op2,&overflow);
	printf("0x%016llX + 0x%016llX = 0x%016llX, overflow=%d\n",
		op1,op2,r,overflow);
}

void
negtest(int64_t op) {
	bool overflow;
	int64_t r;

	r = neg64(op,&overflow);
	printf("- 0x%016llX = 0x%016llX, overflow=%d\n",
		op,r,overflow);
	
}

int
main(int argc,char **argv) {
	int64_t x, y;
	int64_t r;

	report(0x4EEEEEEE99999999ll,0x2AAAAAAAABBBBBBBll);
	report(0x4EEEEEEE99999999ll,0x7AAAAAAAABBBBBBBll);

	negtest(-45609);
	negtest(45609);
	negtest((1ll << 63) + 1);
	negtest(1ll << 63);

	return 0;
}
