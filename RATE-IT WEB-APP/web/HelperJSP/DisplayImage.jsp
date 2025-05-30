<%@page import="rateit.entities.Customer"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="dbclasses.Customer_database"%>
<%@page import="rateit.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Customer c = (Customer) session.getAttribute("Customer");
    byte[] b = null;
    Customer_database cd = new Customer_database(ConnectionProvider.getConnection());
    Blob blob = cd.getImage(c.getUSER_ID());
    try {
        b = blob.getBytes(1, (int) blob.length());
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.setContentType("image/gif");
    OutputStream o = response.getOutputStream();
    o.write(b);
    o.flush();
    o.close();
%>
