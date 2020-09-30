
  .section .text
__unmapself:
  mov.i64       $0, 11  # munmap
  syscall.i64   $1, $0

  mov.i64       $2, 60  # exit
  mov.i64       $3, 0
  syscall.i64   $4, $2, $3

  trap                  # Should not reach here
