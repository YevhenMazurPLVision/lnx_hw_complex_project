#include "calc.h"
#include <stdio.h>

void calc_add(double a, double b) {
    printf("%f\n", a + b);
}

void calc_sub(double a, double b) {
    printf("%f\n", a - b);
}

void calc_mul(double a, double b) {
    printf("%f\n", a * b);
}

void calc_div(double a, double b) {
    if (b == 0) {
        printf("B cant be 0\n");
        return;
    }
    printf("%f\n", a / b);
}
