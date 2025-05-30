<%@page import="rateit.entities.Company_services"%>
<%@page import="java.util.ArrayList"%>
<%@page import="rateit.helper.ConnectionProvider"%>
<%@page import="dbclasses.Company_services_database"%>
<%@page import="rateit.entities.Company"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   Company cmp = (Company)session.getAttribute("Company");
  
            session.setMaxInactiveInterval(40*60);
   if(cmp == null){
    response.sendRedirect("comp_login.jsp");
    }
Company_services_database csd = new Company_services_database(ConnectionProvider.getConnection());

ArrayList<Company_services> list = csd.getAllCategories(cmp.getCOMPANY_ID());

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--<script src="javascript/multiselect-dropdown.js"></script>-->
    <script src="javascript/company_profile.js?43"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <title>Company Profile | rateit.com</title>
    <link rel="stylesheet" href="css\comp_profile_page.css?23">
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
    
        <div class="profile_container">
            <div class="block">
                
                
                
                <div class="imag">
                    <img
                        src="HelperJSP/DisplayCmpImage.jsp?name=<%=cmp.getCOMPANY_NAME()%>">
                </div>
                
                <form enctype="multipart/form-data">
                <table rules="rows">
                    <tr>
                        <td class="t1">Company Name :</td>
                        <td class="t2"><input type="text" name="name" id="name" class="profile_input editable" value="<%=cmp.getCOMPANY_NAME()%>"
                                id="name" disabled > </td>
                    </tr>
                    <tr>
                        <td class="t1">Company ID :</td>
                        <td class="t2"><input type="text"  class="profile_input " value="<%=cmp.getCOMPANY_ID()%>" disabled></td>
                    </tr>
                    <tr>
                        <td class="t1">Email ID :</td>
                        <td class="t2"><input type="text" id="email" name="mail" class="profile_input editable" value="<%=cmp.getCOMPANY_MAIL()%>"
                                disabled></td>
                    </tr>
                    <tr>
                        <td class="t1">Category :</td>
                        <td class="t2"><input type="text" id="category" name="category" class="profile_input" value="<%=cmp.getCATEGORY() %>" disabled></td>
                    </tr>
                    <tr>
                        <td class="t1">Joining Date :</td>
                        <td class="t2"><input type="text" class="profile_input" value="<%=cmp.getJOIN_DATE().toString()%>" disabled></td>
                    </tr>
                    <tr>
                        <td class="t1">Polls Registered :</td>
                        <td class="t2"><input type="text" class="profile_input" value="<%=cmp.getPOLL() %>" disabled></td>
                    </tr>
                </table>
            </div>

            <div class="selector">
                <div>
                
                    <label>Select Your services :</label><br>
<!--                    <select name="Services" id="services" multiple>
                        <option value="Timing">Timing</option>
                        <option value="Product">Product</option>
                        <option value="Payment">Payment</option>
                        <option value="Employ">Emploies</option>
                        <option value="Packing">Packing</option>
                    </select>-->

<div id="services">
   <% for(Company_services e : list){%>
   <input type="checkbox" value="<%=e.getCOMPANY_SERVICES()%>" name="services" checked><%=e.getCOMPANY_SERVICES() %><br>
<%}%>
<!--<input type="checkbox" value="Product" name="services"> Product <br>
<input type="checkbox" value="Payment" name="services"> Payment <br>
<input type="checkbox" value="Emploies" name="services"> Employee <br> 
<input type="checkbox" value="Packing" name="services"> Packing <br>-->
</div>              
            
            </div>
                <br><br><br>
                <div id="addnewDiv">
                <input id="add-text" type="text" placeholder="+ADD NEW SERVICE . . .">
                <button id="add_item">+ADD</button>
                </div>
            </div>
        </div>
        <div id="btn-box">
            <input type="button" value="Edit Profile" class="profile_btn" onclick="editProfile1()" id="profile_edit_btn" class="profile_btn">
            <!--<button type="submit" class="profile_btn" onclick="saveProfile()" id="save_btn"> Save Profile </button>-->
            <input type="button" onclick="saveProfile1()"  id="save_btn" value="save profile" class="profile_btn"/>
            <!--<button class="profile_btn" onclick="closeProfile()" id="profile_close_btn"> Close </button>-->
            
           
        </div>
 </form>
    </body>

</html>
