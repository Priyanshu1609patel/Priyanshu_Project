<%@page import="dbclasses.Review_database"%>
<%@page import="rateit.entities.Poll"%>
<%@page import="dbclasses.Poll_database"%>
<%@page import="java.util.ArrayList"%>
<%@page import="rateit.entities.Company"%>
<%@page import="dbclasses.Company_database"%>
<%@page import="rateit.helper.ConnectionProvider"%>
<%@page import="dbclasses.Customer_database"%>
<%@page import="rateit.entities.Message"%>
<%@page import="rateit.entities.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %> 
<%
    Customer customer = (Customer) session.getAttribute("Customer");
    Message msg = (Message) session.getAttribute("Message");

    Company_database cd1 = new Company_database(ConnectionProvider.getConnection());
    ArrayList<Company> list5 = cd1.getAllCompanies();
   
    Review_database rd = new Review_database(ConnectionProvider.getConnection());
    Customer_database customer1 = new Customer_database(ConnectionProvider.getConnection());
 int i=1;
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Rate it | Home Page</title>
        <script src="https://kit.fontawesome.com/c2a4c35825.js" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/20a4a662a5.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <!-- <link rel="stylesheet" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" href="" crossorigin="anonymous"> -->

        <link rel="stylesheet" href="css/index.css?2"/>
        <link rel="stylesheet" href="css/loading_effect.css?1">
    <script src="javascript/loading_effect.js?1"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    </head>

    <body>
        <div id="preloader">
        <div class="load">
            <img src="img/loading.gif" alt="dfd">
        </div>
    </div>
        
        <div id="loginCheckContainer">

            <div id="loginCheck">
                <span><i class="fa-solid fa-triangle-exclamation" style="font-size:35px; color:red"></i>
                    <br><p style="font-size:15px;" ><b id="errMsg"></b></p></span>
                    <section style="margin-top: 10px;">
                    <a href="LogIn&SignUp.jsp"><button class="header-btn alertBtn" id="errBtn1">Login</button></a>
                    <button class="header-btn alertBtn" id="alertClose">Remind me later</button>
                </section>
            </div>
        </div>


        <header>
            <nav>
                <img class="main_logo" src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/logo.png?raw=true" alt="RATE-IT.COM">

                <div>
                    <input type="checkbox" name="" value="" id="checkbox">
                    <label for="checkbox" class="check">
                        <i class="fas fa-bars"></i>
                    </label>
                    <ul id="navTool">
                        <div class="dropdown">
                            <li>
                                <div class="dropdown-text ">
                                    <b>Polls</b>

                                    <div class="dropdown-content">
                                        <a href="recent_poll_page.jsp?a=2">Previous Polls</a>
                                        <a href="recent_poll_page.jsp?a=1">Recent Polls</a>
                                        <a href="recent_poll_page.jsp?a=3">Upcoming Polls</a>
                                        <a href="recent_poll_page.jsp?a=4">Trending Polls</a>
                                        
                                    </div>
                                </div>
                                <div class="nav-content">
                                    <a href="#">Previous Polls</a>
                                    <a href="#">Recent Polls</a>
                                    <a href="#">Upcoming Polls</a>
                                    <a href="#">Reminder Polls</a>
                                </div>
                            </li>
                        </div>
                        
                        <li><a href="rank_status.jsp" class="header-content"><b>Rank Status</b></a></li>
                        <li><a href="contact_us.jsp" class="header-content"><b>Contact Us</b></a></li>
                        <li><a href="about_us_page.jsp" class="header-content"><b>About Us</b></a></li>
                    </ul>

                    <div id="search-logo"><i class="fa-solid fa-magnifying-glass"></i></div>
                    <div id="search">
                        <!--                        <input  list="list" type="search" placeholder="Search . . . .">-->
                        <div id="search">
                            <input  list="list" id="search2" onchange="searchCompany()" type="search" placeholder="Search . . . .">
                            <datalist id="list">
                                <% for (Company e : list5) {%>
                                <option value="<%=e.getCOMPANY_NAME()%>"></option>
                                <%}%>
                            </datalist>
                        </div>
                    </div>


                </div>
                <%if (customer == null) {%>
                <a href="LogIn&SignUp.jsp"> <button class="header-btn" id="header_button" onclick=""><b>&nbsp;Log In
                            &nbsp;/&nbsp;
                            Sign Up&nbsp;</b></button></a>


                <%} else {%>
<%customer = customer1.getCustomerByEmail(customer.getEMAIL());%>

                <button id="profile_btn" class="header-btn" ><%=customer.getUSER_NAME()%></button>

                <!--<a href="LogOut"><button class="header-btn" onclick="alert('log out successfully')"> Logout </button></a>-->


                <%}%>
                  
                

            </nav>
        </header>
        <%
            Poll_database pd = new Poll_database(ConnectionProvider.getConnection());
            ArrayList<Poll> list = pd.getAllPoll();

        %>
        <main>
            <div class="container">
                <%for (Poll p : list) {%>

                <%
                    Company_database cd = new Company_database(ConnectionProvider.getConnection());
                    Company cmp1 = cd.getCompanyById(p.getCOMPANY1());
                    Company cmp2 = cd.getCompanyById(p.getCOMPANY2());
                    int ratings1 = rd.getOverallRatings(cmp1.getCOMPANY_ID());
                    int ratings2 = rd.getOverallRatings(cmp2.getCOMPANY_ID());
                    cd.updateRank(cmp1.getCOMPANY_ID() , ratings1);
                    cd.updateRank(cmp2.getCOMPANY_ID() , ratings2);
                   
                %>
                <div class="items item1">

                    <section class="company1">

                        <div class="logoContainer">
                            <img src="HelperJSP/DisplayCmpImage.jsp?name=<%=cmp1.getCOMPANY_NAME()%>"
                                 class="logo" id="l1" style="height: 42px; width: 50px; margin-top: 5px;">
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
                                 class="logo" id="l2" style="height: 42px; width: 50px;">
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
<%if(i<=2){%>
<button class="btn compareBtn" value="<%=p.getPOLL_ID()%>">Compare Now</button>
<%}else{%>
<button class="btn compareBtn" value="<%=p.getPOLL_ID()%>">Give Review</button><%}%>

                </div>
                <%i++;}%>
                <!-- Ratings and star code completes -->
            </div>
        </main>


        <footer>

            <div id="footpart1">
                <p id="tgp">Total Generated polls:-<%=pd.getTotalPoll()%></p>
                <p id="trc">Total Registered Companies:-<%=cd1.getTotalCompany()%></p>
                <p id="tlu">Total Logined Users:-<%=customer1.getTotalUser()%></p>
            </div>

            <div id="footpart2">

                <div id="cont1">
                    <p>Useful Links</p>
                    <dd><a href="#" class="about-text">previous Polls</a></dd>
                    <dd><a href="recent_poll_page.jsp" class="about-text">recent Polls</a></dd>
                    <dd><a href="#" class="about-text">Up-Coming Polls</a></dd>
                    <dd><a href="trending_poll_page.jsp" class="about-text">Trending Polls</a></dd>
                    <dd><a href="#" class="about-text">Companies</a></dd>
                    <dd><a onclick="showProfile()" class="about-text">My Profile</a></dd>
                    <dd><a href="about_us_page.jsp" class="about-text">About</a></dd>
                    <dd><a href="#" class="about-text">Blog</a></dd>
                </div>

                <div class="cont2">
                    <p>Rate It</p>
                    <dd><a href="#" class="about-text">Feedback</a></dd>
                    <dd><a href="#" class="about-text">Contact Us</a></dd>
                    <dd><a href="#" class="about-text">Rate It for Employers</a></dd>
                </div>

                <div class="cont2">
                    <p>Rete It Developers</p>
                    <dd class="about-text">Vinay Koshti</dd>
                    <dd class="about-text">Neesarg Soni</dd>
                    <dd class="about-text">Dilip suryal</dd>
                    <dd class="about-text">Priyanshu Popli</dd>
                    <dd class="about-text">Nirmal Prajapati</dd>
                    <dd class="about-text">Dhruv Shere</dd>
                </div>

                <div class="cont2">
                    <p>Help Center</p>
                    <dd><a href="#" class="about-text">FAQ</a></dd>
                    <dd><a href="#" class="about-text">Terms of Use</a></dd>
                    <dd><a href="#" class="about-text">Privacy & Cookies</a></dd>
                </div>

                <div id="cont5">
                    <p>Follaw Us On</p>
                    <div id="social">
                        <div>
                            <dd><a href="https://www.facebook.com/profile.php?id=100088785978857"><img
                                        src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/facebook.png?raw=true"></a>
                            </dd>
                            <dd><a href="https://www.instagram.com/rateit_group/"><img
                                        src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/instagram.png?raw=true"></a>
                            </dd>
                        </div>
                        <div>
                            <dd><a href="https://twitter.com/rateit16"><img
                                        src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/twitter.png?raw=true"></a>
                            </dd>
                            <dd><a href="https://www.linkedin.com/in/rate-it-76513b263/"><img
                                        src="https://github.com/GP-GANG/rateit.github.io/blob/main/Other%20Files/photos/linkedin.png?raw=true"></a>
                            </dd>
                            <%if (customer == null) {%>
                            <dd>
                                <a href="comp_login.jsp"> <button class="header-btn" id="header_button1" onclick=""><b>Company Login</b></button></a>
                            </dd>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>

            <div id="footpart3">
                <dl>
                    <dt>TOP RATED COMPANIES:</dt>
                    <dd><a href="#">TATA Motors</a>
                        <a href="#">Infosys</a> |
                        <a href="http://localhost:8080/Rateit.com/comp_review_page.jsp?name=Facebook">Facebook</a> |
                        <a href="#">Jobbuzz</a> |
                        <a href="#">Adani Gas</a> |
                        <a href="#">Reliance Digital</a> |
                        <a href="#">Google</a> |
                        <a href="#">Lenskart</a> |
                        <a href="#">Bharat Pay</a> |
                        <a href="#">Flipkart</a> |
                        <a href="#">Amazon</a> |
                        <a href="#">Raymond</a> |
                        <a href="#">IBM</a> |
                        <a href="#">Maruti Suzuki</a> 
                        <a href="#">ICICI Bank</a> 
                        <a href="#">Axis Bank</a>
                        <a href="#">Wipro</a> 
                        <a href="http://localhost:8080/Rateit.com/comp_review_page.jsp?name=Ultra%20Track%20Cement">Ultratach Cement</a> |
                        <a href="#">Ambuja Cement</a> |
                        <a href="#">Cipla</a> |
                        <a href="#">Oracle</a> |
                        <a href="#">Kotak Bank</a> |
                        <a href="#">Mahindra Motors</a> |
                        <a href="#">PayPal</a> |
                        <a href="#">Yamaha</a> |
                        <a href="#">Microsoft</a> |
                        <a href="#">Kent</a> |
                    </dd>
                </dl>
            </div>
        </footer>

        <div>
            <div id="profile_div"></div>
        </div>


        <script type="text/javascript" src="javascript/indexJS.js?2">

        </script>
    </body>

</html>
