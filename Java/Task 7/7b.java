class Q{
    int n=0;
    boolean valueSet=false;
    synchronized int get(){
     try{
     while(!valueSet){
      wait();
     }
     }
     catch(InterruptedException e){
     System.out.println("Interrupted Exception caught");
     }
     System.out.println("Got: "+n+" Study");
     valueSet=false;
     notify();
     return n;
    }
    synchronized void put(int n){
     try{
     while(valueSet){
      wait();
     }}
     catch(InterruptedException e){
     System.out.println("Interrupted Exception caught");
     }
     this.n=n;
     valueSet=true;
     System.out.println("Put: "+n+" Study");
     notify();
    }
   }
   class Producer implements Runnable{
    Q q;
    Producer(Q q){
    this.q=q;
    new Thread(this,"Producer").start();
    }
    public void run(){
    int i=0;
    while(true){
     q.put(i++);
    }
    }
   }
   class Consumer implements Runnable{
    Q q;
    Consumer(Q q){
    this.q = q;
    new Thread(this,"Consumer").start();
    }
    public void run(){
    while(true){
     q.get();
    }
}  
   }  
   class T7b{
    public static void main(String args[]){
    Q q = new Q();
    new Producer(q);
    new Consumer(q);
    System.out.println("Press control-c to stop");
    }
   } 