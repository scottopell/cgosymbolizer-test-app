#include <stdio.h>

typedef int (*myFuncDef)();

void indirectionTwo() {
    myFuncDef funcPtr = NULL;
    fprintf(stderr, "Here: %d \n", funcPtr());
}


void indirectionOne() {
    indirectionTwo();
}

void crash_now() {
    indirectionOne();
}
