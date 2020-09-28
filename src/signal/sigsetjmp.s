
  .text
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
  mov.i64       $9, setjmp
  tcall.setjmp  $9, $0, $1
