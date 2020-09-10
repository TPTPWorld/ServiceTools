import java.applet.*;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.util.*;
import javax.swing.*;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;

/**
 * Generic applet application.  A small front-end is needed to get around the
 * problem of no multiple inheritance.  This class should be subclassed to 
 * choose the proper editor and converter or to add additional functionality.
 *
 */


public class IDVURLApplet extends JApplet {
  JTextArea textField;
  IDV win;

 

  public void init(){
    String tptp = getParameter("TPTP");
    String url = getParameter("URL");
    
      //System.out.println("Hi there: " + url);
    textField = new JTextArea();
    setLayout(new BorderLayout());
    add("Center",textField);
    textField.setText("One moment please.  Loading IDV (Interactive Derivation Viewer)...");

    win = new IDV();
    WindowListener wl = new WindowAdapter() {
        public void windowClosing(WindowEvent e) {
          textField.setText("Thanks for using IDV (Interactive Derivation Viewer)!");
        }
        public void windowOpened(WindowEvent e) {
          System.out.println("Window opened" + e.paramString());
        }
        public void windowIconified(WindowEvent e) {
          System.out.println("Window iconified" + e.paramString());
          textField.setText("IDV is currently minimized.");
        }
        public void windowDeiconified(WindowEvent e) {
          System.out.println("Window deiconified" + e.paramString());
        }
        public void windowActivated(WindowEvent e) {
          System.out.println("Window activated" + e.paramString());
        }
        public void windowDeactivated(WindowEvent e) {
          System.out.println("Window deactivated" + e.paramString());
        }
      };

    win.addWindowListener(wl);
    if (tptp == null) {
      win.loadURL(url);
    } else {
      win.loadString(tptp);
    }
    win.setVisible(true);
  }
}
