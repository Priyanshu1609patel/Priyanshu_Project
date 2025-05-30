<%@page import="java.sql.Blob"%>
<%@page import="rateit.helper.ConnectionProvider"%>
<%@page import="dbclasses.Customer_database"%>
<%@page import="rateit.entities.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%Customer cus = (Customer) session.getAttribute("Customer");%>
<!DOCTYPE html>
<html lang="en">
    <%
        if (cus == null) {
            response.sendRedirect("LogIn&SignUp.jsp");

        }
        
     Customer_database cd = new Customer_database(ConnectionProvider.getConnection());
   cus=cd.getCustomerByEmail(cus.getEMAIL(), cus.getPASSWORD());
     Blob blob=cd.getImage(cus.getUSER_ID());
      
    %>

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="css/loading_effect.css">
    <script src="javascript/loading_effect.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <title>Conpany Profile | rateit.com</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Unbounded:wght@300&display=swap');

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
/*                font-family: 'Unbounded', cursive;
                font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
                font-size:calc(+1);*/
                
            }

            .profile_container {
                background-color: transparent;
                height: 100vh;
                width: 100vw;
                
            }
            .profile_input{
                height:30px;
                width:90%;
                text-align: center;
            }

            .block {
                background-color: white;
                height: 500px;
                width: 36%;
                box-shadow: 0px 10px 17px 1px rgba(0,0,0,0.75);
-webkit-box-shadow: 0px 10px 17px 1px rgba(0,0,0,0.75);
-moz-box-shadow: 0px 10px 17px 1px rgba(0,0,0,0.75);
            }
            .imag img {
                height: 120px;
                width: 120px;
                border-radius:100%;
            }
            .imag{
                height: 120px;
            width: 120px;
            position: relative;
            border: 1px solid black;
            border-radius: 100%;
            background-size: 100% 100%;
            margin: 0px auto;
                display: flex;
                justify-content: center;
                align-items: center;
                overflow: hidden;
                background-image: url("img/profile_photo3.png");
            }
            table{
                /*margin-top:20px;*/
                padding:3px;
                width:93%;
                height:285px;
                margin-left: 7%;
            }
            
            #get_profile_pic{
                position: absolute;
                font-size: 70px;
                opacity:0;
            }


.t1{
    width: 31%;
    font-weight:bold;
    font-size:17px;
}
            .profile_btn {
                height: 30px;
                width: 150px;
                font-size: 16px;
                background-color: rgb(237, 75, 75);
                color: white;
                border: none;
                letter-spacing: 1px;
                margin-left:10px;
                margin-right:10px;
                font-weight:bold;
                box-shadow: -1px 0px 5px 0px rgba(0,0,0,0.75);
-webkit-box-shadow: -1px 0px 5px 0px rgba(0,0,0,0.75);
-moz-box-shadow: -1px 0px 5px 0px rgba(0,0,0,0.75);
            }
            tr{
                margin:2px; padding:2px;
            }
            
        #save_btn, #newImageContainer{
            display: none;
        }
        
        #profile_message{
            text-align: center;
            color: gray;
        }

        #profile_buttons{
            display:flex;
            flex-direction: row;
        }
        #Profile_loading{
            display:none;
        }
        td,#profile_title span,span a,.profile_btn{
                            font-family: 'Unbounded', cursive;
                font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
                font-size:calc(+1);
        }
    </style>
</head>

<body>
<!--    <div id="preloader">
        <div class="load">
            <img src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/loading.gif?raw=true" alt="dfd">
        </div>
    </div>-->
    
    <div id="Profile_loading">
        <div id="profile_effect"><image src="img/load.gif" height="20px" width="20px" style="border-radius: 50%;"> Processing...</div>
    </div>
    
    <div class="profile_container">
        <div class="block">
            <div id="profile_title" style=" background-color: lightgrey; padding-right:15px; height:35px; padding-top:5px; margin-bottom:10px;">
                <span style="float:left; font-size:20px; margin-left:15px; font-weight:bolder;"> Profile </span> 
                <span style="float:right; font-size:20px;"><a href="LogOut"> Logout </a></span>
            </div>

            <form  enctype="multipart/form-data">
<!--action="Update_user_profile" method="post"--> 
            <div class="imag">
               <%if(blob == null){%>
            <img src="img/profile_photo3.png" id="profile_pic">
            <%}else{%>
             <img src="HelperJSP/DisplayImage.jsp" id="profile_pic">
             <%}%>
             
             <tr id="newImageContainer">
                        <td colspan="2" class="t1"> 
                       <input type="file" name="profile_image" id="get_profile_pic" class="editable" disabled></td>
                    </tr>
            </div>
         
            <table>
                <tr id="newImageContainer">
                 <td colspan="2" class="t1" id="profile_message"> Click Profile To Edit...</td>
                </tr>

                <tr>
                    <td class="t1">User Name :</td>
                    <td class="t2"><input type="text" id="name" name="name" class="profile_input editable" value="<%=cus.getUSER_NAME()%>" disabled> </td>
                </tr>
<!--                <tr>
                    <td class="t1">User ID :</td>
                    <td class="t2"><input type="text" name="id" class="profile_input editable"  value="<%=cus.getUSER_ID() %>" disabled></td>
                </tr>-->
                <tr>
                    <td class="t1">Email ID :</td>
                    <td class="t2"><input type="text" name="email" class="profile_input" value="<%=cus.getEMAIL()%>" disabled></td>
                </tr>
<!--                <tr>
                    <td class="t1">Category :</td>
                    <td class="t2"><input type="text" class="profile_input" value="" disabled></td>
                </tr>
-->                
                <tr>
                    <td class="t1">Joined Date :</td>
                    <td class="t2"><input type="text" name="join" class="profile_input" value="<%=cus.getJOIN_DATE()%>" disabled></td>
                </tr>

                <tr>
                    <td class="t1"> Attended Poll :</td>
                    <td class="t2"><input type="text" name="attended_poll" class="profile_input" value="<%=cus.getATTENDED_POLL() %>" disabled></td>
                </tr>
            </table>
                
                <div id="profile_buttons">
            <input type="button" value="Save Profile" class="profile_btn" id="save_btn" onclick="saveProfile()">
            <input type="button" value="Edit Profile" class="profile_btn" onclick="editProfile()" id="profile_edit_btn">
            <input type="button" value="Close" class="profile_btn" onclick="closeProfile()" id="profile_close_btn">
               </div>
            </div>
            </form>
            </div>
            </body>

            </html>