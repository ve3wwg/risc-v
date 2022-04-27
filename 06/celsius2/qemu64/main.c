#include <stdio.h>

extern void convtemp();

int temp_f10 = 400;	// Fahrenheit degrees * 10
int temp_c10 = 0;	// Computed result: Celsius * 10

int
main(int argc,char **argv) {

	convtemp();	// Convert temp_f10 to temp_c10

	printf("%d.%d F -> %d.%d C\n",
		temp_f10 / 10,
		temp_f10 % 10,
		temp_c10 / 10,
		temp_c10 % 10);
	return 0;
}
