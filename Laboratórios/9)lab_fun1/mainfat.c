#include <stdio.h>

int fat (int n);

int main (void)
{
	int i = 0;
	
	while(i < 11)
	{
		printf("Fatorial de %d eh: %d\n", i, fat(i));
		i++;
	}
	
	return 0;
}
