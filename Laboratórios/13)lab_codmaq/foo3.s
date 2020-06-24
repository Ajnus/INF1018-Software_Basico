/*
int foo2 (int x)
{
	return add(x);
}
*/

.text
.globl foo3

foo3:

	pushq	%rbp
	movq	%rsp, %rbp

	jmp	add
	
	leave
	ret
