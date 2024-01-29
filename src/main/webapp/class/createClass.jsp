<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 29/01/2024
  Time: 3:01 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Class</title>
    <jsp:include page="/layout/css.jsp"/></head>
<body>
<div class="container">
    <h1>Create Form Class</h1>
    <form method="post" action="create-class">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" name="name" class="form-control" id="name">
        </div>
        <div class="mb-3">
            <label for="room" class="form-label">Room</label>
            <input type="text" name="room" class="form-control" id="room">
        </div>
        <div class="mb-3">
            <label for="semester" class="form-label">Semester</label>
            <input type="text" name="semester" class="form-control" id="semester">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>
