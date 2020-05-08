/*
#include <stdio.h>

int main(void)
{
	int i = 1;
	while (i < 11)
	{
		printf("%d ", i*i);
		i++;
	}
		
	return 0;
}
*/

.data
Sf:	.string "%d\n"

.text
.globl 	main
main:

/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
	pushq	%rbp
	movq    %rsp, %rbp
	subq    $16, %rsp
	movq    %rbx, -8(%rbp)
	movq    %r12, -16(%rbp)
/********************************************************/

	movl	$1, %ebx

L1:
	movl	%ebx, %eax
	cmpl	$11, %ebx
	jge	FORA_WHILE
	
	movq	$Sf, %rdi
	imull 	%eax, %eax
	movl	%eax,%esi
	xorl	%eax, %eax
	call	printf
	
	addl	$1, %ebx
	jmp	L1
	
FORA_WHILE:
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
	movq  	$0, %rax  /* rax = 0  (valor de retorno) */
	movq  	-8(%rbp), %rbx
	movq  	-16(%rbp), %r12
	leave
	ret      
/***************************************************************/
	
