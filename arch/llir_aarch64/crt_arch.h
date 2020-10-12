__asm__(
"  .section .text \n"
"  .weak _DYNAMIC \n"
"  .hidden _DYNAMIC, \".text\" \n"
"  .globl " START " \n"
START ": \n"
// TODO
"   trap\n"
"   .end\n"
);
