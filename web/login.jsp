<!DOCTYPE html>
<html>
<head>

<title>
Login - Court Case Management
</title>

<meta charset="UTF-8">

<meta
name="viewport"
content="width=device-width, initial-scale=1.0">


<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial,sans-serif;
}


/* BODY */

body{

background:

linear-gradient(
rgba(0,0,0,.5),
rgba(0,0,0,.5)
),

url("book.jpg");

background-size:
cover;

background-position:
center;

background-attachment:
fixed;


display:
flex;

justify-content:
center;

align-items:
center;

height:
100vh;

}



/* LOGIN CARD */

.login-box{


width:
400px;


padding:
40px;


background:

rgba(
255,
255,
255,
0.12);


backdrop-filter:
blur(
15px);


border:

1px solid rgba(
255,
255,
255,
0.2);


border-radius:
20px;


box-shadow:

0 8px 30px rgba(
0,
0,
0,
0.4);


color:
white;


transition:
0.3s;

}


.login-box:hover{

transform:

translateY(
-5px);

}



/* TITLE */

h2{

text-align:
center;

margin-bottom:
30px;

font-size:
32px;

color:
white;

}



/* INPUTS */

input{


width:
100%;


padding:
15px;


margin:
12px 0;


border:
none;


outline:
none;


border-radius:
10px;


background:

rgba(
255,
255,
255,
0.15);


color:
white;


font-size:
16px;

}



/* Placeholder */

input::placeholder{

color:
#ddd;

}




/* BUTTON */

button{


width:
100%;


padding:
15px;


margin-top:
20px;


border:
none;


border-radius:
10px;


background:
#3498db;


color:
white;


font-size:
18px;


font-weight:
bold;


cursor:
pointer;


transition:
0.3s;

}



button:hover{

background:
#2980b9;

transform:

scale(
1.02);

}




/* ERROR */

.error{

margin-top:
20px;

text-align:
center;

color:
#ff7675;

font-weight:
bold;

}



/* EXTRA */

.footer{

margin-top:
20px;

text-align:
center;

font-size:
14px;

color:
#ddd;

}


.footer a{

color:
#74b9ff;

text-decoration:
none;

}


.footer a:hover{

text-decoration:
underline;

}

</style>

</head>



<body>



<div class="login-box">


<h2>

Login

</h2>



<form
action="LoginServlet"

method="POST">


<input

type="text"

name="username"

placeholder="Enter Username"

required>



<input

type="password"

name="password"

placeholder="Enter Password"

required>



<button
type="submit">

Login

</button>


</form>




<div class="error">

${error}

</div>




<div class="footer">

Don't have an account?

<a href="register.jsp">

Register

</a>

</div>



</div>



</body>
</html>