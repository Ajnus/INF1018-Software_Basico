/* programa 1*/
#include <stdio.h>

int main (void) 
{
	int x = 0xffffffff;
	int y = 2;
	printf("x=%u, y=%u\n", x, y);
	printf("x é menor do que y? %s\n", (x<y)?"sim":"nao");
  
	return 0;
}

/* EXPLICAÇÃO
	(HEX to BIN, BIN to DEC)
	x = 0xffffffff -> 1111 1111 1111 1111 1111 1111 1111 1111 ->
		       -> 0000 0000 0000 0000 0000 0000 0000 0000
		       					       +1 	       		  0000 0000 0000 0000 0000 0000 0000 0001 -> -1
		       SIGNED int
	y = 2
		       SIGNED int
		       
		       -1 < 2, x É menor que y */
