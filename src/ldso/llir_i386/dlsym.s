  .section .text
  .globl dlsym
  .hidden __dlsym
dlsym:
  .call c
  .args i32, i32
  arg.i32       $0, 0
  arg.i32       $1, 1
  get.i32       $2, $ret_addr
  mov.i32       $3, __dlsym
  tcall.i32.c   $3, $0, $1, $2
  .end
