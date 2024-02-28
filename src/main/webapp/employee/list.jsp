<%@ page import="wcd.jpa.entities.Employee" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 28/02/2024
  Time: 2:14 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee List</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<div class="container">
    <h1>List Employee</h1>
    <a href="create-employee" class="btn btn-primary">Create</a>
</div>
<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Birthday</th>
            <th scope="col">Phone Number</th>
            <th scope="col">Email</th>
            <th scope="col">Action</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <% for (Employee e: (List<Employee>)request.getAttribute("employee")){ %>
        <tr>
            <td><%= e.getEmployee_id() %></td>
            <td><%= e.getEmployee_name() %></td>
            <td><%= e.getBirthday() %></td>
            <td><%= e.getPhone_number() %></td>
            <td><%= e.getEmail() %></td>
            <td><a href="edit-employee?id=<%= e.getEmployee_id() %>" class="btn btn-primary">Edit</a> </td>
            <td><a class="btn btn-danger" onclick="deleteEmployee(<%= e.getEmployee_id()%>)" href="javascript:void(0);">Delete</a></td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    function deleteEmployee(id) {
        var url = `list-employee?employee_id=`+id;
        fetch(url,{
            method: 'DELETE'
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
