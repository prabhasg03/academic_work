import java.util.Scanner;
class MyQueue{
    String[] data;
    int capacity,f,r;
    MyQueue(int a){
        this.capacity=a;
     this.data=new String[a];
        this.f=-1;
        this.r=-1;
    }
void enqueue(String s)
{
if(r==capacity-1){return;}
else if(f==-1&&r==-1){r=0;f=0;}
else{
r++;}
data[r]=s;
}
String dequeue()
{
    String d=data[f];
    f++;
    if(f==r+1){f=-1;r=-1;}
return d;
}
    String peek(){
        if(f==r&&r==-1){return null;}
        return data[f];
    }
    boolean isEmpty(){
        if(f==r&&r==-1){
            return true;
        }
        else{
            return false;
        }
    }
     boolean isFull() {
    if(r==capacity-1) {
      return true;
    } else {
      return false;
}}}
    class Main{
        public static void main(String[] args){
            Scanner s=new Scanner(System.in);
            System.out.print("Enter Queue size:");
            int n=s.nextInt();
            MyQueue q=new MyQueue(n);
            while(true){
                    System.out.println("1 for Enqueue|2 for Dequeue|3 for peek|4 for isEmpty|5 for exit");
                    int u=s.nextInt();
                    switch(u){
                        case 1:System.out.print("Enter Element:");
                            String h=s.next();
                            q.enqueue(h);
                            break;
                        case 2:System.out.println("Dequeued Element: "+q.dequeue());
                            break;
                        case 3:System.out.println("Front Element: "+q.peek());
                            break;
                        case 4:System.out.println("Queue is Empty:"+q.isEmpty());
                            break;
                    case 5: System.exit(0);
                    default:System.out.println("Invalid!!");
                }
            }
        }
    }
