/*
b. Write a C program to create a user defined header file to find sum, product and greatest of two 
numbers ?
*/
//Program
#include "calc.h"
int main() {
  int a, b;
  printf("Enter two numbers: ");
  scanf("%d %d", &a, &b);
  int sum = sum(a, b);
  int product = product(a, b);
  int greatest = greatest(a, b);
  printf("The sum of the numbers is %d.\n", sum);
  printf("The product of the numbers is %d.\n", product);
  printf("The greatest of the numbers is %d.\n", greatest);
  return 0;
}
