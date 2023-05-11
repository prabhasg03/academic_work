class Task6b{
    public static void main(String[] args){
        try{
            int x=0,y=10;
            System.out.println(y/x);
        }
        catch(ArithmeticException ae){
            System.out.println("Divisor can't be zero");
        }
        try{
            int[] a={9,8,7,6,5};
            {
            System.out.print(a[7]);
        }}
        catch(ArrayIndexOutOfBoundsException e){
            System.out.println("Selected Index is out of range");
        }
    }
}