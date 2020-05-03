
  .code
  .globl setjmp
setjmp:
  .call       setjmp
  .args       0, i64

  arg.i64     $0, 0

  mov.i64     $1, $frame_addr
  mov.i64     $2, 8
  add.i64     $3, $1, $2

  st          [$0], $3
  add.i64     $4, $2, $0

  mov.i64     $5, $ret_addr
  st          [$4], $5

  mov.i64     $6, 0
  ret         $6
