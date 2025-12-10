#include "calc.h"
#include <stdio.h>

void calc_factorial(int n) {
    if (n < 0) {
        printf("n must be >= 0\n");
        return;
    }

    if (n > 20) {
        printf("n is too large (max 20)\n");
        return;
    }

    long long result = 1;
    for (int i = 2; i <= n; i++) {
        result *= i;
    }

    printf("%lld\n", result);
}
