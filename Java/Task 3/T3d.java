//3d.)Write java programs that uses the final keyword
class T3d
{
final int num=100;
void printNumber()
{
//Super.variable_name
System.out.print("The value of final num ="+num+"\n");
//num++;
}
}
//Child class or subclass
class Main extends T3d
{
public static void main(String args[])
{
T3d obj= new T3d();
obj.printNumber();
obj.printNumber();
}
}
/*
Output:-
if(num++ is not in comments):
    Main.java:9: error: cannot assign a value to final variable num
    num++;
    ^
    1 error
else:
    The value of final num =100
    The value of final num =100  
*/
