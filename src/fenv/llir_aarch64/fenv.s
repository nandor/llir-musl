  .section .text
  .globl fegetround
fegetround:
  get.i64     $0, $aarch64_fpcr
  trunc.i32   $1, $0
  mov.i32     $2, 0x00C00000
  and.i32     $3, $2, $1
  ret         $3
  .end

  .section .text
  .globl __fesetround
  .hidden __fesetround
__fesetround:
  .args         i32
  arg.i32       $0, 0
  get.i64       $1, $aarch64_fpcr
  trunc.i32     $2, $1
  mov.i32       $3, 0xFF3FFFFF
  and.i32       $4, $2, $3
  or.i32        $5, $0, $4
  xext.i64      $6, $5
  set           $aarch64_fpcr, $6
  mov.i32       $7, 0
  ret           $7
  .end

  .section .text
  .globl fetestexcept
fetestexcept:
  .args         i32
  arg.i32       $0, 0
  mov.i32       $1, 0x0000001F
  and.i32       $2, $0, $1
  get.i64       $3, $aarch64_fpsr
  trunc.i32     $4, $3
  and.i32       $5, $2, $4
  ret           $5
  .end

  .section .text
  .globl feclearexcept
feclearexcept:
  .args         i32
  arg.i32       $0, 0
  mov.i32       $1, 0x0000001F
  and.i32       $2, $0, $1
  get.i64       $3, $aarch64_fpsr
  trunc.i32     $4, $3
  xor.i32       $5, $4, $2
  xext.i64      $6, $5
  set           $aarch64_fpsr, $6
  mov.i32       $7, 0
  ret           $7
  .end

  .section .text
  .globl feraiseexcept
feraiseexcept:
  .args         i32
  arg.i32       $0, 0
  mov.i32       $1, 0x0000001F
  and.i32       $2, $0, $1
  get.i64       $3, $aarch64_fpsr
  trunc.i32     $4, $3
  or.i32        $5, $4, $2
  xext.i64      $6, $5
  set           $aarch64_fpsr, $6
  mov.i32       $7, 0
  ret           $7
  .end

  .section .text
  .globl fegetenv
fegetenv:
  .args         i64
  arg.i64       $0, 0
  get.i64       $1, $aarch64_fpsr
  st            [$0], $1
  mov.i64       $2, 4
  add.i64       $3, $0, $2
  get.i64       $5, $aarch64_fpcr
  st            [$3], $5
  mov.i32       $6, 0
  ret           $6
  .end

  .section .text
  .globl fesetenv
fesetenv:
  .args         i64
  arg.i64       $0, 0
  mov.i64       $1, 0xFFFFFFFF
  cmp.eq.i32    $2, $0, $1
  jcc           $2, .Lclear, .Lset
.Lclear:
  mov.i64       $3, 0
  set           $aarch64_fpsr, $3
  set           $aarch64_fpcr, $3
  mov.i32       $4, 0
  ret           $4
.Lset:
  ld.i64        $5, [$0]
  mov.i64       $6, 4
  add.i64       $7, $0, $6
  ld.i64        $8, [$7]
  set           $aarch64_fpsr, $5
  set           $aarch64_fpcr, $8
  mov.i32       $9, 0
  ret           $9
  .end
