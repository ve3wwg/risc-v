#include <stdio.h>
#include <stdint.h>

extern void identm(void *matrix,unsigned n);

void
app_main(void) {
	{
		unsigned const n=3;
		int matrix[n][n];

		identm(&matrix,n);

		printf("%u x %u identity matrix:\n",n,n);
		for ( unsigned ux=0; ux<n; ++ux ) {
			putchar('[');
			for ( unsigned uy=0; uy<n; ++uy ) {
				printf("%3d ",matrix[ux][uy]);
			}
			puts("]");
		}
	}
	{
		unsigned const n=6;
		int matrix[n][n];

		identm(&matrix,n);

		printf("%u x %u identity matrix:\n",n,n);
		for ( unsigned ux=0; ux<n; ++ux ) {
			putchar('[');
			for ( unsigned uy=0; uy<n; ++uy ) {
				printf("%3d ",matrix[ux][uy]);
			}
			puts("]");
		}
	}

	puts("Done");
	fflush(stdout);
}
