/* Write a C program to implement Insertion sort with passes.

Test Cases:
input = 5
12 78 45 2 18
output =
THE  UNSORTED LIST
12	78	45	2	18	
PASS - 1 :12	78	45	2	18	
PASS - 2 :12	45	78	2	18	
PASS - 3 :2	12	45	78	18	
PASS - 4 :2	12	18	45	78	

THE  SORTED LIST - INSERTION SORT
2	12	18	45	78	


*/
//Start writing program from here
#include<stdio.h>
void insertionsort(int a[],int n);
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
insertionsort(a,n); // calling to sort 
printf("\nTHE  SORTED LIST - INSERTION SORT\n");
display(a,n);
return 0;
}
void insertionsort(int a[],int n)
{
int i,j,temp;
for(i=1;i<n;i++)
{
temp=a[i];
for(j=i-1; j>=0&&a[j]>=temp;j--)
{
    a[j+1]=a[j];
}
a[j+1]=temp;
printf("PASS - %d :",i);
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