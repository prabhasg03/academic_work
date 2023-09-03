/*
b. Write a C program to display binary equivalent of a given decimal number.
*/
//Program:
#include <stdio.h>
#include <math.h>
long convert(int);
int main() {
long int n,b;
 scanf("%ld",&n);
 b=convert(n);
 printf("Decimal Number=%ld its Binary equivalent=%ld",n,b);
 return 0;
}
long convert(int n) {
long b= 0;
int r, i = 1;
while (n!=0) {
 r = n % 2;
 n /= 2;
 b += r* i;
 i *= 10;
 }
return b;
}
