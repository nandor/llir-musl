  .section .text
  .globl fegetround
fegetround:
  trap
  .end

  .section .text
  .globl __fesetround
  .hidden __fesetround
__fesetround:
  trap
  .end

  .section .text
  .globl fetestexcept
fetestexcept:
  trap
  .end

  .section .text
  .globl feclearexcept
feclearexcept:
  trap
  .end

  .section .text
  .globl feraiseexcept
feraiseexcept:
  trap
  .end

  .section .text
  .globl fegetenv
fegetenv:
  trap
  .end

  .section .text
  .globl fesetenv
fesetenv:
  trap
  .end
