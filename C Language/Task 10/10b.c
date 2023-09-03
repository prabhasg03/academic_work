/*
b. Write a C program to implement the following using recursive and non-recursive functions to 
find the GCD (greatest common divisor) of two given integers
*/
//Program:
#include<stdio.h>
#include<math.h>
int rec_gcd(int ,int );
int iter_gcd(int ,int );
int main(void)
{
 int a,b;
 scanf("%d%d",&a,&b);
 printf("GCD of %d and %d Using Recursive Function is:%d",a,b,rec_gcd(a,b));
 
 printf("\nGCD of %d and %d Using Non-Recursive Function is:%d",a,b,iter_gcd(a,b));
 return(0);
}
int rec_gcd(int n1,int n2)
{ 
 
 if(n2>n1)
 return rec_gcd(n2,n1);
 if(n2==0)
 return n1;
 else 
 return rec_gcd(n2,n1%n2);
}
 int iter_gcd(int num1, int num2)
{
int i, gcd;
if(num1 < num2)
{
for(i = 1; i <= num1; i++)
{
if((num1 % i == 0) && (num2 % i == 0))
gcd = i;
}
}
else
{
for(i = 1; i <= num2; i++)
{
if((num1 % i == 0) && (num2 % i == 0))
gcd = i;
}
}
return gcd;
}
