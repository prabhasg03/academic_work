class DefaultConstructor
{
int Sid;
String Sname;
//Default Constructor methodDefaultConstructor()
{
System.out.println("Default Constructor method gets calledautomatically whenever object of the class gets created.\n");
Sid=846;
Sname="Sowmya";
}
void showDetails()
{
System.out.println("Sid:"+Sid+"\nSname:"+Sname);
}
public static void main(String[] args)
{
//creating object
DefaultConstructor object = new DefaultConstructor();
object.showDetails();
}
}
