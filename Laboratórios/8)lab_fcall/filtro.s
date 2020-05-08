.text
.globl	filtro
filtro:
	cmpl	%edi, %esi
	jge	ELSE
	movl	$0, %eax
	ret
	
ELSE:
	movl	%edi, %eax
	ret
