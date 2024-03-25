<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","G@03.com");
    statement = connection.createStatement();
    String name=request.getParameter("name");
    String pwd=request.getParameter("pwd");
    String sql = "SELECT Name FROM user where email='"+name+"' and password='"+pwd+"'";
    resultSet = statement.executeQuery(sql);
    if(resultSet.next()){
        out.println("welcome '"+resultSet.getNString(1) +"'!! Login Successfull");
    } else {
        out.println("User Doesn't found");
        // Delay the redirection using JavaScript
        %>
        <script>
            setTimeout(function() {
                window.location.href = "index.html";
            }, 3000);
        </script>
        <%
    }
}
catch (Exception e) {
    e.printStackTrace();
    out.println("Error: " + e);
}
%>
