<%@ page import="wcd.jpa.entities.Classes" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 29/01/2024
  Time: 4:35 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Class</title>
    <jsp:include page="/layout/css.jsp"/></head>
<body>
<div class="container">
    <h1>Edit Form Class</h1>
    <% Classes classes = (Classes) request.getAttribute("classes"); %>
    <form method="post" action="edit-class?id=<%= classes.getId() %>">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" value="<%= classes.getName() %>" name="name" class="form-control" id="name">
        </div>
        <div class="mb-3">
            <label for="room" class="form-label">Room</label>
            <input type="text" value="<%= classes.getRoom() %>" name="room" class="form-control" id="room">
        </div>
        <div class="mb-3">
            <label for="semester" class="form-label">Semester</label>
            <input type="text" value="<%= classes.getSemester() %>" name="semester" class="form-control" id="semester">
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>
</body>
</html>
