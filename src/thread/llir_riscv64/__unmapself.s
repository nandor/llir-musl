  .section .text
__unmapself:
  .args         i64, i64
  arg.i64       $2, 0
  arg.i64       $3, 1

  mov.i64       $0, 215  # munmap
  syscall.i64   $1, $0, $2, $3

  mov.i64       $2, 93  # exit
  mov.i64       $3, 0
  syscall       $2, $3

  trap                  # Should not reach here
