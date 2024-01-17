<%@ page import="java.util.List" %>
<%@ page import="com.studentlessonservlet.model.Lesson" %>
<%@ page import="com.studentlessonservlet.model.Student" %>
<%--
  Created by IntelliJ IDEA.
  User: narekgalstyan
  Date: 1/12/24
  Time: 12:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Lesson lesson = (Lesson) request.getAttribute("lessonById");%>
<%List <Student> students = (List <Student>) request.getAttribute("students");%>
<html>
<head>
    <title><%=lesson.getName()%></title>
    <style>

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px 15px;
            text-align: left;
        }

        th {
            background-color: #3498db;
            color: #fff;
        }

        td a {
            color: #3498db;
        }

        td a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 style="font-weight: bold; text-align: center;">Subject: <%=lesson.getName()%> | Duration: <%=lesson.getDuration()%> months</h2>

    <%
        if (students != null && !students.isEmpty()) { %>
    <table>
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Surname</th>
            <th>Email</th>
            <th>Age</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Student student : students) { %>
        <tr>
            <td><%=student.getId()%></td>
            <td><%=student.getName()%></td>
            <td><%=student.getSurname()%></td>
            <td><%=student.getEmail()%></td>
            <td><%=student.getAge()%></td>
            <td><a href="/deleteStudent?id=<%=student.getId()%>">delete</a></td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <% } %>
</div>

</body>
</html>
