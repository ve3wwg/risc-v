#include <stdio.h>
#include <stdint.h>

extern uint64_t nCr(int64_t n,int64_t r);

struct s_test {
	uint64_t	n;
	uint64_t	r;
};

int
main(int argc,char **argv) {
	static struct s_test const tests[] = {
		{ 3, 2 }, 	// 3
		{ 4, 3 },	// 4
		{ 9, 3 },	// 84
		{ 13, 7 },	// 1716
		{ 0, 0 }
	};
	
	for ( unsigned ux=0; tests[ux].n != 0; ++ux ) {
		uint64_t ncr = nCr(tests[ux].n,tests[ux].r);
		printf("C(n=%lu,r=%lu) => %lu\n",
			tests[ux].n,
			tests[ux].r,
			ncr);
	}

	return 0;
}
