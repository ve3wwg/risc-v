#include <stdio.h>

extern int add3(int one,int two,int three);

void
app_main(void) {
	int a=23, b=24, c=25;
	int r = 0;
	
	r = add3(a,b,c);
	printf("r = %d\n",r);
}
