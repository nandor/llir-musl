#define a_barrier a_barrier
static inline void a_barrier()
{
	__asm__ __volatile__ ("riscv_fence" : : : "memory");
}

#define a_cas a_cas
static inline int a_cas(volatile int *p, int t, int s)
{
  __asm__ __volatile__
    ( "riscv_cmp_xchg.i32  %0, %1, %3, %2"
    : "=r"(t)
    : "r"(p), "r"(t), "r"(s)
    : "memory"
    );
  return t;
}

#define a_cas_p a_cas_p
static inline void *a_cas_p(volatile void *p, void *t, void *s)
{
  __asm__
    ( "riscv_cmp_xchg.i64  %0, %1, %3, %2"
    : "=r"(t)
    : "r"(p), "r"(t), "r"(s)
    : "memory"
    );
  return t;
}
