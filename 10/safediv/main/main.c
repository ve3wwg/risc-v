#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

extern int32_t safediv(
	int32_t divident,
	int32_t divisor,
	int32_t *remainder,
	bool *divbyzero,
	bool *overflow
);

struct s_div {
	int32_t dividend;
	int32_t divisor;
};

void
app_main(void) {
	static struct s_div const tests[] = {
		{ 23, 3 },
		{ -23, 3 },
		{ 46, 0 },
		{ 0x80000000, -2 },
		{ 0x80000000, -1 },
		{ 0x80000000, 15 },
		{ 0, 0 }
	};
		
	for ( unsigned ux=0; 
	  tests[ux].dividend || tests[ux].divisor;
	  ++ux ) {
		int32_t dividend = tests[ux].dividend;
		int32_t divisor = tests[ux].divisor;
		int32_t quotient, remainder;
		bool divbyzero, overflow;

		quotient = safediv(dividend,divisor,
			&remainder,&divbyzero,&overflow);

		printf("%d / %d => %d remainder %d; "
			"divbyzero=%d, overflow=%d\n",
			dividend, divisor, quotient, remainder,
			divbyzero, overflow);
	}
	printf("Done.\n");
}
