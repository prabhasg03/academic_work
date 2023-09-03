/*
b. Write a C program to create a user defined header file to find sum, product and greatest of two 
numbers ?
*/
// header file
#ifndef CALC_H
#define CALC_H
int sum(int a, int b);
int product(int a, int b);
int greatest(int a, int b);
#endif
int sum(int a, int b) {
  return a + b;
}
int product(int a, int b) {
  return a * b;
}
int greatest(int a, int b) {
  if (a > b) {
    return a;
  } else {
    return b;
  }
}
