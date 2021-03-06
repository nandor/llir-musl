  .section .text
__clone:
  .call       c
  .args       i32, i32, i32, i32, i32, i32, i32
  .noinline
  trap

