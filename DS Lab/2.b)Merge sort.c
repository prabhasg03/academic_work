/* Write a C program to implement MERGE sort with passes.

Test Cases:
input = 7
12 78 56 45 23 100 56 72
OUTPUT=

THE  UNSORTED LIST
12	78	56	45	23	100	72	

 PASS - 12	78	56	45	23	100	72	

 PASS - 12	78	45	56	23	100	72	

 PASS - 12	45	56	78	23	100	72	

 PASS - 12	45	56	78	23	100	72	

 PASS - 12	45	56	78	23	72	100	

 PASS - 12	23	45	56	72	78	100	

THE  SORTED LIST - MERGE SORT
12	23	45	56	72	78	100	


*/
//Start writing program from here
#include<stdio.h>
void mergesort(int a[],int first,int last);  
void merge(int a[],int  first,int mid,int last); 
void display(int a[],int n);
int n;
int main()
{
int a[15],i;
scanf("%d",&n);
for(i=0;i<n;i++)
scanf("%d",&a[i]);
printf("\nTHE  UNSORTED LIST\n");
display(a,n);
mergesort(a,0,n-1); 
printf("\nTHE  SORTED LIST - MERGE SORT\n");
display(a,n);
return 0;
}
void mergesort(int a[],int first,int last)
{
int mid;
if(first<last)
{
mid=(first+last)/2; 
mergesort(a,first,mid);
mergesort(a,mid+1,last); 
merge(a,first,mid,last);
printf("\n PASS - ");
display(a,n);
}
}
void merge(int a[],int  first,int mid,int last)
{
 int i,j,k,b[15];
i=first;
j=mid+1;
k=first;
while(i<=mid&&j<=last)
{
  if(a[i]<a[j])
  {
  b[k++]=a[i++];
  }
 else
  {
  b[k++]=a[j++];
  }
}
while(i<=mid)
{
 b[k++]=a[i++];
}
while(j<=last)
{
b[k++]=a[j++];
}
for(k=first;k<=last;k++)
{
a[k]=b[k];
}
}

void display(int a[],int n)
{
int i;
for(i=0;i<n;i++)
printf("%d\t",a[i]);
printf("\n");
}
