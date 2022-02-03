
  .section .text
__unmapself:
  .args         i32, i32
  .visibility global_hidden
  arg.i32       $2, 0
  arg.i32       $3, 1

  mov.i32       $0, 91  # munmap
  syscall.i32   $1, $0, $2, $3

  mov.i32       $2, 1   # exit
  mov.i32       $3, 0
  syscall       $2, $3

  trap                  # Should not reach here
