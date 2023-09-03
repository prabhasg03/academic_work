//b. Write a C program to sort list of numbers using pointers.
//Program:
#include <stdio.h>
void bubbleSort(int *arr, int n) {
  int i, j, temp;
  for (i = 0; i < n - 1; i++) {
    for (j = 0; j < n - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

int main() {
  int n, i;
  int *arr;
  printf("Enter the number of elements: ");
  scanf("%d", &n);
  arr = (int *)malloc(n * sizeof(int));
  printf("Enter the elements: ");
  for (i = 0; i < n; i++) {
    scanf("%d", arr + i);
  }
  bubbleSort(arr, n);
  printf("The sorted elements are: ");
  for (i = 0; i < n; i++) {
    printf("%d ", arr[i]);
  }
  printf("\n");
  free(arr);
  return 0;
}
