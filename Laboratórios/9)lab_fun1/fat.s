/*
int fat (int n)
{
	if (n==0) return 1;
	else return n*fat(n-1);
}
*/

.text
.globl	fat
fat:
	cmpl	$0, %edi
	jne	ELSE
	movl	$1, %eax
	ret
	
ELSE:
	pushq	%rdi		# mantém n
	decl	%edi
	call	fat
	popq	%rdi 
	imull	%edi, %eax
	ret
