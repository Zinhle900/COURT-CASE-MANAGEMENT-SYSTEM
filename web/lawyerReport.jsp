<%@page import="java.util.List"%>
<%@page import="za.ac.web.Case"%>

<html>

<head>

<style>

body{
font-family:Arial;
background:#f4f6f9;
padding:20px;
}

.container{
background:white;
padding:30px;
border-radius:10px;
}

table{
width:100%;
border-collapse:collapse;
}

th{
background:#3498db;
color:white;
}

td{
padding:10px;
border:1px solid #ddd;
}

button{
background:#2ecc71;
padding:10px;
color:white;
border:none;
}

.export{
padding:10px;
color:white;
text-decoration:none;
border-radius:5px;
margin:5px;
}

.pdf{
background:#e74c3c;
}

.csv{
background:#3498db;
}

.txt{
background:#8e44ad;
}

</style>

</head>



<body>

<div class="container">


<h2>

Lawyer Report

</h2>



<form action="LawyerReportServlet">


Lawyer ID:

<input
type="number"

name="lawyerID">


<button>

Search

</button>



<br><br>



<a

class="export pdf"

href=

"ExportLawyerCSVServlet?lawyerID=<%=request.getParameter("lawyerID")%>&format=pdf"

>

Export PDF

</a>




<a

class="export csv"

href=

"ExportLawyerCSVServlet?lawyerID=<%=request.getParameter("lawyerID")%>&format=csv"

>

Export CSV

</a>




<a

class="export txt"

href=

"ExportLawyerCSVServlet?lawyerID=<%=request.getParameter("lawyerID")%>&format=txt"

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


if(list!=null){

%>



<table>


<tr>

<th>ID</th>

<th>Title</th>

<th>Lawyer</th>

</tr>



<%

for(Case c:list){

%>


<tr>


<td>

<%=c.getCaseID()%>

</td>



<td>

<%=c.getTitle()%>

</td>



<td>

<%=c.getLawyerID()%>

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

<a href="<%=request.getContextPath()%>/dashboard.jsp">

Back Dashboard

</a>


</div>

</body>
</html>