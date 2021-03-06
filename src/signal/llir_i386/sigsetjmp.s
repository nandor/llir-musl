
  .section .text
  .globl sigsetjmp
sigsetjmp:
  .call         setjmp
  .args         i32, i32

  arg.i32       $0, 0   # jmpbuf
  arg.i32       $1, 1   # savemask

  jf            $1, .Lnosave
  # TODO: implement
  trap

.Lnosave:
  get.i32     $1, $frame_addr
  st          [$0], $1

  mov.i32     $2, 4
  add.i32     $3, $0, $2
  get.i32     $4, $ret_addr
  st          [$3], $4

  mov.i32     $5, 0
  ret         $5
