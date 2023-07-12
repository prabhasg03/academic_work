using System;
class Overload{
public int sum(int a,int b){
return a+b;}
public float sum(float x,float y){
return x+y;}
public int sum(int a,int b,int c){
return a+b+c;}
}
public class T2{
public static void Main(string []n){
Overload ol=new Overload();
Console.WriteLine("Enter Two integers:");
int a=int.Parse(Console.ReadLine());
int b=int.Parse(Console.ReadLine());
Console.WriteLine("Sum of "+a+" and "+b+":"+ol.sum(a,b));
Console.WriteLine("Sum of "+a+","+b+","+10+":"+ol.sum(a,b,10));
Console.WriteLine("Enter Two Float:");
float x=float.Parse(Console.ReadLine());
float y=float.Parse(Console.ReadLine());
Console.WriteLine("Sum of "+x+" and "+y+":"+ol.sum(x,y));
}}