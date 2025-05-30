
<%@page import="rateit.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/20a4a662a5.js" crossorigin="anonymous"></script>
    <title>Rate It</title>
    <link href="css/LoginSignup.css?2" rel="stylesheet">
</head>

<body>

    <span id="showError">
             <%
    Message message =(Message)session.getAttribute("Message");
    if(message != null){

%>
<p><%=message.getMsg_name() %></p>
<%}
session.removeAttribute("Message");
%>
        </span>
    
    <div class="main_container">
               
        <div class="form-box">
                   
            <div class="button-box">
                <div id="btn"></div>
                <button type="button" class="upper-btn" onclick="changeBack()">Log In</button>
                <button type="button" class="upper-btn" onclick="changeBack()">Register</button>
            </div>
            <div id="Login" class="input-group">


                <form action="LogIn" method="post" onsubmit="return validateLogin()">
                    <label for="Uname" class="inputs"> Email : </label> <br>
                    <input class="inputs" type="text" id="Uname" name="name" tabindex="1" placeholder="E.x. : user#123">
                    <div class="Error" id="alertUname"></div>
                    <br>

                    <label for="Uname" class="inputs"> Password : </label> <br>
                    <input class="inputs" type="password" id="Upassword" name="password" tabindex="2"><br>
                    <div class="Error" id="alertPass"></div>

                    <a href="forgot_page.jsp" class="inputs" id="fpassword">Forgot Password?</a><br>
                    <button id="submit_btn_login" class="inputs submit_btn"> submit </button>
                </form>



                <label for="Uname" class="inputs" id="low_lbl"> Not a Member? </label>
                <button type="button" class="lower-btn" onclick="changeBack()"><b> Signup Now</b></button> <br>

                <div class="social-media">
                    <a href="https://www.facebook.com/profile.php?id=100088785978857" target="_blank"><i
                            class="fa-brands fa-facebook"></i></a>
                    <a href="https://www.instagram.com/rateit_group/" target="_blank"> <i
                            class="fa-brands fa-instagram"></i></a>
                    <a href="https://stackoverflow.com/users/20854115/rate-it" target="_blank"> <i
                            class="fa-brands fa-stack-overflow"></i></a>
                </div>

            </div>
            <div id="Signup" class="input-group">

                <form action="SignUp" id="register" onsubmit="return validateReg()" method="post">

                    <label for="URname" class="inputs"> Username : </label> <br>
                    <input class="inputs" type="text" id="URname" name="name" tabindex="1">
                    <div class="Error" id="usernameAlert"></div>

                    <label for="URmail" class="inputs"> Email :</label><br>
                    <input type="email" name="email" class="inputs" id="URmail" autocomplete="off" tabindex="2">
                    <div class="Error" id="emailAlert"></div>

                    <label for="URpassword" class="inputs"> Password : </label> <br>
                    <input class="inputs" type="password" id="URpassword" name="password" tabindex="3">
                    <div class="Error" id="alertRPass"></div>

                    <label for="URcpassword" class="inputs"> Confirm Password : </label> <br>
                    <input class="inputs" type="password" id="URcpassword" name="pass" tabindex="4"><br>
                    <div class="Error" id="bothCheck"></div>

                    <input type="submit" name="Login Now" value="Register" id="submit_btn_signup" tabindex="5"
                        class="inputs submit_btn"><br>
                </form>

                <div class="social-media">
                    <a href="https://www.facebook.com/profile.php?id=100088785978857" target="_blank"><i
                            class="fa-brands fa-facebook"></i></a>
                    <a href="https://www.instagram.com/rateit_group/" target="_blank"> <i
                            class="fa-brands fa-instagram"></i></a>
                    <a href="https://stackoverflow.com/users/20854115/rate-it" target="_blank"> <i
                            class="fa-brands fa-stack-overflow"></i></a>
                </div>

            </div>
        </div>
    </div>


    <script type="text/javascript" src="javascript/LoginSignupValidation.js?1"> </script>
    
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        
        <!--Alternate code for the login-->
<!--    <script>
        $(document).ready(function(){
            $("#submit_btn_login").click(function(e){
                e.preventDefault();
                if(validateLogin() === true){
                    var name = $("#Uname").val();
                    var password = $("#Upassword").val();
                    console.log(name);
                    console.log(password);
                    $.post("LogIn",{"name":name, "password":password}, function(response){
                        $("#alertPass").text(response);
                    });
                }
            })
        })
    </script>-->

</body>

</html>