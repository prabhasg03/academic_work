//a. Write a C program to implement matrix multiplication
//Program
#include<stdio.h>
void main()
{
int r1,r2,c1,c2,i,j,k;
scanf("%d %d %d %d",&r1,&c1,&r2,&c2);
int a[r1][c1],b[r2][c2],c[r1][c2];
if(c1==r2)
{
for(i=0;i<r1;i++)
{
for(j=0;j<c1;j++)
{
scanf("%d",&a[i][j]);
}
}
for(i=0;i<r2;i++)
{
for(j=0;j<c2;j++)
{
scanf("%d",&b[i][j]);
}
}
for(i=0;i<r1;i++)
{
for(j=0;j<c2;j++)
{
c[i][j]=0;
for(k=0;k<c1;k++)
{
c[i][j]=c[i][j]+(a[i][k]*b[k][j]);
}
}
}
printf("\n resultant matrix is:");
for(i=0;i<r1;i++)
{
printf("\n");
for(j=0;j<c2;j++)
{
printf("%d ",c[i][j]);
}
}
}
else{
printf("\n matrix multiplication is not possible");
}
}
