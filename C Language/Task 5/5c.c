/*
c. Write a C program to calculate the following Sum: 
   Sum=1+x/1!-x2/2!+x3/3!-x4/4!+…..xn/n!
*/
#include<stdio.h>
#include<math.h>
int main()
{
int i,n;
float x,s=1,t=1;
scanf("%f%d",&x,&n);
for(i=1;i<=n;i++){
 t=t*x/i;
 s+=t;
}
printf("%.3f",s);
 return 0;
}
