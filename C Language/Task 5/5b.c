/*
b. Write a C program to generate the prime numbers between x and y where x and y are starting 
and ending values to be supplied by the user.
*/
//Program:
#include<stdio.h>
int main()
{
 int x,y,i,j,c;
 scanf("%d%d",&x,&y);
 for(i=x;i<=y;i++)
 {
 c=1;
 for(j=2;j<i;j++)
 {
 if(i%j==0)
 {
 c++;
 }
 }
 if(c==1)
 {
 printf("%d ",i);
 }
 }
}
