.section .data
divisor:
	.int 10
data_items:
	.int 12, 4, 6, 7, 80, 34, 54, 46, 3, 23
output:
	.ascii "The minimun number is %d\n The average is %d\n"

.section .bss
	.lcomm buffer, 18

.section .text
.globl _start

_start:
	movl $0, %edi
	movl data_items(,%edi, 4), %eax
	movl %eax, %ebx
	movl %eax, %ecx
start_loop:
	cmpl $9, %edi
	je loop_exit
	incl %edi
	movl data_items(,%edi, 4), %eax
	addl %eax, %ecx
	cmpl %eax, %ebx
	jle start_loop
	movl %eax, %ebx
	jmp start_loop

loop_exit:
	movl %ecx, %eax
	movl $0, %edx
	divl divisor	
	pushl %eax
	pushl %ebx
	pushl $output
	call printf
	pushl $0

	call exit


