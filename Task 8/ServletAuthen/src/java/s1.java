import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class s1 extends HttpServlet
{
@Override
public void doGet(HttpServletRequest request,HttpServletResponse response) throws
ServletException,IOException
{
response.setContentType("text/html");
PrintWriter out=response.getWriter();
String name,value;
name=request.getParameter("t1");
value=request.getParameter("t2");
Cookie c=new Cookie(name,value);
response.addCookie(c);
out.println("<html>");
out.println("<head>");
out.println("<script>alert('COOKIE ADDED');</script>");
out.println("</head>");
out.println("<body>");
out.println("<h2>COOKIE DETAILS</h2>");
out.println("<br>Name: "+c.getName());
out.println("<br>Value:"+c.getValue());
out.println("</body>");
out.println("</html>");
}
}
