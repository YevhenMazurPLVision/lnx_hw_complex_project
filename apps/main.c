#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

#include "calc.h"

void print_menu() {
    printf("\n===== CALCULATOR =====\n");
    printf("1. Addition (a + b)\n");
    printf("2. Subtraction (a - b)\n");
    printf("3. Multiplication (a * b)\n");
    printf("4. Division (a / b)\n");
    printf("5. Factorial (n!)\n");
    printf("6. Square root (sqrt(x))\n");
    printf("0. Exit\n");
    printf("Choose option: ");
}

void clear_stdin() {
    int c;
    while ((c = getchar()) != '\n' && c != EOF) {}
}

double read_double(const char *prompt) {
    double value;
    int result;

    while (1) {
        printf("%s", prompt);
        result = scanf("%lf", &value);

        if (result == 1) {
            clear_stdin();
            return value;
        }

        printf("Error: please enter a valid number.\n");
        clear_stdin();
    }
}

int read_int(const char *prompt) {
    int value;
    int result;

    while (1) {
        printf("%s", prompt);
        result = scanf("%d", &value);

        if (result == 1) {
            clear_stdin();
            return value;
        }

        printf("Error: please enter a valid integer.\n");
        clear_stdin();
    }
}

int main() {
    while(1) {
        print_menu();
        int option = read_int("");

        if (option == 0) {
            printf("Programe has finished!\n");
            break;
        }

        switch(option) {
            case 1: {
                double a = read_double("Enter a: ");
                double b = read_double("Enter b: ");
                calc_add(a, b);
                break;
            }
            case 2: {
                double a = read_double("Enter a: ");
                double b = read_double("Enter b: ");
                calc_sub(a, b);
                break;
            }
            case 3: {
                double a = read_double("Enter a: ");
                double b = read_double("Enter b: ");
                calc_mul(a, b);
                break;
            }
            case 4: {
                double a = read_double("Enter a: ");
                double b = read_double("Enter b: ");
                calc_div(a, b);
                break;
            }
            case 5: {
                int n = read_int("Enter int n >= 0: ");
                calc_factorial(n);
                break;
            }
            case 6: {
                double x = read_double("Enter double x >= 0: ");
                calc_sqrt(x);
                break;
            }
            default: {
                printf("Invalid option\n");
                break;
            }
        }
    }
    return 0;
}
