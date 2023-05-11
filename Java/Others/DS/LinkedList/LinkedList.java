class Node {
    String data;
    Node next;

    Node(String data) {
        this.data = data;
        next = null;
    }
}

class MyLinkedList {
    Node head;

    public void insert(String data) {
        Node node = new Node(data);
        if (head == null) {
            head = node;
        } else {
            Node current = head;
            while (current.next != null) {
                current = current.next;
            }
            current.next = node;
        }
    }

    public void print() {
        Node current = head;
        while (current != null) {
            System.out.print(current.data + " ");
            current = current.next;
        }
        System.out.println();
    }
}

class MyLinkedList1 {
    Node head;
    int c = 0;

    void insert(int index, String data) {
        Node new_node = new Node(data);
        if (index == 0) {
            new_node.next = head;
            head = new_node;
            c++;
            return;
        }
        Node temp = head;
        for (int i = 0; temp != null && i < index - 1; i++)
            temp = temp.next;
        if (temp != null) {
            new_node.next = temp.next;
            temp.next = new_node;
            c++;
        }
    }

    void delete(int a) {
        Node temp = head, b;
        int i;
        if (a < 0 || a > c) {
            System.out.printf("Position does not exist - Cannot delete from SLL\n");
            return;
        }
        if (a == 0) {
            head = head.next;
        } else {
            for (i = 1; i <= a - 1; i++) {
                temp = temp.next;
            }
            b = temp.next;
            temp.next = b.next;
        }
        c--;
    }

    void print() {
        Node temp = head;
        while (temp != null) {
            System.out.print(temp.data + " ");
            temp = temp.next;
        }
        System.out.println("");
    }
}

class MyLinkedList2 {
    Node head = null;

    void insert(Node n) {
        Node r = n;
        if (head == null) {
            head = n;
            n.next = null;
        } else {
            Node temp = head;
            int i;
            while (temp.next != null) {
                temp = temp.next;
            }
            temp.next = n;
        }

        Node l = head;
        Node c;
        int temp;
        while (l != null) {
            c = l.next;
            while (c != null) {
                if (l.data>c.data) {
                    temp = l.data;
                    l.data = r.data;
                    r.data = temp;
                }
                c = c.next;
            }
            l = l.next;
        }
    }
    void print() {
        Node temp = head;
        System.out.print(temp.data + " ");
        while (temp.next != null) {
            temp = temp.next;
            System.out.print(temp.data + " ");

        }
        System.out.println();
    }
}
