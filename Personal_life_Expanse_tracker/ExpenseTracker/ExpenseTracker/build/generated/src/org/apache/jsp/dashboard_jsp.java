package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;
import javax.servlet.http.HttpSession;

public final class dashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");

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

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Dashboard</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/dashboard.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<div class=\"sidebar\">\n");
      out.write("    <h2>Expense Tracker</h2>\n");
      out.write("    <ul>\n");
      out.write("        <li><a href=\"dashboard.jsp\" class=\"active\">Dashboard</a></li>\n");
      out.write("        <li><a href=\"addExpense.jsp\">Add Expense</a></li>\n");
      out.write("        <li><a href=\"viewExpenses.jsp\">View Expenses</a></li>\n");
      out.write("        <li><a href=\"addMember.jsp\">Add Member</a></li>\n");
      out.write("        <li><a href=\"addMemberExpense.jsp\">Add Member Expense</a></li>\n");
      out.write("        <li><a href=\"viewMemberExpenses.jsp\">View Member Expenses</a></li>\n");
      out.write("        <li><a href=\"updateBudget.jsp\">Update Budget</a></li>\n");
      out.write("        <li><a href=\"logout.jsp\">Logout</a></li>\n");
      out.write("    </ul>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<div class=\"main-content\">\n");
      out.write("    <div class=\"top-bar\">\n");
      out.write("        <h1>Welcome, ");
      out.print( username );
      out.write("!</h1>\n");
      out.write("        <p>Your Monthly Budget: <strong>₹");
      out.print( budget );
      out.write("</strong></p>\n");
      out.write("        <p>Total Spent this Month: <strong>₹");
      out.print( totalMonthly );
      out.write("</strong></p>\n");
      out.write("\n");
      out.write("        ");
 if (totalMonthly > budget) { 
      out.write("\n");
      out.write("            <div class=\"budget-alert\" style=\"margin-top:15px; padding: 12px; background-color: #ffe6e6; color: #c0392b; border-left: 6px solid #e74c3c;\">\n");
      out.write("                ⚠️ Alert: You have exceeded your monthly budget!\n");
      out.write("            </div>\n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"card\">\n");
      out.write("        <h3>Quick Actions</h3>\n");
      out.write("        <div class=\"actions\">\n");
      out.write("            <a href=\"addExpense.jsp\">+ Add Expense</a>\n");
      out.write("            <a href=\"viewExpenses.jsp\">📄 View Expenses</a>\n");
      out.write("            <a href=\"updateBudget.jsp\">💰 Update Budget</a>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
