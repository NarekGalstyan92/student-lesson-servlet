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
    <title>Add Lesson</title>
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

        form {
            margin: 0 auto;
            width: 80%;
            max-width: 500px;
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
<h1 style="font-weight: bold; text-align: center;">Add a lessons</h1>
<form method="post" action="/addLesson">
    Lesson name: <input type="text" name="lessonName"> <br>
    Lesson duration: <input type="text" name="lessonDuration"> <br>
    Lecturer name: <input type="text" name="lecturerName"> <br>
    Lesson price: <input type="number" name="lessonPrice"> <br>
    <input type="submit" name="add">
</form>
</body>
</html>
