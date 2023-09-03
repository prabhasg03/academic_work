/*a. Write a C program to implement following pre-processor directives.
 i. define ii. ifdef iii. undef iv. ifndef.
*/
//Program:
#include<stdio.h>
#define MY_CONSTANT 100
int main() {
  int x = MY_CONSTANT;
  #ifdef MY_CONSTANT
    printf("The macro MY_CONSTANT is defined.\n");
  #else
    printf("The macro MY_CONSTANT is not defined.\n");
  #endif
  #undef MY_CONSTANT
  #ifdef MY_CONSTANT
    printf("The macro MY_CONSTANT is defined.\n");
  #else
    printf("The macro MY_CONSTANT is not defined.\n");
  #endif
  return 0;
}
