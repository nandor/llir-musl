#include <math.h>

#if __riscv_flen >= 32

float fabsf(float x)
{
	__asm__ ("abs.f32 %0, %1" : "=r"(x) : "r"(x));
	return x;
}

#else

#include "../fabsf.c"

#endif
