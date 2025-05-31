package com.expensetracker.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.expensetracker.db.DBConnection;

@WebServlet("/AddExpenseServlet")
public class AddExpenseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");
        String name = request.getParameter("name");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String date = request.getParameter("date"); // Get date from form

        Connection conn = null;
        PreparedStatement pst = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO expenses (user_id, name, amount, date) VALUES (?, ?, ?, ?)";
            pst = conn.prepareStatement(sql);
            pst.setInt(1, userId);
            pst.setString(2, name);
            pst.setDouble(3, amount);
            pst.setString(4, date);

            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("viewExpenses.jsp?success=1");
            } else {
                response.sendRedirect("addExpense.jsp?error=Failed to add expense");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("addExpense.jsp?error=SQL Error");
        } finally {
            try { if (pst != null) pst.close(); } catch (SQLException ignored) {}
            try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
        }
    }
}
