<%@ page import ="java.sql.*" %>

<%
String user = request.getParameter("name");
String pwd = request.getParameter("password");
String email = request.getParameter("email");
String phone = request.getParameter("phone");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "G@03.com");
    Statement st = con.createStatement();
    String query = "INSERT INTO user (name, password, email, phone) VALUES (?, ?, ?, ?)";
    PreparedStatement preparedStatement = con.prepareStatement(query);
    preparedStatement.setString(1, user);
    preparedStatement.setString(2, pwd);
    preparedStatement.setString(3, email);
    preparedStatement.setString(4, phone);
    int i = preparedStatement.executeUpdate();
    con.close();
%>
<p>Registration Successfully</p>
<%
} catch (Exception e) {
    out.println("Error: " + e);
}
%>
