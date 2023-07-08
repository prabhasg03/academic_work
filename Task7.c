#include <stdio.h>

#include <stdlib.h>

int main() {

  int Max[10][10], need[10][10], alloc[10][10], avail[10], completed[10], safeSequence[10];

  int p, r, i, j, process, count;

  count = 0;

  printf("Enter the number of processes (up to 10): ");

  scanf("%d", &p);

  if (p <= 0 || p > 10) {

    printf("Invalid number of processes.\n");

    return 1;

  }

  for (i = 0; i < p; i++) {

    completed[i] = 0; // Initially, no process is completed

  }

  printf("\nEnter the number of resources (up to 10): ");

  scanf("%d", &r);

  if (r <= 0 || r > 10) {

    printf("Invalid number of resources.\n");

    return 1;

  }

  printf("\nEnter the maximum matrix for each process:\n");

  for (i = 0; i < p; i++) {

    printf("For process %d:\n", i + 1);

    for (j = 0; j < r; j++) {

      scanf("%d", &Max[i][j]);

    }

  }

  printf("\nEnter the allocation matrix for each process:\n");

  for (i = 0; i < p; i++) {

    printf("For process %d:\n", i + 1);

    for (j = 0; j < r; j++) {

      scanf("%d", &alloc[i][j]);

    }

  }

  printf("\nEnter the available resources:\n");

  for (i = 0; i < r; i++) {

    scanf("%d", &avail[i]);

  }

  for (i = 0; i < p; i++) {

    for (j = 0; j < r; j++) {

      need[i][j] = Max[i][j] - alloc[i][j]; // Calculate the resource need for each process

    }

  }

  do {

    printf("\nMax matrix:\tAllocation matrix:\n");

    for (i = 0; i < p; i++) {

      for (j = 0; j < r; j++) {

        printf("%d ", Max[i][j]);

      }

      printf("\t\t");

      for (j = 0; j < r; j++) {

        printf("%d ", alloc[i][j]);

      }

      printf("\n");

    }

    process = -1; // Indicates that a process cannot be completed

    for (i = 0; i < p; i++) {

      if (completed[i] == 0) { // If the process is not completed

        int canExecute = 1;

        for (j = 0; j < r; j++) {

          if (avail[j] < need[i][j]) {

            canExecute = 0; // Excess required resources that are not available

            break;

          }

        }

        if (canExecute) {

          process = i; // The ith process can be completed

          break;

        }

      }

    }

    if (process != -1) {

      printf("\nProcess %d runs to completion!", process);

      safeSequence[count] = process; // Add it to the safe sequence

      count++;

      for (j = 0; j < r; j++) {

        avail[j] += alloc[process][j]; // Return the resources

        alloc[process][j] = 0;

        Max[process][j] = 0;

        completed[process] = 1;

      }

    }

  } while (count != p && process != -1);

  if (count == p) {

    printf("\nThe system is in a safe state!\n");

    printf("Safe Sequence: < ");

    for (i = 0; i < p; i++) {

      printf("%d ", safeSequence[i]);

    }

    printf(">\n");

  } else {

    printf("\nThe system is in an unsafe state!\n");

  }

  return 0;

}
