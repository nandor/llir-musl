  .section .text
__syscall_cp_asm:
  .globl __syscall_cp_asm
  .hidden __syscall_cp_asm
  .args     i32, i32, i32, i32, i32, i32, i32, i32
__cp_begin:
  .globl __cp_begin
  .hidden __cp_begin

  arg.i32   $0, 0 # cancel
  arg.i32   $1, 1 # nr
  arg.i32   $2, 2 # arg0
  arg.i32   $3, 3 # arg1
  arg.i32   $4, 4 # arg2
  arg.i32   $5, 5 # arg3
  arg.i32   $6, 6 # arg4
  arg.i32   $7, 7 # arg5

  load.i32  $8, [$0]
  mov.i32   $9, 0
  cmp.ne.i8 $10, $8, $9
  jump_cond $10, __cp_cancel, Lcont
Lcont:
  syscall.i32  $11, $1, $2, $3, $4, $5, $6, $7
  jump       __cp_end
__cp_end:
  .globl __cp_end
  .hidden __cp_end
  ret     $11
__cp_cancel:
  .globl __cp_cancel
  .hidden __cp_cancel
  mov.i32     $12, __cancel
  tcall.i32.c $12
  .end
