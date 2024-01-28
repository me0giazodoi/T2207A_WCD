<%@ page import="wcd.jpa.entities.Student" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 22/01/2024
  Time: 4:24 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
    <jsp:include page="/layout/header.jsp"/>
    <div class="container">
        <h1>List Student</h1>
    </div>
    <%--    Table Student--%>
    <div class="container">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Address</th>
            </tr>
            </thead>
            <tbody>
            <% for (Student s: (List<Student>)request.getAttribute("students")){ %>
                <tr>
                    <td><%= s.id %></td>
                    <td><%= s.name %></td>
                    <td><%= s.email %></td>
                    <td><%= s.address %></td>
                </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</body>
</html>
