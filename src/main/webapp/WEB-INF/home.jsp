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
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        header {
            background-color: #3498db;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        a {
            text-decoration: none;
            color: #3498db;
            transition: color 0.3s;
        }

        a:hover {
            color: #2078b4;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .welcome-msg {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .logout-link {
            color: #e74c3c;
        }
    </style>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<header>
    <h1>Home Page</h1>
</header>

<div class="container">
    <% if (session.getAttribute("user") != null) {
        User user = (User) session.getAttribute("user");
    %>
    <div class="welcome-msg">Welcome <%=user.getName() + " " + user.getSurname()%></div>
    <a href="/logout" class="logout-link">Logout</a>
    <% } %>

    <div style="margin-top: 20px;">
        <a href="/lessons">View all lessons</a> <br>
        <a href="/students">View all students</a> <br>
    </div>
</div>
</body>
</html>
