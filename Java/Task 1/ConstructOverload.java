class ConstructOverloading
{
int i, j;
public ConstructOverloading()
{
//i=100;//j=200;
System.out.print("Inside default constructor");
System.out.println(" Value of i="+i+"and j="+j);
}
public ConstructOverloading(int q)
{
System.out.println("Inside single parameter constructor with int value="+q);
}
public ConstructOverloading(String str)
{
System.out.println("Inside single parameter constructor with String object");
System.out.println("String Value="+str);
}
public ConstructOverloading(int p, double k)
{
System.out.println("Inside double parameter constructor value ofp="+p+""+"and k"+k);
}
public static void main(String args[])
{
new ConstructOverloading();
new ConstructOverloading(10);
new ConstructOverloading(10,20.20);
new ConstructOverloading(" Task1");
}
}
