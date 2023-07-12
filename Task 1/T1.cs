using System;
class T1
{
        public static void Main(string[] args)
    {
        Console.WriteLine("Enter an Integer:");
        int n=int.Parse(Console.ReadLine());
        int c=n;
        int r,s=0;
        while(c>0)
        {
            r = c % 10;
            c=c/10;
            s=(s*10)+r;
        }
        if (n == s)
        {
            Console.WriteLine(n + " is a palindrome");
        }
        else
        {
            Console.WriteLine(n + " is not a palindrome");
        }
    }
}