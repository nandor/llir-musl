__asm__(
"  .section .text\n"
"  .extern _DYNAMIC, \".text\"\n"
"  .weak _DYNAMIC\n"
"  .hidden _DYNAMIC\n"
"  .globl " START " \n"
START ": \n"
"   get.i64 $1, $sp\n"
"   mov.i64 $2, -16\n"
"   and.i64 $3, $1, $2\n"
"   mov.i64 $4, 8\n"
"   sub.i64 $5, $3, $4\n"
"   set.i64 $sp, $5\n"
"   mov.i64 $6, _DYNAMIC\n"
"   mov.i64 $7, " START "_c\n"
"   tcall.c $7, $1, $6\n"
"   .end\n"
);
