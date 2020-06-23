/*
int foo (int a[], int tam)
{
	int i;
	int b[tam];
	
	for (i = 0; i<tam; i++)
		b[i] = calcula (&(a[i]), tam-i);
		
	return calcula (b, tam);
}
*/

.text
.globl foo
foo:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp		/* ALOCA múltiplo de 16 necessário para poder salvar/usar os registradores	*/
	movq	%r12, -8(%rbp)		/* SALVA o valor antigo de %r12  | internamente, guardará &b 			*/
	movq	%r13, -16(%rbp)		/* SALVA o valor antigo de %r13 | internamente, guardará &a 			*/
	movq	%r15, -24(%rbp)		/* SALVA o valor antigo de %r15 | internamente, salvará tam			*/
	/*---------------------------------------- calcula espaço múltiplo de 16 para b[tam] ---------------------------------------------------*/
	movl	%esi, %edx		/* %edx = tam												*/
	imul	$4, %edx		/* %edx(tam) *= 4, teremos um vetor de ints								*/
	movl	%edx, %eax			/* %eax = tamanho do vetor, usado mais tarde para determinar &b	*/
	movq	%rbp, %rcx			/*                           usado mais tarde para determinar &b*/	
	shr	$4, %edx		/* %edx(tam) /= 16, determina fator do múltiplo de 16 imediatamente inferior ao tamanho do vetor	*/
	incl	%edx			/* %edx(tam)++												*/
	imul	$16, %edx		/* determina múltiplo de 16 imediatamente superior							*/
	/*--------------------------------------------------------------------------------------------------------------------------------------*/
	subq	%rdx, %rsp		/* ALOCA espaço mútiplo de 16 necessário para b[tam] no RA	*/
	
	subq	$32, %rcx		/* %rcx = &<registradores>			*/
	subq	%rax, %rcx		/* %rcx = &b					*/
	movq	%rcx, %r12		/* %r12 = &b ORIGINAL				*/
	movl	%esi, %r15d		/* %r15d = tam ORIGINAL				*/	
	movq	%rdi, %r13		/* %r13 = &a					*/	
	
	movl	$0, %ebx		/* %ebx(i) = 0				*/


FOR:
	cmpl	%r15d, %ebx		/* if (i				*/
	je	FORA_FOR		/*	 < tam)				*/
	
	movl	%r15d, %edx		/* restaura no loop %edx = tam		*/
	subl	%ebx, %edx		/* %edx(tam) -= i			*/
	movq	%rdx, %rsi		/* (tam-i) <2o param>			*/
	
	movq	%r13, %rax		/* restaura no loop %rax = &a		*/
	movslq	%ebx, %rcx		/* %rcx = i				*/
	imulq	$4, %rcx		/* %rcx = i * 4 (bytes) 		*/
	addq	%rcx, %rax		/* %rax = &(a[i]) 			*/
	movq	%rax, %rdi		/* &(a[i]) <1o param>			*/
	
	call	calcula			/* %eax = calcula (&(a[i]), tam-i)	*/
	
	movq	%r12, %rdx		/* restaura no loop %rdx = &b		*/
	movslq	%ebx, %rcx		/* %rcx = i				*/
	imulq	$4, %rcx		/* %rcx = i * 4 (bytes) 		*/
	addq	%rcx, %rdx		/* %rdx = &b[i]				*/
	
	movl	%eax, (%rdx)		/* b[i] = calcula (&(a[i]), tam-i)	*/

	incl	%ebx			/* i++					*/
	jmp	FOR
	
FORA_FOR:
	movq	%r12, %rdi		/* b <1o param>				*/
	movl	%r15d, %esi		/* tam <2o param>			*/
	call	calcula
	
	movq	-24(%rbp), %r15		/* RESTAURA o valor antigo de %r15	*/
	movq	-16(%rbp), %r13 	/* RESTAURA o valor antigo de %r13	*/	
	movq	-8(%rbp), %r12 		/* RESTAURA o valor antigo de %r12	*/
	leave
	ret
