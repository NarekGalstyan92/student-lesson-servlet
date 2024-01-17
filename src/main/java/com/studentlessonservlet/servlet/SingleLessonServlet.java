package com.studentlessonservlet.servlet;

import com.studentlessonservlet.manager.LessonManager;
import com.studentlessonservlet.manager.StudentManager;
import com.studentlessonservlet.model.Lesson;
import com.studentlessonservlet.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/singleLesson")
public class SingleLessonServlet extends HttpServlet {
    private LessonManager lessonManager = new LessonManager();
    private StudentManager studentManager = new StudentManager();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Lesson lessonById = lessonManager.getLessonById(id);
        if (lessonById == null) {
            resp.sendRedirect("/lessons");
        } else {
           List <Student> students = studentManager.getByLessonId(id);
           req.setAttribute("lessonById", lessonById);
           req.setAttribute("students", students);
           req.getRequestDispatcher("/WEB-INF/singleLesson.jsp").forward(req, resp);
        }
    }
}
