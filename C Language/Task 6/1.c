/*
1) Write a C program to find sum, average and minimum and maximum in a list of numbers.
*/
//Program:
#include<stdio.h>
void main()
{
 int n,sum=0,min,max,i,j=0,k=0;
 float avg;
 scanf("%d",&n);
 int a[n];
 for(i=0;i<n;i++)
 {
 scanf("%d",&a[i]);
 }
 for(i=0;i<n;i++)
 {
 sum=sum+a[i];
 
 }
 avg=sum/n;
 min=max=a[0];
 for(i=0;i<n;i++)
 {
 if(a[i]<min)
 min=a[i];
 if(a[i]>max)
 max=a[i];
 }
 for(i=0;i<n;i++)
 {
 if(max==a[i])
 {
 break;
 }
 else
 j++;
 }
 for(i=0;i<n;i++)
 {
 if(min==a[i])
 {
 break;
 }
 else
 k++;
 }
 printf("Sum = %d\n",sum);
 printf("Avg = %f\n",avg);
 printf("Min element is %d found at a[%d]\n",min,k);
 printf("Max element is %d found at a[%d]\n",max,j);
}
