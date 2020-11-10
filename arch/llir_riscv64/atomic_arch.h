#define a_barrier a_barrier
static inline void a_barrier()
{
	__asm__ __volatile__ ("riscv_fence" : : : "memory");
}

#define a_cas a_cas
static inline int a_cas(volatile int *p, int t, int s)
{
	__builtin_trap();
}

#define a_cas_p a_cas_p
static inline void *a_cas_p(volatile void *p, void *t, void *s)
{
	__builtin_trap();
}
