/*
int foo (int x)
{
	return x+1;
}
*/

.text
.globl foo
foo:
	pushq	%rbp
	movq	%rsp, %rbp

inicio:	
	incl	%edi
	movl	%edi, %eax
	
fim:	
	movq	%rbp, %rsp
	popq	%rbp
	ret
