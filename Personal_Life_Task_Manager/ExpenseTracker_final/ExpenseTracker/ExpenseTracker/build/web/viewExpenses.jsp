<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*, javax.servlet.http.HttpSession, java.text.SimpleDateFormat, java.util.Calendar" %>

<%
    HttpSession sessionUser = request.getSession(false);
    if (sessionUser == null || sessionUser.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int userId = ((Integer) sessionUser.getAttribute("userId")).intValue();
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    double totalExpenses = 0.0;
    double userBudget = 0.0;

    ArrayList expensesList = new ArrayList();
    ArrayList availableMonths = new ArrayList();

    SimpleDateFormat monthFormat = new SimpleDateFormat("yyyy-MM");
    SimpleDateFormat displayFormat = new SimpleDateFormat("MMMM yyyy");

    String selectedMonth = request.getParameter("month");
    Calendar calendar = Calendar.getInstance();
    if (selectedMonth == null || selectedMonth.trim().equals("")) {
        selectedMonth = monthFormat.format(calendar.getTime());
    }

    try {
        conn = com.expensetracker.db.DBConnection.getConnection();

        pst = conn.prepareStatement("SELECT budget FROM users WHERE id=?");
        pst.setInt(1, userId);
        rs = pst.executeQuery();
        if (rs.next()) {
            userBudget = rs.getDouble("budget");
        }
        rs.close(); pst.close();

        pst = conn.prepareStatement("SELECT DISTINCT DATE_FORMAT(date, '%Y-%m') as month FROM expenses WHERE user_id=? AND member_id IS NULL ORDER BY month DESC");
        pst.setInt(1, userId);
        rs = pst.executeQuery();
        while (rs.next()) {
            availableMonths.add(rs.getString("month"));
        }
        rs.close(); pst.close();

        pst = conn.prepareStatement("SELECT id, name, amount, date FROM expenses WHERE user_id=? AND member_id IS NULL AND DATE_FORMAT(date, '%Y-%m')=? ORDER BY date DESC");
        pst.setInt(1, userId);
        pst.setString(2, selectedMonth);
        rs = pst.executeQuery();

        while (rs.next()) {
            HashMap expense = new HashMap();
            expense.put("id", String.valueOf(rs.getInt("id")));
            expense.put("name", rs.getString("name"));
            expense.put("amount", String.valueOf(rs.getDouble("amount")));
            expense.put("date", rs.getDate("date").toString());
            expensesList.add(expense);
            totalExpenses += rs.getDouble("amount");
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
    <title>View Personal Expenses</title>
    <link rel="stylesheet" href="css/viewExpenses.css">
</head>
<body>
<div class="container">
    <h2>Personal Expenses for <%= displayFormat.format(monthFormat.parse(selectedMonth)) %></h2>

    <form method="get" action="viewExpenses.jsp" class="month-form">
        <label for="month">Select Month:</label>
        <select name="month" id="month" onchange="this.form.submit()">
            <% for (int i = 0; i < availableMonths.size(); i++) {
                String month = (String) availableMonths.get(i); %>
                <option value="<%= month %>" <%= month.equals(selectedMonth) ? "selected" : "" %>>
                    <%= displayFormat.format(monthFormat.parse(month)) %>
                </option>
            <% } %>
        </select>
    </form>

    <% if (request.getParameter("success") != null) { %>
        <p class="success">Expense added successfully!</p>
    <% } %>

    <table>
        <tr>
            <th>Expense Name</th>
            <th>Amount (₹)</th>
            <th>Date</th>
            <th>Action</th>
        </tr>
        <% for (int i = 0; i < expensesList.size(); i++) {
            HashMap expense = (HashMap) expensesList.get(i); %>
            <tr>
                <td><%= expense.get("name") %></td>
                <td>₹<%= expense.get("amount") %></td>
                <td><%= expense.get("date") %></td>
                <td><a class="edit-btn" href="editExpense.jsp?id=<%= expense.get("id") %>">Edit</a></td>
            </tr>
        <% } %>
    </table>

    <div class="summary">
        <p><strong>Total Expenses:</strong> ₹<%= totalExpenses %></p>
        <p><strong>Budget:</strong> ₹<%= userBudget %></p>
        <p><strong>Remaining:</strong> ₹<%= userBudget - totalExpenses %></p>
    </div>

    <a class="back-btn" href="dashboard.jsp">← Back to Dashboard</a>
</div>
</body>
</html>
