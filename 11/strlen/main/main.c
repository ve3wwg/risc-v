#include <stdio.h>
#include <stdint.h>

extern int strlen32(char const *s);

void
app_main(void) {
	static char const *tests[] = {
		"One",
		"Three",
		"Ten four",
		"",
		"This is the end!",
		NULL
	};

	for ( unsigned ux=0; tests[ux] != NULL; ++ux ) {
		printf("strlen32('%s') => %d\n",
			tests[ux],strlen32(tests[ux]));
	}

	puts("Done");
	fflush(stdout);
}
