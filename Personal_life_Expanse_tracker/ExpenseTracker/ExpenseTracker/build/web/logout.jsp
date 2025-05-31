<%@ page import="javax.servlet.http.HttpSession" %>

<%
HttpSession sessionUser = request.getSession(false);
if (sessionUser != null) {
    sessionUser.invalidate(); // Destroy session
}
response.sendRedirect("login.jsp"); // Redirect to login page
%>
