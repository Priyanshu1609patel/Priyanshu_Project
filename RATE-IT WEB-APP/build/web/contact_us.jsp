<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <title>Contact Us | rateit.com</title>
    <link rel="stylesheet" href="css/contact_us.css">
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
    
    <h2 id="heading"><img class="main_logo" src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/logo.png?raw=true" alt="RATE-IT.COM" height="40px"></h2>
    <div id="main_cont">
        <div id="cont1">
            <div id="add-box1">
                <div class="box">
                    <img src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/map.png?raw=true" alt="location">
                    <h1>LOCATION</h1>
                    <p>Government Polytechnic, Ahmedabad</p>
                </div>
                <div class="box">
                    <img src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/phone.png?raw=true" alt="phone">
                    <h1>PHONE NUMBER</h1>
                    <p>+91 9726098230</p>
                </div>
            </div>
            <div id="add-box2">
                <div class="box">
                    <img src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/email.png?raw=true" alt="email">
                    <h1>EMAIL</h1>
                    <p>rateit.contact@gmail.com</p>
                </div>
            </div>
        </div>
        <div id="cont2">
            <div id="content">
                <CENTER><b> CONTACT US </b></center>
                <form action="https://formspree.io/f/mqkobyvd" method="post">
                    <input class="name" type="text" id="username" name="username" placeholder="First Name :">
                    <input class="name" type="text" id="username" name="username" placeholder="Last Name :"><br>
                    <input style="width: 91%;" class="name" type="text" id="subject" name="subject" placeholder="Subject :"><br>
                <input type="email" name="email" id="email" placeholder="E-mail Address :"><br>
                <textarea id="message" name="textarea" placeholder="Description . . ."></textarea><br>
                <input type="submit"  id="my-form-button" class="btn" value="Submit">
                <input type="reset" value="Reset" class="btn">
<!--               -->
                <!--<input type="text" id="captcha-code" class="btn">-->
                
                </form>
            </div>
        </div>
    </div>
</body>
</html>
