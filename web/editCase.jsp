<%@page import="za.ac.web.Case"%>

<%
Case c = (Case) request.getAttribute("case");
%>

<html>
<head>
<title>Edit Case</title>
<style>
body { font-family: Arial; background:#f4f6f9; padding:20px; }
form { background:white; padding:20px; width:350px; }
input, select { width:100%; margin-bottom:10px; padding:8px; }
button { background:#f39c12; color:white; padding:10px; border:none; }
</style>
</head>

<body>

<h2>Edit Case</h2>

<form action="EditCaseServlet" method="post">

<input type="hidden" name="caseID" value="<%=c.getCaseID()%>">

Case Number:
<input type="text" name="caseNumber" value="<%=c.getCaseNumber()%>" required>

Title:
<input type="text" name="title" value="<%=c.getTitle()%>" required>

Description:
<input type="text" name="description" value="<%=c.getDescription()%>">

Status:
<select name="status">
<option <%=c.getStatus().equals("Filed")?"selected":""%>>Filed</option>
<option <%=c.getStatus().equals("Verified")?"selected":""%>>Verified</option>
<option <%=c.getStatus().equals("Scheduled")?"selected":""%>>Scheduled</option>
<option <%=c.getStatus().equals("Closed")?"selected":""%>>Closed</option>
</select>

Filing Date:
<input type="date" name="filingDate">

Lawyer ID:
<input type="text" name="lawyerID" value="<%=c.getLawyerID()%>">

<button type="submit">Update</button>

</form>

<br>
<a href="CaseListServlet">? Back to List</a>

</body>
</html>