/* CONVERSÃO NA MÃO
	signed char sc = -1;
	unsigned int ui = sc; (32 bits)
	
	-1 -> 1 -> 0000 0001 -> 1111 1110
				       +1
				1111 1111
				SIGNED CHAR (8 bits)
	
	0000 0000 0000 0000 0000 0000 0000 0000 UNSIGNED INT
				     +1111 1111 UNSIGNED CHAR
	----------------------------------------------------- 
       |0000 0000 0000 0000 0000 0000 1111 1111 UNSIGNED INT|
       -----------------------------------------------------
       		    (repesentação interna)
       	
       	!na_mão	    
	OUTPUT:
	dump de ui: 
	0x7fff6e703b38 - ff
	0x7fff6e703b39 - ff
	0x7fff6e703b3a - ff
	0x7fff6e703b3b - ff
	
	o valor do 1 byte de uma variável é atribuído a todos os bytes
	da outra(?)
	
	
	(sc = -18)
	dump de sc: 
	0x7fff7f29dfdf - ee
	dump de ui: 
	0x7fff7f29dfd8 - ee
	0x7fff7f29dfd9 - ff
	0x7fff7f29dfda - ff
	0x7fff7f29dfdb - ff

	**** O BYTE MENOS SIGNIFICATIVO É ATRÍBUIDO CONFORME A 		VARIÁVEL ORIGINAL E OS OUTROS SÃO TODOS SETADOS COM (EM SEUS 		BITS) 1 ****
	(atribuição seguida de 'or' lógico com 0xFFFFFF00?)
*/ 

#include <stdio.h>

void dump (void *p, int n)
{
	unsigned char *p1 = p;
	
	while (n--) 
	{
		printf("%p - %02x\n", p1, *p1);
		p1++;
	}
}

int main(void)
{
	signed char sc = -18;
	unsigned int ui = sc;
	
	printf("dump de sc: \n");
	dump(&sc, sizeof(sc));	
			
	printf("dump de ui: \n");
	dump(&ui, sizeof(ui));	
	
	return 0;  
} 
  
  
