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
    <title>Add Expense</title>
    <link rel="stylesheet" href="css/expense.css">
</head>
<body>
<div class="page-wrapper">
    <div class="card">
        <h2>Add New Personal Expense</h2>

        <% if (request.getParameter("error") != null) { %>
            <p class="error-msg">Failed to add expense. Please try again.</p>
        <% } %>
        <% if (request.getParameter("success") != null) { %>
            <p class="success-msg">Expense added successfully!</p>
        <% } %>

        <form action="AddExpenseServlet" method="post">
            <label>Expense Name:</label>
            <input type="text" name="name" required>

            <label>Amount (₹):</label>
            <input type="number" name="amount" step="0.01" required>

            <label>Date:</label>
            <input type="date" name="date" required>

            <button type="submit">Add Expense</button>
        </form>

        <div class="bottom-link">
            <a href="dashboard.jsp" class="back-btn">Back to Dashboard</a>
        </div>
    </div>
</div>
</body>
</html>
