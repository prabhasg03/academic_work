//c. Write a C Program check whether a given number is Armstrong numberor not
//Program
#include<stdio.h> 
void main() 
{ 
int num,sum=0,temp; 
scanf("%d",&num); 
temp=num; 
while(num>0) 
{ 
sum=sum+((num%10)*(num%10)*(num%10)); 
num=num/10; 
} 
if(temp==sum) 
printf("%d is an armstrong number",num); 
else 
printf("%d is not an armstrong number",num); 
}
