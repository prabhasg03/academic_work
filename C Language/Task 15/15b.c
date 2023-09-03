/*
b. Write a C program to find some of n numbers using command line arguments.
*/
//Program:
#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
  if (argc < 2) {
    printf("Usage: %s <number1> <number2> ... <numberN>\n", argv[0]);
    return 1;
  }
  int sum = 0;
  for (int i = 1; i < argc; i++) {
    int n = atoi(argv[i]);
    sum += n;
  }
  printf("The sum is %d\n", sum);
  return 0;
}
