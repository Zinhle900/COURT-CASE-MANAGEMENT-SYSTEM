<%@page import="java.util.List"%>
<%@page import="za.ac.web.Case"%>
<%@page import="za.ac.web.bl.CaseFacadeLocal"%>
<%@page import="javax.naming.InitialContext"%>

<%

String username=
(String)session.getAttribute(
"username"
);

String role=
(String)session.getAttribute(
"userRole"
);


if(role==null){

response.sendRedirect(
"login.jsp"
);

return;

}


InitialContext ctx=
new InitialContext();


CaseFacadeLocal caseFacade=
(CaseFacadeLocal)

ctx.lookup(

"java:global/CourtSystemWebApp/CaseFacade"

);



List<Case> cases=

caseFacade.findAll();



int total=
cases.size();

int filed=0;
int verified=0;

int scheduled=0;

int closed=0;



for(Case c:cases){


if(

"Filed".equalsIgnoreCase(
c.getStatus()
)

)

filed++;
if(

"Verified".equalsIgnoreCase(
c.getStatus()
)

)

verified++;




if(

"Scheduled".equalsIgnoreCase(
c.getStatus()
)

)

scheduled++;




if(

"Closed".equalsIgnoreCase(
c.getStatus()
)

)

closed++;

}

%>



<!DOCTYPE html>

<html>

<head>


<title>

Court Dashboard

</title>



    <!Bootstrap>
<link

href=

"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"   

rel=
"stylesheet">



<script src=

"https://cdn.jsdelivr.net/npm/chart.js">

</script>





<style>


*{

margin:
0;

padding:
0;

box-sizing:
border-box;

font-family:
Arial;

}



body{


background:

linear-gradient(

rgba(0,0,0,.45),

rgba(0,0,0,.45)

),

url("bg.jpg");


background-size:
cover;

background-attachment:
fixed;

min-height:
100vh;

}




.header{


height:
70px;

background:

rgba(
0,
0,
0,
0.5
);

display:
flex;

justify-content:
space-between;

align-items:
center;

padding:
0 30px;

position:
fixed;

top:
0;

left:
0;

right:
0;

color:
white;

z-index:
1000;

}



.sidebar{


position:
fixed;

top:
70px;

left:
0;

width:
250px;


/* FIXED HEIGHT */
height:
calc(
100vh - 70px
);


background:

rgba(
0,
0,
0,
0.5
);


padding:
20px;


/* ENABLE SCROLL */
overflow-y:
auto;

overflow-x:
hidden;


/* SPACE FOR LOGOUT */
padding-bottom:
60px;

}



/* Optional scrollbar style */

.sidebar::-webkit-scrollbar{

width:
8px;

}



.sidebar::-webkit-scrollbar-track{

background:

rgba(
255,
255,
255,
0.1
);

}



.sidebar::-webkit-scrollbar-thumb{

background:
gold;

border-radius:
10px;

}



.sidebar::-webkit-scrollbar-thumb:hover{

background:
orange;

}



.sidebar h3{

color:
gold;

margin:
20px 0;

}



.sidebar a{


display:
block;

padding:
10px;

margin:
9px ;

color:
white;

text-decoration:
none;

border-radius:
10px;

}



.sidebar a:hover{

background:

rgba(
255,
255,
255,
0.1
);

}



.logout{

background:
red;

}



.main{

margin-left:
270px;

padding:
100px 30px;

}




.card{


background:

rgba(
0,
0,
0,
0.35
);

padding:
25px;

border-radius:
20px;

margin-bottom:
20px;

color:
white;

backdrop-filter:
blur(
10px
);

}



.grid{


display:
grid;

grid-template-columns:

1fr 2fr;

gap:
20px;

}



.stats{


display:
grid;

grid-template-columns:

repeat(
4,
1fr
);

gap:
15px;

}



.stat{


background:

rgba(
255,
255,
255,
0.05
);

padding:
20px;

text-align:
center;

border-radius:
10px;

}



.btn{


display:
block;

padding:
15px;

text-align:
center;

margin:
10px 0;

border-radius:
10px;

text-decoration:
none;

font-weight:
bold;

color:
white;

}



.blue{

background:
#1e90ff;

}


.green{

background:
#27ae60;

}


.purple{

background:
#8e44ad;

}



table{


width:
100%;

border-collapse:
collapse;

}



th,td{


padding:
15px;

border-bottom:

1px solid

rgba(
255,
255,
255,
0.1
);

color:
white;

}



</style>

</head>





<body>




<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">

<div class="container-fluid">

<a class="navbar-brand fw-bold">

COURT CASE MANAGEMENT

</a>

<div class="text-white">

Welcome

<b><%=username%></b>

|

Role

<b><%=role%></b>

</div>

</div>

</nav>








<div class=
"sidebar">


<h3>

NAVIGATION

</h3>



<a href=
"dashboard.jsp">

Dashboard

</a>



<a href=
"CaseListServlet">

View Cases

</a>



<%

if(

"ADMIN".equals(
role
)

){

%>



<a href=
"addCase.jsp">

Add Case

</a>



<%

}

%>




<h3>

REPORTS

</h3>



<a href=
"SummaryReportServlet">

Summary Report

</a>



<a href=
"DateReportServlet">

Date Report

</a>



<a href=
"StatusReportServlet">

Status Report

</a>



<a href=
"LawyerReportServlet">

Lawyer Report

</a>




<h3>

ACCOUNT

</h3>



<a href=
"ExportPDFServlet">

ABOUT SYSTEM

</a>



<a href=
"sendEmail.jsp">

Send Email Notification

</a>



<a

class=
"logout"

href=
"LogoutServlet">

Logout

</a>



</div>








<div class=
"main">



<div class=
"card">


<h1>

Welcome,

<%=username%>

</h1>


<br>


Manage court cases

and reports.


</div>







<div class=
"grid">


<div class=
"card">


<h2>

QUICK ACTIONS

</h2>



<a

class=
"btn blue"

href=
"CaseListServlet">

View Cases

</a>




<%

if(

"ADMIN".equals(
role
)

){

%>



<a

class=
"btn green"

href=
"addCase.jsp">

Add Case

</a>



<%

}

%>




<a

class=
"btn purple"

href=
"SummaryReportServlet">

Generate Reports

</a>



</div>







<div class=
"card">


<h2>

OVERVIEW

</h2>



<div class=
"stats">


<div class=
"stat">

<h1>

<%=total%>

</h1>

Total

</div>




<div class=
"stat">

<h1>

<%=filed%>

</h1>

Filed

</div>
<div class=
"stat">

<h1>

<%=verified%>

</h1>

Verified

</div>




<div class=
"stat">

<h1>

<%=scheduled%>

</h1>

Scheduled

</div>




<div class=
"stat">

<h1>

<%=closed%>

</h1>

Closed

</div>



</div>



</div>


</div>







<!-- CHARTS -->

<div class=
"card">


<h2>

Case Analytics

</h2>



<div

style=

"display:flex;
justify-content:space-around;
flex-wrap:wrap;
gap:30px;">



<div

style=

"width:400px;">

<canvas

id=
"pieChart">

</canvas>

</div>





<div

style=

"width:400px;">

<canvas

id=
"barChart">

</canvas>

</div>



</div>


</div>








<div class=
"card">


<h2>

RECENT CASES

</h2>



<table>



<tr>

<th>ID</th>

<th>Title</th>

<th>Status</th>

<th>Lawyer</th>

</tr>




<%

for(

Case c:
cases

){

%>




<tr>


<td>

<%=c.getCaseID()%>

</td>



<td>

<%=c.getTitle()%>

</td>



<td>

<%=c.getStatus()%>

</td>



<td>

<%=c.getLawyerID()%>

</td>



</tr>




<%

}

%>



</table>


</div>








<div class=
"card">


<h2>

System Features

</h2>



<ul>

<li>Case Management</li>

<li>Role Authentication</li>

<li>Reports</li>

<li>CSV Export</li>

<li>Email Notifications</li>

<li>PDF Export</li>

<li>Dashboard Analytics</li>

<li>Charts</li>

<li>Recent Cases</li>

</ul>



</div>



</div>







<script>


new Chart(

document.getElementById(

"pieChart"

),

{

type:

"pie",


data:{

labels:[
"Verified",  
"Filed",
"Scheduled",
"Closed"

],


datasets:[{

data:[
<%=verified%>,
<%=filed%>,
<%=scheduled%>,
<%=closed%>

],


backgroundColor:[
    
"#FF0000",
"#3498db",
"#f39c12",
"#2ecc71"

]

}]

}

});








new Chart(

document.getElementById(

"barChart"

),

{

type:

"bar",


data:{

labels:[
"Verified",

"Filed",

"Scheduled",

"Closed"

],


datasets:[{

label:

"Cases",


data:[
 
<%=verified%>,
<%=filed%>,

<%=scheduled%>,

<%=closed%>

],


backgroundColor:[
"#FF0000",
"#3498db",
"#f39c12",
"#2ecc71"

]

}]

}

});


</script>




</body>

</html>