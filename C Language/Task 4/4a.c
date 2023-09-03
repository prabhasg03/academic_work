//a. Write a C Program check whether a given number is perfect number or not.
//Program:
#include<stdio.h>
void main()
 {
 int n,i,r=0;
 //printf("enter n:");
 scanf("%d",&n);
 for(i=1;i<=n;i++){
 if(n%i==0)
 r=r+i;
 }
 if(r==2*n)
 printf("%d is a perfect number",n);
 else
 printf("%d is not a perfect number",n);
 }
