import java.util.Scanner;
class Stack{
    int capacity;
    char n='1';
    char[] data;
    public int top=-1;
    Stack(int a){
        this.capacity=a;
        this.data=new char[a];
    }
    void push(char w){
        if(top==capacity-1){
            System.out.println("Stack is full");
        }
        else{
            top++;
            data[top]=w;
        }
    }
    char pop(){
        if(top==-1){return n;}
        else{
            char a=data[top];
            top--;
            return a;
        }
    }
    char peek(){
        if(top==-1){
            return n;
        }
        else{
            return data[top];
        }
    }
    boolean isFull(){
        if(top==capacity-1){return true;}
        else{return false;}
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
}
class Solution {
  public String toPost(String A) {
      /* write your solution here */
      Stack st=new Stack(A.length());
      int i,j=0;
      char ch,val,temp;
      char[] infix=A.toCharArray();
      char[] postfix=new char[A.length()];
for(i=0;i<A.length();i++)
{
   ch=infix[i];
     if(ch=='(') // if open brace
     st.push(ch);
     else if((ch>=((char)64)&&ch<=((char)90))||ch>=((char)97)&&ch<=((char)122))  // if operand
       postfix[j++]=ch;
     else if(ch=='+'||ch=='-'||ch=='*'||ch=='/'||ch=='%'||ch=='^')
        {
            while(st.getpriority(st.peek())>=st.getpriority(ch))
              {
                   val=st.pop();
                if(val=='1'){break;}
                   if(val!='('||val!=')'){
                   postfix[j++]=val;}
               }
           st.push(ch);
         }
    else if(ch==')')
      {
               while(st.peek()!='(')
                  {
                   val=st.pop();
                   postfix[j++]=val;
                 }
             temp=st.pop(); 
      }
else
    {
       break;
    }
}
while(st.top!=-1)
 {
     val=st.pop();
      postfix[j++]=val;
 }
      String r=new String(postfix);
      return r;
  }
}
class Main{
    public static void main(String[] args){
    Scanner s=new Scanner(System.in);
    Solution p=new Solution();
    while(true){
        System.out.println("1 for Expression and 2 for exit");
       int o=s.nextInt();
       switch(o){
        case 1:System.out.println("Enter Infix Expression:");
               String d=s.next();
               System.out.println("Postfix Expression: "+p.toPost(d));
               break;
        case 2:System.exit(0);
               break;
       }
    }
}}