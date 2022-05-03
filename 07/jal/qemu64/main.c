#include <stdio.h>

extern int callme();

int
main(int argc,char **argv) {

	printf("callme() returned %d\n",callme());
	return 0;
}
