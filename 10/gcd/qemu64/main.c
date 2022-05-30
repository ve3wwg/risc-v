#include <stdio.h>
#include <stdint.h>

extern int64_t gcd64(int64_t a,int64_t b);

struct s_test {
	int64_t	a;
	int64_t	b;
};

int
main(int argc,char **argv) {
	static struct s_test const tests[] = {
		{ 12, 10 },
		{ 51, 21 },
		{ 31 * 3, 31 * 7 },
		{ 211*5, 211 },
		{ 0, 0 }
	};

	for ( unsigned ux=0; tests[ux].a && tests[ux].b; ++ux ) {
		int64_t g = gcd64(tests[ux].a,tests[ux].b);
		printf("gcd(%d,%d) => %d\n",
			tests[ux].a,tests[ux].b,g);
	}
	return 0;
}
