  .globl __restore
  .hidden __restore
__restore:
  mov.i32     $0, 119
  syscall     $0
  trap
  .end

  .globl __restore_rt
  .hidden __restore_rt
__restore_rt:
  mov.i32     $0, 173
  syscall     $0
  trap
  .end
