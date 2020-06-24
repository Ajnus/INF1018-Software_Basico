/*
int foo2 (int x)
{
	return add(x);
}
*/

.text
.globl foo2

foo2:

	pushq	%rbp
	movq	%rsp, %rbp

	call	add
	
	leave
	ret
