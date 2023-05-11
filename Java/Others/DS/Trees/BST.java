class Node{
    int data;
    Node left;
    Node right;
    String data1;
    Node(String data){
        this.data1 = data;
        this.left = null;
        this.right = null;
    }
    Node(int data){
        this.data = data;
        this.left = null;
        this.right = null;
    }
}
class BST{
    Node root;

    BST(){
        root = null;
    }
    public void insert(int data){
        Node parent = root;
        if(parent==null){
            root = new Node(data);
        }
        else {
            Node x = root;
            while(x!=null){
                parent = x;
                if(data > x.data) 
                    x = x.right;
                else if (data < x.data) 
                    x = x.left;
            }
            if(data > parent.data)
                parent.right = new Node(data);
            else if(data < parent.data)
                parent.left = new Node(data);
            
        }
    }
    public void insert(String data){
        Node parent = root;
        if(parent==null){
            root = new Node(data);
        }
        else {
            Node x = root;
            while(x!=null){
                parent = x;
                if(data.compareTo(x.data1)>0) 
                    x = x.right;
                else if (data.compareTo(x.data1)<0) 
                    x = x.left;
            }
            if(data.compareTo(parent.data1)>0)
                parent.right=new Node(data);
            else if(data.compareTo(parent.data1)<0)
                parent.left = new Node(data);
            
        }
    }
    public boolean search(String k){
        Node r=root;
        while(r!=null){
        if(k.compareTo(r.data1)==0){
            return true;}
        else if(k.compareTo(r.data1)<0){
            r=r.left;
        }
        else{
            r=r.right;
        }}
            return false;
        }
    public boolean search(int data){
        Node curr_node = root;
        while(curr_node!=null){
            if(curr_node.data == data)
                return true;
            else if(curr_node.data < data)
                curr_node = curr_node.right;
            else if(curr_node.data > data)
                curr_node = curr_node.left;
        }
        return false;
    }
    public void Preorder(Node root){
        Node m=root;
        if(m!=null){
            System.out.print(m.data+" ");
            Preorder(m.left);
            Preorder(m.right);
        }
    }
    public void Postorder(Node root){
        Node m=root;
        if(m!=null){
            Postorder(m.left);
            Postorder(m.right);
            System.out.print(m.data+" ");
        }
    }
}