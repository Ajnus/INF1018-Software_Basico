/*
#include <stdio.h>

char S2[] = {65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0};

int main (void)
{
	char *pc = S2;
	
	while (*pc)
		printf ("%c", *pc++);
		printf("\n");
	return 0;
}
*/

.data
S2:	.byte  65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0
Sf:	.string "%c"
Sf2:	.string "\n"

.text
.globl	main
main:

/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)  /* guarda rbx */
  movq    %r12, -16(%rbp)  /* guarda r12 */
/********************************************************/

	movq	$S2, %r12

L1:	
	cmpb	$0, (%r12)
	je	FORA_WHILE
	
	movsbl	(%r12), %eax
	
	movq	$Sf, %rdi
	movl    %eax, %esi
	xorl	%eax, %eax
	call 	printf
	
	addq	$1, %r12
	jmp	L1
	
	movq	$Sf2, %rdi
	xor	%eax, %eax
	call printf
	
FORA_WHILE:
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
	movq  	$0, %rax  /* rax = 0  (valor de retorno) */
	movq  	-8(%rbp), %rbx
	movq  	-16(%rbp), %r12
	leave
	ret      
/***************************************************************/
