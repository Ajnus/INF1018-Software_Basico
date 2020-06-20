/*
struct X
{
	int val;			
	struct X* next;
};

int add (struct X* x)
{
	int a = 0;
	for (; x != NULL; x = x->next)
		a += x->val;
		
	return a;
}*/

.text
.globl	add
add:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -16(%rbp)
	
	movl	$0, -4(%rbp)		/* int a = 0	*/

FOR:
	cmpq	$0, -16(%rbp)		/* x		*/
	je	FORA_FOR		/*   != NULL	*/
	
	movq	-16(%rbp), %r12
	movl	(%r12), %r12d
	addl	%r12d, -4(%rbp) 	/* a += x->val	*/
	
	movq	-16(%rbp), %r12
	movq	8(%r12), %r12
	movq	%r12, -16(%rbp)		/* x  = x->next	*/
	jmp	FOR
	
FORA_FOR:
	movl	-4(%rbp), %eax
	movq	%rbp, %rsp
	popq	%rbp
	ret
