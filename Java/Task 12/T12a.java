import java.awt.*;
  import java.applet.*;
 import java.awt.event.*;
 /* <applet code="T12a.class" width=500 height=500> </applet> */ 
public class T12a extends Applet implements ActionListener
 { 
 int i=0; 
 Button R,O,G; 
 public void init()
 { 
setBackground(Color.white); 
setForeground(Color.black);
  R=new Button("red"); 
 O=new Button("orange");
  G=new Button("green");  
add(R); 
add(O);
 add(G);
  R.addActionListener(this); 
 O.addActionListener(this); 
 G.addActionListener(this); 
}
 public void actionPerformed(ActionEvent ae)
 {
 String s=ae.getActionCommand(); 
 if(s.equals("red"))
 i=1; 
if(s.equals("orange")) 
 i=2;
 if(s.equals("green")) 
 i=3;
 repaint();
 }
 public void paint(Graphics g)
 {                                                                                                                
g.setColor(Color.black); 
 g.drawRect(50,50,100,200); 
 g.fillRect(50,50,100,200);
  g.setColor(Color.white);
  g.drawOval(80,70,30,30); 
 g.drawOval(80,130,30,30); 
 g.drawOval(80,190,30,30);
  g.setColor(Color.yellow);  
g.fillRect(85,250,25,800); 
if(i==1) 
{
 g.setColor(Color.red);  
g.fillOval(80,70,30,30);
 }
 if(i==2) 
{ 
g.setColor(Color.orange); 
 g.fillOval(80,130,30,30); 
}
 if(i==3) 
{
 g.setColor(Color.green); 
 g.fillOval(80,190,30,30);
 }
 }
 } 
