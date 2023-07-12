using System;
using mymathlib;
class MyMathApp
{
	public static void Main(string[] args)
	{
		Console.WriteLine("Calling Method from mymathlib");
		if (args.Length != 2)
		{
			Console.WriteLine("Usage :MyMathApp <num1> <num2>");
			return;
		}
		long num1 = long.Parse(args[0]);
		long num2 = long.Parse(args[1]);
		long add = method1.Add(num1, num2);
		long mul = method1.Mul(num1, num2);
		Console.WriteLine("{0} + {1}= {2}", num1, num2, add);
		Console.WriteLine("{0} * {1}= {2}", num1, num2, mul);
	}
}
/*C:\21241A6625\2-2\VPL\Task 11>MyMathApp.exe 20 15
Calling Method from mymathlib
20 + 15= 35
20 * 15= 300

C:\21241A6625\2-2\VPL\Task 11>csc /target:library /out:mymathlib.dll Mymathlib.cs
Microsoft (R) Visual C# Compiler version 4.6.0-3.23259.8 (c3cc1d0c)
Copyright (C) Microsoft Corporation. All rights reserved.


C:\21241A6625\2-2\VPL\Task 11>csc /reference:Mymathlib.dll MyMathApp.cs
Microsoft (R) Visual C# Compiler version 4.6.0-3.23259.8 (c3cc1d0c)
Copyright (C) Microsoft Corporation. All rights reserved.


C:\21241A6625\2-2\VPL\Task 11>MyMathApp.exe 20 15
Calling Method from mymathlib
20 + 15= 35
20 * 15= 300
 */