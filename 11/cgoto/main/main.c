#include <stdio.h>

typedef enum {
	func_add=0,
	func_sub,
	func_mul,
	func_div,
	func_rem,
	func_bad
} func_t;

extern int cgoto(func_t fun,int a,int b);

void
app_main(void) {
	int r[6];

	r[0] = cgoto(func_add,1,2);
	r[1] = cgoto(func_sub,5,2);
	r[2] = cgoto(func_mul,6,5);
	r[3] = cgoto(func_div,35,6);
	r[4] = cgoto(func_rem,13,5);
	r[5] = cgoto(func_bad,9,99);

	for ( unsigned ux=0; ux<6; ++ux ) {
		printf("r[%u] = %d\n",ux,r[ux]);
	}
	puts("Done");
	fflush(stdout);
}
