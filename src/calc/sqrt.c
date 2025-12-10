#include "calc.h"
#include <stdio.h>
#include <math.h>

void calc_sqrt(double x) {
    if (x < 0) {
        printf("x must be >= 0\n");
        return;
    }

    printf("%f\n", sqrt(x));
}
