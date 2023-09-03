//Write a C program to implement operators in c?
//Program:
#include <stdio.h>

int main() {
  int a, b;
  char operator;

  printf("Enter two integers: ");
  scanf("%d %d", &a, &b);

  printf("Enter an operator (+, -, *, /, %): ");
  scanf(" %c", &operator);

  switch (operator) {
    case '+':
      printf("%d %c %d = %d\n", a, operator, b, a + b);
      break;
    case '-':
      printf("%d %c %d = %d\n", a, operator, b, a - b);
      break;
    case '*':
      printf("%d %c %d = %d\n", a, operator, b, a * b);
      break;
    case '/':
      printf("%d %c %d = %d\n", a, operator, b, a / b);
      break;
    case '%':
      printf("%d %c %d = %d\n", a, operator, b, a % b);
      break;
    default:
      printf("Invalid operator.\n");
      break;
  }

  return 0;
}
