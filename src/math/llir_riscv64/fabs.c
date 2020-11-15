#include <math.h>

#if __riscv_flen >= 64

double fabs(double x)
{
	__asm__ ("abs.f64 %0, %1" : "=r"(x) : "r"(x));
	return x;
}

#else

#include "../fabs.c"

#endif
