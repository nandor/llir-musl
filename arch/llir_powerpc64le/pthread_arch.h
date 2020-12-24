static inline uintptr_t __get_tp()
{
  uintptr_t tp;
  __asm__ ("get.i64 %0, $fs" : "=r" (tp) );
  return tp;
}

#define TLS_ABOVE_TP
#define GAP_ABOVE_TP 0

#define TP_OFFSET 0x7000
#define DTP_OFFSET 0x8000

// the kernel calls the ip "nip", it's the first saved value after the 32
// GPRs.
#define MC_PC gp_regs[32]
