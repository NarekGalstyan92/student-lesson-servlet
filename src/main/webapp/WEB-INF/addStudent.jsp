<%@ page import="java.util.List" %>
<%@ page import="com.studentlessonservlet.model.Lesson" %>
<%@ page import="com.studentlessonservlet.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Student</title>
    <%String message = (String) request.getAttribute("studentExist");%>
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

        .student-form {
            width: 100%;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="email"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        input[type="file"] {
            margin-bottom: 10px;
        }

        button[type="submit"] {
            background-color: #3498db;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<% List<Lesson> lessons = (List<Lesson>) request.getAttribute("lessons");%>

<div class="container">
    <h2>Add Student</h2>

    <form method="post" action="/addStudent" class="student-form" enctype="multipart/form-data">
        <%if (message != null) {%>
        <span style="color: red"><%=message%></span> <br>
        <%}%>
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required>

        <label for="surname">Surname:</label>
        <input type="text" name="surname" id="surname" required>

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required>

        <label for="age">Age:</label>
        <input type="number" name="age" id="age" required>

        <label for="lessonId">Select Lesson:</label>
        <select name="lessonId" id="lessonId" required>
            <% for (Lesson lesson : lessons) { %>
            <option value="<%=lesson.getId()%>"><%=lesson.getName()%></option>
            <% } %>
        </select>
        <%User user = (User) request.getSession().getAttribute("user");%>
        <input type="hidden" name="userId" value="<%=user.getId()%>">
        <input type="file" name="avatar" accept="image/jpeg">
        <button type="submit">Add Student</button>
    </form>
</div>

</body>
</html>
