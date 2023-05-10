#include<stdio.h>
#include<ctype.h>
#include<stdlib.h>
#define MAX 25
char stack[MAX];
int top=-1;
void push(char val);
char pop();
int getpriority(char ch);
void topostfix(char infix[]);
int main()
{
char infix[MAX];
scanf("%s",infix);
printf("Infix expression is : %s",infix);
topostfix(infix);
return 0;
}
void topostfix(char infix[])
{
int i,j=0;
char ch,postfix[MAX],val,temp;
for(i=0;infix[i]!='\0';i++)
{
   ch=infix[i];
     if(ch=='(') // if open brace
     push(ch);
     else if(isalnum(ch))  // if operand
       postfix[j++]=ch;
     else if(ch=='+'||ch=='-'||ch=='*'||ch=='/'||ch=='%'||ch=='^')
        {
            while(getpriority(stack[top])>=getpriority(ch))
              {
                   val=pop();
                   postfix[j++]=val;
               }
           push(ch);
         }
    else if(ch==')')
      {
               while(stack[top]!='(')
                  {
                   val=pop();
                   postfix[j++]=val;
                 }
             temp=pop(); 
      }
else
    {
       printf("\n Invalid infix expression - other symbols");
       exit(0);
    }
}
while(top!=-1)
 {
     val=pop();
      postfix[j++]=val;
 }
 postfix[j]='\0';
printf("\n Postfix expression is : %s",postfix);
}
void push(char val)
{
  if(top==MAX-1)
printf("\n Stack overflow");
else
    stack[++top]=val;
}

char pop()
{
   if(top==-1)
  {
    printf("\n Stack underflow - missing open brace - invalid infix exp");
     exit(0);
   }
else
   return(stack[top--]);
}
int getpriority(char ch)
{
    if(ch=='^')
        return 3;
     else if(ch=='*'||ch=='/'||ch=='%')
         return 2;
       else if(ch=='+'||ch=='-')
          return 1;
        else
          return 0; 
}