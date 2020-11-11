  .section .text
  .globl dlsym
  .hidden __dlsym
dlsym:
  .call c
  .args i64, i64
  arg.i64       $0, 0
  arg.i64       $1, 1
  mov.i64       $2, $ret_addr
  mov.i64       $3, __dlsym
  tcall.i64.c   $3, $0, $1, $2
  .end
