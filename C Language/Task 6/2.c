/*
2) Write a C program to implement linear search.
*/
//Program
#include<stdio.h>
void main()
{
 int a[20],n,i,key,flag=0;
 scanf("%d",&n);
 for(i=0;i<n;i++)
 {
 scanf("%d",&a[i]);
 }
 scanf("%d",&key);
 for(i=0;i<n;i++)
 {
 if(a[i]==key)
 {
 printf("Search is successful element is found at position %d",i+1);
 flag+=1;
 break;
 }
 
 }if(flag==0){
 printf("\n Element not found");
 }
}
