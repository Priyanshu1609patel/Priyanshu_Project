<%@page import="rateit.entities.Message"%>
<%@page import="dbclasses.Review_database"%>
<%@page import="rateit.entities.Company_services"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbclasses.Company_services_database"%>
<%@page import="dbclasses.Company_database"%>
<%@page import="rateit.helper.ConnectionProvider"%>
<%@page import="rateit.entities.Customer"%>
<%@page import="rateit.entities.Company"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 String name = request.getParameter("name");

Company_database cd = new Company_database(ConnectionProvider.getConnection());


   Company cmp=cd.getCompanyByName(name);
   if(cmp == null){
    Message msg = new Message("Company Does not Exists","success");
    session.setAttribute("msg", msg);
    response.sendRedirect("error_page.jsp");
    
    }
    Company_services_database csd = new Company_services_database(ConnectionProvider.getConnection());
    ArrayList<Company_services> list1 = csd.getAllCategories(cmp.getCOMPANY_ID());

Review_database rd = new Review_database(ConnectionProvider.getConnection());
int temp = 1;
int temp2 =1;
 int rating = rd.getOverallRatings(cmp.getCOMPANY_ID());
%>
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title><%=cmp.getCOMPANY_NAME()%></title>
   <script src="https://kit.fontawesome.com/c2a4c35825.js" crossorigin="anonymous"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
   <link rel="stylesheet" href="css\comp_review_page.css?123">
   <link
      href="https://github.com/GP-GANG/rateit.github.io/blob/b32152f01d68b11cb33f47d2f5d42ea30e8e6d04/CODE/css/headerstyle.css"
      rel="stylesheet">
       <link rel="stylesheet" href="css/loading_effect.css?1">
    <script src="javascript/loading_effect.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
   
   <style>
       #loginCheckContainer{
                height:100vh;
                width:100vw;
                /*background-color: gray;*/
                /*opacity:0.4;*/
                position:fixed;
                left:0; top:0;
                z-index:-2;
                display:flex;
                justify-content: center;
                align-items: center;
                opacity: 0;
            }
            #loginCheck{
                height:200px;
                width:350px;
                background-color: white;
                border:2px solid black;
                display:flex;
                align-items: center;
                justify-content: center;
                padding:30px;
                z-index:4;
            }
            #loginCheck span{
                width:70%;
            }
            #loginCheck button{
                padding:4px;
                margin-bottom:10px;
                height:30px;
                cursor: pointer;
            }
       
   </style>
</head>

<body>
    <div id="preloader">
        <div class="load">
            <img src="img/loading.gif" alt="dfd">
        </div>
    </div>
    
        <div id="loginCheckContainer">
            <div id="loginCheck">
                <span><i class="fa-solid fa-triangle-exclamation" style="font-size:25px; color:red"></i>
                    <br><p style="font-size:13px;" ><b id="errMsg"></b></p></span>
                <section>
                    <a href="LogIn&SignUp.jsp"><button class="header-btn alertBtn" id="errBtn1">Login</button></a>
                    <button class="header-btn alertBtn" id="alertClose">Remind me later</button>
                </section>
            </div>
        </div>
    <div id="head-rateit"><h2>RATE IT</h2></div>
   <div class="container">
       <div style="display: flex;">
       <div id="info-div">
      <div class="logo">
          <img src="HelperJSP/DisplayCmpImage.jsp?name=<%=cmp.getCOMPANY_NAME()%>">
         <p class="company_text"><%=cmp.getCOMPANY_NAME() %></p>
      </div>
      <div class="overall-rating">
         <p class="text">Overall Rating*</p>
         
         <div id="uper-star">
             <%if(rating == 0){%>
              <i class="fa-regular fa-star"></i>
              <i class="fa-regular fa-star"></i>
              <i class="fa-regular fa-star"></i>
              <i class="fa-regular fa-star"></i>
              <i class="fa-regular fa-star"></i>
            <%}%>
             <%if(rating == 1){%>
            <i class="fa-solid fa-star"></i>
            <i class="fa-regular fa-star"></i>
            <i class="fa-regular fa-star"></i>
            <i class="fa-regular fa-star"></i>
            <i class="fa-regular fa-star"></i>
            <%}%>
             <%if(rating == 2){%>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-regular fa-star"></i>
            <i class="fa-regular fa-star"></i>
            <i class="fa-regular fa-star"></i>
            <%}%>
             <%if(rating == 3){%>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-regular fa-star"></i>
            <i class="fa-regular fa-star"></i>
            <%}%>
             <%if(rating == 4){%>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-regular fa-star"></i>
            <%}%>
             <%if(rating == 5){%>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <%}%>
         </div>
      </div>

            <div>‎<p class="description"><%=cmp.getCOMPANY_DESC() %></p></div>
     

      <div class="c-service-static c-service">
         <table>
             <%for(Company_services e : list1){%>
             <%  int i = rd.getRatings(cmp.getCOMPANY_ID(), e.getCOMPANY_SERVICES());
      
               %>
            <tr>
               <td><%=e.getCOMPANY_SERVICES() %></td>
               <%if(i == 0){%>
               <td>
                  <input type="radio" name="s01" id="staticr11" value="1"> <label for="staticr11"><i
                        class="fa-regular fa-star"></i></label>
                  <input type="radio" name="s01" id="staticr12" value="2"> <label for="staticr12"> <i
                        class="fa-regular fa-star"></i> </label>
                  <input type="radio" name="s01" id="staticr13" value="3"> <label for="staticr33"> <i
                        class="fa-regular fa-star"></i> </label>
                  <input type="radio" name="s01" id="staticr14" value="4"> <label for="staticr14"> <i
                        class="fa-regular fa-star"></i> </label>
                  <input type="radio" name="s01" id="staticr15" value="5"> <label for="staticr15"> <i
                        class="fa-regular fa-star"></i> </label>
               </td>
               <%}%>
               <%if(i == 1){%>
               <td>
                  <input type="radio" name="s01" id="staticr11" value="1"> <label for="staticr11"><i
                        class="fa-solid fa-star"></i></label>
                  <input type="radio" name="s01" id="staticr12" value="2"> <label for="staticr12"> <i
                        class="fa-regular fa-star"></i> </label>
                  <input type="radio" name="s01" id="staticr13" value="3"> <label for="staticr33"> <i
                        class="fa-regular fa-star"></i> </label>
                  <input type="radio" name="s01" id="staticr14" value="4"> <label for="staticr14"> <i
                        class="fa-regular fa-star"></i> </label>
                  <input type="radio" name="s01" id="staticr15" value="5"> <label for="staticr15"> <i
                        class="fa-regular fa-star"></i> </label>
               </td>
               <%}%>
               <%if(i == 2){%>
               <td>
                  <input type="radio" name="s01" id="staticr11" value="1"> <label for="staticr11"><i
                        class="fa-solid fa-star"></i></label>
                  <input type="radio" name="s01" id="staticr12" value="2"> <label for="staticr12"> <i
                        class="fa-solid fa-star"></i> </label>
                  <input type="radio" name="s01" id="staticr13" value="3"> <label for="staticr33"> <i
                        class="fa-regular fa-star"></i> </label>
                  <input type="radio" name="s01" id="staticr14" value="4"> <label for="staticr14"> <i
                        class="fa-regular fa-star"></i> </label>
                  <input type="radio" name="s01" id="staticr15" value="5"> <label for="staticr15"> <i
                        class="fa-regular fa-star"></i> </label>
               </td>
               <%}%>
               <%if(i == 3){%>
               <td>
                  <input type="radio" name="s01" id="staticr11" value="1"> <label for="staticr11"><i
                        class="fa-solid fa-star"></i></label>
                  <input type="radio" name="s01" id="staticr12" value="2"> <label for="staticr12"> <i
                        class="fa-solid fa-star"></i> </label>
                  <input type="radio" name="s01" id="staticr13" value="3"> <label for="staticr33"> <i
                        class="fa-solid fa-star"></i> </label>
                  <input type="radio" name="s01" id="staticr14" value="4"> <label for="staticr14"> <i
                        class="fa-regular fa-star"></i> </label>
                  <input type="radio" name="s01" id="staticr15" value="5"> <label for="staticr15"> <i
                        class="fa-regular fa-star"></i> </label>
               </td>
               <%}%>
               <%if(i == 4){%>
               <td>
                  <input type="radio" name="s01" id="staticr11" value="1"> <label for="staticr11"><i
                        class="fa-solid fa-star"></i></label>
                  <input type="radio" name="s01" id="staticr12" value="2"> <label for="staticr12"> <i
                        class="fa-solid fa-star"></i> </label>
                  <input type="radio" name="s01" id="staticr13" value="3"> <label for="staticr33"> <i
                        class="fa-solid fa-star"></i> </label>
                  <input type="radio" name="s01" id="staticr14" value="4"> <label for="staticr14"> <i
                        class="fa-solid fa-star"></i> </label>
                  <input type="radio" name="s01" id="staticr15" value="5"> <label for="staticr15"> <i
                        class="fa-regular fa-star"></i> </label>
               </td>
               <%}%>
               <%if(i == 5){%>
               <td>
                  <input type="radio" name="s01" id="staticr11" value="1"> <label for="staticr11"><i
                        class="fa-solid fa-star"></i></label>
                  <input type="radio" name="s01" id="staticr12" value="2"> <label for="staticr12"> <i
                        class="fa-solid fa-star"></i> </label>
                  <input type="radio" name="s01" id="staticr13" value="3"> <label for="staticr33"> <i
                        class="fa-solid fa-star"></i> </label>
                  <input type="radio" name="s01" id="staticr14" value="4"> <label for="staticr14"> <i
                        class="fa-solid fa-star"></i> </label>
                  <input type="radio" name="s01" id="staticr15" value="5"> <label for="staticr15"> <i
                        class="fa-solid fa-star"></i> </label>
               </td>
               <%}%>
            </tr>
            <%}%>
         </table>
      </div>
       </div>
         <div id="thank-div">
             <div style="display: flex;"><div id="style-line"></div><h3 style="margin: 7px 0px 18px 5px;">Keep it Real</h3></div>
             
             <p id="thank-dis">Thank you for contributing to the community. Your opinion will help others make decisions about companies.</p>
             <br><p id="thank-dis"><b>Please stick to the Community Guidelines and do not post:</b></p>
             <ul>
             <li id="thank-li">Aggressive or discriminatory language</li>
             <li id="thank-li">Profanities</li>
             <li id="thank-li">Trade secrets/confidential information</li>
             </ul>
             <p id="thank-dis">Thank you for doing your part to keep <b>Rateit</b> the most trusted place to find a company you love. See the <b>Community Guidelines</b> for more details.</p>
         </div>
       </div>
      <br>
      <br>
      <div id="dynamic-div">
      <span class="Text-1">Rate a Company</span>


      <form action="IndividualReview?name=<%=name%>" method="post" onsubmit="return checkForLogin(validateSubmit)">

          
         <div class="c-service-dynamic c-service">
            <table>
               <%for(Company_services e : list1){%>
            <tr>
               <td><%=e.getCOMPANY_SERVICES() %></td>
               <td>
                   <input type="radio" name="c<%=temp%>" id="dynamic<%=temp%><%=temp2%>" value="1"> <label for="dynamic<%=temp%><%=temp2%>"><i
                        class="fa-regular fa-star"></i></label><%temp2++;%>
                  <input type="radio" name="c<%=temp%>" id="dynamic<%=temp%><%=temp2%>" value="2"> <label for="dynamic<%=temp%><%=temp2%>"> <i
                        class="fa-regular fa-star"></i> </label><%temp2++;%>
                  <input type="radio" name="c<%=temp%>" id="dynamic<%=temp%><%=temp2%>" value="3"> <label for="dynamic<%=temp%><%=temp2%>"> <i
                        class="fa-regular fa-star"></i> </label><%temp2++;%>
                  <input type="radio" name="c<%=temp%>" id="dynamic<%=temp%><%=temp2%>" value="4"> <label for="dynamic<%=temp%><%=temp2%>"> <i
                        class="fa-regular fa-star"></i> </label><%temp2++;%>
                  <input type="radio" name="c<%=temp%>" id="dynamic<%=temp%><%=temp2%>" value="5"> <label for="dynamic<%=temp%><%=temp2%>"> <i
                        class="fa-regular fa-star"></i> </label>
               </td>
            </tr>
            <%temp++;}%>
            </table>
            <div id="comm-box">
                <textarea id="txt-area" rows="8" cols="125" name="review"
                  placeholder="Comment your opinion about the company..."></textarea></td>
            </div>
         </div>

         <div id="btn-box">
             <!--<button type="button" class="btn-sub" onclick="checkForLogin()">Submit Review</button>-->
            <input class="btn-sub" type="reset">
            <input class="btn-sub" type="submit">
         </div>
      </form>
      </div>
   </div>

   <script>
      var rates = new Array(6);
      $(document).ready(function () {

         // array for the dynamic stars
         rates[0] = 0;
         rates[1] = document.getElementsByName("c1");
         rates[2] = document.getElementsByName("c2");
         rates[3] = document.getElementsByName("c3");
         rates[4] = document.getElementsByName("c4");
         rates[5] = document.getElementsByName("c5");

         // star classes
         var filledStar = "fa-solid fa-star";
         var emptyStar = "fa-regular fa-star";

//         console.log(rates)
         $("input").change(function (a) {

            var index = a.target.name.substr(1);
//            console.log(index);
            
            if(index.length != 1){
                return;
            }
            

            // Loop to empty all stars 
            for (var i = 0; i < a.target.value; i++) {
               rates[index][i].labels[0].children[0].setAttribute("class", filledStar);
            }
            
            // loop to fill the selected stars
            for (var i = rates[index].length - 1; i >= a.target.value; i--) {
               rates[index][i].labels[0].children[0].setAttribute("class", emptyStar);
            }
            // retes[i]
         });
      });
      $("#alertClose").click(function(){
                    $("#loginCheck").css("display","none");
                    $("#loginCheckContainer").css({"zIndex":"-2", "opacity":"0"});
                });

      var flag = 0;  
      
    function validateSubmit(){
    console.log(flag);
    if(flag == 1)
        return true;
    else
        return false;
      }
      
       function checkForLogin(valid){
      
      $.post("CheckForLogin", function(response){

//                    console.log(response)
                    if(response == 0){
                    $("#errMsg").text(" To provide review, you have to login first. ");
                    $("#loginCheck").css("display","flex");
                    $("#loginCheckContainer").css({"zIndex":"2", "opacity":"1"}); 
                    flag = 0;
                    }

                    else flag = 1;
        });
        return valid();

      }

   </script>
</body>

</html>
