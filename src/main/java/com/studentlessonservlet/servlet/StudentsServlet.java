package com.studentlessonservlet.servlet;


import com.studentlessonservlet.manager.StudentManager;
import com.studentlessonservlet.model.Student;
import com.studentlessonservlet.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/students")
public class StudentsServlet extends HttpServlet {

    private StudentManager studentManager = new StudentManager();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        List<Student> students = studentManager.getStudentByUserId(user.getId());
        req.setAttribute("students",students);

       req.getRequestDispatcher("/WEB-INF/students.jsp").forward(req, resp);
    }
}
