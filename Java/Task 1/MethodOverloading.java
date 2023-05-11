class Task1c
{
public void disp(char c)
{
System.out.println("Value of charcter c="+c);
}
public void disp(char c, int num)
{
System.out.println("Value of character c="+c);
System.out.println("Value of integer num="+num);
}
public void disp(int no, double d)
{
System.out.println("Value of Integer number No="+no);
System.out.println("Value of Floating Number ="+no);
}
}
class MethodOverloading
{
public static void main(String args[])
{
Task1c obj = new Task1c();
obj.disp('a');
obj.disp('a',10);
obj.disp(10,20.40);
}
}