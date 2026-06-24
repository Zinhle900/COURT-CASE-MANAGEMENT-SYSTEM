<html>
<head>
<title>Add Case</title>
<style>
body { font-family: Arial; background:#f4f6f9; padding:20px; }
form { background:white; padding:20px; width:350px; }
input, select { width:100%; margin-bottom:10px; padding:8px; }
button { background:#2ecc71; color:white; padding:10px; border:none; }
</style>
</head>

<body>
 <%
String role = (String) session.getAttribute("userRole");
if (role == null || !role.equals("ADMIN")) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<h2>Add New Case</h2>

<form action="AddCaseServlet" method="post">

Case Number:
<input type="text" name="caseNumber" required>

Title:
<input type="text" name="title" required>

Description:
<input type="text" name="description">

Status:
<select name="status">
<option value="Filed">Filed</option>
<option value="Verified">Verified</option>
<option value="Scheduled">Scheduled</option>
<option value="Closed">Closed</option>
</select>

Filing Date:
<input type="date" name="filingDate" required>

Lawyer ID:
<input type="number" name="lawyerID" required>

<button type="submit">Save</button>

</form>

<br>
<a href="<%=request.getContextPath()%>/dashboard.jsp">Back</a>

</body>
</html>