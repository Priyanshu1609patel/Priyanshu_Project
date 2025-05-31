<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.expensetracker.db.DBConnection" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession sessionUser = request.getSession(false);
    if (sessionUser == null || sessionUser.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    int userId = (Integer) sessionUser.getAttribute("userId");
%>
<html>
<head>
    <title>Add Member Expense</title>
    <link rel="stylesheet" href="css/expense.css">
</head>
<body>
<div class="page-wrapper">
    <div class="card">
        <h2>Add Expense for a Member</h2>

        <% if (request.getParameter("success") != null) { %>
            <p class="success-msg">Expense added successfully!</p>
        <% } else if (request.getParameter("error") != null) { %>
            <p class="error-msg">Failed to add expense. Please try again.</p>
        <% } %>

        <form action="AddMemberExpenseServlet" method="post">
            <label>Member:</label>
            <select name="member_id" required>
                <%
                    try {
                        Connection conn = DBConnection.getConnection();
                        PreparedStatement ps = conn.prepareStatement("SELECT id, name FROM members WHERE user_id = ?");
                        ps.setInt(1, userId);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                %>
                    <option value="<%= rs.getInt("id") %>"><%= rs.getString("name") %></option>
                <%
                        }
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select>

            <label>Expense Name:</label>
            <input type="text" name="name" required>

            <label>Amount (₹):</label>
            <input type="number" step="0.01" name="amount" required>

            <label>Date:</label>
            <input type="date" name="date" required>

            <button type="submit">Add Member Expense</button>
        </form>

        <div class="bottom-link">
            <a href="dashboard.jsp" class="back-btn">Back to Dashboard</a>
        </div>
    </div>
</div>
</body>
</html>
