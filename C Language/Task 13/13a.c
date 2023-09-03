/*
a. Write a C program using functions and pointers that compares two strings to see whether they 
are identical. The function returns 1 if they are identical, 0 otherwise.
*/
//Program:
#include <stdio.h>
int compareStrings(char *str1, char *str2) {
  while (*str1 == *str2 && *str1 != '\0' && *str2 != '\0') {
    str1++;
    str2++;
  }
  return (*str1 == *str2);
}
int main() {
  char str1[100], str2[100];
  printf("Enter the first string: ");
  scanf("%s", str1);
  printf("Enter the second string: ");
  scanf("%s", str2);
  int result = compareStrings(str1, str2);
  if (result) {
    printf("The strings are identical.\n");
  } else {
    printf("The strings are not identical.\n");
  }
  return 0;
}
