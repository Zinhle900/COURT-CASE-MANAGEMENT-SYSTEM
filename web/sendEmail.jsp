<!DOCTYPE html>
<html>

<head>

<title>

Send Email Notification

</title>


<style>

body{

font-family:
Arial;

background:
#f4f6f9;

padding:
40px;

}


.container{

background:
white;

padding:
30px;

width:
400px;

margin:
auto;

border-radius:
10px;

box-shadow:
0 0 10px rgba(
0,
0,
0,
0.2
);

}


input{

width:
100%;

padding:
12px;

margin:
10px 0;

}


button{

background:
green;

color:
white;

padding:
12px;

border:
none;

width:
100%;

cursor:
pointer;

}

</style>

</head>

<body>



<div class=
"container">


<h2>

Send Case Notification

</h2>



<form

action=
"EmailNotificationServlet"

method=
"post">


<label>

Receiver Email

</label>


<input

type=
"email"

name=
"receiverEmail"

required>



<button>

Send Email

</button>


</form>


</div>



</body>

</html>