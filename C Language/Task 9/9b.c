//b. Write a C program to sort the names of n students in the alphabetical order.
//Program
#include<stdio.h>
#include<string.h>
void main(){
 int i,j,n;
 char str[100][100],s[100];
 scanf("%d",&n);
 for(i=1;i<=n;i++){
 scanf("%s",str[i]);
 }
 printf("\n THE ORIGINAL UNSORTED STRINGS ARE:\n");
 for(i=1;i<=n;i++)
 {
 printf(" \t%d. %s\n",i,str[i]);
 }
 for(i=1;i<=n;i++){
 for(j=i+1;j<=n;j++){
 if(strcmp(str[i],str[j])>0){
 strcpy(s,str[i]);
 strcpy(str[i],str[j]);
 strcpy(str[j],s);
 }
 }
 }
 printf("\nTHE SORTED STRINGS ARE:\n");
 for(i=1;i<=n;i++){
 printf(" \t%d. %s\n",i,str[i]);
 }
}
