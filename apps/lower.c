#include <stdio.h>
#include <string.h>
#include "convert.h"

#define MAX_TEXT_LEN 1024

int main() {
    char buffer[MAX_TEXT_LEN];

    printf("Enter text to convert to lower case:\n");

    if (fgets(buffer, sizeof(buffer), stdin) == NULL) {
        printf("Error reading input\n");
        return 1;
    }

    convert_to_lower(buffer);
    return 0;
}

