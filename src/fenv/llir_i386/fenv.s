  .section .text
  .globl feclearexcept
feclearexcept:
  .args         i32
  trap
  .end

  .globl feraiseexcept
feraiseexcept:
  .args         i32
  trap
  .end

  .globl __fesetround
  .hidden __fesetround
__fesetround:
  .args         i32
  trap
  .end

  .globl fegetround
fegetround:
  trap
  .end

  .globl fegetenv
fegetenv:
  .args         i32
  trap
  .end

  .globl fesetenv
fesetenv:
  .args         i32
  trap
  .end

  .globl fetestexcept
fetestexcept:
  .args         i32
  trap
  .end
