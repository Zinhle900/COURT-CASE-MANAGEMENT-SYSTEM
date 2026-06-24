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
padding:10px;
}

td{
padding:10px;
border:1px solid #ddd;
}

button{
background:#2ecc71;
color:white;
padding:10px;
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

Status Report

</h2>



<form
action="StatusReportServlet">


<select
name="status">

<option>

Filed

</option>


<option>

Closed

</option>


<option>

Scheduled

</option>


<option>

Verified

</option>


</select>



<button>

Filter

</button>



<br><br>



<a

class="export pdf"

href=

"ExportStatusCSVServlet?status=<%=request.getParameter("status")%>&format=pdf"

>

Export PDF

</a>




<a

class="export csv"

href=

"ExportStatusCSVServlet?status=<%=request.getParameter("status")%>&format=csv"

>

Export CSV

</a>




<a

class="export txt"

href=

"ExportStatusCSVServlet?status=<%=request.getParameter("status")%>&format=txt"

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

<th>Status</th>

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

<%=c.getStatus()%>

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