//b. Write a C Program check whether a given number is palindrome number or no
//Program
#include<stdio.h> 
void main() 
{ 
int num,rem,sum=0,temp; 
scanf("%d",&num); 
temp=num; 
while(num!=0) 
{ 
rem=num%10; 
sum=(sum*10)+rem; 
num=num/10; 
} 
if(temp==sum) 
printf("%d is a Palindrome.",temp); 
else 
printf("%d is not a Palindrome.",temp); 
}
