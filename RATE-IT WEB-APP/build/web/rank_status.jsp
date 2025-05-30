<%@page import="java.util.Comparator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="dbclasses.Review_database"%>
<%@page import="java.util.ArrayList"%>
<%@page import="rateit.entities.Company"%>
<%@page import="rateit.helper.ConnectionProvider"%>
<%@page import="dbclasses.Company_database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Company_database cd = new Company_database(ConnectionProvider.getConnection());
    ArrayList<Company> list = cd.getAllCompanies();
     Collections.sort(list , new Comparator<Company>(){
 @Override
 public int compare(Company e1 , Company e2){  
     return Integer.valueOf(e2.getCOMPANY_RATE()).compareTo(e1.getCOMPANY_RATE());
 }});
     
    Review_database rd = new Review_database(ConnectionProvider.getConnection());
     
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Company Ranking | rateit.com</title>
        <link rel="stylesheet" href="css/rank_status.css?2">
        <script src="https://kit.fontawesome.com/c2a4c35825.js" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/20a4a662a5.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
        
        
        <nav>
            <table>
                <tr height="50px"><td><a href="#" data-category="All" class="header-content"><i class="fa-solid fa-earth-americas"></i> All Companies</a></td></tr>
                <tr height="50px"><td><a href="#" data-category="Health-economics-companies" class="header-content"><i class="fa-solid fa-user-nurse"></i> Health Economics Companies</a></td></tr>
                <tr height="50px"><td><a href="#" data-category="Electronic" class="header-content"><i class="fa-solid fa-microchip"></i> Technology Companies</a></td></tr>
                <tr height="50px"><td><a href="#" data-category="Food" class="header-content"><i class="fa-sharp fa-solid fa-person-biking"></i> Online Food Ordering Companies</a></td></tr>
                <tr height="50px"><td><a href="#" data-category="Airline" class="header-content"><i class="fa-sharp fa-solid fa-taxi"></i> Transportation service Companies</a></td></tr>
                <tr height="50px"><td><a href="#" data-category="E-commerce-store" class="header-content"><i class="fa-solid fa-shop"></i> E-commerce Store Companies</a></td></tr>
                <tr height="50px"><td><a href="#" data-category="Automobile" class="header-content"><i class="fa-solid fa-car-side"></i> Automobile Companies</a></td></tr>
                <tr height="50px"><td><a href="#" data-category="Social-media-companies" class="header-content"><i class="fa-solid fa-icons"></i> Social-Media Companies</a></td></tr>
                <tr height="50px"><td><a href="#" data-category="Banking-companies" class="header-content"><i class="fa-solid fa-landmark"></i> Banking Companies</a></td></tr>
                <tr height="50px"><td><a href="#" data-category="Financial-technology-companies" class="header-content"><i class="fa-solid fa-coins"></i> Financial Technology Companies</a></td></tr>
                <tr height="50px"><td><a href="#" data-category="Jewellery-companies" class="header-content"><i class="fa-solid fa-gem"></i> Jewellery Companies</a></td></tr>
                <tr height="50px"><td><a href="#" data-category="Beverage-companies" class="header-content"><i class="fa-solid fa-martini-glass-citrus"></i> Beverage Companies</a></td></tr>
                <tr height="50px"><td><a href="#" data-category="Cement-manufacturer" class="header-content"><i class="fa-solid fa-house-medical-circle-check"></i> Cement Manufacturer Companies</a></td></tr>
            </table>
        </nav>

        <section id="Polls">
            <%for (int i=0;list.size() > i;i++) {
            
                Company e = list.get(i);
                    int rating = e.getCOMPANY_RATE();
            %>
            <div class="First-Poll <%=e.getCATEGORY()%>" id="f-poll">
                <div class="logoContainer">
                    <img src="HelperJSP/DisplayCmpImage.jsp?name=<%=e.getCOMPANY_NAME()%>"
                         id="l1" style="height: 70px; width: 80px;">
                </div>
                <div class="text-section">
                    <p><b><%=e.getCOMPANY_NAME()%></b></p><br>
                    <p class="details"><%=e.getCATEGORY()%></p>

                    <div class="details">
                        <%if (rating == 0) {%>
                        <i class="fa-regular fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <%}%>
                        <%if (rating == 1) {%>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <%}%>
                        <%if (rating == 2) {%>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <%}%>
                        <%if (rating == 3) {%>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <%}%>
                        <%if (rating == 4) {%>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <%}%>
                        <%if (rating == 5) {%>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <%}%>
                    </div>
                    <p class="details">Total Review : <%=rd.getTotalRatings(e.getCOMPANY_ID())%></p>
                </div>
                <div class="description">
                    <b>About :</b>
                    <p><%=e.getCOMPANY_DESC() %></p>
                </div>
            </div>
                   
            <%}%>
        </section>
        <div id="noList"> <p>There is no match for "<span id="optionIndicator"></span>" category.</p></div>
        <script>
            $(document).ready(function () {
                const AllCompanies = [...$(".First-Poll")];
//                console.log(AllCompanies)
                $("tr:first").css("backgroundColor", "rgb(237, 75, 75)");
                $("nav table tr:first").css("color", "white");

                $("a").click(function (e) {
                    $("tr").css("backgroundColor", "white");
                    $("tr").css("color", "black");

                    $(e.target).parent().parent().css("color", "white");
                    $(e.target).parent().parent().css("backgroundColor", "rgb(237, 75, 75)");
                    
//                $(".First-Poll").hide();
//                $(".First-Poll").hasClass(e.target.dataset["category"]).show();
                if(e.target.dataset["category"] == "All")
                    $(AllCompanies).show();
                else if(AllCompanies.every((val)=>!(val.classList.contains(e.target.dataset["category"])))){
                    $("#optionIndicator").text(e.target.innerText);
                    $(AllCompanies).hide();
                }
                else{
                
                $(AllCompanies).hide();
//                console.log(e.target.dataset["category"])
                $(AllCompanies.filter((val)=>{
//                    console.log(val.classList)
            return val.classList.contains(e.target.dataset["category"])?val:false;
                   
                })).show();
            }
            })
        });
        </script>

    </body>
</html>
