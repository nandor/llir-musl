#define a_ll a_ll
static inline int a_ll(volatile int *p)
{
	__builtin_trap();
}

#define a_sc a_sc
static inline int a_sc(volatile int *p, int v)
{
	__builtin_trap();
}

#define a_barrier a_barrier
static inline void a_barrier()
{
	__builtin_trap();
}

#define a_cas a_cas
static inline int a_cas(volatile int *p, int t, int s)
{
	__builtin_trap();
}

#define a_ll_p a_ll_p
static inline void *a_ll_p(volatile void *p)
{
	__builtin_trap();
}

#define a_sc_p a_sc_p
static inline int a_sc_p(volatile int *p, void *v)
{
	__builtin_trap();
}

#define a_cas_p a_cas_p
static inline void *a_cas_p(volatile void *p, void *t, void *s)
{
	__builtin_trap();
}
