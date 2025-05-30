<%@page import="dbclasses.Company_database"%>
<%@page import="rateit.entities.Customer"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="dbclasses.Customer_database"%>
<%@page import="rateit.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = request.getParameter("name");
   
    byte[] b = null;
    Company_database cd = new Company_database(ConnectionProvider.getConnection());
    Blob blob = cd.getCompanyImage(name);
    try {
        b = blob.getBytes(1, (int) blob.length());
     
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.setContentType("image/gif");
    OutputStream oo = response.getOutputStream();
    oo.write(b);
    oo.flush();
    oo.close();
%>
