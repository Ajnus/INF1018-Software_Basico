/*
int novonum(void)
{
	int minhalocal;
	
	printf("numero: ");
	scanf("%d",&minhalocal);
	
	return minhalocal;
}
*/

/* #define tamanhoRA 16 */
tamanhoRA = 16

.data
mensagem:	.string "numero: "
formato:	.string "%d"

.text
.globl	novonum
novonum:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$tamanhoRA, %rsp
	
	movq	$mensagem, %rdi
	xorl	%eax, %eax
	call	printf
	
	movq	$formato, %rdi
	leaq	-4(%rbp), %rsi
	call	scanf
	
	movl	-4(%rbp), %eax
	
	//addq	$tamanhoRA, %rsp
	leave
	ret
