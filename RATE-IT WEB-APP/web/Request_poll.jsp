<%@page import="java.util.ArrayList"%>
<%@page import="rateit.helper.ConnectionProvider"%>
<%@page import="dbclasses.Company_services_database"%>
<%@page import="rateit.entities.Company_services"%>
<%@page import="rateit.entities.Company"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
HttpSession session1 = request.getSession();
session.setMaxInactiveInterval(40*60);
 Company cc=(Company)session1.getAttribute("Company");
 if(cc == null){
 
 response.sendRedirect("index.jsp");
    }
 Company_services_database cs = new Company_services_database(ConnectionProvider.getConnection());
 
     ArrayList<Company_services> csList= cs.getAllCategories(cc.getCOMPANY_ID());
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <title>Request Poll | rateit.com</title>
    <link rel="stylesheet" href="css/request_poll.css?1">
    <link rel="stylesheet" href="css/loading_effect.css">
    <script src="javascript/loading_effect.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>

<body>
    <div id="preloader">
        <div class="load">
            <img src="img/loading.gif" alt="dfd">
        </div>
    </div>
    
    <div id="container">
        <form action="AcceptRequest" method="post">
        <div id="com-info">
            <img src="HelperJSP/DisplayCmpImage.jsp?name=<%=cc.getCOMPANY_NAME()%>"
                alt="company name">
            <h2><%=cc.getCOMPANY_NAME()%></h2>
        </div>
        <div id="content-box">
            <div class="checkboxGroup">
                <%for(Company_services e : csList){%>
                <label><%=e.getCOMPANY_SERVICES() %></label><br>
               <%}%>
            </div>
            <div id="srh-com">
                <input type="search" placeholder="Opposite Company Name :">
                <p>Enter company name which you want to display your opposite in a poll <b>(Optional)</b></p>
            </div>
        </div> <%
        out.println("<input type='hidden' name='id' value="+cc.getCOMPANY_ID()+">");
        
        %>
        <button type="submit">Submit Request</button>
       
        </form>
    </div>
</body>

</html>
