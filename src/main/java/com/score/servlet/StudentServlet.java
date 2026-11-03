package com.score.servlet;

import com.score.dao.DataStore;
import com.score.model.Score;
import com.score.model.User;
import com.score.service.ScoreService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class StudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) (session != null ? session.getAttribute("user") : null);
        if (user == null || !"student".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String studentId = user.getUsername();
        List<Score> scores = DataStore.getScoresByStudentId(studentId);
        double avg = new ScoreService().getStudentAverage(studentId);

        request.setAttribute("scores", scores);
        request.setAttribute("average", avg);
        request.setAttribute("studentName", user.getName());
        request.getRequestDispatcher("/student.jsp").forward(request, response);
    }
}
