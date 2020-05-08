/*
#include <stdio.h>

int nums[4] = {65, -105, 111, 34};

int main (void)
{
	int i;
	int s = 0;

	for (i=0;i<4;i++)
		s = s+nums[i];

	printf ("soma = %d\n", s);

	return 0;
}
*/

.data
nums:	.int 65, -105, 111, 34
Sf:	.string "soma = %d\n"

.text
.globl	main
main:

/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
	pushq	%rbp
	movq    %rsp, %rbp
	subq    $16, %rsp
	movq    %rbx, -8(%rbp)
	movq    %r12, -16(%rbp)
/********************************************************/

	# 	int i; assembly pode declarar sem definir?
	movl	$0, %ebx	# int s = 0
	movq	$nums, %r12	# &nums -> %r12	
	movl	$0, %eax	# i = 0
	
FOR:
	cmpl	$4, %eax	# if (i
	jge	FORA_FOR 	#       < 4)

	movl  	%eax, %edx 	# preserva i inicial
	movq	%r12, %r13	# preserva nums inicial
	
	imull	$4, %eax	# i * sizeof(nums) -> %eax
	
	movslq	%eax, %rcx	# i * sizeof(nums) -> %Rcx
	addq	%rcx, %r12	# &nums + i * sizeof(nums) -> %r12
	addl	(%r12), %ebx	# s = s+nums[i];

	movl	%edx, %eax	# restaura i em %eax
	movq	%r13, %r12	# restaura nums em %r12
	
	incl	%eax
	jmp 	FOR
	
FORA_FOR:
	movq	$Sf, %rdi
	movl	%ebx, %esi
	xorl	%eax, %eax
	call	printf
	
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
	movq  	$0, %rax  /* rax = 0  (valor de retorno) */
	movq  	-8(%rbp), %rbx
	movq  	-16(%rbp), %r12
	leave
	ret      
/***************************************************************/
