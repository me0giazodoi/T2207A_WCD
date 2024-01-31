<%@ page import="wcd.jpa.entities.Classes" %>
<%@ page import="java.util.List" %>
<%@ page import="wcd.jpa.entities.Subject" %><%--
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 22/01/2024
  Time: 5:03 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Student</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
    <div class="container">
        <h1>Create Form Student</h1>
        <form method="post" action="create-student">
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" name="name" class="form-control" id="name">
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="text" name="email" class="form-control" id="email">
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <input type="text" name="address" class="form-control" id="address">
            </div>
            <div class="mb-3">
                <label for="class" class="form-label">Class</label>
                <select name="class_id" class="form-control" id="class">
                    <% for (Classes c: (List<Classes>)request.getAttribute("classesList")){ %>
                    <option value="<%= c.getId()%>"><%= c.getName() %></option>
                    <% } %>
                </select>
            </div>
            <div class="mb-3">
                <label for="subject" class="form-label">Subject</label>
                <% for (Subject s: (List<Subject>)request.getAttribute("subjectList")){ %>
                <div class="form-check">
                    <label class="form-check-label">
                        <input name="subject_id[]" class="form-check-input" type="checkbox" value="<%= s.getId() %>" id="subject">
                        <%= s.getName() %>
                    </label>
                </div>
                <% } %>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</body>
</html>
// Chuyen mang các giá tri chọn nhieu gia tri