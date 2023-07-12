using System;
using System.Threading;
class create_Thread
{
    public static void Main(string[] args)
    {
        ThreadStart cref = new ThreadStart(ChildThread);
         Console.WriteLine("Creating Child Thread from within Main");
        Thread child= new Thread(cref);
        child.Start();
    }
    public static void ChildThread()
    {
        Console.WriteLine("Child Thread Started");
    }
}