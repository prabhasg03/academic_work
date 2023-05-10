/* Write a C program to implement Bubble sort with passes

Test Cases:
input = 5
23 16 78 14 10

THE  UNSORTED LIST
23	16	78	14	10	
PASS - 1 :16	23	14	10	78	
PASS - 2 :16	14	10	23	78	
PASS - 3 :14	10	16	23	78	
PASS - 4 :10	14	16	23	78	

THE  SORTED LIST - BUBBLE SORT
10	14	16	23	78	
*/
//Start writing program from here
#include<stdio.h>
void bubblesort(int a[],int n);
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
bubblesort(a,n); // calling to sort 
printf("\nTHE  SORTED LIST - BUBBLE SORT\n");
display(a,n);
return 0;
}
void bubblesort(int a[],int n)
{
int i,j,temp;
for(i=0;i<n-1;i++)
{
for(j=0; j<n-i-1;j++)
{
if(a[j] >a[j+1])
{
  temp=a[j];
 a[j]=a[j+1];
 a[j+1]=temp;
}
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