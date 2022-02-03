
  .section .text
  .globl longjmp
longjmp:
  .noinline
  .args               i32, i32
  .call               c

  arg.i32             $0, 0
  arg.i32             $1, 1

  mov.i32             $2, 0
  mov.i32             $3, 1
  select.i32          $4, $1, $2, $3
  add.i32             $5, $1, $4

  load.i32            $6, [$0]

  mov.i32             $7, 4
  add.i32             $8, $0, $7
  load.i32            $9, [$8]

  raise.setjmp        $9, $6, $5

  .section .text
  .globl _longjmp
_longjmp:
  .noinline
  .args               i32, i32
  .call               c

  arg.i32             $0, 0
  arg.i32             $1, 1

  mov.i32             $2, 0
  mov.i32             $3, 1
  select.i32          $4, $1, $2, $3
  add.i32             $5, $1, $4

  load.i32            $6, [$0]

  mov.i32             $7, 4
  add.i32             $8, $0, $7
  load.i32            $9, [$8]

  raise.setjmp        $9, $6, $5
