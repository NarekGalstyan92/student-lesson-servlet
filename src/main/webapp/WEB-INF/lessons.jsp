<%@ page import="com.studentlessonservlet.model.Lesson" %>
<%@ page import="java.util.List" %>
<%@ page import="com.studentlessonservlet.manager.LessonManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lessons</title>
    <style>

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .navigation {
            text-align: center;
            margin-bottom: 20px;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            text-decoration: none;
            color: #fff;
            background-color: #3498db;
            border-radius: 4px;
            transition: background-color 0.3s;
            font-size: 18px;
        }


        .button:hover {
            background-color: #2980b9;
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

<h1>Lessons</h1>
<%
    List<Lesson> lessons = (List<Lesson>) request.getAttribute("lessons");
%>
<a href="/addStudent" class="button">Add a student</a>  <a href="/addLesson" class="button">Add a lesson</a>  <a href="/students" class="button">Students</a>
<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Duration</th>
        <th>Added by</th>
        <th>Lecturer</th>
        <th>Price</th>
        <th>Delete</th>
        <th>Update</th>
    </tr>
    </thead>
    <tbody>
    <%
        if (lessons != null) {
            for (Lesson lesson : lessons) {
    %>
    <tr>
        <td><a href="/singleLesson?id=<%= lesson.getId() %>"><%= lesson.getName() %></a></td>
        <td><%= lesson.getDuration() %></td>
        <td>
            <% if (lesson.getUser() != null) { %>
            <%= lesson.getUser().getName() + " " + lesson.getUser().getSurname() %>
            <% }%>
        </td>
        <td><%= lesson.getLecturerFullName()%></td>

        <td><%= lesson.getPrice() %></td>
        <td class="navigation"> <a href="/deleteLesson?id=<%=lesson.getId()%>" class="button">delete</a> </td>
        <td class="navigation"> <a href="/updateLesson?id=<%=lesson.getId()%>" class="button">update</a> </td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>

</body>
</html>
