#include <stdio.h>
#include <stdint.h>

extern void identm(void *matrix,unsigned n);

void
app_main(void) {
	{
		int matrix[3][3];

		for ( unsigned ux=0; ux<3; ++ux ) {
			for ( unsigned uy=0; uy<3; ++uy ) {
				matrix[ux][uy] = 13;
			}
		}

		identm(&matrix,3);

		for ( unsigned ux=0; ux<3; ++ux ) {
			putchar('[');
			for ( unsigned uy=0; uy<3; ++uy ) {
				printf("%3d ",matrix[ux][uy]);
			}
			puts("]");
		}
	}
	fflush(stdout);
}
