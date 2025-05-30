<%-- Document : submitted Created on : 12-Mar-2023, 12:56:15 pm Author : asus --%>

<%@page import="rateit.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <%
        Message message = null;
        Message message1 = null;
        message = (Message) session.getAttribute("message");
        message1 = (Message) session.getAttribute("msg");

    %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Review Submitted</title>

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Unbounded:wght@300&display=swap');

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Unbounded', cursive;
            }

            body {
                text-align: center;
                justify-content: center;
                display: flex;
            }

            div {
                background-image: linear-gradient(rgba(240, 202, 250, 0.918), rgba(187, 215, 250, 0.932));
                width: 60%;
                text-align: center;
                border: 2px double black;
                margin-top: 10%;
            }

            h1 {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            #time {
                border: 1px solid black;
                color: red;
                font-size: 18px;
            }

            img {
                height: 130px;
                animation: mymove 0.8s;
            }


            @keyframes mymove {
                70% {
                    transform: rotate(360deg);
                }

                100% {
                    transform: scale(1.2);
                }
            }
        </style>
    </head>

    <body>
        <div><br>
            <img src="img/ticked-mark.png" alt="Submitted Successfully"><br><br>
            <%if (message != null) {%>
            <h1 id="message"><%=message.getMsg_name()%>
                <% session.removeAttribute("message");
                    message = null;
                %>
            </h1>
            <%}
                  else if (message1 != null) {%>
            <h1 id="message1">Request is Sent Successfully<%
                    session.removeAttribute("msg");
                    message1 = null;
                %></h1>

            <%
} else {%>
            <h1 id="message">Review Submitted Successfully.</h1><%}%><br>
            <span style="font-weight: bolder;"> You will be redirected to home page in <span
                    id="time">4</span></span><br><br>
        </div>
        <script>
            let timeout = 3;
            let iterator = timeout;
            let msg = "Review Submitted Successfully.";
            let msg1 = "Request is Sent Successfully";
            let redirectTo = "index.jsp";

            window.addEventListener("load", () => {
                setInterval(updateTime, 1000);

  
                if (message.innerText != msg)
                    redirectTo = "comp_home_page.jsp";

              
              
                
                setTimeout(redirect, timeout * 1000);
            });

            function updateTime() {
                document.getElementById("time").innerText = iterator--;
            }
            function redirect() {
                window.location.href = redirectTo;
            }
        </script>

    </body>

</html>