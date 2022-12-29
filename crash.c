#include <stdio.h>

char *p;

int __attribute__ ((noinline)) crash_now() {
    *p = '\0';
    return 44;
}

int __attribute__ ((noinline)) indirectionTwo(int a) {
    int j = a;
    for (int i = 0; i < a; i++) {
        j += i;
    }
    return crash_now(j);
}

int __attribute__ ((noinline)) indirectionOne(int a) {
    int j = a;
    for (int i = 0; i < a; i++) {
        j += i;
    }
    return indirectionTwo(j);
}

int __attribute__ ((noinline)) entryPoint() {
    return indirectionOne(44);
}
