#include <stdio.h>
#include <stdbool.h>

extern unsigned extensions(char *buf,unsigned bufsiz,unsigned *bits);

int
main(int argc,char **argv) {
	char buf[32];
	unsigned exten=0, bits=0;

	exten = extensions(buf,sizeof buf,&bits);	

	printf("exten = 0x%06X, %u bits, RV%u%s\n",
		exten, bits, bits, buf);
	return 0;
}
