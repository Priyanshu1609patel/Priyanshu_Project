package com.expensetracker.servlets;

import com.expensetracker.db.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/AddMemberExpenseServlet")
public class AddMemberExpenseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");
        String name = request.getParameter("name");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String date = request.getParameter("date");
        int memberId = Integer.parseInt(request.getParameter("member_id"));

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO expenses (user_id, name, amount, date, member_id) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, name);
            ps.setDouble(3, amount);
            ps.setString(4, date);
            ps.setInt(5, memberId);
            int rows = ps.executeUpdate();
            conn.close();

            if (rows > 0) {
                response.sendRedirect("addMemberExpense.jsp?success=true");
            } else {
                response.sendRedirect("addMemberExpense.jsp?error=true");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addMemberExpense.jsp?error=true");
        }
    }
}
