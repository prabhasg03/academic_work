/*
b. Write a C program that uses structures and functions to perform the following operations: 
 i. Addition of two complex numbers 
 ii. Subtraction of two complex numbers 
 iii. Multiplication of two complex numbers 
*/
//Program:
#include <stdio.h>
typedef struct {
    double real;
    double imag;
} complex;
complex add(complex a, complex b) {
    complex result;
    result.real = a.real + b.real;
    result.imag = a.imag + b.imag;
    return result;
}
complex subtract(complex a, complex b) {
    complex result;
    result.real = a.real - b.real;
    result.imag = a.imag - b.imag;
    return result;
}
complex multiply(complex a, complex b) {
    complex result;
    result.real = a.real * b.real - a.imag * b.imag;
    result.imag = a.real * b.imag + a.imag * b.real;
    return result;
}
void print_complex(complex c) {
    printf("%.2f + %.2fi\n", c.real, c.imag);
}
int main() {
    complex x = {3, 2};
    complex y = {1, 4};
    printf("x = ");
    print_complex(x);
    printf("y = ");
    print_complex(y);
    printf("x + y = ");
    print_complex(add(x, y));
    printf("x - y = ");
    print_complex(subtract(x, y));
    printf("x * y = ");
    print_complex(multiply(x, y));   
    return 0;
}
