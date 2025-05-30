<%@page import="rateit.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Message msg = (Message)session.getAttribute("Message");
if(msg != null){
String msg_name = msg.getMsg_name();
    } 
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>forgot password | rateit.com</title>
    <link rel="stylesheet" href="css/forgot_page.css">
    <script src="https://smtpjs.com/v3/smtp.js"></script>
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
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
    <div class="main_container">
        <div class="form-box">

            <div id="Login" class="input-group">
                <h3><b>Forgot Password</b></h3><br>

                <form method="POST" action="Forgot">
                    <label for="Email" class="inputs"> Email : </label><input class="inputs" type="text" id="Uemail"
                       name="email" onkeydown="clearAlert()" required>
                    <span id="emailAlert">
                        
                    </span><br><br>
                    <input type="button" name="OTP" value="Get OTP" id="submit_btn1" class="inputs"><br><br>


                    <label for="Uname" class="inputs"> OTP : </label> <br>
                    <input class="inputs" type="password" id="UserOTP" name="pass"><br>
                    <input type="button" name="Login Now" value="Continue" id="submit_btn" class="inputs"
                       onClick="validateTheOTP()" ><br>
                    
                    
            </div>


            <div id="Signup" class="input-group">
                <h3><b>New Password</b></h3><br>
                <label for="Uname" class="inputs"> New Password : </label> <br> <input class="inputs" type="text"
                    id="Upassword" name="password" onchange="newCheck()" required>
                <label for="Ucpassword" class="inputs"> Confirm Password : </label> <br> <input class="inputs"
                    type="password" id="Ucpassword" name="pass" required><br>
                <input type="submit" name="Login Now" value="Submit" id="submit_btn" class="inputs"
                    onclick="validatePassword()"><br>
                <span id="passwordAlert"></span>
            </div>
        </form>
        </div>
    </div>


    <script src="javascript/forgot.js"></script>
</body>

</html>