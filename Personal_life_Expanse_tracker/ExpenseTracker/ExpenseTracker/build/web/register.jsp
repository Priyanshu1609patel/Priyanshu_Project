<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
    <h2>User Registration</h2>

    <% if (request.getParameter("error") != null) { %>
        <p class="error"><%= request.getParameter("error") %></p>
    <% } %>

    <form action="RegisterServlet" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="number" name="budget" step="0.01" placeholder="Monthly Budget (₹)" required>
        <button type="submit">Register</button>
    </form>

    <p>Already have an account? <a href="login.jsp">Login Here</a></p>
</div>
</body>
</html>
