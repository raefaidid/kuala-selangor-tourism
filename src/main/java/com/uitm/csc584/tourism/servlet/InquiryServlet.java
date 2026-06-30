package com.uitm.csc584.tourism.servlet;

import com.uitm.csc584.tourism.model.Db;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/submit-inquiry")
public class InquiryServlet extends HttpServlet {

    private static final String INSERT_SQL =
        "INSERT INTO inquiries (name, contact_number, gender, email, how_heard, message) " +
        "VALUES (?, ?, ?, ?, ?, ?)";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name          = request.getParameter("name");
        String contactNumber = request.getParameter("contactNumber");
        String gender        = request.getParameter("gender");
        String email         = request.getParameter("email");
        String howHeard      = request.getParameter("howHeard");
        String message       = request.getParameter("message");

        // Server-side validation as backup to client-side checks
        if (isBlank(name) || isBlank(contactNumber) || isBlank(gender) ||
                isBlank(email) || isBlank(howHeard) || isBlank(message)) {
            request.setAttribute("error", "All fields are required. Please fill in the form completely.");
            request.getRequestDispatcher("/contact.jsp").forward(request, response);
            return;
        }

        try (Connection conn = Db.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_SQL)) {

            ps.setString(1, name.trim());
            ps.setString(2, contactNumber.trim());
            ps.setString(3, gender);
            ps.setString(4, email.trim());
            ps.setString(5, howHeard);
            ps.setString(6, message.trim());
            ps.executeUpdate();

            request.setAttribute("success", "Inquiry Sent Successfully! We will get back to you soon.");
            request.getRequestDispatcher("/contact.jsp").forward(request, response);

        } catch (SQLException e) {
            request.setAttribute("error", "A database error occurred. Please try again later.");
            request.getRequestDispatcher("/contact.jsp").forward(request, response);
        }
    }

    private boolean isBlank(String value) {
        return value == null || value.isBlank();
    }
}
