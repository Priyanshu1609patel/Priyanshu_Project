<%@page import="dbclasses.Review_database"%>
<%@page import="rateit.entities.Company_services"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbclasses.Company_services_database"%>
<%@page import="rateit.entities.Company"%>
<%@page import="dbclasses.Company_database"%>
<%@page import="rateit.entities.Poll"%>
<%@page import="rateit.helper.ConnectionProvider"%>
<%@page import="dbclasses.Poll_database"%>
<%@page import="rateit.entities.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Customer customer = (Customer) session.getAttribute("Customer");
    if (customer == null) {
        response.sendRedirect("LogIn&SignUp.jsp");
    }
    int id = Integer.parseInt(request.getParameter("a"));

    Poll_database pd = new Poll_database(ConnectionProvider.getConnection());
    Poll p = pd.getPoll(id);
    Company_database cd = new Company_database(ConnectionProvider.getConnection());
    Company cmp1 = cd.getCompanyById(p.getCOMPANY1());
    Company cmp2 = cd.getCompanyById(p.getCOMPANY2());
    
    //getting services...
    Company_services_database csd = new Company_services_database(ConnectionProvider.getConnection());
    ArrayList<Company_services> list1 = csd.getAllCategories(cmp1.getCOMPANY_ID());
    ArrayList<Company_services> list2 = csd.getAllCategories(cmp2.getCOMPANY_ID());
    int temp1 = 1;
    int temp2 = 11;
    
    Review_database rd = new Review_database(ConnectionProvider.getConnection());
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><%=cmp1.getCOMPANY_NAME() %> VS <%=cmp2.getCOMPANY_NAME() %> | Rateit.com</title>
        <script src="https://kit.fontawesome.com/c2a4c35825.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <link rel="stylesheet" href="css/poll_review_page.css?1">
        <link
            href="https://github.com/GP-GANG/rateit.github.io/blob/b32152f01d68b11cb33f47d2f5d42ea30e8e6d04/CODE/css/headerstyle.css"
            rel="stylesheet">
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

        <form action="Rsubmit?POLL_ID=<%=p.getPOLL_ID()%>" method="post">
            <main class="container">
                <section id="section1">

                    <div class="logo-name-box">
                        <div>
                            <div class="img_container">
                                <img src="HelperJSP/DisplayCmpImage.jsp?name=<%=cmp1.getCOMPANY_NAME() %>"
                                     height="80px" width="80px" class="c-logo">
                            </div>

                            <span><%=cmp1.getCOMPANY_NAME() %></span>
                        </div>

                        <div class="box" align="right">
                            <b id="b1"><%=cmp1.getCOMPANY_RATE()%></b>
                            <i class="fa-solid fa-star" id="i1"></i>
                            <p class="spa">Ratings: <%=rd.getOverallRatings(cmp1.getCOMPANY_ID()) %></p>
                            <p class="spa">Reviews: <%=rd.getTotalRatings(cmp1.getCOMPANY_ID())  %></p>
                        </div>
                    </div>

                    <div class="description">
                        ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ <%=cmp1.getCOMPANY_DESC()%>
                    </div>
                    <div class="c-service">
                        <h1>Give Reviews</h1>
                        <table>
                            <%for(Company_services cmp1_s : list1){%>
                            <tr>
                                <td><%=cmp1_s.getCATEGORY()%></td>
                                <td>
                                    <div id="r1">
                                        <input type="checkbox" name="c<%=temp1%>" id="c1r<%=temp1%>s1" value="1"> <label for="c1r<%=temp1%>s1"><i class="fa-regular fa-star"></i></label>
                                        <input type="checkbox" name="c<%=temp1%>" id="c1r<%=temp1%>s2" value="2"> <label for="c1r<%=temp1%>s2"> <i class="fa-regular fa-star"></i>
                                        </label>
                                        <input type="checkbox" name="c<%=temp1%>" id="c1r<%=temp1%>s3" value="3"> <label for="c1r<%=temp1%>s3"> <i class="fa-regular fa-star"></i>
                                        </label>
                                        <input type="checkbox" name="c<%=temp1%>" id="c1r<%=temp1%>s4" value="4" on> <label for="c1r<%=temp1%>s4"> <i class="fa-regular fa-star"></i>
                                        </label>
                                        <input type="checkbox" name="c<%=temp1%>" id="c1r<%=temp1%>s5" value="5" on> <label for="c1r<%=temp1%>s5"> <i class="fa-regular fa-star"></i>
                                        </label>
                                    </div>
                                </td>
                            </tr>
                            <%temp1++;
                                    }%>
                        </table>
                        <div id="comm-box">
                            <textarea id="txt-area" rows="8" cols="69" name="review1" placeholder="Comment your opinion about the company..."></textarea>
                        </div>
                    </div>

                </section>

                        <h2 style="margin-left: 45%;">vs</h2>

                <section id="section2">
                    <div class="logo-name-box">
                        <div>
                            <div class="img_container">
                                <img src="HelperJSP/DisplayCmpImage.jsp?name=<%=cmp2.getCOMPANY_NAME() %>"
                                     height="80px" width="80px" class="c-logo">
                            </div>

                            <span><%=cmp2.getCOMPANY_NAME() %></span>
                        </div>

                        <div class="box" align="right">
                            <b id="b1"><%=cmp2.getCOMPANY_RATE()%></b>
                            <i class="fa-solid fa-star" id="i1"></i>
                            <p class="spa">Ratings: <%=rd.getOverallRatings(cmp1.getCOMPANY_ID()) %></p>
                            <p class="spa">Reviews: <%=rd.getTotalRatings(cmp1.getCOMPANY_ID())  %></p>
                        </div>
                    </div>

                    <div class="description">
                        ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ <%=cmp2.getCOMPANY_DESC()%>
                    </div>

                    <div class="c-service">
                        <h1>Give Reviews</h1>
                        <table>
                               <%for(Company_services cmp2_s : list2){%>
                            <tr>
                                <td><b><%=cmp2_s.getCATEGORY()%></b></td>
                                <td>
                                    <div id="r1">
                                        <input type="checkbox" name="c<%=temp2%>" id="c2r<%=temp2%>s1" value="1"> <label for="c2r<%=temp2%>s1"><i class="fa-regular fa-star"></i></label>
                                        <input type="checkbox" name="c<%=temp2%>" id="c2r<%=temp2%>s2" value="2"> <label for="c2r<%=temp2%>s2"> <i class="fa-regular fa-star"></i>
                                        </label>
                                        <input type="checkbox" name="c<%=temp2%>" id="c2r<%=temp2%>s3" value="3"> <label for="c2r<%=temp2%>s3"> <i class="fa-regular fa-star"></i>
                                        </label>
                                        <input type="checkbox" name="c<%=temp2%>" id="c2r<%=temp2%>s4" value="4" on> <label for="c2r<%=temp2%>s4"> <i class="fa-regular fa-star"></i>
                                        </label>
                                        <input type="checkbox" name="c<%=temp2%>" id="c2r<%=temp2%>s5" value="5" on> <label for="c2r<%=temp2%>s5"> <i class="fa-regular fa-star"></i>
                                        </label>
                                    </div>

                                </td>
                            </tr>

                           <%temp2++;}%>
                        </table>
                        <div id="comm-box">
                            <textarea id="txt-area" rows="8" cols="69" name="review2" placeholder="Comment your opinion about the company..."></textarea>
                        </div>

                </section>

                <div id="btn-box">
                    <button type="submit" class="btn-sub">Submit Review</button>
                    <input id="btn" type="reset" value="reset"  class="btn-sub">
                </div>
                <!-- <button class="Read-more_btn" id="btn2" onclick="moreContent('showContent2','btn2')">Show -->
                <!-- More</button> -->
            </main>
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
        </form>

<!--<--        <script type="text/javascript">
    
            window.addEventListener("load", () => {
                document.getElementById("showContent").style.display = "none";
                document.getElementById("showContent2").style.display = "none";
            })
    
            function moreContent(extraContent, btn) {
                if (document.getElementById(extraContent).style.display == "none") {
                    document.getElementById(extraContent).style.display = "inline";
                    document.getElementById(btn).innerText = "Show Less";
                }
                else {
                    document.getElementById(extraContent).style.display = "none";
                    document.getElementById(btn).innerText = "Show More";
                }
            } 
    </script> -->
            <script>

            let rates = new Array(11);
            const rated = `fa-solid fa-star`;
            const notRated = `fa-regular fa-star`;

            $(document).ready(function () {


                rates[0] = 0;
                rates[1] = document.getElementsByName('c1');
                rates[2] = document.getElementsByName('c2');
                rates[3] = document.getElementsByName('c3');
                rates[4] = document.getElementsByName('c4');
                rates[5] = document.getElementsByName('c5');
                rates[6] = document.getElementsByName('c11');
                rates[7] = document.getElementsByName('c12');
                rates[8] = document.getElementsByName('c13');
                rates[9] = document.getElementsByName('c14');
                rates[10] = document.getElementsByName('c15');


                console.log(rates)
                $("input").change(function (a) {

                    var index = a.target.name.substr(1, 2);
                    index = index > 10 ? index -5 : index;
                    console.log(index)

                    for (var i = 0; i < a.target.value; i++) {
                        rates[index][i].labels[0].children[0].setAttribute("class", rated);
                    }
                    for (var i = rates[index].length - 1; i >= a.target.value; i--) {
                        rates[index][i].labels[0].children[0].setAttribute("class", notRated);
                    }
                    // retes[i]
                });
            });
        </script>

    </body>

</html>
