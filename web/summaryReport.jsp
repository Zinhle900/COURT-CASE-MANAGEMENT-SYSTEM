<%@page contentType="text/html"%>

<html>

<head>

<title>

Summary Report

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



.card{

background:
#3498db;

color:
white;

padding:
20px;

margin:
10px;

display:
inline-block;

width:
180px;

text-align:
center;

border-radius:
10px;

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



/* Export colors */

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

background:
#2c3e50;

padding:
10px;

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



<div class="container">


<h2>

Management Summary Report

</h2>





<div class="card">

Total Cases

<br><br>

${total}

</div>




<div class="card">

Verified

<br><br>

${verified}

</div>




<div class="card">

Filed

<br><br>

${filed}

</div>




<div class="card">

Closed

<br><br>

${closed}

</div>




<div class="card">

Scheduled

<br><br>

${scheduled}

</div>





<br><br>


<a class="export pdf"
href="ExportSummaryCSVServlet?format=pdf">

Export PDF

</a>



<a class="export csv"
href="ExportSummaryCSVServlet?format=csv">

Export CSV

</a>



<a class="export txt"
href="ExportSummaryCSVServlet?format=txt">

Export TXT

</a>





<br><br>



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