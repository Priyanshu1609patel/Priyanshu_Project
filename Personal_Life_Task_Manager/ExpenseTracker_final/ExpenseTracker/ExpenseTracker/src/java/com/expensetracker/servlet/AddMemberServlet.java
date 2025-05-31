// AddMemberServlet.java
package com.expensetracker.servlet;

import com.expensetracker.db.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddMemberServlet")
public class AddMemberServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");
        String name = request.getParameter("name");
        String budgetStr = request.getParameter("budget");

        try {
            double budget = Double.parseDouble(budgetStr);
            Connection conn = DBConnection.getConnection();

            PreparedStatement ps = conn.prepareStatement("INSERT INTO members (user_id, name, budget) VALUES (?, ?, ?)");
            ps.setInt(1, userId);
            ps.setString(2, name);
            ps.setDouble(3, budget);

            int result = ps.executeUpdate();
            if (result > 0) {
                response.sendRedirect("dashboard.jsp?success=Member added");
            } else {
                response.sendRedirect("addMember.jsp?error=Failed to add member");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addMember.jsp?error=Something went wrong");
        }
    }
}
