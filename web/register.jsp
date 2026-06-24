<!DOCTYPE html>
<html>
<head>

<title>
Register User
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

url("bg.jpg");


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




/* REGISTER BOX */

.register-box{


width:
420px;


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


.register-box:hover{

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
30px;

color:
white;

}




/* LABEL */

label{

display:
block;

margin:
15px 0 8px;

font-weight:
bold;

}




/* INPUT */

input,
select{


width:
100%;


padding:
15px;


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


input::placeholder{

color:
#ddd;

}


select{

color:
white;

}


option{

background:
#2c3e50;

}




/* BUTTON */

button{


width:
100%;


padding:
15px;


margin-top:
25px;


border:
none;


border-radius:
10px;


background:
#2ecc71;


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
#27ae60;

transform:

scale(
1.02);

}




/* LOGIN LINK */

.login-link{

margin-top:
25px;

text-align:
center;

color:
#ddd;

}


.login-link a{

color:
#74b9ff;

font-weight:
bold;

text-decoration:
none;

}



.login-link a:hover{

text-decoration:
underline;

}



</style>

</head>



<body>



<div class="register-box">


<h2>

Create Account

</h2>



<form
action="RegisterServlet"

method="POST">



<label>

Username

</label>


<input

type="text"

name="username"

placeholder="Enter username"

required>




<label>

Password

</label>


<input

type="password"

name="password"

placeholder="Enter password"

required>





<label>

Role

</label>


<select
name="role">


<option value="USER">

USER

</option>


</select>




<button
type="submit">

Register Account

</button>



</form>





<div class="login-link">


Already have an account?


<a href="login.jsp">

Login

</a>


</div>



</div>



</body>
</html>