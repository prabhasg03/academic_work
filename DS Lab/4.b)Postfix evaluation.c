#include<stdio.h>
#include<ctype.h>
#include<stdlib.h>
#include<math.h>
#define MAX 50
int stack[MAX];
int top=-1;
void push(int val);
int pop();
void evalpostfix(char postfix[]);
int main()
{
    char postfix[MAX];
    scanf("%s",postfix);
    evalpostfix(postfix);
    return 0;
}
void push(int val)
{
if(top==MAX-1)

    printf("stack overflow");
else
stack[++top]=val;
}
int pop()
{
    if(top==-1)
    {
    printf("stack underflow - Invalid Expression");
    exit(0);
    }
    else
    return (stack[top--]);
}
void evalpostfix(char postfix[])
{
    int i,j=0,res,val,a,b;
    char ch;
    for(i=0;postfix[i]!='\0';i++)
    {
        ch=postfix[i];
        if(isalnum(ch))
    {
        if(isalpha(ch))
        {
        scanf("%d",&val);
        push(val);
        
        }
    else
    {
        val=ch-'0';
    push(val);
    }
    }
else if(ch=='+'||ch=='-'||ch=='*'||ch=='/'||ch=='+'||ch=='-'||ch=='%'||ch=='^')
{
    a=pop();
    b=pop();
    switch(ch)
    {
        case '+':res=b+a;
        break;
         case '-':res=b-a;
        break;
         case '*':res=b*a;
        break;
         case '/':res=b/a;
        break;
         case '%':res=b%a;
        break;
         case '^':res=pow(b,a);
        break;
         
    }
    push(res);
}
else
{
    printf("Invalid postfix expression\n");
    exit(0);
}
}
if(top==0)
{
printf("Postfix Expression is : %s\n",postfix);
printf("Value of the postfix expression is : %d",pop());
}
else{
printf("Postfix Expression is : %s\n",postfix);
printf("Incomplete or Invalid postfix expression\n");
}
}
    