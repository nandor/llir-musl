#include <math.h>

#if __riscv_flen >= 32

float sqrtf(float x)
{
	__asm__ ("sqrt.f32 %0, %1" : "=r"(x) : "r"(x));
	return x;
}

#else

#include "../sqrtf.c"

#endif
