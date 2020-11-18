#define a_ll a_ll
static inline int a_ll(volatile int *p)
{
	int v;
  __asm__ __volatile__
    ( "ppc_ll.i32 %0, %1"
    : "=r"(v)
    : "r"(p)
    :
    );
	return v;
}

#define a_ll_p a_ll_p
static inline void *a_ll_p(volatile void *p)
{
	void *v;
  __asm__ __volatile__
    ( "ppc_ll.i64 %0, %1"
    : "=r"(v)
    : "r"(p)
    :
    );
	return v;
}

#define a_sc a_sc
static inline int a_sc(volatile int *p, int v)
{
	int r;
  __asm__ __volatile__
    ( "ppc_sc.i32 %0, %1, %2"
    : "=r"(r)
    : "r"(p), "r"(v)
    : "memory"
    );
	return r;
}

#define a_sc_p a_sc_p
static inline int a_sc_p(volatile void *p, void *v)
{
  int r;
  __asm__ __volatile__
    ( "ppc_sc.i32 %0, %1, %2"
    : "=r"(r)
    : "r"(p), "r"(v)
    : "memory"
    );
	return r;
}

#define a_barrier a_barrier
static inline void a_barrier()
{
	__asm__ __volatile__ ("ppc_sync" : : : "memory");
}

#define a_pre_llsc a_barrier

#define a_post_llsc a_post_llsc
static inline void a_post_llsc()
{
	__asm__ __volatile__ ("ppc_isync" : : : "memory");
}

#define a_crash a_crash
static inline void a_crash()
{
	__builtin_trap();
}
