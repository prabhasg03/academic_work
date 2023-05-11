import java.util.Scanner;
class Stack{
    int capacity;
    char[] data;
    char n='n';
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
    boolean isEmpty(){
        if(top==-1){return true;}
        else{return false;}
    }
}
class Brackets{
    String data;
    Brackets(String a){
        this.data=a;
    }
    boolean isBalanced(){    
        char[] b=data.toCharArray();
        int l=b.length;
        Stack st= new Stack(l);
        for(int i=0;i<l;i++){
            char ch=b[i];
            if(ch=='('||ch=='{'||ch=='['){
             st.push(ch);   
            }
            else if(ch==')'){
                    if((st.pop())!='('){return false;}}
            else if(ch==']'){
                    if((st.pop())!='['){return false;}}
            else if(ch=='}'){
                    if((st.pop())!='{'){return false;}}
            else{}
                }
        return true;
            }
        }
class Main{
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        while(true){
        System.out.println("Enter Paranthesis Expression:");
        String b=sc.next();
        Brackets br=new Brackets(b);
        System.out.println(br.isBalanced()?"Balanced":"Not Balanced");
    }
    }
}