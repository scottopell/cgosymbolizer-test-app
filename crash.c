#include <stdio.h>

typedef int (*myFuncDef)();

void crash_now(char *b) {
    myFuncDef funcPtr = NULL;
    fprintf(stderr, "Here: %s %d \n", b, funcPtr());
}
