<%@page import="rateit.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/20a4a662a5.js" crossorigin="anonymous"></script>
        <title>Rate It</title>
        <link href="css/LoginSignup.css?2" rel="stylesheet">
    </head>
    
    <body>
       
        <div class="main_container">
            
              <span id="showError">
                 <% 
        Message message =(Message)session.getAttribute("Message");
        if(message != null){
    
   %>
    <p><%=message.getMsg_name() %></p>
    <% }
    session.removeAttribute("Message");
    %>
            </span>
            <div class="form-box">
                       
                <div class="button-box">
                    <div id="btn"></div>
                    <button type="button" class="upper-btn" onclick="changeBack()">Log In</button>
                    <button type="button" class="upper-btn" onclick="changeBack()">Register</button>
                </div>
                <div id="Login" class="input-group">
    
    
                    <form action="Cmp_Login" method="post" onsubmit="return validateLogin()">
                        <label for="Uname" class="inputs"> Company_Id or Email : </label> <br>
                        <input class="inputs" type="text" id="Uname" name="name" tabindex="1" placeholder="E.x. : user#123">
                        <div class="Error" id="alertUname"></div>
                        <br>
    
                        <label for="Uname" class="inputs"> Password : </label> <br>
                        <input class="inputs" type="password" id="Upassword" name="password" tabindex="2"><br>
                        <div class="Error" id="alertPass"></div>
    
                        <!--<a href="forgot_page.jsp" class="inputs" id="fpassword">Forgot Password?</a><br>-->
                        <button type="submit" id="submit_btn_login" class="inputs submit_btn"> submit </button>
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
                
               <!--             **********Sign up form***********               -->
               
               
                <div id="Signup" class="input-group">
    
                    <form action="Register_company" id="register" onsubmit="return validateReg()" method="post" enctype="multipart/form-data">
    
                        <label for="URname" class="inputs"> Company name : </label> <br>
                        <input class="inputs" type="text" id="URname" name="name" tabindex="1">
                        <div class="Error" id="usernameAlert"></div>
    
                        <label for="URmail" class="inputs"> Email :</label><br>
                        <input type="email" name="email" class="inputs" id="URmail" autocomplete="off" tabindex="2">
                        <div class="Error" id="emailAlert"></div>

                        <label for="URphone" class="inputs"> Phone No. :</label><br>
                        <input type="tel" name="phone" class="inputs" id="URphone" autocomplete="off" tabindex="3">
                        <div class="Error" id="emaillAlert"></div>

                        <label for="URurl" class="inputs"> Website URL :</label><br>
                        <input type="url" name="websiteURL" class="inputs" id="URurl" autocomplete="off" tabindex="4">
                        <div class="Error" id="emaillAlert"></div>
    
                        <label for="category" class="inputs"> Category :</label><br>
                        <input type="text" name="category" class="inputs" id="category" autocomplete="off" tabindex="5"> 
                        
                        <label for="URpassword" class="inputs"> Password : </label> <br>
                        <input class="inputs" type="password" id="URpassword" name="password" tabindex="6">
                        <div class="Error" id="alertRPass"></div>
    
                        <label for="URcpassword" class="inputs"> Confirm Password : </label> <br>
                        <input class="inputs" type="password" id="URcpassword" name="pass" tabindex="7"><br>
                        <div class="Error" id="bothCheck"></div>
                        
                        <label for="image" class="inputs"> Upload image :</label><br>
                        <input type="file" name="image" class="inputs" id="image" autocomplete="off" tabindex="5"> 
    
                        <input type="submit" name="Login Now" value="Register" id="submit_btn_signup" tabindex="8"
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
            
            <script>
                        function changeBack() {
            if (left == 0) {
                buttonBack.style.left = "200px";
                login.style.left = "-420px";
                signUp.style.left = "0px";
                container.style.height = "680px";
                document.getElementById('URname').focus();
                left = 200;
            }
            else {
                buttonBack.style.left = 0 + "px";
                signUp.style.left = "420px";
                login.style.left = "0px";
                document.getElementById('Uname').focus();
                left = 0;
                container.style.height = "420px";
            }
        }
            </script>
    
    </body>
    
</html>
