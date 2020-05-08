/*
#include <stdio.h>
#define LIM 1

int filtro(int x, int lim);

int nums[5] = {3,-5,7,8,-2};

int main()
{
	int i;
	int *p = nums;
  
	for (i = 0; i < 5; i++)
	{
		printf("%d\n", filtro(*p,LIM));
		p++;
  	}
  	
	return 0;
}
*/

LIM=1

.data
nums: .int 3, -5, 7, 8, -2
s1:   .string "%d\n"

.text
.globl main
main:
	/* prologo */
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rbx, -8(%rbp)
	movq	%r12, -16(%rbp)

	movq	$nums, %r12
	
	movl	$0, %ebx
FOR:
	cmpl	$5, %ebx
	jge	FORA_FOR
	
	movl	(%r12), %edi
	movl	$LIM, %esi
	call 	filtro
	
	movq	$s1, %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	call 	printf
	
	addq	$4, %r12
	incl	%ebx
	jmp	FOR
	
FORA_FOR:

	/* finalizacao */
	movq	-8(%rbp), %rbx
	movq	-16(%rbp), %r12
	leave
	ret


