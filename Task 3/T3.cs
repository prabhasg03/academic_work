using System;

public class Emp
{
    public int id;
    public string name;
    public int age;
    public double sal;
    public void ins(int i, string n, int a, double s){
    this.id=i;
     this.name=n;
     this.age=a;
    this.sal=s;}
    public void display()
    {
        Console.WriteLine("Details of Employee:");
        Console.WriteLine("ID:"+id+"\nName:"+name);
        Console.WriteLine("Age:" + age + "\nSalary:" + sal);
    }
}
public class T3
{
    public static void Main(string[] args)
    {
        int id, age;
        double sal;
        string name;
        Console.WriteLine("Enter ID:"); id = Convert.ToInt32(Console.ReadLine());
        Console.WriteLine("Enter Name:"); name =Convert.ToString(Console.ReadLine());
        Console.WriteLine("Enter Salary:"); sal =Convert.ToDouble(Console.ReadLine());
        Console.WriteLine("Enter Age:"); age = Convert.ToInt32(Console.ReadLine());
        Emp emp = new Emp();
        emp.ins(id, name,age,sal);
        emp.display();
    }
}