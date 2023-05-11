class Node{
    int data;
    Node next;

    Node(int data){
        this.data = data;
        next = null;
    }
}
class MyQueueLinkedList{
    Node front=null;
    Node rear=null;
    void insert(Node a){
        Node newnode=new Node(a.data);
        if(front==null){
            front=newnode;}
            if(rear==null){
                rear=newnode;
            }
        else{
            rear.next=newnode;
            rear=newnode;
        }
    }
    Node delete(){
        Node t=null;
        t=front;
        front=front.next;
        return t;
    }
    boolean isEmpty(){
        if(front==null)return true;
        else{return false;}
    }
    void print(){
        Node t=front;
        while(t!=null){
            System.out.print(t.data+" ");
            t=t.next;
        }
        System.out.println();
    }
}