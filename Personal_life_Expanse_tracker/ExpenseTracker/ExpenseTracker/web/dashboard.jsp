<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.sql.*, javax.servlet.http.HttpSession" %>

<%
    HttpSession sessionUser = request.getSession(false);
    if (sessionUser == null || sessionUser.getAttribute("username") == null) {
        response.sendRedirect("login.jsp?error=Please login first.");
        return;
    }

    String username = (String) sessionUser.getAttribute("username");
    int userId = (Integer) sessionUser.getAttribute("userId");
    double budget = (Double) sessionUser.getAttribute("budget");

    double totalMonthly = 0;
    Calendar cal = Calendar.getInstance();
    int year = cal.get(Calendar.YEAR);
    int month = cal.get(Calendar.MONTH) + 1;

    try {
        Class.forName("com.mysql.jdbc.Driver"); // or "com.mysql.cj.jdbc.Driver" for MySQL 8+
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/expensetracker_final", "root", "");

        String sql = "SELECT SUM(amount) AS total FROM expenses WHERE user_id = ? AND MONTH(`date`) = ? AND YEAR(`date`) = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, userId);
        stmt.setInt(2, month);
        stmt.setInt(3, year);

        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            totalMonthly = rs.getDouble("total");
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>

<div class="sidebar">
    <h2>Expense Tracker</h2>
    <ul>
        <li><a href="dashboard.jsp" class="active">Dashboard</a></li>
        <li><a href="addExpense.jsp">Add Expense</a></li>
        <li><a href="viewExpenses.jsp">View Expenses</a></li>
        <li><a href="addMember.jsp">Add Member</a></li>
        <li><a href="addMemberExpense.jsp">Add Member Expense</a></li>
        <li><a href="viewMemberExpenses.jsp">View Member Expenses</a></li>
        <li><a href="updateBudget.jsp">Update Budget</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul>
</div>

<div class="main-content">
    <div class="top-bar">
        <h1>Welcome, <%= username %>!</h1>
        <p>Your Monthly Budget: <strong>₹<%= budget %></strong></p>
        <p>Total Spent this Month: <strong>₹<%= totalMonthly %></strong></p>

        <% if (totalMonthly > budget) { %>
            <div class="budget-alert" style="margin-top:15px; padding: 12px; background-color: #ffe6e6; color: #c0392b; border-left: 6px solid #e74c3c;">
                ⚠️ Alert: You have exceeded your monthly budget!
            </div>
        <% } %>
    </div>

    <div class="card">
        <h3>Quick Actions</h3>
        <div class="actions">
            <a href="addExpense.jsp">+ Add Expense</a>
            <a href="viewExpenses.jsp">📄 View Expenses</a>
            <a href="updateBudget.jsp">💰 Update Budget</a>
        </div>
    </div>
</div>

</body>
</html>
