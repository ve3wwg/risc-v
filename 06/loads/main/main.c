#include <stdio.h>

extern int loadb(), loadh(), loadw();
extern long long loadd();

void
app_main(void) {

	printf("loadb() = %08X\n",loadb());
	printf("loadh() = %08X\n",loadh());
	printf("loadw() = %08X\n",loadw());
	printf("loadd() = %016llX\n",loadd());
}
