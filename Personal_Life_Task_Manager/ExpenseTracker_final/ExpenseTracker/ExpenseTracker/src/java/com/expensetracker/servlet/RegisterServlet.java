package com.expensetracker.servlet;

import com.expensetracker.db.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String budgetStr = request.getParameter("budget");

        double budget = 0.0;
        try {
            budget = Double.parseDouble(budgetStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("register.jsp?error=Invalid budget amount");
            return;
        }

        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                response.sendRedirect("register.jsp?error=Database connection failed");
                return;
            }

            // Check if email already exists
            PreparedStatement checkUser = conn.prepareStatement("SELECT * FROM users WHERE email = ?");
            checkUser.setString(1, email);
            ResultSet rs = checkUser.executeQuery();

            if (rs.next()) {
                response.sendRedirect("register.jsp?error=User already exists");
                return;
            }

            // Insert new user
            PreparedStatement ps = conn.prepareStatement("INSERT INTO users (username, email, password, budget) VALUES (?, ?, ?, ?)");
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setDouble(4, budget);

            int result = ps.executeUpdate();
            if (result > 0) {
                response.sendRedirect("login.jsp?success=Registration successful! Please login.");
            } else {
                response.sendRedirect("register.jsp?error=Registration failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=Something went wrong.");
        }
    }
}
