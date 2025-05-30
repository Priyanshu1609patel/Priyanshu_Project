<%@page import="dbclasses.Report_database"%>
<%@page import="dbclasses.Company_database"%>
<%@page import="rateit.entities.Customer"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="dbclasses.Customer_database"%>
<%@page import="rateit.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int COMPANY_ID= Integer.parseInt(request.getParameter("cmp_id"));
    int POLL_ID= Integer.parseInt(request.getParameter("poll_id"));
    String name = "hello.pdf";
    byte[] b = null;
    Report_database rd = new Report_database(ConnectionProvider.getConnection());
     Blob blob=rd.getCompanyReport(COMPANY_ID, POLL_ID);
    try {
        b = blob.getBytes(1, (int) blob.length());
     
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.setContentType("application/pdf");
//    response.setContentType("APPLICATION/OCTET-STREAM");
//    response.setHeader("Conetent-Disposition","attachment;filename=\""+name+"\"");
    OutputStream oo = response.getOutputStream();
    oo.write(b);
    oo.flush();
    oo.close();
%>

