//Write a C program to swap two numbers using the following .
//iii.Using bitwise operators
//Program
#include<stdio.h>
void main()
{
 int a,b;
 scanf("%d%d",&a,&b);
 a=a^b;
 b=a^b;
 a=a^b;
 printf("%d %d",a,b);
}
