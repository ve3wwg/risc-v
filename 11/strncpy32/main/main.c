#include <stdio.h>
#include <string.h>
#include <assert.h>

extern char *strncpy32(char *dest,char const *src,size_t n);

void
app_main(void) {
	static char const *tests[] = {
		"abc",
		"Main",
		"",
		"1234567890",
		NULL
	};
	char buf[8], *rp;
	char const *src;

	for ( unsigned ux=0; (src = tests[ux]) != NULL; ++ux ) {
		memset(buf,'X',sizeof buf);
		rp = strncpy32(buf,src,sizeof buf);

		assert(rp == buf);
		printf("src='%s', n=%u, buf[] = ",src,sizeof buf);
		for ( unsigned u=0; u<sizeof buf; ++u ) {
			if ( buf[u] )
				printf("'%c'%c",
					buf[u],
					u+1<sizeof buf?',':'\n');
			else	printf("NUL%c",
					u+1<sizeof buf?',':'\n');
		}
	}

	puts("Done");
	fflush(stdout);
}
