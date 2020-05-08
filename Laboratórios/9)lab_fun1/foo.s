/*
void foo (int a[], int n) 
{
	int i;
	int s = 0;
	for (i=0; i<n; i++)
	{
		s += a[i];
		if (a[i] == 0)
		{
			a[i] = s;
			s = 0;
		}
	}
}
*/

.text
.globl foo
foo:
	pushq	%rbp
	movq	%rsp, %rbp
	
	
	movl	$0, %ecx	# s = 0
	movl	%rdi, %r12	# a[]
	movl	$0, %ebx	# i = 0
FOR:
	cmpl	%esi, %ebx	# if (i
	jge	FORA_FOR	#	< n)
	pushl	%ebx
	pushl	%r12
	
	imull 	$4, %ebx
	
	movlq	%ebx, %rcx
	addq	%rcx, %r12
	addl	(%r12), %ecx
	
	cmpl	$0, (%r12)
	jne	FORA_IF
	movl	%ecx, (%r12)
	movl	$0, %ecx
	
FORA_IF:
	incl	%ebx
	
	popl	%ebx
	popl	%r12
	jmp	FOR
	
	
	
	
	
	
	
	
	
	
	incl	%ebx
	
	
	
	
	
	
	
	
