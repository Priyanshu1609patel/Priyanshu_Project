<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*, javax.servlet.http.*" %>

<%
    HttpSession sessionUser = request.getSession(false);
    if (sessionUser == null || sessionUser.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int userId = (Integer) sessionUser.getAttribute("userId");

    String action = request.getParameter("action");
    String message = null;

    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    double personalBudget = 0.0;
    List<Map<String, String>> members = new ArrayList<Map<String, String>>();

    try {
        conn = com.expensetracker.db.DBConnection.getConnection();

        if ("updatePersonal".equals(action)) {
            double newBudget = Double.parseDouble(request.getParameter("newPersonalBudget"));
            pst = conn.prepareStatement("UPDATE users SET budget=? WHERE id=?");
            pst.setDouble(1, newBudget);
            pst.setInt(2, userId);
            pst.executeUpdate();
            message = "Personal budget updated successfully.";
            pst.close();
        }

        if ("updateMember".equals(action)) {
            int memberId = Integer.parseInt(request.getParameter("memberId"));
            double newBudget = Double.parseDouble(request.getParameter("newMemberBudget"));
            pst = conn.prepareStatement("UPDATE members SET budget=? WHERE id=? AND user_id=?");
            pst.setDouble(1, newBudget);
            pst.setInt(2, memberId);
            pst.setInt(3, userId);
            pst.executeUpdate();
            message = "Member budget updated successfully.";
            pst.close();
        }

        // Get current personal budget
        pst = conn.prepareStatement("SELECT budget FROM users WHERE id=?");
        pst.setInt(1, userId);
        rs = pst.executeQuery();
        if (rs.next()) {
            personalBudget = rs.getDouble("budget");
        }
        rs.close();
        pst.close();

        // Get members
        pst = conn.prepareStatement("SELECT id, name, budget FROM members WHERE user_id=?");
        pst.setInt(1, userId);
        rs = pst.executeQuery();
        while (rs.next()) {
            Map<String, String> member = new HashMap<String, String>();
            member.put("id", String.valueOf(rs.getInt("id")));
            member.put("name", rs.getString("name"));
            member.put("budget", String.valueOf(rs.getDouble("budget")));
            members.add(member);
        }
        rs.close();
        pst.close();

    } catch (Exception e) {
        e.printStackTrace();
        message = "Error: " + e.getMessage();
    } finally {
        try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
        try { if (pst != null) pst.close(); } catch (SQLException ignored) {}
        try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
    }
%>

<html>
<head>
    <title>Update Budgets</title>
    <link rel="stylesheet" href="css/updateBudget.css">
</head>
<body>
<div class="page-wrapper">
    <div class="card">
        <h2>Update Budgets</h2>

        <% if (message != null) { %>
            <p class="message"><%= message %></p>
        <% } %>

        <form method="post" action="updateBudget.jsp" class="budget-form">
            <input type="hidden" name="action" value="updatePersonal">
            <h3>Personal Budget</h3>
            <label>Current Budget: ₹<%= personalBudget %></label><br><br>
            <label>New Budget:</label>
            <input type="number" name="newPersonalBudget" step="0.01" required>
            <input type="submit" value="Update Personal Budget" class="btn">
        </form>

        <hr>

        <h3>Update Member Budgets</h3>
        <% for (int i = 0; i < members.size(); i++) {
            Map<String, String> member = members.get(i); %>
            <form method="post" action="updateBudget.jsp" class="budget-form">
                <input type="hidden" name="action" value="updateMember">
                <input type="hidden" name="memberId" value="<%= member.get("id") %>">
                <label><%= member.get("name") %> (Current: ₹<%= member.get("budget") %>)</label><br>
                <label>New Budget:</label>
                <input type="number" name="newMemberBudget" step="0.01" required>
                <input type="submit" value="Update Budget" class="btn">
            </form>
            <br>
        <% } %>

        <div class="back-btn-wrapper">
            <a class="back-btn" href="dashboard.jsp">← Back to Dashboard</a>
        </div>
    </div>
</div>
</body>
</html>
