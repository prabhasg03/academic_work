//Write a C program to swap two numbers using the following .
//i. Using third variable
//Program
#include<stdio.h>
void main()
{ 
 int a,b,c;
 scanf("%d%d",&a,&b);
 c = a;
 a = b;
 b = c;
 printf("%d %d",a,b);
}
