#include <stdio.h>

extern int callme();

void
app_main(void) {

	printf("callme() returned %d\n",callme());
}
