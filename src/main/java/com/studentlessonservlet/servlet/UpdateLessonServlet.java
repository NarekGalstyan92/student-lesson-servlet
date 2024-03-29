package com.studentlessonservlet.servlet;

import com.studentlessonservlet.manager.LessonManager;
import com.studentlessonservlet.model.Lesson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/updateLesson")
public class UpdateLessonServlet extends HttpServlet {

    private LessonManager lessonManager = new LessonManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Lesson lesson = lessonManager.getLessonById(id);
        req.setAttribute("lesson", lesson);

        req.getRequestDispatcher("/WEB-INF/updateLesson.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("lessonId"));
        String lessonName = req.getParameter("lessonName");
        int lessonDuration = Integer.parseInt(req.getParameter("lessonDuration"));
        String lecturerName = req.getParameter("lecturerName");
        double price = Double.parseDouble(req.getParameter("price"));
        lessonManager.update(Lesson.builder()
                .id(id)
                .name(lessonName)
                .duration(lessonDuration)
                .lecturerFullName(lecturerName)
                .price(price)
                .build());
        resp.sendRedirect("/lessons");
    }
}
