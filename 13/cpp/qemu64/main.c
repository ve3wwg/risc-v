#include <stdio.h>

extern double fconvtemp(double f,unsigned *pflags);

int
main(int argc,char **argv) {
	static double const tests[] = {
		32.0, 0.0, -40.0, 18.5
	};

	for ( int ux=0; ux < 4; ++ux ) {
		unsigned flags;

		double celsius = fconvtemp(tests[ux],&flags);

		printf("%.1lf F -> %.1lf C (flags = 0x%04X)\n",
			tests[ux], celsius, flags);
	}
	return 0;
}
