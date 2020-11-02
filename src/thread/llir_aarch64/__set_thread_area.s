  .section .text
  .globl __set_thread_area
  .hidden __set_thread_area
__set_thread_area:
  .call       c
  .args       i64

  arg.i64     $0, 0
  set         $fs, 0
  mov.i64     $1, 0
  ret         $1
