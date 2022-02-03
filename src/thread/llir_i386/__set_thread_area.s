.section .text
__set_thread_area:
  .visibility   global_hidden
  .stack_object 0, 16, 8
  .args         i32

  arg.i32       $0, 0

  frame.i32     $1000, 0, 12
  mov.i32       $1001, 0x51
  store         $1000, $1001

  frame.i32     $1002, 0, 8
  mov.i32       $1003, 0xfffff
  store         $1002, $1003

  frame.i32     $1004, 0, 4
  store         $1004, $0

  mov.i32       $1004, .L4
  ld.i32        $1005, $1004
  frame.i32     $1006, 0, 0
  store         $1006, $1005

  mov.i32       $3000, 243
  syscall.i32   $3000, $1006

  mov.i32       $3001, 0
  cmp.i8.eq     $3002, $3000, $3001
  jcc           $3002, .Lokay_set, .Lfail_set

.Lokay_set:
  ld.i32        $4000, $1006
  store         $1004, $4000

  mov.i32       $4001, 8
  mul.i32       $4002, $4000, $4001
  mov.i32       $4003, 3
  add.i32       $4004, $4002, $4003

  set           $x86_gs, $4004
  mov.i32       $4005, 0
  ret           $4005

.Lfail_set:
  mov.i32       $5001, 123
  mov.i32       $5002, 1
  mov.i32       $5003, 0
  store         $1006, $5003
  mov.i32       $5004, 16
  syscall.i32   $5005, $5001, $5002, $1006, $5004

  mov.i32       $5006, 0
  cmp.i32.eq    $5007, $5005, $5006
  jcc           $5007, .Lokay_ldt, .Lfail_ldt

.Lokay_ldt:
  mov.i32       $5008, 0
  ret           $5008

.Lfail_ldt:
  mov.i32       $6000, 7
  set           $x86_gs, $6000
  mov.i32       $6001, 0
  ret           $6001

  .section .data
  .align 4
.L4:
  .long -1
