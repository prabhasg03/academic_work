import java.awt.*;
import java.awt.event.*;
import java.applet.Applet;
/*<applet code="T10b.class" width=400 height=350></Applet>*/
public class T10b extends Applet implements KeyListener
{
String msg=""; 
public void init()
{
addKeyListener(this);
}
public void keyPressed(KeyEvent obj)
{
showStatus("Key Pressed");
}
public void keyReleased(KeyEvent obj)
{
showStatus("Key Released");
}
public void keyTyped(KeyEvent obj)
{
showStatus("Key Typed");
msg=msg+obj.getKeyChar();
repaint();
}
public void paint(Graphics g)
{
Font currentFont=new Font("TimesRoman",Font.BOLD,29);
g.setFont(currentFont);
FontMetrics fm=g.getFontMetrics(); 
Dimension d= getSize();
int xc,yc;
xc=d.width/2-fm.stringWidth(msg)/2;
yc=d.height/2+fm.getDescent();
g.drawString(msg,xc,yc); 
setBackground(Color.red);
}
}