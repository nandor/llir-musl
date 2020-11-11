struct user_pt_regs {
	unsigned long gpr[32];
	unsigned long nip;
	unsigned long msr;
	unsigned long orig_gpr3;
	unsigned long ctr;
	unsigned long link;
	unsigned long xer;
	unsigned long ccr;
	unsigned long softe;
	unsigned long trap;
	unsigned long dar;
	unsigned long dsisr;
	unsigned long result;
};

struct pt_regs {
	union {
		struct user_pt_regs user_regs;
		struct {
			unsigned long gpr[32];
			unsigned long nip;
			unsigned long msr;
			unsigned long orig_gpr3;
			unsigned long ctr;
			unsigned long link;
			unsigned long xer;
			unsigned long ccr;
			unsigned long softe;
			unsigned long trap;
			unsigned long dar;
			unsigned long dsisr;
			unsigned long result;
		};
	};

	union {
		struct {
			unsigned long ppr;
			unsigned long kuap;
		};
		unsigned long __pad[2];
	};
};

struct user_fpu_struct {
  unsigned long fp_regs[16];
  unsigned long xfp_regs[16];
  unsigned long fpscr;
  unsigned long fpul;
};
typedef struct user_fpu_struct elf_fpregset_t;

struct user {
  struct pt_regs regs;
  struct user_fpu_struct fpu;
  int u_fpvalid;
	unsigned long u_tsize, u_dsize, u_ssize;
	unsigned long start_code, start_data, start_stack;
	long signal;
	void *u_ar0;
	unsigned long magic;
	char u_comm[32];
};

#define ELF_NGREG 48
#define ELF_NFPREG 33
#define ELF_NVRREG 34
typedef unsigned long elf_greg_t, elf_gregset_t[ELF_NGREG];
typedef struct { unsigned u[4]; }
#ifdef __GNUC__
__attribute__((__aligned__(16)))
#endif
	elf_vrreg_t, elf_vrregset_t[ELF_NVRREG];
