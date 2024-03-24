<%@ page errorPage="error.jsp" %>
<html>
<body>
<H1><center>Result for <%=request.getParameter("a1")%>
</center></H1>
<%
String num1=request.getParameter("t1");
String num2=request.getParameter("t2");
int i=Integer.parseInt(num1);
int j=Integer.parseInt(num2);
String k = ""; // Initialize k with a default value
String str=request.getParameter("a1");
if(str.equals("add")) {
    k=String.valueOf(i+j);
} else if(str.equals("sub")) {
    k=String.valueOf(i-j);
} else if(str.equals("mul")) {
    k=String.valueOf(i*j);
} else if(str.equals("div")) {
    if(j==0) {
        k="Cannot divide by zero";
    } else {
        k=String.valueOf((double)i/j);
    }
}
%>
Result is: <%=k%>
</body>
</html>
