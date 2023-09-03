/*
Write a C program to merge two files into a third file.
*/
//Program:
#include <stdio.h>
#include <stdlib.h>
void merge_files(char *file1, char *file2, char *file3) {
  // Open the two files in read mode.
  FILE *fp1 = fopen(file1, "r");
  FILE *fp2 = fopen(file2, "r");
  // Create a new file in write mode.
  FILE *fp3 = fopen(file3, "w");
  // Read the contents of the first file.
  char c;
  while ((c = fgetc(fp1)) != EOF) {
    fputc(c, fp3);
  }
  // Read the contents of the second file.
  while ((c = fgetc(fp2)) != EOF) {
    fputc(c, fp3);
  }
  // Close all files.
  fclose(fp1);
  fclose(fp2);
  fclose(fp3);
}
int main() {
  // Get the names of the two files to be merged.
  char *file1 = "file1.txt";
  char *file2 = "file2.txt";
  char *file3 = "file3.txt";
  // Merge the two files.
  merge_files(file1, file2, file3);
  // Print a message to indicate that the files have been merged.
  printf("The files have been merged successfully.\n");
  return 0;
}
