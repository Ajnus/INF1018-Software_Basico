/*
int bemboba (int num)
{
	int local[4];
	int *a;
	int i;

	for (i=0,a=local;i<4;i++)
	{
		*a = num;
		a++;
	}
  
	return addl (local, 4);
}
*/

.text
.globl	bemboba
bemboba:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp		/* múltiplo de 16	*/
	movq	%rbx, -8(%rbp)		/* int local[4]		*/
	movq	%r12, -16(%rbp)		/* int *a		*/
	
	movl	$0, %ebx		/* i = 0		*/
	leaq	-8(%rbp), %r12		/* a = local		*/
	
FOR:
	cmpl	$4, %ebx		/*if (i			*/
	jge	FORA_FOR		/*	< 4) 		*/
	movl	%edi, (%r12)		/* *a = num		*/
	addq	$4, %r12		/* a++			*/
	
	incl	%ebx			/* i++			*/
	jmp	FOR
	
FORA_FOR:
	leaq	-8(%rbp), %rdi		/* local <1o param>	*/
	movl	$4, %esi		/* 4 <2o param>		*/
	call	addl
	
	/* %eax já setado com o valor de retorno */
	
	movq	-16(%rbp), %r12 	/* restaura %r12	*/
	movq	-8(%rbp), %rbx		/* restaura %rbx	*/
	leave
	ret

	
	
	
	
	
	
	
	
