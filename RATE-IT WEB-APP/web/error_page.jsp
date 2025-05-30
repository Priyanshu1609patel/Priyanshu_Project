<%@page import="rateit.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<% Message msg =(Message)session.getAttribute("msg");
   

%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page | rateit.com</title>
    <link rel="stylesheet" href="css/error_page.css?2">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Unbounded:wght@300&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Unbounded', cursive;
}

body {
    background-image: linear-gradient(rgba(187, 215, 250, 0.932), rgba(240, 202, 250, 0.918));
}

#cont1 {
    padding: 4% 0% 0% 20%;
    height: 100vh;
}

#cont2 {
    box-sizing: border-box;
    width: 80%;
    text-align: center;
    background-color: white;
    box-shadow: 1px 1px 10px grey;
}

#error_img {
    margin: 10px 0px;
    height: 170px;
    width: 170px;
}

p {
    color: rgb(44, 44, 44);
    margin: 0px 10px 0px 10px;
    font-size: 36px;
    font-weight: 900;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
}

h3 {
    color: rgb(63, 62, 62);
    margin: 50px 40px 20px 40px;
    font-size: 19px;
}

#btn1,
#btn2 {
    height: 45px;
    width: 200px;
    margin: 5px 20px;
    font-size: 16px;
    font-weight: 600;
    border-radius: 50px;
    transition: all 0.3s;
}

#btn1:hover,
#btn2:hover {
    transform: scale(1.02);
}

#btn1 {
    background-color: rgb(237, 75, 75);
    border: none;
    color: white;
    margin-top: 50px;
}

#btn2 {
    background-color: white;
    color: rgb(237, 75, 75);
    border: 1px solid rgb(237, 75, 75);
    margin: 5px 0px 40px 0px;
}

@media(max-width: 1000px) {

    #cont1 {
        padding-left: 10%;
        margin-top: 15%;
        height: 75vh;
    }
}

@media(max-width: 900px) {

    #cont2 {
        width: 90%
    }
}

@media(max-width: 550px) {

    #cont1 {
        margin-top: 15%;
    }

    #btn1,
    #btn2 {
        margin: 5px 10px;
    }

    #btn2 {
        margin-bottom: 20px;
    }
}

@media(max-width: 450px) {

    #cont1 {
        margin-top: 18%;
        height: 88vh;
    }

    #error_img {
        height: 150px;
        width: 150px;
    }

    p {
        font-size: 30px;
    }

    h3 {
        font-size: 15px;
        margin: 50px 20px 20px 20px;
    }
}

@media(max-width: 300px) {

    #btn1,
    #btn2 {
        width: 150px;
    }
}
    </style>
</head>

<body>
    
    <div id="cont1">
    <div id="cont2">
        <img id="error_img" src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/error.png?raw=true" alt="#ERROR">
        <%if(msg != null){%>
        <p><%=msg.getMsg_name() %></p>
        <h3>Sorry, the page you're looking for doesn't exist. if you think somthing is broken, complaint a problem.</h3>
        <%session.removeAttribute("msg");}else{%>
        <p>OOPS! PAGE NOT FOUND</p>
        <h3>Sorry, the page you're looking for doesn't exist. if you think somthing is broken, complaint a problem.</h3>
        <h3></h3>
        <%}%>
        <a href="index.jsp"><button class="btn_box" id="btn1">Back To Home</button></a>
        <a href="contact_us.jsp"><button class="btn_box" id="btn2">complaint</button></a>
    </div>
    </div>
</body>

</html>
