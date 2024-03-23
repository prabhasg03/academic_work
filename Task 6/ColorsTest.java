import java.awt.*;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
public class ColorsTest {
    public static void main(String[] args) {
        // Create a frame
        Frame frame = new Frame("Colors Test");
        // Create an instance of the Colors bean
        Colors colorsBean = new Colors();
        // Set up property change listener
        colorsBean.addPropertyChangeListener(new PropertyChangeListener() {
            @Override
            public void propertyChange(PropertyChangeEvent evt) {
                if ("color".equals(evt.getPropertyName())) {
                    System.out.println("Color changed: " + evt.getNewValue());
                }
            }
        });

        // Set the layout of the frame
        frame.setLayout(new FlowLayout());

        // Add the Colors bean to the frame
        frame.add(colorsBean);

        // Set up the frame
        frame.setSize(200, 200);
        frame.setVisible(true);

        // Close the application when the frame is closed
        frame.addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent windowEvent) {
                System.exit(0);
            }
        });
    }
}
