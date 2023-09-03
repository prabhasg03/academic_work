/*
a. Write a C program to display the following patterns.
ii. 1
   2 3
  4 5 6 
 7 8 9 10 
*/
//Program
#include <stdio.h>
void main() {
 int n,i,j,r=1;
 //printf("Enter the n:");
 scanf("%d",&n);
 for (i=1;i<=n;i++){
 for (j=1;j<=i;++j) {
 printf("%d ",r);
 ++r;
 }
 printf("\n");
 }
 }
