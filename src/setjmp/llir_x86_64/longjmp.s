
  .section .text
  .globl longjmp
longjmp:
  .noinline
  .args         i64, i64
  .call         c

  arg.i64       $0, 0
  arg.i64       $1, 1

  mov.i64       $2, 0
  mov.i64       $4, 1
  select.i64    $5, $1, $2, $4
  add.i64       $6, $1, $5

  mov.i64       $212, 0
  add.i64       $213, $0, $212
  ld.i64        $106, [$213]
  mov.i64       $214, 8
  add.i64       $215, $0, $214
  ld.i64        $107, [$215]

  set           $rsp, $106
  tcall.c       $107
