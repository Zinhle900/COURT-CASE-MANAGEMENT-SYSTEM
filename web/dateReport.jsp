<%@page import="java.util.List"%>
<%@page import="za.ac.web.Case"%>

<!DOCTYPE html>
<html>

<head>

<title>

Date Report

</title>


<style>

body{

font-family:
Arial;

background:
#f4f6f9;

padding:
20px;

}



.container{

background:
white;

padding:
30px;

border-radius:
10px;

box-shadow:
0 0 10px #ccc;

}



h2{

color:
#2c3e50;

}



table{

width:
100%;

border-collapse:
collapse;

margin-top:
20px;

}



th{

background:
#3498db;

color:
white;

padding:
10px;

}



td{

padding:
10px;

border:
1px solid #ddd;

}



input,
button{

padding:
10px;

margin:
5px;

}



button{

background:
#2ecc71;

color:
white;

border:
none;

border-radius:
5px;

cursor:
pointer;

}



button:hover{

background:
#27ae60;

}



.export{

padding:
10px;

color:
white;

text-decoration:
none;

border-radius:
5px;

margin:
5px;

display:
inline-block;

}



.pdf{

background:
#e74c3c;

}


.csv{

background:
#3498db;

}


.txt{

background:
#8e44ad;

}



.export:hover{

opacity:
0.8;

}



.back{

padding:
10px;

background:
#2c3e50;

color:
white;

text-decoration:
none;

border-radius:
5px;

}



</style>

</head>





<body>



<div class=
"container">


<h2>

Date Report

</h2>



<form action=
"DateReportServlet">


Start:

<input

type=
"date"

name=
"start"

value=

"<%=java.time.LocalDate.now().withDayOfMonth(1)%>"

>



End:

<input

type=
"date"

name=
"end"

value=

"<%=java.time.LocalDate.now()%>"

>



<button>

Filter

</button>



<br><br>



<!-- PDF -->

<a

class=
"export pdf"

href=

"ExportDateCSVServlet?start=<%=request.getParameter("start")%>&end=<%=request.getParameter("end")%>&format=pdf"

>

Export PDF

</a>




<!-- CSV -->

<a

class=
"export csv"

href=

"ExportDateCSVServlet?start=<%=request.getParameter("start")%>&end=<%=request.getParameter("end")%>&format=csv"

>

Export CSV

</a>




<!-- TXT -->

<a

class=
"export txt"

href=

"ExportDateCSVServlet?start=<%=request.getParameter("start")%>&end=<%=request.getParameter("end")%>&format=txt"

>

Export TXT

</a>



</form>






<%

List<Case> list=

(List<Case>)

request.getAttribute(

"report"

);



if(

list!=null

){

%>



<table>


<tr>

<th>ID</th>

<th>Title</th>

<th>Status</th>

<th>Lawyer</th>

<th>Date</th>

</tr>




<%

for(

Case c:
list

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



<td>

<%=c.getFilingDate()%>

</td>



</tr>



<%

}

%>



</table>



<%

}

%>



<br>


<a

class=
"back"

href=

"<%=request.getContextPath()%>/dashboard.jsp"

>

Back Dashboard

</a>



</div>


</body>

</html>