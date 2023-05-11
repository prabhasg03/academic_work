class MyStackLinkedList{
    Node top=null;
    void push(Node n){
       Node newnode=new Node(n.data);
        newnode.next=top;
        top=newnode;
    }
    Node pop(){
        Node d=null;
        if(top!=null){
           d=top;
           top=top.next;
        }
        return d;
    }
    boolean isEmpty(){
        if(top==null){return true;}
        return false;
    }
    void print(){
        Node t=top;
        while(t	!=null){
            System.out.print(t.data+" ");
            t=t.next;
        }
        System.out.println();
    }
}
class Node{
    String data;
    Node next;

    Node(String data){
        this.data = data;
        next = null;
    }
}
