/* programa 2*/
#include <stdio.h>

int main (void) 
{
	unsigned int x = 0xffffffff;
	unsigned int y = 2;
	printf("x=%u, y=%u\n", x, y);
	printf("x é menor do que y? %s\n", (x<y)?"sim":"nao");
	  
	return 0;
}

/* EXPLICAÇÃO
	(HEX to BIN, BIN to DEC)
	x = 0xffffffff -> 1111 1111 1111 1111 1111 1111 1111 1111 ->
			  31
		       -> ∑1x2^n = 4294967295
			 n=0       
		       UNSIGNED int
	y = 2
		       UNSIGNED int
		       
		       4294967295 > 2, x NÃO É menor que y */
