<%@ page import="wcd.jpa.entities.Classes" %>
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
    <h1>List Class</h1>
    <a href="#" class="btn btn-primary">Create</a>
</div>
<%--    Table Student--%>
<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Room</th>
            <th scope="col">Semester</th>
            <th scope="col">Student Count</th>
            <th scope="col">Action</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <% for (Classes s: (List<Classes>)request.getAttribute("classes")){ %>
        <tr>
            <td><%= s.getId() %></td>
            <td><%= s.getName() %></td>
            <td><%= s.getRoom() %></td>
            <td><%= s.getSemester() %></td>
            <td><%= s.getStudents().size() %></td>
            <td><a href="edit-student?id=<%= s.getId() %>" class="btn btn-primary">Edit</a> </td>
            <td><a class="btn btn-danger" onclick="deleteStudent(<%= s.getId()%>)" href="javascript:void(0);">Delete</a></td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    function deleteStudent(id) {
        var url = `list-student?id=`+id;
        fetch(url,{
            method: 'DELETE'
            // body: formData
        }).then(rs=>{
            if(confirm("Reload page?"))
                window.location.reload();
        }).error(err=>{
            alert(err)
        })
    }
</script>
</body>
</html>
