#ifndef CALC_H
#define CALC_H

typedef enum {
    OPTION_EXIT = 0,
    OPTION_ADD = 1,
    OPTION_SUB = 2,
    OPTION_MUL = 3,
    OPTION_DIV = 4,
    OPTION_FACTORIAL = 5,
    OPTION_SQRT = 6
} MenuOption;


void calc_add(double a, double b);
void calc_sub(double a, double b);
void calc_mul(double a, double b);
void calc_div(double a, double b);
void calc_factorial(int n);
void calc_sqrt(double x);

#endif
