#define __SYSCALL_LL_E(x) (x)
#define __SYSCALL_LL_O(x) (x)

static inline long __syscall0(long n)
{
	__builtin_trap();
}

static inline long __syscall1(long n, long a)
{
	__builtin_trap();
}

static inline long __syscall2(long n, long a, long b)
{
	__builtin_trap();
}

static inline long __syscall3(long n, long a, long b, long c)
{
	__builtin_trap();
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
	__builtin_trap();
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
	__builtin_trap();
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
	__builtin_trap();
}

#define SO_RCVTIMEO_OLD  18
#define SO_SNDTIMEO_OLD  19
