  .globl __restore_rt
  .hidden __restore_rt
__restore_rt:
  mov.i64     $0, 139
  syscall     $0
  trap
