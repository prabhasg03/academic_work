import java.util.StringTokenizer;
import java.util.Scanner;
class T2c
{
public static void main(String[] args)
{
String temp; int k,total=0;
Scanner input=new Scanner(System.in);//Take the input from the user.
System.out.println("Enter the Numbers : "); //Display the message to user.
String sentence=input.nextLine(); //read the numbers entered by the user.
//System.out.println("Number="+sentence);
StringTokenizer s1=new StringTokenizer(sentence); //Create object of theString
//Tokenizer and pass the numbers entered by the user to it.
System.out.println("Total Number of tokens:"+s1.countTokens());
while(s1.hasMoreTokens())
{
temp=s1.nextToken();
//nextToken() takes the next token and returns string
k=Integer.parseInt(temp);//Make use of parseInt() method from the Integer class
//to convert the String token into integer token.
total=total+k;//total+=k;
//Perform the addtion for obtaining final sum of all theSystem.out.print(k+"\t")
}
System.out.println("Sum of tokens :"+total); //Display the sum of all the tokensentered by 
//the user.
input.close();
}
}