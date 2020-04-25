#define N 8		// "Para simplificar, assuma que o buffer tem tamanho suficiente para guardar todo o resultado."
#include <stdio.h>

void num2string(char* s, int num, int base)
{
	int n = N-2;

 	while ((num/base)>=1)
	{
		//printf("num = %d, base = %d, ", num, base);
		s[n] = num%base;
		//printf("s[%d] = %d\n", n, s[n]);
		num = num/base;
		//printf("novo num = %d\n", num);
		n--;
		
	}
		s[0] = num;
		//printf("s[0] = %d\n\n", s[0]);
		
	while (n < N-1) // caracteres estranhos ou segfaults com o uso de %s
	{  
		printf("%d", s[n]);
		n++;
	}
	printf("\n");
}

int main(void)
{
	char s[N];  
	num2string(s, 123, 2);

	return 0;
}
