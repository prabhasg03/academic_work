import java.util.Scanner;
class CircularQueue{
    String[] data;
    int capacity,front,rear;
    CircularQueue(int a){
       this.capacity=a;
        this.front=this.rear=-1;
        this.data=new String[a];
    }
    public void enqueue(String newData){
        if(front==-1&&rear ==-1){
            front = 0;
            rear = 0;}
        else if(rear == capacity-1)
        {
            rear = 0;
        }
        else
        {
            rear++;
        }
        data[rear] = newData;
    }
public boolean isEmpty(){
        if(front==-1||front==rear+1){return true;}
    else{return false;}
    }
public String dequeue(){
        String deletedElement = data[front];
        if(front == capacity-1)
        {front = 0;}
        else{
            front++;}
        if(front == rear+1)
        {front = -1;rear = -1;}
        return deletedElement;
    }
public String peek(){
    if(front==-1){return null;}
    return data[front];
}
}
class Main{
    public static void main(String[] args){
        Scanner s=new Scanner(System.in);
        System.out.print("Enter Circular Queue Size: ");
        int n=s.nextInt();
        CircularQueue q=new CircularQueue(n);
        while(true){
            System.out.println("1-Enqueue|2-Dequeue|3-isEmpty|4-peek|5-Exit");
            int a=s.nextInt();
            switch(a){
            case 1:System.out.print("Enter Element to enqueue:");
                   String b=s.next();
                   q.enqueue(b);
                   break;
            case 2:System.out.println("Dequeued Element: "+q.dequeue());
                   break;
            case 3:System.out.println("Queue is "+q.isEmpty()!=null?"Empty":"Not Empty");
                   break;    
            case 4:System.out.println("Front Element: "+q.peek());
                   break;
            case 5:System.exit(0);
            default:System.out.println("Invalid");
        }
        }
    }
}
