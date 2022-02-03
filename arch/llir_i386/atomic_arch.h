#define a_cas a_cas
static inline int a_cas(volatile int *p, int t, int s)
{
	__asm__ __volatile__
		( "x86_cmp_xchg.i32  %0, %1, %3, %2"
		: "=r"(t)
		: "r"(p), "r"(t), "r"(s)
		: "memory"
		);
	return t;
}

#define a_swap a_swap
static inline int a_swap(volatile int *p, int v)
{
	__asm__ __volatile__
		( "x86_xchg.i32 %0, %1, %2"
		: "=r"(v)
		: "r"(p), "r"(v)
		: "memory"
		);
	return v;
}

#define a_barrier a_barrier
static inline void a_barrier()
{
	__asm__ __volatile__( "" : : : "memory" );
}

#define a_spin a_spin
static inline void a_spin()
{
	__asm__ __volatile__( "x86_pause" : : : "memory" );
}

#define a_crash a_crash
static inline void a_crash()
{
	__asm__ __volatile__( "x86_hlt; trap" : : : "memory" );
}

#define a_ctz_64 a_ctz_64
static inline int a_ctz_64(uint64_t x)
{
	return __builtin_ctzll(x);
}

#define a_ctz_32 a_ctz_32
static inline int a_ctz_32(uint32_t x)
{
	return __builtin_ctz(x);
}

#define a_clz_32 a_clz_32
static inline int a_clz_32(uint32_t x)
{
	return __builtin_clz(x);
}
