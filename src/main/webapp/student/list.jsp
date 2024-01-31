<%@ page import="wcd.jpa.entities.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="wcd.jpa.entities.Subject" %><%--
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
        <a href="create-student" class="btn btn-primary">Create</a>
        <a href="list-class" class="btn btn-primary">Class</a>
        <a href="favourite-student" class="btn btn-primary">Favourite</a>
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
                <th scope="col">Class</th>
                <th scope="col">Subject</th>
                <th scope="col">Action</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <% for (Student s: (List<Student>)request.getAttribute("students")){ %>
                <tr>
                    <td><%= s.getId() %></td>
                    <td><%= s.getName() %></td>
                    <td><%= s.getEmail() %></td>
                    <td><%= s.getAddress() %></td>
                    <td><%= s.getClasses().getName() %></td>
                    <td>
                        <ul>
                            <% for (Subject j: s.getSubjects()){ %>
                            <li><%= j.getName() %></li>
                            <% }%>
                        </ul>
                    </td>
                    <td><a href="edit-student?id=<%= s.getId() %>" class="btn btn-primary">Edit</a> </td>
                    <td><a class="btn btn-danger" onclick="deleteStudent(<%= s.getId()%>)" href="javascript:void(0);">Delete</a></td>
                    <td><a class="btn btn-success" onclick="likeStudent(<%= s.getId()%>)" href="javascript:void(0);">Like</a></td>
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
        function likeStudent(id){
            var url = `list-student?id=`+id;
            fetch(url,{
                method: 'POST'
                // body: formData
            }).then(rs=>{
                if(confirm("Like student successfully!"))
                    window.location.reload();
            }).error(err=>{
                alert(err)
            })
        }
    </script>
</body>
</html>
