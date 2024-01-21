<%--
  Created by IntelliJ IDEA.
  User: narekgalstyan
  Date: 1/16/24
  Time: 10:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <style>

        .button {
            display: inline-block;
            padding: 200px 200px;
            margin: 10px;
            text-decoration: none;
            color: #fff;
            background-color: #3498db;
            border-radius: 4px;
            transition: background-color 0.3s;
            font-size: 100px
        }

        .button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<% if (session.getAttribute("msg") != null) {%>
<span style="color: red"> <%=session.getAttribute("msg")%></span>
<%session.removeAttribute("msg");%>
<%}%>

<form action="/login" method="post">
    Email: <input type="email" name="email"> <br>
    Password: <input type="password" name="password"> <br>
    <input type="submit" value="login">
</form>
<br>
<br>
<br>
<form action="/register" method="post">
    Name: <input type="text" name="name"> <br>
    Surname: <input type="text" name="surname"> <br>
    Email: <input type="email" name="email"> <br>
    Password: <input type="password" name="password"> <br>
    <input type="submit" value="register">
</form>

</body>
</html>
