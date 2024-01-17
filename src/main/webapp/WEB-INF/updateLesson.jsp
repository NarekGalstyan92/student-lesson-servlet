<%@ page import="com.studentlessonservlet.model.Lesson" %>
<%--
  Created by IntelliJ IDEA.
  User: narekgalstyan
  Date: 1/10/24
  Time: 7:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Lesson</title>
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

        form {
            width: 100%;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<% Lesson lesson = (Lesson) request.getAttribute("lesson");%>

<div class="container">
    <h2 style="font-weight: bold; text-align: center;">Update Lesson</h2>
    <br>
    <form method="post" action="/updateLesson">
        <input type="hidden" name="lessonId" value="<%=lesson.getId()%>">
        <br>
        <label for="lessonName">Lesson name:</label>
        <input type="text" name="lessonName" id="lessonName" value="<%=lesson.getName()%>">
        <br>
        <label for="lessonDuration">Lesson duration:</label>
        <input type="number" name="lessonDuration" id="lessonDuration" value="<%=lesson.getDuration()%>">
        <br>
        <label for="lecturerName">Lecturer name:</label>
        <input type="text" name="lecturerName" id="lecturerName" value="<%=lesson.getLecturerName()%>">
        <br>
        <label for="price">Lesson price:</label>
        <input type="number" name="price" id="price" value="<%=lesson.getPrice()%>">
        <br>
        <input type="submit" value="Update">
    </form>
</div>

</body>
</html>
