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
    <title>Home page</title>
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

<div style="display: flex; justify-content: center;">
    <a href="/lessons" class="button">Lessons</a>
    <a href="/students" class="button">Students</a>
</div>

</body>
</html>
