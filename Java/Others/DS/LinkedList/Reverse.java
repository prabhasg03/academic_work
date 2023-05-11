class Node{
    int data;
    Node next;

    Node(int data){
        this.data = data;
        next = null;
    }
}

class MyLinkedList{
    Node first;

    public void insert (Node input) {
        //inserts Node at end of linked list
    }

    public void print(){
        //prints the given linked list
    }
    void reverseLinkedList(){
        Node p=null,t=first,n=null;
                while(t!=null){
                    n=t.next;
                    t.next=p;
                    p=t;
                    t=n;
                }
                first=p;    
        }
}
