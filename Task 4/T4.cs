/*Task 4
 Create a program to implement the concepts of OOPS for creating class, inheritance*/
using System;
//Single Inheritance
class Animal
{
    public void Eat()
    {
        Console.WriteLine("Animal is eating.");
    }
}
class Dog:Animal
{
    public void Bark()
    {
        Console.Write("Dog is barking.");
    }
}
//Multi-Level Inheritance
class Mammal : Animal
{
    public void run()
    {
        Console.WriteLine("Mammal is running.");
    }
}
class Horse : Mammal
{
    public void gallop()
    {
        Console.WriteLine("Horse is Galloping.");
    }
}
///hierarchial inheritance
class Bird : Animal
{
    pu
}
class T4 { 
public static void Main(string[] args) { 
    A a = new A();
    a.print("A");
    B b = new B();
    b.print("B");   
        b.run();
    }
}