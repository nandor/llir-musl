#include <math.h>

#if __riscv_flen >= 64

double copysign(double x, double y)
{
	__asm__ ("copy_sign.f64 %0, %1, %2" : "=r"(x) : "r"(x), "r"(y));
	return x;
}

#else

#include "../copysign.c"

#endif
