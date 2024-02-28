<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 28/02/2024
  Time: 3:24 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Employee</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<div class="container">
    <h1>Create Form Employee</h1>
    <form method="post" action="create-employee">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" name="name" required class="form-control" id="name">
        </div>
        <div class="mb-3">
            <label for="birthday" class="form-label">Birthday</label>
            <input type="date" name="birthday" required class="form-control" id="birthday">
        </div>
        <div class="mb-3">
            <label for="phone_number" class="form-label">Phone Number</label>
            <input type="text" name="phone_number" required class="form-control" id="phone_number">
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="text" name="email" required class="form-control" id="email">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>
