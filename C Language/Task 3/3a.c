//3a. Write a C program to find the roots of a quadratic equation using if-else.
//Program:
#include<stdio.h>
#include<math.h>
void main()
{
float a,b,c,disc,root1,root2,d;
scanf("%f %f %f", &a, &b, &c);
disc = ((b*b)-(4*a*c));
if(disc > 0)
{
root1 = (-b + sqrt(disc))/(2*a);
root2 = (-b - sqrt(disc))/(2*a);
printf("root1=%.3f\n",root1);
printf("root2=%.3f\n",root2);
}
else if(disc == 0)
{
root1 = (-b/(2*a)); 
root2 = (-b/(2*a));
printf("root1 = %.3f\n",root1);
 printf("root2 = %.3f\n",root2);
}
else
{
d=sqrt(-disc);
printf("root1 = %.3f + i %.3f\n",((-b)/(2*a)),(d/(2*a)));
printf("root2 = %.3f - i %.3f\n",((-b)/(2*a)),(d/(2*a)));
}
}
