//Write a C program to implement operators in c?
//Program:
#include <stdio.h>

int main() {
    int a = 5, b = 3;
    printf("a + b = %d\n", a + b);
    printf("a - b = %d\n", a - b);
    printf("a * b = %d\n", a * b);
    printf("a / b = %d\n", a / b);
    printf("a %% b = %d\n", a % b);
    printf("a++ = %d\n", a++);
    printf("--b = %d\n", --b);
    printf("a == b: %s\n", a == b ? "true" : "false");
    printf("a != b: %s\n", a != b ? "true" : "false");
    printf("a > b: %s\n", a > b ? "true" : "false");
    printf("a < b: %s\n", a < b ? "true" : "false");
    printf("a >= b: %s\n", a >= b ? "true" : "false");
    printf("a <= b: %s\n", a <= b ? "true" : "false");
    return 0;
}
