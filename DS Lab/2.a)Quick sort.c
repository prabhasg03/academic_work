/* Write a C program to implement QUICK sort with passes.

 Test Cases:
input =5
23 45 19 10 43

OUTPUT=
THE  UNSORTED LIST
23	45	19	10	43	

 PASS -  : 19	10	23	45	43	

 PASS -  : 10	19	23	45	43	

 PASS -  : 10	19	23	43	45	

THE  SORTED LIST - QUICK SORT
10	19	23	43	45	
 
*/
//Start writing program from here
#include<stdio.h>
int n; 
void quicksort(int a[],int low, int high);
void display(int a[],int n);
int main()
{
int a[20],i;
scanf("%d",&n);
for(i=0;i<n;i++)
{
scanf("%d",&a[i]);
}
printf("\nTHE UNSORTED LIST\n");
display(a,n);
quicksort(a,0,n-1);
printf("\nTHE  SORTED LIST - QUICK SORT\n");
display(a,n);
return 0;
}

void display(int a[],int n)
{
int i;
for(i=0;i<n;i++)
printf("%d\t",a[i]);
printf("\n");
}
void quicksort(int a[],int low, int high)
{
    int i,j,temp,pivot;
    if(low< high) 
    {
      pivot=a[low];
      i=low;
      j=high;
      
      while(i<j)
      {
        while(a[i] <=pivot && i<=high)  
          i++;
         while(a[j]>pivot)
         j--;
         if(i<j)
         {
             temp=a[i];
             a[i]=a[j];
             a[j]=temp;
         }     
      }
        temp=a[low];
        a[low]=a[j];
        a[j]=temp;
        printf("\n PASS -  :  ");
        display(a,n); 
      quicksort(a,low,j-1); 
      quicksort(a,j+1,high); 
    }
}