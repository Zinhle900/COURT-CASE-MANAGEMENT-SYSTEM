<%-- 
    Document   : duplicateUser
    Created on : May 19, 2026, 10:58:27 AM
    Author     : Washington AM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>

<title>
Duplicate User
</title>


<style>

body{

font-family:Arial;

background:#f4f6f9;

display:flex;

justify-content:center;

align-items:center;

height:100vh;

margin:0;

}


.card{

background:white;

padding:40px;

width:400px;

text-align:center;

border-radius:10px;

box-shadow:

0px 4px 15px

rgba(0,0,0,.1);

}


.error{

font-size:50px;

color:red;

}


h2{

color:#e74c3c;

}


.btn{

display:inline-block;

padding:12px 20px;

background:#3498db;

color:white;

text-decoration:none;

border-radius:5px;

margin-top:15px;

}

.btn:hover{

background:#2980b9;

}

</style>

</head>


<body>


<div class="card">


<div class="error">

⚠

</div>


<h2>

Registration Failed

</h2>



<p>

${error}

</p>



<p>

Choose another username.

</p>



<a

href="register.jsp"

class="btn">

Try Again

</a>


</div>


</body>

</html>