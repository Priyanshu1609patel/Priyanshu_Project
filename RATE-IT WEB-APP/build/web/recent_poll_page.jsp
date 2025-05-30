<%@page import="dbclasses.Review_database"%>
<%@page import="rateit.entities.Company"%>
<%@page import="dbclasses.Company_database"%>
<%@page import="java.util.ArrayList"%>
<%@page import="rateit.helper.ConnectionProvider"%>
<%@page import="dbclasses.Poll_database"%>
<%@page import="rateit.entities.Poll"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        Review_database rd = new Review_database(ConnectionProvider.getConnection());
        String str = request.getParameter("a");
        String ss = null;
        ArrayList<Poll> list = null;
        Poll_database pd = new Poll_database(ConnectionProvider.getConnection());
        if (str.equals("1")) {
            list = pd.getRecentPolls();
            ss = "recent";
        }
        if (str.equals("2")) {
            list = pd.getExpiredPolls();
            ss = "Expired";
        }
        if (str.equals("3")) {
            list = pd.getUpcomingPolls();
            ss = "Upcoming";
        }
        if (str.equals("4")) {
            list = pd.getTrendingPolls();
            ss = "trending";
        }

    %>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Rate It | <%=ss%> Poll List</title>
        <script src="https://kit.fontawesome.com/c2a4c35825.js" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/20a4a662a5.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/recent_poll_page.css">
        <link rel="stylesheet" href="css/loading_effect.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>    <script src="javascript/loading_effect.js"></script>

    </head>

    <body>
        <div id="preloader">
            <div class="load">
                <img src="img/loading.gif" alt="dfd">
            </div>
        </div>
        <main>
            <div class="container">
                <%for (Poll p : list) {
                        Company_database cd = new Company_database(ConnectionProvider.getConnection());
                        Company cmp1 = cd.getCompanyById(p.getCOMPANY1());
                        Company cmp2 = cd.getCompanyById(p.getCOMPANY2());
                        int ratings1 = rd.getOverallRatings(cmp1.getCOMPANY_ID());
                        int ratings2 = rd.getOverallRatings(cmp2.getCOMPANY_ID());

                %>
                <div class="items item1">

                    <section class="company1">

                        <div class="logoContainer">
                            <img src="HelperJSP/DisplayCmpImage.jsp?name=<%=cmp1.getCOMPANY_NAME()%>"
                                 class="logo" id="l1" style="height: 25px; width: 30px; margin-top: 5px;">
                        </div>
                        <p class="company_name"><%=cmp1.getCOMPANY_NAME()%></p>
                        <div class="star-1">
                            <span class="label">Ratings:</span>
                            <%if (ratings1 == 0) {%>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <%}%>
                            <%if (ratings1 == 1) {%>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <%}%>
                            <%if (ratings1 == 2) {%>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <%}%>
                            <%if (ratings1 == 3) {%>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <%}%>
                            <%if (ratings1 == 4) {%>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <%}%>
                            <%if (ratings1 == 5) {%>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <%}%>

                        </div>
                    </section>

                    <h1 class="vs">VS</h1>

                    <section class="company2">
                        <div class="logoContainer">
                            <img src="HelperJSP/DisplayCmpImage.jsp?name=<%=cmp2.getCOMPANY_NAME()%>"
                                 class="logo" id="l2" style="height: 50px; width: 55px;">
                        </div>
                        <p class="company_name"><%=cmp2.getCOMPANY_NAME()%></p>
                        <div class="star-2">
                            <span class="label">Ratings:</span>
                            <%if (ratings2 == 0) {%>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <%}%>
                            <%if (ratings2 == 1) {%>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <%}%>
                            <%if (ratings2 == 2) {%>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <%}%>
                            <%if (ratings2 == 3) {%>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <%}%>
                            <%if (ratings2 == 4) {%>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <%}%>
                            <%if (ratings2 == 5) {%>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <%}%>
                        </div>
                    </section>

                    <button class="btn">GIVE REVIEW</button>

                </div>
                <%}%>
                <!-- Ratings and star code completes -->
                <!--
                            <div class="items item2">
                
                                <section class="company1">
                
                                    <div class="logoContainer">
                                        <img src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/amazon.png?raw=true"
                                            class="logo" id="l1" style="height: 40px; width: 50px; margin-top: 5px;">
                                    </div>
                                    <p class="company_name">Amazon</p>
                
                                    <div class="star-1">
                                        <span class="label">Ratings:</span>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                    </div>
                                </section>
                
                                <h1 class="vs">VS</h1>
                
                
                                <section class="company2">
                                    <div class="logoContainer">
                                        <img src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/flipkart.png?raw=true"
                                            class="logo" id="l2" style="height: 33px; width: 40px; margin-top: 7px;">
                                    </div>
                                    <p class="company_name">Flipkart</p>
                
                                    <div class="star-2">
                                        <span class="label">Ratings:</span>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                    </div>
                                </section>
                
                                <button class="btn">GIVE REVIEW</button>
                
                            </div>
                             Ratings and star code completes 
                
                            <div class="items item3">
                
                                <section class="company1">
                
                                    <div class="logoContainer">
                                        <img src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/facebook.png?raw=true"
                                            class="logo" id="l1" style="height: 50px; width: 50px; margin-top: 5px;">
                                    </div>
                                    <p class="company_name" style="margin-top:10px;">Facebook</p>
                
                                    <div class="star-1">
                                        <span class="label">Ratings:</span>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                    </div>
                                </section>
                
                                <h1 class="vs">VS</h1>
                
                
                                <section class="company2">
                                    <div class="logoContainer">
                                        <img src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/instagram.png?raw=true"
                                            class="logo" id="l2" style="height: 50px; width: 50px; margin-top: 5px;">
                                    </div>
                                    <p class="company_name" style="margin-top:10px;">instagram</p>
                
                                    <div class="star-2">
                                        <span class="label">Ratings:</span>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                    </div>
                                </section>
                
                                <button class="btn">GIVE REVIEW</button>
                
                            </div>
                             Ratings and star code completes 
                
                            <div class="items item4">
                
                                <section class="company1">
                
                                    <div class="logoContainer">
                                        <img src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/gpay.png?raw=true"
                                            class="logo" id="l1" style="height: 43px; width: 50px; margin-top: 5px;">
                                    </div>
                                    <p class="company_name">Google Pay</p>
                
                                    <div class="star-1">
                                        <span class="label">Ratings:</span>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                    </div>
                                </section>
                
                                <h1 class="vs">VS</h1>
                
                
                                <section class="company2">
                                    <div class="logoContainer">
                                        <img src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/paytm.png?raw=true"
                                            class="logo" id="l2" style="height: 55px; width: 60px; margin-top: 0px;">
                                    </div>
                                    <p class="company_name">Paytm</p>
                
                                    <div class="star-2">
                                        <span class="label">Ratings:</span>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                    </div>
                                </section>
                
                                <button class="btn">GIVE REVIEW</button>
                
                            </div>
                             Ratings and star code 
                
                            <div class="items item5">
                
                                <section class="company1">
                
                                    <div class="logoContainer">
                                        <img src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/swiggy.png?raw=true"
                                            class="logo" id="l1" style="height: 45px; width: 50px; margin-top: 5px;">
                                    </div>
                                    <p class="company_name">Swiggy</p>
                
                                    <div class="star-1">
                                        <span class="label">Ratings:</span>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                    </div>
                                </section>
                
                                <h1 class="vs">VS</h1>
                
                
                                <section class="company2">
                                    <div class="logoContainer">
                                        <img src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/zomato.png?raw=true"
                                            class="logo" id="l2" style="height: 40px; width: 45px; margin-top: 10px;">
                                    </div>
                                    <p class="company_name">Zomato</p>
                
                                    <div class="star-2">
                                        <span class="label">Ratings:</span>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                    </div>
                                </section>
                
                                <button class="btn">GIVE REVIEW</button>
                
                            </div>
                             Ratings and star code 
                
                            <div class="items item6">
                
                                <section class="company1">
                
                                    <div class="logoContainer">
                                        <img src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/fastrack.png?raw=true"
                                            class="logo" id="l1" style="height: 75px; width: 60px; margin-top: -5px;">
                                    </div>
                                    <p class="company_name">Fastrack</p>
                
                                    <div class="star-1">
                                        <span class="label">Ratings:</span>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                    </div>
                                </section>
                
                                <h1 class="vs">VS</h1>
                
                
                                <section class="company2">
                                    <div class="logoContainer">
                                        <img src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/titan.png?raw=true"
                                            class="logo" id="l2" style="height: 30px; width: 35px; margin-top: 12px;">
                                    </div>
                                    <p class="company_name">Titan</p>
                
                                    <div class="star-2">
                                        <span class="label">Ratings:</span>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                    </div>
                                </section>
                
                                <button class="btn">GIVE REVIEW</button>
                
                            </div>
                
                            <div class="items item1">
                
                                <section class="company1">
                
                                    <div class="logoContainer">
                                        <img src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/honda.png?raw=true"
                                            class="logo" id="l1" style="height: 45px; width: 40px; margin-top: 5px;">
                                    </div>
                                    <p class="company_name">Honda</p>
                
                                    <div class="star-1">
                                        <span class="label">Ratings:</span>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                    </div>
                                </section>
                
                                <h1 class="vs">VS</h1>
                
                
                                <section class="company2">
                                    <div class="logoContainer">
                                        <img src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/yamaha.png?raw=true"
                                            class="logo" id="l2" style="height: 40px; width: 40px; margin-top: 5px;">
                                    </div>
                                    <p class="company_name">Yamaha</p>
                
                                    <div class="star-2">
                                        <span class="label">Ratings:</span>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                    </div>
                                </section>
                
                                <button class="btn">GIVE REVIEW</button>
                
                            </div>
                
                            <div class="items item1">
                
                                <section class="company1">
                
                                    <div class="logoContainer">
                                        <img src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/pepsi.png?raw=true"
                                            class="logo" id="l1" style="height: 45px; width: 45px; margin-top: 0px;">
                                    </div>
                                    <p class="company_name">Pepsi</p>
                
                                    <div class="star-1">
                                        <span class="label">Ratings:</span>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                    </div>
                                </section>
                
                                <h1 class="vs">VS</h1>
                
                
                                <section class="company2">
                                    <div class="logoContainer">
                                        <img src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/sprite.png?raw=true"
                                            class="logo" id="l2" style="height: 50px; width: 50px; margin-top: 0px;">
                                    </div>
                                    <p class="company_name">Sprite</p>
                
                                    <div class="star-2">
                                        <span class="label">Ratings:</span>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                    </div>
                                </section>
                
                                <button class="btn">GIVE REVIEW</button>
                
                            </div>-->
            </div>
        </main>
    </body>

</html>