/*
int f(int x);

void map2 (int* um, int* outro, int n)
{
	int i;
	
	for (i=0; i<n; i++)
		*(outro+i) = f(*(um+i));
}
*/

.text
.globl	map2
map2:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp		/* múltiplo de 16		*/
	movq	%rdi, -8(%rbp)		/* int* um			*/
	movq	%rsi, -16(%rbp)		/* int* outro			*/
	movl	%edx, -20(%rbp)		/* int n			*/
	
	movl	$0, %ebx		/* i = 0			*/
		
FOR:
	cmpl	-20(%rbp), %ebx		/* if (i			*/
	jge	FORA_FOR		/*       < n)			*/
	
	movl	%ebx, %r12d		/* %r12d = i			*/
	imull	$4, %r12d		/* %r12d = i*4 bytes		*/
	
	addq	-8(%rbp), %r12 		/* %r12d = %r12d(i) + um	*/
	movq	(%r12), %rdi		/* *(um+1) 1o param		*/
	call	f
	
	movl	%ebx, %r12d		/* %r12d = i			*/
	imull 	$4, %r12d		/* %r12d = i*4 bytes		*/
	
	addq	-16(%rbp), %r12		/*  %r12 = %r12(i) + outro	*/
	
	movq	%rax, (%r12)		/* *(outro+i) = f(*(um+i))	*/
	
	addl	$1, %ebx			/* i++			*/
	jmp	FOR
	
FORA_FOR:
	movl	-20(%rbp), %edx 	/* int n			*/
	movq	-16(%rbp), %rsi		/* int* outro			*/
	movq	-8(%rbp), %rdi 		/* int* um			*/
	addq	$32, %rsp
	leave
	ret
