//a. Write a C program to implement matrix addition
//Program
#include<stdio.h>
void main()
{
int r1,r2,c1,c2,a[6][6],b[6][6],c[6][6],i,j;
scanf("%d%d",&r1,&c1);
scanf("%d%d",&r2,&c2);
if(r1==r2&&c1==c2)
{
for(i=0;i<r1;i++)
{
for(j=0;j<c1;j++)
scanf("%d",&a[i][j]);
}
for(i=0;i<r2;i++)
{
for(j=0;j<c2;j++)
scanf("%d",&b[i][j]);
}
for(i=0;i<r1;i++)
{
for(j=0;j<c1;j++)
c[i][j]=a[i][j]+b[i][j];
}
printf("\nresultant matrix is:");
for(i=0;i<r1;i++)
{
for(j=0;j<c1;j++)
{
printf("%d ",c[i][j]);
}
printf("\n");
}
}
else
printf("matrix addition is not possible");
}
