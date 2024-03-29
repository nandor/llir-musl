#ifdef __riscv_flen

.globl feclearexcept
feclearexcept:
  .args         i32
  .features     "", "", "+d,+f"
  arg.i32       $0, 0
  x_ext.i64      $1, $0
  get.i64       $2, $riscv_fflags
  xor.i64       $3, $2, $1
  set           $riscv_fflags, $3
  mov.i32       $4, 0
  ret           $4
  .end

.globl feraiseexcept
feraiseexcept:
  .args         i32
  .features     "", "", "+d,+f"
  arg.i32       $0, 0
  x_ext.i64      $1, $0
  get.i64       $2, $riscv_fflags
  or.i64        $3, $2, $1
  set           $riscv_fflags, $3
  mov.i32       $4, 0
  ret           $4
  .end

.globl fetestexcept
fetestexcept:
  .args         i32
  .features     "", "", "+d,+f"
  arg.i32       $0, 0
  get.i64       $1, $riscv_fflags
  trunc.i32     $2, $1
  and.i32       $3, $0, $2
  ret           $3
  .end

.globl fegetround
fegetround:
  .features     "", "", "+d,+f"
  get.i64         $1, $riscv_frm
  trunc.i32       $2, $1
  ret             $2
  .end

.globl __fesetround
__fesetround:
  .args         i32
  .features     "", "", "+d,+f"
  arg.i32       $0, 0
  x_ext.i64      $1, $0
  set           $riscv_frm, $1
  mov.i32       $2, 0
  ret           $2
  .end

.globl fegetenv
fegetenv:
  .args           i64
  .features     "", "", "+d,+f"
  arg.i64         $0, 0
  get.i64         $1, $riscv_fcsr
  trunc.i32       $2, $1
  store           [$0], $2
  mov.i32         $3, 0
  ret             $3
  .end

.globl fesetenv
fesetenv:
  .args         i64
  .features     "", "", "+d,+f"
  arg.i64       $0, 0
  mov.i64       $1, 0xFFFFFFFF
  cmp.eq.i32    $2, $0, $1
  jump_cond     $2, .Lclear, .Lset
.Lclear:
  mov.i64       $3, 0
  jump          .Ljoin
.Lset:
  load.i64      $4, [$0]
  jump          .Ljoin
.Ljoin:
  phi.i64       $5, .Lclear, $3, .Lset, $4
  set           $riscv_fcsr, $5
  mov.i32       $4, 0
  ret           $4
  .end

#endif
