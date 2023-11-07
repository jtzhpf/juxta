	.text
	.file	"test.c"
	.globl	function
	.align	16, 0x90
	.type	function,@function
function:                               # @function
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	%edi, %eax
	subl	$4, %edi
	movl	%eax, -16(%rbp)         # 4-byte Spill
	movl	%edi, -20(%rbp)         # 4-byte Spill
	je	.LBB0_2
	jmp	.LBB0_4
.LBB0_4:                                # %entry
	movl	-16(%rbp), %eax         # 4-byte Reload
	subl	$1, %eax
	movl	%eax, -24(%rbp)         # 4-byte Spill
	jne	.LBB0_3
	jmp	.LBB0_1
.LBB0_1:                                # %sw.bb
	movl	$1, %eax
	movl	-4(%rbp), %ecx
	movl	%eax, -28(%rbp)         # 4-byte Spill
	movl	%ecx, %eax
	cltd
	movl	-28(%rbp), %ecx         # 4-byte Reload
	idivl	%ecx
	movl	%eax, -8(%rbp)
	jmp	.LBB0_3
.LBB0_2:                                # %sw.bb1
	movl	-4(%rbp), %eax
	subl	$4, %eax
	movl	%eax, -12(%rbp)
	movl	-4(%rbp), %eax
	cltd
	idivl	-12(%rbp)
	movl	%eax, -8(%rbp)
.LBB0_3:                                # %sw.epilog
	movl	-8(%rbp), %eax
	popq	%rbp
	retq
.Ltmp3:
	.size	function, .Ltmp3-function
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp4:
	.cfi_def_cfa_offset 16
.Ltmp5:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp6:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$4, %edi
	callq	function
	xorl	%edi, %edi
	movl	%eax, -4(%rbp)          # 4-byte Spill
	movl	%edi, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
.Ltmp7:
	.size	main, .Ltmp7-main
	.cfi_endproc


	.ident	"clang version 3.6.0 "
	.section	".note.GNU-stack","",@progbits
