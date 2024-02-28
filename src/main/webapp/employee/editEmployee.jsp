<%@ page import="wcd.jpa.entities.Employee" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 28/02/2024
  Time: 3:49 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Employee</title>
    <jsp:include page="/layout/css.jsp"/></head>
<body>
<div class="container">
    <h1>Edit Form Employee</h1>
    <% Employee employee = (Employee) request.getAttribute("employee"); %>
    <form method="post" action="edit-employee?id=<%= employee.getEmployee_id() %>">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" value="<%= employee.getEmployee_name() %>" name="name" required class="form-control" id="name">
        </div>
        <div class="mb-3">
            <label for="birthday" class="form-label">Birthday</label>
            <input type="date" value="<%= employee.getBirthday() %>" name="birthday" required class="form-control" id="birthday">
        </div>
        <div class="mb-3">
            <label for="phone_number" class="form-label">Phone Number</label>
            <input type="text" value="<%= employee.getPhone_number() %>" name="phone_number" required class="form-control" id="phone_number">
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="text" value="<%= employee.getEmail() %>" name="email" required class="form-control" id="email">
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>
</body>
</html>
