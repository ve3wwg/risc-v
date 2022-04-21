// main.c

#include <stdio.h>

extern int add3(int arg1,int arg2,int arg3);

int
main(int argc,char **argv) {
	int a=23, b=24, c=25;
	int r = 0;

	r = add3(a,b,c);
	printf("r = %d\n",r);
	return 0;
}
