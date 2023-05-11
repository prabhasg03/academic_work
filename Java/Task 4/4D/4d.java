class A
{
private int a=5;
public int b=6;
protected int c=1;
int d=2;
void print()
{a=20;
System.out.println(a+" "+b+" "+c+" "+d);
}}
class B
{A x=new A();void print1()
{x.b=7;
//x.a=30;error can't access private variableoutside the class
x.d=35;
x.print();
}}
class C
{public static void main(String []args)
{B y=new B();y.print1();
}}
