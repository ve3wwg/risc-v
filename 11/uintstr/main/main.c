#include <stdio.h>

extern char *uintstr(unsigned v,char *buf,unsigned buflen);

void
app_main(void) {
	static unsigned const tests[] = {
		1023, 32, 96001, 10045, 90999, 1770771, 
		0, 0xFFFFFF
	};
	char buf[7];
	char const *cp;
	unsigned v;

	for ( unsigned ux=0; (v = tests[ux]) != 0xFFFFFF; ++ux ) {
		cp = uintstr(v,buf,sizeof buf);

		printf("uintstr(%u,buf,%u) => '%s' %s\n",
			v,(unsigned)sizeof buf,cp,
			cp <= buf ? "!!" : "");
	}

	puts("Done");
	fflush(stdout);
}
