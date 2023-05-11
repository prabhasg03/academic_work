import java.io.*;
class Week5c
{
    public static void main (String [] args) throws IOException
{
BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
System.out.println("Enter a file name");
String s=br.readLine();
int s1,ch=0,ln=1,wd=1;
FileInputStream fin=new FileInputStream(s);
do
{
s1= fin.read();
if(s1 !=-1)
ch++;
if((char)s1==' '||(char)s1=='\n')
wd++;
if((char)s1=='\n')
ln++;
}while(s1!= -1);
System.out.println("The number of characters is "+ch);
System.out.println("The number of words is "+wd);
System.out.println("The number of lines is "+ln);
br.close();
fin.close();
}}