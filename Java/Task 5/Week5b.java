import java.util.Scanner;
import java.io.*;
class Week5b
{
public static void main(String[] args) throws IOException
{
Scanner br=new Scanner(System.in);
System.out.println("Enter a file name");
String s=br.nextLine();
System.out.println(s);
int s1,i=1;
FileInputStream fin=new FileInputStream(s);
System.out.print(i+++" ");
do
{
s1= fin.read();
if(s1 !=-1)
System.out.print((char)s1);
if((char)s1=='\n')
System.out.print(i+++" ");
}while(s1!= -1);
fin.close();
br.close();
}
}