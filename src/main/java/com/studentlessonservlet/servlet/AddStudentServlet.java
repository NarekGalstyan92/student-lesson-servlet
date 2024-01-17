package com.studentlessonservlet.servlet;

import com.studentlessonservlet.manager.LessonManager;
import com.studentlessonservlet.manager.StudentManager;
import com.studentlessonservlet.model.Lesson;
import com.studentlessonservlet.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/addStudent")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 5, //5Mb
        maxRequestSize = 1024 * 1024 * 10, // should be grater than maxFileSize (Includes texts, etc.)
        fileSizeThreshold = 1024 * 1024 * 1 // size of file parts that are going to be sent to the server
)
public class AddStudentServlet extends HttpServlet {

    private LessonManager lessonManager = new LessonManager();
    private StudentManager studentManager = new StudentManager();
    private final String UPLOAD_DIRECTORY = "/Users/narekgalstyan/Documents/IdeaProjects/student-lesson-servlet/uploadDirectory";


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Lesson> lessons = lessonManager.getLessons();
        req.setAttribute("lessons", lessons);
        req.getRequestDispatcher("/WEB-INF/addStudent.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studentName = req.getParameter("name");
        String studentSurname = req.getParameter("surname");
        String studentEmail = req.getParameter("email");
        int studentAge = Integer.parseInt(req.getParameter("age"));
        int lessonId = Integer.parseInt(req.getParameter("lessonId"));

        Part picture = req.getPart("avatar");
        String pictureName = null;
        if (picture != null && picture.getSize() > 0) {
            pictureName = System.currentTimeMillis() + "_" + picture.getSubmittedFileName();
            picture.write(UPLOAD_DIRECTORY + File.separator + pictureName);

        }

        studentManager.add(Student.builder()
                .name(studentName)
                .surname(studentSurname)
                .email(studentEmail)
                .age(studentAge)
                .lesson(lessonManager.getLessonById(lessonId))
                .picName(pictureName)
                .build());
        resp.sendRedirect("/students");
    }
}
