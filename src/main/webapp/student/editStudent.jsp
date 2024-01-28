<%@ page import="wcd.jpa.entities.Student" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 26/01/2024
  Time: 4:15 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Student</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<div class="container">
    <h1>Edit Form Student</h1>
    <% Student student = (Student)request.getAttribute("student"); %>
    <form method="post" action="edit-student?id=<%= student.getId() %>">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" value="<%= student.getName() %>" name="name" class="form-control" id="name">
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="text" value="<%= student.getEmail() %>" name="email" class="form-control" id="email">
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">Address</label>
            <input type="text" value="<%= student.getAddress() %>" name="address" class="form-control" id="address">
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>
</body>
</html>