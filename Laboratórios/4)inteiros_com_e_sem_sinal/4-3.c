/* programa 3*/
#include <stdio.h>

int main (void)
{
	int x = 0xffffffff;
	unsigned int y = 2;
	printf("x=%d, y=%d\n", x, y);
	printf("x é menor do que y? %s\n", (x<y)?"sim":"nao");
	  
	return 0;
}

/* EXPLICAÇÃO
	(HEX to BIN, BIN to DEC)
	x = 0xffffffff -> 1111 1111 1111 1111 1111 1111 1111 1111 ->
		       -> 0000 0000 0000 0000 0000 0000 0000 0000
		       					       +1
			  0000 0000 0000 0000 0000 0000 0000 0001-> -1
		       SIGNED int
	y = 2 -> 					     0010 ->
	      -> 					     1101
							       +1
							     1110->-14
		       UNSIGNED int
		       
		       -1 > -14, x NÃO É menor que y */
