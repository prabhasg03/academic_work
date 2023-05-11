import java.applet.*; 
import java.awt.*;
import java.awt.event.*; 
/*<applet code="T9b.class" height=200 width=200></applet>*/ 
public class T9b extends Applet implements ActionListener
{
TextField t1,t2; Label l1,l2; Button b;
int a,fact;
public void init()
{
l1=new Label("enter a number"); 
t1= new TextField(5);
l2=new Label("Factorial of the given number is :"); 
t2=new TextField(10);
b=new Button("compute"); 
add(l1);
add(t1);
add(b);
add(l2);
add(t2);
 b.addActionListener(this);
}
public void actionPerformed(ActionEvent e)
{
a=Integer.parseInt(t1.getText()); fact=1;
if(a<0)
{
t2.setText("wrong Input");
}
else
{
for(int i=a;i>1;i--) 
{fact*=i;} 
t2.setText(""+fact);
}
}
}
