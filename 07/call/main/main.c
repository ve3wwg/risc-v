#include <stdio.h>
#include <stdint.h>

#pragma GCC optimize("-O3")

extern int bigcall(
	int32_t one,
	int64_t two,
	int32_t three,
	int64_t four,
	int32_t five,
	int64_t six,
	int32_t seven,
	int64_t eight,
	int32_t nine
);

void
app_main(void) {
	int rc = bigcall(101,102,103,104,105,106,107,108,109);

	printf("bigcall() returned %d\n",rc);
}
