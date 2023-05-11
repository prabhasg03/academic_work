class ParamConstructor
{
int Sid;
String Sname;
ParamConstructor()
{
Sid=125;
Sname="Sindhu";
}
ParamConstructor(int x,String n)
{
Sid=x;
Sname=n;
}
void showDetails()
{
System.out.println("Sid:"+Sid+"Sname:"+Sname);
}
public static void main(String[]args)
{
ParamConstructor p=new ParamConstructor();
p.showDetails();
ParamConstructor p1=new ParamConstructor(1458,"Pooja");
p1.showDetails();
ParamConstructor p2=new ParamConstructor(1459,"Anand");
p2.showDetails();
}
}