#define LDSO_ARCH "x86_64"

#define REL_SYMBOLIC    R_X86_64_64
#define REL_OFFSET32    R_X86_64_PC32
#define REL_GOT         R_X86_64_GLOB_DAT
#define REL_PLT         R_X86_64_JUMP_SLOT
#define REL_RELATIVE    R_X86_64_RELATIVE
#define REL_COPY        R_X86_64_COPY
#define REL_DTPMOD      R_X86_64_DTPMOD64
#define REL_DTPOFF      R_X86_64_DTPOFF64
#define REL_TPOFF       R_X86_64_TPOFF64
#define REL_TLSDESC     R_X86_64_TLSDESC

#define CRTJMP(pc,sp) __asm__ __volatile__ \
  ( "raise %0, %1\n" \
  : \
  : "r"(pc), "r"(sp) \
  : "memory" \
  )

#define GETFUNCSYM(fp, sym, got) __asm__ \
  ( "mov.i64 %0, " #sym "\n" \
	: "=r"(*fp) \
  : \
  : "memory" \
  )
