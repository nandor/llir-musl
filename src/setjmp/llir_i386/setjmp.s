
  .section .text
  .globl setjmp
setjmp:
  .call       setjmp
  .args       i32

  arg.i32     $0, 0

  get.i32     $1, $frame_addr
  st          [$0], $1

  mov.i32     $2, 4
  add.i32     $3, $0, $2
  get.i32     $4, $ret_addr
  st          [$3], $4

  mov.i32     $5, 0
  ret         $5

  .section .text
  .globl _setjmp
_setjmp:
  .call       setjmp
  .args       i32

  arg.i32     $0, 0

  get.i32     $1, $frame_addr
  st          [$0], $1

  mov.i32     $2, 4
  add.i32     $3, $0, $2
  get.i32     $4, $ret_addr
  st          [$3], $4

  mov.i32     $5, 0
  ret         $5
