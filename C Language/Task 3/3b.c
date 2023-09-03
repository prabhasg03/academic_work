/*b. The program should request the user to input two numbers and display one of the following as 
per the desire of user. 
(a). Sum of numbers 
(b) difference of numbers 
(c) product of the numbers 
(d)division of the numbers. 
Write a C program using switch statement to accomplish the above task*/
//Program:
#include<stdio.h>
#include<stdlib.h>
void main()
{
 int a,b,r;
 char n;
 scanf("%d %d",&a,&b);
 scanf("\n%c",&n);
 switch(n)
 {
 case'1':r=a+b;
 printf("\n%d",r);
 break;
 case'2':r=a-b;
 printf("\n%d",r);
 break;
 case'3':r=a*b;
 printf("\n%d",r);
 break;
 case'4':r=a/b;
 printf("\n%d",r);
 break;
 default:printf("wrong choice");
 break;
 }
}
