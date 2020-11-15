#include <math.h>

#if __riscv_flen >= 32

float copysignf(float x, float y)
{
	__asm__ ("copysign.f32 %0, %1, %2" : "=r"(x) : "r"(x), "r"(y));
	return x;
}

#else

#include "../copysignf.c"

#endif
