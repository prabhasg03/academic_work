/*
Write a C program to implement BINARY search.
Test Cases :
Input = 6
10 20 35 44 21 32
44
output = Search is successful element is found at position 4
 
Input = 4
1 4 5 6
Enter the element to search:10
output = Element not found
 
Input Format: Read the number of elements in array in first line, Enter the elements in second line 
separated by space, 
Enter the element to search in 3rd line
Output Format : The output is search successful element found at particular position based on search 
key.
// Start Writing your program from here..!!*/
#include <stdio.h>
void main()
{
 int i,f,l,m,n,s,a[100];
 scanf("%d", &n);
 for (i=0;i<n;i++)
 scanf("%d",&a[i]);
 scanf("%d",&s);
 f=0;
 l=n-1;
 m=(f+l)/2;
 while (f<=l) {
 if (a[m]<s)
 f=m+1;
 else if (a[m]==s) {
 printf(" Search is successful element is found at position %d",m+1);
 break;
 }
 else
 l=m-1;
 m=(f+l)/2;
 }
 if (f>l)
 printf("Element not found\n");
}
