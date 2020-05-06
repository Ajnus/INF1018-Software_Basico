/*
int nums[] = {10, -21, -30, 45};

int main()
{
	int i, *p;
	int sum = 0;
	
	for (i = 0, p = nums; i != 4; i++, p++)
		sum += *p;
	printf("%d\n", sum);
	
  	return 0;
}
*/

.data
nums:	.int  10, -21, -30, 45
Sf:	.string "%d\n"		#string de formato para printf

.text
.globl main
main:

/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
	pushq	%rbp
	movq    %rsp, %rbp
	subq    $16, %rsp
	movq    %rbx, -8(%rbp)
	movq    %r12, -16(%rbp)
/********************************************************/

	movl	$0, %ebx	/* i = 0	*/
	movl	$0, %ecx	/* sum = 0	*/
	movq	$nums, %r12	/* p = &nums	*/

L1:
	cmpl	$4, %ebx	/* if (i == 4)	*/
	je	L2		/* goto L2 	*/
	
	addl	(%r12), %ecx	/* sum += *p	*/ 
		
	addl	$1, %ebx	/* i++		*/
	addq	$4, %r12	/* p++		*/
	jmp	L1		/* goto L1	*/
	
L2:
	movl	%ecx, %eax
	/*movl	%ecx, %esi*/
/*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)  */
	movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
	movl    %eax, %esi   /* segundo parametro  (inteiro) */
	/*xorl 	%eax, %eax   NECESSÁRIO PARA EVITAR 'OPERAÇÃO ILEGAL', se %al > 8; explicação no link */
			     /* https://stackoverflow.com/questions/61622435/assembly-executable-doesnt-show-anything-x64/61625371#61625371 */
	call	printf       /* chama a funcao da biblioteca */
/*************************************************************/

/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
	movq  	$0, %rax  /* rax = 0  (valor de retorno) */
	movq  	-8(%rbp), %rbx
	movq  	-16(%rbp), %r12
	leave
	ret      
/***************************************************************/

	
