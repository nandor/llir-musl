#include <math.h>

#if __riscv_flen >= 64

double sqrt(double x)
{
	__asm__ ("sqrt.f64 %0, %1" : "=r"(x) : "r"(x));
	return x;
}

#else

#include "../sqrt.c"

#endif
