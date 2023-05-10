#include<stdio.h>
#include<stdlib.h>
#define MAX 4
void push(int);
void pop();
void peep();
int top=-1;
int stack[MAX];
void main()
{
 int val,ch;
 while(1)
 {
 scanf("%d",&ch);
 switch(ch)
 {
  case 1:scanf("%d",&val);
         push(val);
         break;
  case 2:pop();
         break;
  case 3:peep();
         break;
  case 4:exit(0);
         break;
  default:printf("\nInvalid Option");         
 }}}
 void push(int val)
 {
  if(top==MAX-1)
  {
    printf("\nStack Overflow"); 
    return;
  }
  top++;
  stack[top]=val;
 }
 void pop()
 {
  if(top==-1)
  {
      printf("\nStack Underflow");
      return;
  }
  printf("\nPopped value = %d",stack[top]);
  top--;
 }
 void peep()
 {
     int i;
    if(top==-1)
    {
    printf("\nNothing to display - Stack is empty");
    return;
    }
    printf("\n");
    for(i=top;i>=0;i--)
    {
     printf("%d ",stack[i]);    
    }
    }