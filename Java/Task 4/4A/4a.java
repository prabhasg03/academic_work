class Bank{
int getROI(){
return 0;}
}
class SBI extends Bank{
int getROI(){
return 8;}}
class ICICI extends Bank{
int getROI(){
return 7;}
}
class Axis extends Bank{
int getROI(){
return 9;}
}
class NewMethodOverriding{
public static void main(String[]args)
{
SBI s=new SBI();
ICICI i=new ICICI();
Axis a=new Axis();
System.out.println("SBI rate of interest = "+s.getROI());
System.out.println("ICICI rate of interest ="+i.getROI());
System.out.println("Axis rate of interest = "+a.getROI());
Bank b=new ICICI();
System.out.println("Example of Base class can hold the object of an child class"+b.getROI());
}}
