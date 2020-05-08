#include <stdio.h>

void foo (int a[], int n);

int main (void)
{
	int vect = {0, 1, 2, 3, 4, 5};
	foo(vect,6); // void, como testar?
	
	return 0;
}
