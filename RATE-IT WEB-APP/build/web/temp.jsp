<%-- 
    Document   : temp
    Created on : 09-Mar-2023, 6:10:31 pm
    Author     : Dell
--%>

<%@page import="rateit.entities.Company"%>
<%@page import="dbclasses.Company_database"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbclasses.Poll_database"%>
<%@page import="rateit.entities.Poll"%>
<%@page import="rateit.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="preloader">
        <div class="load">
            <img src="img/loading.gif" alt="dfd">
        </div>
    </div>
        <h1>hii</h1>
         <%
                   Poll_database pd = new Poll_database(ConnectionProvider.getConnection()); 
                   ArrayList<Poll> list = pd.getAllPoll();
                   
          
                %>
                <%for(Poll p : list){%><%
             Company_database cd = new Company_database(ConnectionProvider.getConnection());
               Company c =cd.getCompanyByName(p.getCOMPANY1());%>
             
               <p><%=c.getCOMPANY_NAME() %></p>
               <p><%=c.getCOMPANY_ID() %></p>
               
               
               
                <%}%>
    </body>
</html>
