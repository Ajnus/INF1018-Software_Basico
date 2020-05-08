/* #include <stdio.h>
#include "dados.h"

int main()
{
	int i;
	St *p = dados;
	int max = 0;
	
	for (i = 0; i <3; i++)
	{
     		if (p->cc && p->ci > max)
			max = p->ci;
		p++;
	}
  	printf("%d\n",max);
  	
	return 0;
}
*/

Sf:	.string "Máximo: %d\n"

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

	movq	$dados, %r12	# St *p = dados
	movl	$0, %ebx	# int max = 0
	
	movl	$0, %eax	# (int) i = 0
FOR:
	cmpl	$3, %eax	# if (i
	jge	FORA_FOR	#	< 3)
	cmpb	$0, (%r12)	# if (p->cc
	je	FORA_IF		#	    != 0)
	cmpl	%ebx, 4(%r12)	# if (p->ci
	jle	FORA_IF		#	     > max)
	movl	4(%r12), %ebx
	
FORA_IF:
	addq	$8, %r12
	incl	%eax
	jmp	FOR
	
FORA_FOR:
	movq	$Sf, %rdi
	movl	%ebx,%esi
	xor	%eax, %eax
	call	printf
	
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
	movq  	$0, %rax  /* rax = 0  (valor de retorno) */
	movq  	-8(%rbp), %rbx
	movq  	-16(%rbp), %r12
	leave
	ret      
/***************************************************************/
		

	
	

	


