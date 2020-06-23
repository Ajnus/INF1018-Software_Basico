#include <stdio.h>

int calcula (int a[], int tam)
{
	int i;
	int acc = 0;
	
	for (i=0; i<tam; i++)
		acc += a[i];
	return acc;
}

int foo (int a[], int tam);
/*{
	int i;
	int b[tam];
	
	for (i = 0; i<tam; i++)
	//{
		b[i] = calcula (&(a[i]), tam-i);
		//printf("O valor de b[%d] eh: %d\n", i, b[i]);
	//}
		
	return calcula (b, tam);
}*/

int main (void)
{
	int i;
	int a[4];
	
	for (i=0;i<4;i++)
	{
		printf ("valor de a[%d]? ",i);
		scanf ("%d", &a[i]);
    	}
	printf ("foo(a) = %d\n", foo(a,4));
	
	return 0;
}
