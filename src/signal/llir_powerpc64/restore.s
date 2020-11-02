  .globl __restore
  .hidden __restore
__restore:
  mov.i64     $0, 119
  syscall     $0
  trap

  .globl __restore_rt
  .hidden __restore_rt
__restore_rt:
  mov.i64     $0, 172
  syscall     $0
  trap
