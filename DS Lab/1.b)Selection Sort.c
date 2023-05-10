/* Write a C program to implement Selection sort with passes

Test Cases:
input:
5
10 9 8 7 6
output:
THE  UNSORTED LIST
10	9	8	7	6	
PASS - 1 :6	9	8	7	10	
PASS - 2 :6	7	8	9	10	
PASS - 3 :6	7	8	9	10	
PASS - 4 :6	7	8	9	10	

THE  SORTED LIST - SELECTION SORT
6	7	8	9	10	

*/
//Start writing program from here
#include<stdio.h>
void selectionsort(int a[],int n);
void display(int a[],int n);
int main()
{
int a[15],n,i;
printf("\n Enter n - number of elements to sort:");
scanf("%d",&n);
printf("\n Enter %d elements into the list : ",n);
for(i=0;i<n;i++)
scanf("%d",&a[i]);
printf("\nTHE  UNSORTED LIST\n");
display(a,n);
selectionsort(a,n); // calling to sort 
printf("\nTHE  SORTED LIST - SELECTION SORT\n");
display(a,n);
return 0;
}
void selectionsort(int a[],int n)
{
int min,i,j,temp;
for(i=0;i<n-1;i++)
{
min=i;
for(j=i+1;j<n;j++)
{
if(a[min]>a[j])
{
  min=j;
}
}
if(min!=i)
{
 temp=a[i];
 a[i]=a[min];
 a[min]=temp;
}
printf("PASS - %d :",i+1);
display(a,n);
}
}

void display(int a[],int n)
{
int i;
for(i=0;i<n;i++)
printf("%d\t",a[i]);
printf("\n");
}