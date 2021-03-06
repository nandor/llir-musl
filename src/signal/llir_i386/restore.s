  .globl __restore_rt
  .hidden __restore_rt
__restore_rt:
  mov.i32     $0, 15
  syscall     $0
  trap
