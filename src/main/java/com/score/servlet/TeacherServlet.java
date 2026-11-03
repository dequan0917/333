package com.score.servlet;

import com.score.dao.DataStore;
import com.score.model.Score;
import com.score.model.Student;
import com.score.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class TeacherServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) (session != null ? session.getAttribute("user") : null);
        if (user == null || !"teacher".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        List<Student> students = DataStore.getAllStudents();
        List<Score> scores = DataStore.getAllScores();
        request.setAttribute("students", students);
        request.setAttribute("scores", scores);
        request.getRequestDispatcher("/teacher.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) (session != null ? session.getAttribute("user") : null);
        if (user == null || !"teacher".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String studentId = request.getParameter("studentId");
        String course = request.getParameter("course");
        String scoreStr = request.getParameter("score");

        if (studentId != null && course != null && scoreStr != null) {
            try {
                double scoreVal = Double.parseDouble(scoreStr);
                Student student = DataStore.findStudent(studentId);
                if (student != null) {
                    Score s = new Score(studentId, student.getName(), course, scoreVal);
                    DataStore.addScore(s);
                    request.setAttribute("msg", "成绩录入成功！");
                } else {
                    request.setAttribute("error", "学生不存在");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "成绩格式错误");
            }
        }

        List<Student> students = DataStore.getAllStudents();
        List<Score> scores = DataStore.getAllScores();
        request.setAttribute("students", students);
        request.setAttribute("scores", scores);
        request.getRequestDispatcher("/teacher.jsp").forward(request, response);
    }
}
