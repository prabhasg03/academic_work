//3c.)Write java programs that uses the static keyword
class T3c
{
static int num=100;
void printNumber()
{
//Super.variable_name
System.out.println("\nThe value of static num ="+ num);
num++;
}
}
//Child class or subclass
class Main extends T3c
{
public static void main(String args[])
{
T3c obj= new T3c();
obj.printNumber();
T3c obj1= new T3c();
obj1.printNumber();
}
}
/*
Output:-
The value of static num =100
The value of static num =101
*/
