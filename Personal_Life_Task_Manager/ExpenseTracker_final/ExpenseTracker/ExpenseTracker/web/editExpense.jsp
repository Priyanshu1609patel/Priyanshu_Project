<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, javax.servlet.http.*, java.text.*" %>

<%
    HttpSession sessionUser = request.getSession(false);
    if (sessionUser == null || sessionUser.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int userId = (Integer) sessionUser.getAttribute("userId");
    int expenseId = Integer.parseInt(request.getParameter("id"));

    String name = "";
    double amount = 0;
    String date = "";

    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        conn = com.expensetracker.db.DBConnection.getConnection();
        pst = conn.prepareStatement("SELECT name, amount, date FROM expenses WHERE id=? AND user_id=?");
        pst.setInt(1, expenseId);
        pst.setInt(2, userId);
        rs = pst.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            amount = rs.getDouble("amount");
            date = rs.getDate("date").toString();
        }

        rs.close();
        pst.close();

        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String newName = request.getParameter("name");
            double newAmount = Double.parseDouble(request.getParameter("amount"));
            String newDate = request.getParameter("date");

            pst = conn.prepareStatement("UPDATE expenses SET name=?, amount=?, date=? WHERE id=? AND user_id=?");
            pst.setString(1, newName);
            pst.setDouble(2, newAmount);
            pst.setString(3, newDate);
            pst.setInt(4, expenseId);
            pst.setInt(5, userId);
            pst.executeUpdate();
            pst.close();

            response.sendRedirect("viewExpenses.jsp");
            return;
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
        try { if (pst != null) pst.close(); } catch (SQLException ignored) {}
        try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
    }
%>

<html>
<head>
    <title>Edit Expense</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
    <h2>Edit Expense</h2>
    <form method="post">
        <label>Expense Name:</label>
        <input type="text" name="name" value="<%= name %>" required><br>

        <label>Amount:</label>
        <input type="number" name="amount" value="<%= amount %>" required><br>

        <label>Date:</label>
        <input type="date" name="date" value="<%= date %>" required><br>

        <button type="submit">Update Expense</button>
    </form>

    <p><a href="viewExpenses.jsp">Cancel</a></p>
</div>
</body>
</html>
