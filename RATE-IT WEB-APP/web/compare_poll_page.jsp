<%-- 
    Document   : compare_poll_page
    Created on : 27-Apr-2023, 10:51:34 am
    Author     : neesa
--%>

<%@page import="dbclasses.Review_database"%>
<%@page import="rateit.entities.Company_services"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbclasses.Company_services_database"%>
<%@page import="rateit.entities.Company"%>
<%@page import="rateit.entities.Poll"%>
<%@page import="dbclasses.Company_database"%>
<%@page import="dbclasses.Poll_database"%>
<%@page import="rateit.helper.ConnectionProvider"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compare Poll</title>
    <script src="https://kit.fontawesome.com/c2a4c35825.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/20a4a662a5.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
</script>
    <style>
@import url('https://fonts.googleapis.com/css2?family=Unbounded:wght@300&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        #container {
            /*display: flex;*/
            height: 100%;
            width: 100%;
            border-radius: 5px;
        }

        .main_logo {
            height: 50px;
            width: 130px;
            float: left;
            border-radius: 5%;
            padding: 7px;
            background-color: black;
            margin-top: 10px;
            margin-left: 15px;
        }

        #chart-container{
            width: 70%;
            height: 60vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 50px;
            margin: 20px 14%;
        }

        #myChart{
            width: 100%;
            height: 100%;
            background-color: rgba(243, 240, 240, 0.966);
            padding: 40px;
        }

        #check1{
            height: 100px;
            width: 100px;
            background-color: rgba(173, 216, 230, 0.741);
        }
         #check2{
            height: 100px;
            width: 100px;
            background-color: rgba(0, 119, 255, 0.767);
        }

        #comps{
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 40px;
            margin: 30px 0px;
            border: 1px solid black;
        }

        .comp_image{
            margin: 10px 30px;
            height: 80px;
            width: 80px;
            border-radius: 100%;
            border: 1px solid black;
            margin-top: -40px;
        }
        .box1{
            flex-direction: column;
        }

        .box1 span{
            margin-left: 40px;
            font-size: 30px;
        }
        table{
            border-spacing: 0px 10px;
            height:60vh;
            width:65vw;
            margin:4% 17%;
        }

        #table-head {
            background-color: #383838;
        }

        table tr{
            height:7vh;
            border:2px solid black;
            background-color: rgba(243, 240, 240, 0.966);
            box-shadow: 0.3px 0.3px 2px rgb(141, 140, 140);
            
        }
         .label{
            position:relative;
            top: -5px;
            font-size: 22px;
        }
        th {
           color: white;
        }
        td{
            text-align: center;
            /* background-color: aqua; */

        }
        #t1{
            border-bottom:none;
        }
        .right{
            border-right:none;
        }
        
        .left, .right {
            font-family: 'Unbounded', cursive;
        }
        
        .bottom{
            border-bottom: none
        }
        button{
            height:35px;
            width:130px;
            border-radius:3px;
            border: none;
            color:white;
            font-size: 15px;
            background-color: #303030;
        }
    </style>
</head>
<% 
  int i =Integer.parseInt(request.getParameter("a"));

  Poll_database pd = new Poll_database(ConnectionProvider.getConnection());
  Poll p = pd.getPoll(i);
  
 
  Company_database cd = new Company_database(ConnectionProvider.getConnection());
 Company cmp1 =  cd.getCompanyById(p.getCOMPANY1());
 Company cmp2 = cd.getCompanyById(p.getCOMPANY2());
 
Company_services_database csd = new Company_services_database(ConnectionProvider.getConnection());
 ArrayList<Company_services> list = csd.getAllCategories(cmp1.getCOMPANY_ID());
 
Review_database rd = new Review_database(ConnectionProvider.getConnection());


%>
<body>
    <div id="container">
      
<!--        <img class="comp_image" src="HelperJSP/DisplayCmpImage.jsp?name=<%=cmp1.getCOMPANY_NAME()%>" alt="image1"><br>-->
<!--//            -->
        <table>
            <tr>
                <th>BASIC COMPARISON</th>
                <th><img class="comp_image" src="HelperJSP/DisplayCmpImage.jsp?name=<%=cmp1.getCOMPANY_NAME()%>" alt="image1"><br>
                    <span class="label"><%=cmp1.getCOMPANY_NAME() %></span></th>
                <th><img class="comp_image" src="HelperJSP/DisplayCmpImage.jsp?name=<%=cmp2.getCOMPANY_NAME()%>" alt="imag2"><br>
                    <span class="label"><%=cmp2.getCOMPANY_NAME() %></span></th>
                
            </tr>
            <tr><td>CATEGORY</td>
            <td><%=cmp1.getCATEGORY() %> </td>
            <td class="right"><%=cmp2.getCATEGORY() %> </td>
            </tr>
            
            <tr><td>OVERALL RATINGS </td>
                <td><%=rd.getOverallRatings(cmp1.getCOMPANY_ID()) %></td>
            <td class="right"><%=rd.getOverallRatings(cmp2.getCOMPANY_ID()) %> </td></tr>
            
            <tr><td>TOTAL REVIEWS </td>
                <td><%=rd.getTotalRatings(cmp1.getCOMPANY_ID()) %></td>
            <td class="right"><%=rd.getTotalRatings(cmp2.getCOMPANY_ID()) %></td></tr>
            
            <tr><td>ACTIVE CUSTOMER PROBLEM [ACP]</td>
                <%if(cmp1.getACP_COUNT() == 0){%>
                <td> - </td>
                <%}else{%>
            <td><%=cmp1.getACP_COUNT()%></td> 
            <%}%>
            <%if(cmp2.getACP_COUNT() == 0){%>
            <td class="right"> - </td>
            <%}else{%>
            <td class="right"><%=cmp2.getACP_COUNT() %></td>
            <%}%>
            </tr>
            <tr>
                <td>SOLVED CUSTOMER PROBLEM [SCP] </td>
            <%if(cmp1.getSCP_COUNT() == 0){%>
                <td> - </td>
                <%}else{%>
            <td><%=cmp1.getSCP_COUNT()%></td> 
            <%}%>
            <%if(cmp2.getSCP_COUNT() == 0){%>
            <td class="right"> - </td>
            <%}else{%>
            <td class="right"><%=cmp2.getSCP_COUNT() %></td>
            <%}%>
            </tr>
            
            <tr>
                <td id="t1"></td>
                <td class="bottom"><a target="_blank" href="https://<%=cmp1.getCOMPANY_URL() %>"><button>VISIT SITE</button></a></td>
                <td class=" bottom right"><a target="_blank" href="https://<%=cmp2.getCOMPANY_URL() %>"><button>VISIT SITE</button></a></td>
            </tr>
        </table>   
            
    <div id="chart-container">
        <canvas id="myChart" style="width:100%;max-width:700px"></canvas>
    </div>
    </div>
</body>

<script>
    
    let company1 = new Array();
    let company2 = new Array();
    let labels = new Array();
    
<%for(Company_services cs : list){%>
    labels.push(("<%=cs.getCOMPANY_SERVICES() + "," %>").split(","));
    <%}%>
    
<%for(Company_services cs : list){%>
    company1.push(("<%=rd.getRatings(cmp1.getCOMPANY_ID() , cs.getCOMPANY_SERVICES())+"," %>").split(","));
    <%}%>
    console.log(company1)
<%for(Company_services cs : list){%>
    company2.push(("<%=rd.getRatings(cmp2.getCOMPANY_ID() , cs.getCOMPANY_SERVICES()) + ","%>").split(","));
    <%}%>
    console.log(company2);
    
    for(let i = 0; i< company1.length; i++){
        labels[i].pop();
    }
    console.log(labels)
    let color1 = 'rgba(0, 119, 255, 0.767)',color2 = 'rgba(173, 216, 230, 0.741)';
    const dataVal = {
      labels:[...labels],
      datasets:[{
              data:[...company1,0,5],
              backgroundColor:[color1,color1,color1,color1,color1],
              label: "<%=cmp1.getCOMPANY_NAME()%>"
      },
      {
              data:[...company2],
              backgroundColor:[color2,color2,color2,color2,color2],
              label: "<%=cmp2.getCOMPANY_NAME()%>"
      }
    ]
  }
  
    new Chart(document.getElementById("myChart"), 
{
  type: "bar",
  data:dataVal
  
});


</script>

</html>

       
   








