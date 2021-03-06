  .section .text
  .globl __tlsdesc_static
  .hidden __tlsdesc_static
__tlsdesc_static:
  trap
  .end

  .section .text
  .globl __tlsdesc_dynamic
  .hidden __tlsdesc_dynamic
__tlsdesc_dynamic:
  trap
  .end
