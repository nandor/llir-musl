
  .section .text
  .globl sigsetjmp
sigsetjmp:
  .call         setjmp
  .args         i64, i64

  arg.i64       $0, 0   # jmpbuf
  arg.i64       $1, 1   # savemask

  jf            $1, .Lnosave
  # TODO: implement
  trap

.Lnosave:
  get.i64     $1, $frame_addr
  store      [$0], $1

  mov.i64     $2, 8
  add.i64     $3, $0, $2
  get.i64     $4, $ret_addr
  store      [$3], $4

  mov.i32     $5, 0
  ret         $5
