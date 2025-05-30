<%@page import="dbclasses.Customer_database"%>
<%@page import="dbclasses.Company_database"%>
<%@page import="dbclasses.Poll_database"%>
<%@page import="rateit.helper.ConnectionProvider"%>
<%@page import="rateit.entities.Company"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Poll_database pd = new Poll_database(ConnectionProvider.getConnection());
    Company_database cd1 = new Company_database(ConnectionProvider.getConnection());
    Customer_database c = new Customer_database(ConnectionProvider.getConnection());
   Company cmp = (Company)session.getAttribute("Company");
   session.setMaxInactiveInterval(40*60);
   if(cmp == null){
    response.sendRedirect("comp_login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <title>Company-Home Page</title>
    <link rel="stylesheet" href="css\comp_home_page.css?1">
</head>

<body>
    <header>
        <nav>
            <img class="main_logo"
                src="https://raw.githubusercontent.com/GP-GANG/rateit.github.io/main/Other%20Files/photos/logo.png"
                alt="RATE-IT.COM">
            <ul id="navTool">
                <li><a data-value="comp_profile_page.jsp" class="header-content"><b>Profile</b></a></li>
                <li><a data-value="Request_poll.jsp" class="header-content"><b>Request Poll</b></a></li>
                <li><a data-value="poll_result.jsp" class="header-content"><b>Poll Result</b></a></li>
                <li><a data-value="about_us_page.jsp" class="header-content"><b>About Us</b></a></li>
            </ul>

            <div id="button">
                <a href="Company_Logout"> <button class="header-btn" onclick="">
                        <b> Log Out</b></button></a>
            </div>
        </nav>
    </header>
    <main>
        <div id="Jcontainer"></div>
    </main>

    <footer>

        <div id="footpart1">
            <p id="tgp">Total Generated polls:-<%=pd.getTotalPoll()%></p>
            <p id="trc">Total Registered Companies:-<%=cd1.getTotalCompany()%></p>
            <p id="tlu">Total Logined Users:- <%=c.getTotalUser()%></p>
        </div>

        <div id="footpart2">

            <div id="cont1">
                <p>Useful Links</p>
                <dd><a href="" class="about-text">previous Polls</a></dd>
                <dd><a href="" class="about-text">recent Polls</a></dd>
                <dd><a href="" class="about-text">Up-Coming Polls</a></dd>
                <dd><a href="" class="about-text">Tranding Polls</a></dd>
                <dd><a href="" class="about-text">Companies</a></dd>
                <dd><a href="" class="about-text">My Profile</a></dd>
                <dd><a href="" class="about-text">About</a></dd>
                <dd><a href="" class="about-text">Blog</a></dd>
            </div>

            <div class="cont2">
                <p>Rate It</p>
                <dd><a href="" class="about-text">Feedback</a></dd>
                <dd><a href="" class="about-text">Contact Us</a></dd>
                <dd><a href="" class="about-text">Rate It for Employers</a></dd>
            </div>

            <div class="cont2">
                <p>Rete it Developers</p>
                <dd class="about-text">Vinay Koshti</dd>
                <dd class="about-text">Neesarg Soni</dd>
                <dd class="about-text">Dilip Suryal</dd>
                <dd class="about-text">Priyanshu Patel</dd>
                <dd class="about-text">Nirmal Prajapati</dd>
                <dd class="about-text">Dhruv Shere</dd>
            </div>

            <div class="cont2">
                <p>Help Center</p>
                <dd><a href="" class="about-text">FAQ</a></dd>
                <dd><a href="" class="about-text">Terms of Use</a></dd>
                <dd><a href="" class="about-text">Privecy & Cookies</a></dd>
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
                    </div>
                </div>
            </div>
        </div>

        <div id="footpart3">
            <dl>
                <dt>TOP RATED COMPANIES :</dt> <br>
                <dd><a href="">TATA Motors</a> |
                    <a href="">Infosys</a> |
                    <a href="">Facebook</a> |
                    <a href="">Jobbuzz</a> |
                    <a href="">Adani Gas</a> |
                    <a href="">Reliance Digital</a> |
                    <a href="">Google</a> |
                    <a href="">Lenskart</a> |
                    <a href="">Bharat Pay</a> |
                    <a href="">Flipkart</a> |
                    <a href="">Amazon</a> |
                    <a href="">Raymond</a> |
                    <a href="">IBM</a> |
                    <a href="">Maruti Suzuki</a> |
                    <a href="">ICICI Bank</a> |
                    <a href="">Axis Bank</a> |
                    <a href="">Wipro</a> |
                    <a href="">Ultratach Cement</a> |
                    <a href="">Ambuja Cement</a> |
                    <a href="">Cipla</a> |
                    <a href="">Oracle</a> |
                    <a href="">Kotak Bank</a> |
                    <a href="">Mahindra Motors</a> |
                    <a href="">PayPal</a> |
                    <a href="">Yamaha</a> |
                    <a href="">Microsoft</a> |
                    <a href="">Kent</a>
                </dd>
            </dl>
        </div>
    </footer>
</body>

<script>
    $(document).ready(function(){
        // this will load the company profile
        $("#Jcontainer").load("comp_profile_page.jsp");
        $("#navTool a").click(function(){
            $("#Jcontainer").html("");
            $("#Jcontainer").load(this.dataset.value);
        })
    })
</script>
</html>

