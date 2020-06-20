/*
int add2 (struct X *x)
{
	if (x == NULL)
		return 0;
	else
		return (x->val + add2(x->next));
}
*/

.text
.globl add2
add2:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	
IF:
	cmpq	$0, -16(%rbp)		/* x		*/	
	jne	ELSE			/*   == 0	*/
	movl	$0, %eax
	jmp	RETURN			/* return 0	*/
	
ELSE:
	movq	-16(%rbp), %rax
	movl	(%rax), %ebx		/* x->val em ebx*/
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax		
	movq	%rax, %rdi		/* x->next como 1o param */
	call	add2
	addl	%ebx, %eax		/* x->val + add(x->next)*/

RETURN:
	addq	$16, %rsp
	popq	%rbx
	movq	%rbp, %rbp
	popq	%rbp
	ret
