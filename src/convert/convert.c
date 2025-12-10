#include <stdio.h>
#include <ctype.h>
#include "convert.h"

void convert_to_upper(const char *text) {
    if (text == NULL) {
        printf("Error: text is NULL\n");
        return;
    }

    for (int i = 0; text[i] != '\0'; i++) {
        putchar(toupper((unsigned char)text[i]));
    }
    putchar('\n');
}

void convert_to_lower(const char *text) {
    if (text == NULL) {
        printf("Error: text is NULL\n");
        return;
    }

    for (int i = 0; text[i] != '\0'; i++) {
        putchar(tolower((unsigned char)text[i]));
    }
    putchar('\n');
}

