using System;
using System.Xml.Linq;
class Emp

{
    string name;
    int id;
    float sal;
    public Emp(string s, int i, float ns)
    {
        name = s;
        id = i;
        sal = ns;
    }
    public void display()
    {
        Console.Write(" | " + name);
        Console.Write(" | " + id);
        Console.Write(" | " + sal);
        Console.WriteLine(" | ");
    }
}
public class T32
{

    public static void Main(string[] n)
    {
        Console.WriteLine("Enter how many employees ");
        int num = int.Parse(Console.ReadLine());
        Emp[] emp = new Emp[num];
        Emp e;
        int i;
        Console.WriteLine("Now enter the emp details of" + num + "Employees");
        for (i = 0; i <= num - 1; i++)
        {
            Console.WriteLine("Enter the details of Employee" + (i + 1));
            Console.WriteLine("Enter name of employee");
            string name = Console.ReadLine();
            Console.WriteLine("Enter ID of the employee");
            int id = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter the net salary of the employee");
            float sal = float.Parse(Console.ReadLine());
            emp[i] = new Emp(name, id, sal);
        }
        Console.WriteLine("The EMP details are");
        Console.WriteLine("|______________________________|");
        Console.WriteLine("|Name |EmpID |NetSalary");
        for (i = 0; i <= num - 1; i++)
        {
            e = emp[i];
            Console.WriteLine("|_________________________|");
            e.display();
        }
        Console.WriteLine("|__________________________________|");
    }
}