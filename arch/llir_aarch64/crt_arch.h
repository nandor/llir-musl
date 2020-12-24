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
"   set.i64 $sp, $3\n"
"   mov.i64 $4, _DYNAMIC\n"
"   mov.i64 $5, " START "_c\n"
"   tcall.c $5, $1, $4\n"
"   .end\n"
);
