/*
struct X
{
	int val1;
	int val2;
};

int f(int i, int v);

void boo (struct X* px, int n, int val)
{
	while (n--)
	{
		px->val2 = f(px->val1, val);
		px++;
	}
}
*/

.text
.globl	boo
boo:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp		/*	 EMPILHA		*/
	movq	%rbx, -8(%rbp)		/* struct X* px 		*/
	movq	%r12, -12(%rbp)		/* int n			*/
	movq	%r13, -16(%rbp)		/* int val			*/
					/*	TORNA TRABALHÁVEL	*/
	movq	%rdi, %rbx		/* struct X* px 		*/
	movl	%esi, %r12d		/* int n			*/
	movl	%edx, %r13d		/* int val			*/
	
WHILE:
	cmpl	$0, %r12d		/* if (n 			*/
	je	FORA_WHILE		/*      != 0)			*/
	movl	(%rbx), %edi		/* px->val1 1o param		*/
	movl	%r13d, %esi		/* val 2o param			*/
	call	f
	movl	%eax, 4(%rbx)		/* px->val2 = f(px->val1, val)	*/
	
	addq	$8, %rbx		/* px++				*/
	decl	%r12d			/* n--				*/
	jmp	WHILE
	
FORA_WHILE:
	movq	-12(%rbp), %r12		/* int n			*/
	movq	-16(%rbp), %r13		/* int val			*/
	movq	-8(%rbp), %rbx		/* struct X* px 		*/
	addq	$16, %rsp
	leave
	ret	
	
	
	
	


