  .section .text
  .globl feclearexcept
feclearexcept:
  .args         i32
  .stack_object 0, 4, 8
  arg.i32       $0, 0
  mov.i32       $1, 0x3f
  and.i32       $2, $0, $1
  frame.i64     $7, 0, 0
  x86_fnstsw    $7
  ld.i16        $3, [$7]
  xext.i32      $4, $3
  and.i32       $5, $2, $4
  jcc           $5, .Lno_clear1, .Lclear1
.Lclear1:
  x86_fnclex
  jmp           .Lno_clear1
.Lno_clear1:
  and.i32       $6, $4, $1
  x86_stmxcsr   $7
  ld.i32        $8, [$7]
  or.i32        $9, $4, $8
  and.i32       $10, $0, $9
  jcc           $10, .Lno_clear2, .Lclear2
.Lclear2:
  mov.i32       $11, 0
  xor.i32       $12, $11, $0
  and.i32       $13, $12, $9
  st            [$7], $13
  x86_ldmxcsr   $7
  jmp           .Lno_clear2
.Lno_clear2:
  mov.i32       $20, 0
  ret           $20
  .end

  .globl feraiseexcept
feraiseexcept:
  .args         i32
  .stack_object 0, 4, 8
  arg.i32       $0, 0
  mov.i32       $1, 0x3f
  and.i32       $2, $0, $1
  frame.i64     $3, 0, 0
  x86_stmxcsr   $3
  ld.i32        $4, [$3]
  or.i32        $5, $4, $2
  st            [$3], $5
  x86_ldmxcsr   $3
  mov.i32       $6, 0
  ret           $6
  .end

  .globl __fesetround
  .hidden __fesetround
__fesetround:
  .args         i32
  .stack_object 0, 4, 8
  arg.i32       $0, 0
  mov.i32       $1, 8
  srl.i32       $2, $0, $1
  trunc.i8      $3, $2
  frame.i64     $4, 0, 0
  frame.i64     $5, 0, 1
  x86_fnstcw    $4
  ld.i8         $6, $5
  mov.i8        $7, 0xf3
  and.i8        $8, $6, $7
  or.i8         $9, $3, $8
  st            $5, $9
  x86_fldcw     $4
  x86_stmxcsr   $4
  ld.i8         $10, $5
  mov.i8        $11, 3
  sll.i8        $12, $3, $11
  mov.i8        $13, 0x9f
  and.i8        $14, $13, $10
  or.i8         $15, $12, $14
  st            $5, $15
  x86_ldmxcsr   $4
  mov.i32       $20, 0
  ret           $20
  .end

  .globl fegetround
fegetround:
  .stack_object 0, 4, 8
  frame.i64     $0, 0, 0
  x86_stmxcsr   $0
  ld.i32        $1, [$0]
  mov.i32       $2, 3
  srl.i32       $3, $1, $2
  mov.i32       $4, 0xC00
  and.i32       $5, $3, $4
  ret           $5
  .end

  .globl fegetenv
fegetenv:
  .args         i64
  arg.i64       $0, 0
  x86_fnstenv   $0
  mov.i64       $1, 28
  add.i64       $2, $0, $1
  x86_stmxcsr   $2
  mov.i64       $3, 0
  ret           $3
  .end

  .globl fesetenv
fesetenv:
  .args         i64
  .stack_object 0, 32, 8
  arg.i64       $0, 0
  mov.i64       $1, 0xFFFFFFFF
  cmp.eq.i8     $2, $0, $1
  jcc           $2, .Lclear, .Lset
.Lclear:
  frame.i64     $3, 0, 0
  mov.i64       $4, 0x0000037f
  st            $3, $4
  frame.i64     $5, 0, 8
  mov.i64       $6, 0x0000ffff
  st            $5, $6
  frame.i64     $7, 0, 16
  mov.i64       $8, 0x0
  st            $7, $8
  frame.i64     $9, 0, 24
  mov.i64       $10, 0x0
  st            $9, $10
  x86_fldenv    $3
  frame.i64     $11, 0, 0
  mov.i64       $12, 0x00001f80
  st            $11, $12
  x86_ldmxcsr   $11
  mov.i32       $12, 0
  ret           $12
.Lset:
  x86_fldenv    $0
  mov.i64       $3, 28
  add.i64       $4, $0, $3
  x86_ldmxcsr   $4
  mov.i32       $5, 0
  ret           $5
  .end

  .globl fetestexcept
fetestexcept:
  .args         i32
  .stack_object 0, 4, 8
  arg.i32       $0, 0
  mov.i32       $1, 0x3f
  and.i32       $2, $0, $1
  frame.i64     $3, 0, 0
  x86_stmxcsr   $3
  ld.i32        $4, [$3]
  x86_fnstsw    $3
  ld.i16        $5, [$3]
  xext.i32      $6, $5
  or.i32        $7, $4, $6
  and.i32       $8, $7, $2
  ret           $8
  .end
