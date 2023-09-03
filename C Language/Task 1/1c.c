//c. Write a C program to implicit and explicit type conversion in c?
//Program:
#include<stdio.h>
void main()
{
 char ch;
 int i,x;
 float f,c;
 double d;
 long int j;
 scanf(" %c",&ch);
 printf("%d",ch);
 scanf("%d%f%lf%ld",&i,&f,&d,&j);
 x=1/j+i*f-d;
 c= 1/(float)j+i*f-d;
 printf(" x=%d c= %lf",x,c);
}
