<%@ page import="com.example.btl_web_book.model.User" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!= null){
        request.setAttribute("auth", auth);
        response.sendRedirect("/manage-user");
    }
%>
<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: DUCTRONG
  Date: 4/30/2023
  Time: 10:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.btl_web_book.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="CSS/style.css">
    <link rel="stylesheet" href="CSS/index.css">
</head>
<body>
<%@include file="includes/nav-bar.jsp"%>
<br>
<div class="row">
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

    <div class="container">
        <h3 class="text-center">List Users</h3>
        <hr>
        <div class="container text-left">

            <a href="<%=request.getContextPath()%>/new_user" class="btn btn-success">Add New User</a>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Phone Number</th>
                <th>Address</th>
                <th>Email</th>
                <th>Password</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>

            <%
                List<User> listUser = (List<User>) request.getAttribute("listUser");
                for(User user: listUser){
            %>

                <tr>
                    <td>
                        <%=user.getId()%>
                    </td>
                    <td>
                        <%=user.getUserName()%>
                    </td>
                    <td>
                        <%=user.getPhoneNumber()%>
                    </td>
                    <td>
                        <%=user.getAddress()%>
                    </td>
                    <td>
                        <%=user.getEmail()%>
                    </td>
                    <td>
                        <%=user.getPassWord()%>
                    </td>

                    <td>
                        <%=user.getRole()%>
                    </td>
                    <td><a href="edit_user?id=<%=user.getId()%>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete_user?id=<%=user.getId()%>">Delete</a></td>
                </tr>
            <%
                }
            %>
            </tbody>

        </table>
    </div>
</div>
<%@include file="includes/footer.jsp"%>
</body>
</html>
