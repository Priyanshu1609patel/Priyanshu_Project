<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession sessionUser = request.getSession(false);
    if (sessionUser == null || sessionUser.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Add Member</title>
    <link rel="stylesheet" href="css/expense.css">
</head>
<body>
<div class="page-wrapper">
    <div class="card">
        <h2>Add New Member</h2>

        <% if (request.getParameter("error") != null) { %>
            <p class="error-msg"><%= request.getParameter("error") %></p>
        <% } %>
        <% if (request.getParameter("success") != null) { %>
            <p class="success-msg"><%= request.getParameter("success") %></p>
        <% } %>

        <form action="AddMemberServlet" method="post">
            <label>Member Name:</label>
            <input type="text" name="name" required>

            <label>Budget (₹):</label>
            <input type="number" step="0.01" name="budget" required>

            <button type="submit">Add Member</button>
        </form>

        <div class="bottom-link">
            <a href="dashboard.jsp" class="back-btn">Back to Dashboard</a>
        </div>
    </div>
</div>
</body>
</html>
