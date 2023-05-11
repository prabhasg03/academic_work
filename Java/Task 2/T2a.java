import java.util.*;
class T2a
{
public static void main(String args[])
{
Scanner s=new Scanner(System.in);
System.out.println("Enter the string");
String st1=s.nextLine();
if(isReverse(st1))
{
System.out.println("String "+st1+" is Palindrome");
}
else
{
System.out.println("String "+st1+" is notPalindrome");
}
s.close();
}
public static boolean isReverse(String a){
    a=a.toLowerCase();
    int l=0,h=a.length()-1;
    while(l<h){
        if(a.charAt(l)!=a.charAt(h)){return false;}
        l++;
        h--;
    }
    return true;
}
}
