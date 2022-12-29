#include <stdio.h>

typedef int (*myFuncDef)();

void __attribute__ ((noinline)) indirectionTwo() {
    myFuncDef funcPtr = NULL;
    fprintf(stderr, "Here: %d \n", funcPtr());
}


void __attribute__ ((noinline)) indirectionOne() {
    indirectionTwo();
}

void crash_now() {
    indirectionOne();
}
