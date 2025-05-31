<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*, javax.servlet.http.HttpSession, java.text.SimpleDateFormat, java.util.Calendar" %>

<%
    HttpSession sessionUser = request.getSession(false);
    if (sessionUser == null || sessionUser.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int userId = (Integer) sessionUser.getAttribute("userId");
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    List<Map<String, String>> expensesList = new ArrayList<Map<String, String>>();
    List<String> availableMonths = new ArrayList<String>();
    List<Map<String, String>> memberList = new ArrayList<Map<String, String>>();

    double totalExpenses = 0.0;
    double memberBudget = 0.0;

    SimpleDateFormat monthFormat = new SimpleDateFormat("yyyy-MM");
    SimpleDateFormat displayFormat = new SimpleDateFormat("MMMM yyyy");

    String selectedMonth = request.getParameter("month");
    String selectedMemberIdStr = request.getParameter("memberId");
    int selectedMemberId = -1;

    Calendar calendar = Calendar.getInstance();
    if (selectedMonth == null || selectedMonth.trim().isEmpty()) {
        selectedMonth = monthFormat.format(calendar.getTime());
    }

    try {
        conn = com.expensetracker.db.DBConnection.getConnection();

        pst = conn.prepareStatement("SELECT id, name, budget FROM members WHERE user_id=?");
        pst.setInt(1, userId);
        rs = pst.executeQuery();
        while (rs.next()) {
            Map<String, String> member = new HashMap<String, String>();
            member.put("id", String.valueOf(rs.getInt("id")));
            member.put("name", rs.getString("name"));
            member.put("budget", String.valueOf(rs.getDouble("budget")));
            memberList.add(member);

            if (selectedMemberIdStr == null) {
                selectedMemberIdStr = member.get("id");
            }
        }
        rs.close();
        pst.close();

        if (selectedMemberIdStr != null) {
            selectedMemberId = Integer.parseInt(selectedMemberIdStr);
        }

        pst = conn.prepareStatement("SELECT budget FROM members WHERE id=? AND user_id=?");
        pst.setInt(1, selectedMemberId);
        pst.setInt(2, userId);
        rs = pst.executeQuery();
        if (rs.next()) {
            memberBudget = rs.getDouble("budget");
        }
        rs.close();
        pst.close();

        pst = conn.prepareStatement("SELECT DISTINCT DATE_FORMAT(date, '%Y-%m') as month FROM expenses WHERE user_id=? AND member_id=? ORDER BY month DESC");
        pst.setInt(1, userId);
        pst.setInt(2, selectedMemberId);
        rs = pst.executeQuery();
        while (rs.next()) {
            availableMonths.add(rs.getString("month"));
        }
        rs.close();
        pst.close();

        pst = conn.prepareStatement("SELECT id, name, amount, date FROM expenses WHERE user_id=? AND member_id=? AND DATE_FORMAT(date, '%Y-%m')=? ORDER BY date DESC");
        pst.setInt(1, userId);
        pst.setInt(2, selectedMemberId);
        pst.setString(3, selectedMonth);
        rs = pst.executeQuery();

        while (rs.next()) {
            Map<String, String> expense = new HashMap<String, String>();
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

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Member Expenses</title>
    <link rel="stylesheet" href="css/viewMemberExpenses.css">
</head>
<body>
<div class="container">
    <h2>Member Expenses - <%= displayFormat.format(monthFormat.parse(selectedMonth)) %></h2>

    <form method="get" action="viewMemberExpenses.jsp" class="filters">
        <div class="form-group">
            <label for="memberId">Select Member:</label>
            <select name="memberId" id="memberId" onchange="this.form.submit()">
                <% for (int i = 0; i < memberList.size(); i++) {
                    Map<String, String> member = memberList.get(i);
                %>
                    <option value="<%= member.get("id") %>" <%= member.get("id").equals(selectedMemberIdStr) ? "selected" : "" %>>
                        <%= member.get("name") %>
                    </option>
                <% } %>
            </select>
        </div>

        <div class="form-group">
            <label for="month">Select Month:</label>
            <select name="month" id="month" onchange="this.form.submit()">
                <% for (int i = 0; i < availableMonths.size(); i++) {
                    String month = availableMonths.get(i);
                %>
                    <option value="<%= month %>" <%= month.equals(selectedMonth) ? "selected" : "" %>>
                        <%= displayFormat.format(monthFormat.parse(month)) %>
                    </option>
                <% } %>
            </select>
        </div>
    </form>

    <table class="expense-table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Amount</th>
                <th>Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <% for (int i = 0; i < expensesList.size(); i++) {
            Map<String, String> expense = expensesList.get(i);
        %>
            <tr>
                <td><%= expense.get("name") %></td>
                <td>₹<%= expense.get("amount") %></td>
                <td><%= expense.get("date") %></td>
                <td><a class="edit-btn" href="editExpense.jsp?id=<%= expense.get("id") %>">Edit</a></td>
            </tr>
        <% } %>
        </tbody>
    </table>

    <div class="summary">
        <p><strong>Total:</strong> ₹<%= totalExpenses %></p>
        <p><strong>Budget:</strong> ₹<%= memberBudget %></p>
        <p><strong>Remaining:</strong> ₹<%= memberBudget - totalExpenses %></p>
    </div>

    <a href="dashboard.jsp" class="back-button">← Back to Dashboard</a>
</div>
</body>
</html>
