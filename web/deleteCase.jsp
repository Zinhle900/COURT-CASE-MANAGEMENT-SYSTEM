<html>
<head>
<title>Delete Case</title>
<style>
body { font-family: Arial; text-align:center; padding:50px; }
button { padding:10px 20px; margin:10px; }
.delete { background:red; color:white; }
.cancel { background:gray; color:white; }
</style>
</head>

<body>

<h2>Are you sure you want to delete this case?</h2>

<%
String id = request.getParameter("id");
%>

<form action="DeleteCaseServlet" method="post">
<input type="hidden" name="id" value="<%=id%>">
<button class="delete">Yes Delete</button>
</form>

<a href="CaseListServlet">
<button class="cancel">Cancel</button>
</a>
<a href="<%=request.getContextPath()%>/dashboard.jsp">Back</a>

</body>
</html>