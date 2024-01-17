<%@ page import="com.studentlessonservlet.model.Student" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            text-align: center;
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

        .student-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .student-table th, .student-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .student-table th {
            background-color: #3498db;
            color: #fff;
        }

        .student-table td img {
            border-radius: 50%;
        }

        .student-table span {
            color: #777;
        }

        .student-table a {
            color: #e74c3c;
            text-decoration: none;
        }

        .student-table a:hover {
            text-decoration: underline;
        }

        .delete-button {
            display: inline-block;
            padding: 12px 20px;
            margin: 10px;
            text-decoration: none;
            color: #131111;
            background-color: #52f0f0;
            border-radius: 10px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.15);
            transition: background-color 0.3s;
            font-size: 16px;
        }

        .delete-button:hover {
            background-color: #e57373;
        }

    </style>
</head>
<body>

<div class="container">
    <h2>Students</h2>

    <nav class="navigation">
        <a href="/addStudent" class="button">Add a student</a>
        <a href="/addLesson" class="button">Add a lesson</a>
        <a href="/lessons" class="button">Lessons</a>
    </nav>

    <%
        List<Student> students = (List<Student>) request.getAttribute("students");
        if (students != null && !students.isEmpty()) {
    %>
    <table class="student-table">
        <thead>
        <tr>
            <th>Id</th>
            <th>Picture</th>
            <th>Name</th>
            <th>Surname</th>
            <th>Email</th>
            <th>Student Age</th>
            <th>Lesson Name</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Student student : students) { %>
        <tr>
            <td><%=student.getId()%></td>
            <td><% if (student.getPicName() != null) { %>
                <img src="/downloadImage?imageName=<%=student.getPicName()%>" width="45px">
                <% } else {%>
                <span>No picture</span>
                <%} %>
            </td>
            <td><%=student.getName()%></td>
            <td><%=student.getSurname()%></td>
            <td><%=student.getEmail()%></td>
            <td><%=student.getAge()%></td>
            <td><%=student.getLesson().getName()%></td>
            <td><a href="/deleteStudent?id=<%=student.getId()%>" class="delete-button">delete</a></td>
        </tr>
        <% }
        %>
        </tbody>
    </table>
    <%
        }
    %>
</div>

</body>
</html>
