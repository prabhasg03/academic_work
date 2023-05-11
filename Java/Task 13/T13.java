import java.awt.*;
import javax.swing.*;
/*<applet code="T13.class" height=310 width=400></applet>*/
public class T13 extends JApplet {
    public void init() {
        Container c=getContentPane();
        c.setLayout(new BorderLayout());
        final String colheads[] = { "Name", "Phone", "Fax" };
        final Object data[][] = { { "vijay", "1234", "1234" }, { "Vinod", "3456", "3456" },
                { "siva", "1256", "1256" } };
        JTable table = new JTable(data, colheads);
        int v = ScrollPaneConstants.VERTICAL_SCROLLBAR_AS_NEEDED;
        int h = ScrollPaneConstants.HORIZONTAL_SCROLLBAR_AS_NEEDED;
        JScrollPane jsp = new JScrollPane(table, v, h);
        c.add(jsp,BorderLayout.CENTER);
    }
}
