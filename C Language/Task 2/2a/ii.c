//Write a C program to swap two numbers using the following .
//ii. Without using third variable
//Program
#include<stdio.h>
void main()
{
 int a,b;
 //printf("Enter a,b");
 scanf("%d%d",&a,&b);
 b=a+b;
 a=b-a;
 b=b-a;
 printf("%d %d",a,b);
}
