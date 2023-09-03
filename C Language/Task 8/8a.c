/*
a. Write a C program to implement the following string handling functions.
i.strlen() ii.strcpy() iii.strcmp() iv.strcat()
*/
//Program:
#include<stdio.h>
#include<string.h>
void main()
{
 char s1[20],s2[20],s3[7]={' ','G','R','I','E','T','\0'};
 int n,x;
 scanf("%s",s1);
 n=strlen(s1);
 printf("Length of string %s =%d",s1,n);
 strcpy(s2,s1);
 printf("\nOriginal String s1 = %s and Copied String s2 = %s",s1,s2);
 x=strcmp(s1,s2);
 if(x==0)
 printf("\nStrings s1= %s and s2 = %s are identical",s1,s2);
 else
 printf("\nStrings s1= %s and s2 = %s are not identical",s1,s2);
 printf("\nConcatenated String = %s",strcat(s1,s3));
}
