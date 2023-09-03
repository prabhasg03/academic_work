#include<stdio.h>
void main()
{
 int a,b,c,max,min;
 //printf("Enter a,b,c");
 scanf("%d%d%d",&a,&b,&c);
 max=a>b?a>c?a:c:b>c?b:c;
 min=a<b?a<c?a:c:b<c?b:c;
 printf("%d %d",max,min);
}
