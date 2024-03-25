<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registered Users</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Registered Users</h2>
    <sql:setDataSource var="dataSource" driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/test"
        user="root" password="G@03.com" />

    <sql:query dataSource="${dataSource}" var="result">
        SELECT * FROM user;
    </sql:query>

    <c:if test="${not empty result.rows}">
        <table>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone Number</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.name}" /></td>
                    <td><c:out value="${row.email}" /></td>
                    <td><c:out value="${row.phone}" /></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${empty result.rows}">
        <p>No registered users found.</p>
    </c:if>
</body>
</html>
