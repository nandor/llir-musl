  .text
  .globl __set_thread_area
  .hidden __set_thread_area
__set_thread_area:
  .call       c
  .args       i64

  mov.i64     $0, 158
  mov.i64     $1, 0x1002
  arg.i64     $2, 0
  # arch_prctl(SET_FS, arg)
  syscall.i64 $3, $0, $1, $2
  ret         $3
