static inline uintptr_t __get_tp()
{
  uintptr_t tp;
	__asm__ ("get.i64 %0, $fs" : "=r" (tp) );
	return tp;
}

#define MC_PC gregs[REG_RIP]
