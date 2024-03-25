<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font color="#FF00FF"><strong>Select query in JSP</strong></font></h2>
<table align="center" cellpadding="4" cellspacing="4" style="width:70%;">
<tr>
</tr>
<tr bgcolor="#008000">
<th><b>Name</b></th>
<th><b>E-Mail</b></th>
<th><b>Password</b></th>
<th><b>Phone</b></th>
</tr>
<%
try {
Class.forName("com.mysql.cj.jdbc.Driver");
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root","G@03.com");
statement = connection.createStatement();
String sql = "SELECT * FROM user";
resultSet = statement.executeQuery(sql);
while (resultSet.next()) {
%>
<tr bgcolor="#8FBC8F">
<td><%=resultSet.getString("name")%></td>
<td><%=resultSet.getString("email")%></td>
<td><%=resultSet.getString("password")%></td>
<td><%=resultSet.getString("phone")%></td>
</tr>
<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>