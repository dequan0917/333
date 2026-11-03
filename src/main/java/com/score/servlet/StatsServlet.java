package com.score.servlet;

import com.score.model.User;
import com.score.service.ScoreService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

public class StatsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) (session != null ? session.getAttribute("user") : null);
        if (user == null || !"teacher".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        ScoreService service = new ScoreService();
        Map<String, double[]> stats = service.getCourseStats();
        request.setAttribute("stats", stats);
        request.getRequestDispatcher("/stats.jsp").forward(request, response);
    }
}
