/*
int nums[] = {10, -21, -30, 45};

int main()
{
	int i, *p;
	
	for (i = 0, p = nums; i != 4; i++, p++)
		if ((*p % 2) == 0)
		printf("%d\n", *p);
		
	return 0;
}
*/

.data
nums:	.int 10, -21, -30, 45
Sf:	.string "%d\n"		#string de formato de printf

.text
.globl	main
main:

/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
	pushq	%rbp
	movq    %rsp, %rbp
	subq    $16, %rsp
	movq    %rbx, -8(%rbp)
	movq    %r12, -16(%rbp)
/********************************************************/

	movl	$0, %ebx	# i = 0
	movq	$nums, %r12	# p = nums
	
L1:
	cmpl	$4, %ebx	# if (i == 4)
	je	FORA_LOOP
	
	movl	(%r12), %ecx	# p[i] -> %ecx
	andl	$1, %ecx	# p[i] &= 1
	cmpl	$1, %ecx	# p[i] é ímpar?
	je	FORA_IF		# sai do if se for
	
	movl	(%r12), %eax	# prepara p/ printf
	
	movq	$Sf, %rdi	# primeiro parâmetro, formato string
	movl	%eax, %esi	# segundo parâmetro, "quem" imprimir
	xorl 	%eax, %eax   /* NECESSÁRIO PARA EVITAR LOOP INFINITO, no gNewSense x64; explicação no link */
			     /* https://stackoverflow.com/questions/61622435/assembly-executable-doesnt-show-anything-x64/61625371#61625371 */
	call	printf

FORA_IF:	
	addl	$1, %ebx	# i++
	addq	$4, %r12	# p++
	jmp	L1
	
FORA_LOOP:
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
	movq  	$0, %rax  /* rax = 0  (valor de retorno) */
	movq  	-8(%rbp), %rbx
	movq  	-16(%rbp), %r12
	leave
	ret      
/***************************************************************/
	
	
