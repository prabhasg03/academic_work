using System;
using System.Thread;
public class ExThread
{
    public void mythread()
    {
        for(int i = 0; i < 3; i++)
        {
            Console.WriteLine("Thread - " + i);
        }
    }
}
public class thread
{
    public static void Main(string[] args)
    {
        ExThread obj = new ExThread(thread);
        Thread thr=new Thread(new Thread.Start(obj.mythread()));
        thr.Start();
    }
}