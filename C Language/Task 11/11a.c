/*
a. Write a C program to implement transpose of a matrix using functions.
*/
//Program:
#include<stdio.h>
void transpose(int a[][10],int trns[][10],int row,int col);
void display(int x[][10],int row,int col);
void main()
{
 int a[10][10],trns[10][10];
 int r,c,i,j;
 scanf("%d %d",&r,&c);
 for(i=0;i<r;i++)
 {
 for(j=0;j<c;j++)
 scanf("%d",&a[i][j]);
 }
 printf("\nOriginal Matrix");
 display(a,r,c);
 transpose(a,trns,r,c);
 printf("\nTranspose Matrix");
 display(trns,c,r); 
}
void transpose(int a[][10],int trns[][10],int row,int col)
{
int i,j; 
for(i=0;i<row;i++) 
{
 for(j=0;j<col;j++)
{
 trns[j][i]=a[i][j];
}
} 
}
void display(int x[][10],int row,int col)
{
 int i,j;
 for(i=0;i<row;i++)
 {
 for(j=0;j<col;j++) 
 {
 printf("\n%3d",x[i][j]); 
 }
 printf("\n");
}}
