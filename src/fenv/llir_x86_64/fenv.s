
  .section .text
  .globl feclearexcept
feclearexcept:
  trap
  .end

  .globl feraiseexcept
feraiseexcept:
  trap
  .end

  .globl __fesetround
  .hidden __fesetround
__fesetround:
  trap
  .end

  .globl fegetround
fegetround:
  trap
  .end

  .globl fegetenv
fegetenv:
  trap
  .end

  .globl fesetenv
fesetenv:
  trap
  .end

  .globl fetestexcept
fetestexcept:
  trap
  .end
