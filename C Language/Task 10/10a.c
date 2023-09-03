/*
a. Write a C program to implement the following using recursive and non-recursive functions to 
find the factorial of a given integer. 
*/
//Program:
#include <stdio.h>
long int rec_fact(int n);
long int iter_fact(int n);
void main ()
{
 int n;
 scanf("%d",&n);
 if(n==0)
 printf("\nFactorial of 0 is 1\n");
 else
 {
 printf("\nFactorial of %d Using Recursive Function is: %ld",n,rec_fact(n));
 printf("\nFactorial of %d Using Recursive Function is: %ld",n,iter_fact(n));
 }
 
}
long int rec_fact(int n)
{
 long int fact=0;
 if(n==1)
 return (1);
 else
 fact= n*rec_fact(n-1);
 return (fact);
}
//iteractive funtion (non - recursive)
long int iter_fact(int n)
{
 long int fact =1;
 int i;
 for(i=1;i<=n;i++)
 fact*=i;
 return (fact);
}
