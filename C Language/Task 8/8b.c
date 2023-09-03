/*
b. Write a C program to read first name , middle name and last name of a student and display a 
string full name without using string handling functions
*/
//Program:
#include<stdio.h>
void main()
{
 char s1[30],s2[30],s3[30],s4[100];
 int i,j=0;
 scanf("%s",s1);
 scanf("%s",s2);
 scanf("%s",s3);
 for(i=0;s1[i]!='\0';i++)
 {
 s4[j]=s1[i];
 j++;
 }
 s4[j]=' ';
 j+=1;
 for(i=0;s2[i]!='\0';i++)
 {
 s4[j]=s2[i];
 j++;
 }
 s4[j]=' ';
 j+=1;
 for(i=0;s3[i]!='\0';i++)
 {
 s4[j]=s3[i];
 j++;
 }
 s4[j]='\n';
 printf("Student Full Name is:");
 for(i=0;s4[i]!='\n';i++)
 {
 printf("%c",s4[i]);
 }
}
