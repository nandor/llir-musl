#include <math.h>

#if __riscv_flen >= 32

float copysignf(float x, float y)
{
	__asm__ ("copy_sign.f32 %0, %1, %2" : "=r"(x) : "r"(x), "r"(y));
	return x;
}

#else

#include "../copysignf.c"

#endif
