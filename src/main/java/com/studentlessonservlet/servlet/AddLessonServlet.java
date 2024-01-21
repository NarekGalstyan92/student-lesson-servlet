package com.studentlessonservlet.servlet;

import com.studentlessonservlet.manager.LessonManager;
import com.studentlessonservlet.model.Lesson;
import com.studentlessonservlet.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/addLesson")
public class AddLessonServlet extends HttpServlet {

    private LessonManager lessonManager = new LessonManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/addLesson.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String lessonName = req.getParameter("lessonName");
        int lessonDuration = Integer.parseInt(req.getParameter("lessonDuration"));
        String lecturerName = req.getParameter("lecturerName");
        Double price = Double.parseDouble(req.getParameter("lessonPrice"));

        Lesson lessonByLessonName = lessonManager.getLessonByLessonName(lessonName);
        String message = null;
        if (lessonByLessonName.getName() != null && lessonByLessonName.getName().equalsIgnoreCase(lessonName)) {
            message = "Lesson already exist";
            req.setAttribute("lessonExist", message);
            req.getRequestDispatcher("/WEB-INF/addLesson.jsp").forward(req, resp);
        } else {
            User user = (User) req.getSession().getAttribute("user");
            lessonManager.add(Lesson.builder()
                    .name(lessonName)
                    .duration(lessonDuration)
                    .lecturerFullName(lecturerName)
                    .price(price)
                    .user(user)
                    .build());
            resp.sendRedirect("/lessons");
        }
    }
}
