package com.uitm.csc584.tourism.servlet;

import com.uitm.csc584.tourism.model.Db;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String sql = "SELECT id FROM admin_users WHERE username = ? AND password = ?";

        try (Connection conn = Db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("adminUser", username);
                    session.setMaxInactiveInterval(30 * 60); // 30 minutes
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
                } else {
                    request.setAttribute("error", "Invalid username or password.");
                    request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
                }
            }

        } catch (SQLException e) {
            request.setAttribute("error", "Database error. Please try again.");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
        }
    }
}
