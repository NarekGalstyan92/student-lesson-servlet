<%@ page import="com.studentlessonservlet.model.User" %><%--
  Created by IntelliJ IDEA.
  User: narekgalstyan
  Date: 1/9/24
  Time: 9:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home page</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<% if (session.getAttribute("user") != null) {
    User user = (User) session.getAttribute("user");
%>
Welcome <%=user.getName() + " " + user.getSurname()%> <a href="/logout">Logout</a>
<% } %>
<div style="margin: 0 auto">
    <a href="/lessons"> View all lessons</a> <br>
    <a href="/students"> View all students</a> <br>
</div>


</body>
</html>
