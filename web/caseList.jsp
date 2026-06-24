<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="za.ac.web.Case"%>

<html>
<head>
<title>Case List</title>
<style>
body { font-family: Arial; background:#f4f6f9; padding:20px; }
table { width:100%; border-collapse:collapse; background:white; }
th, td { padding:10px; border:1px solid #ddd; }
th { background:#3498db; color:white; }
a { text-decoration:none; font-weight:bold; margin-right:10px; }
.btn { padding:6px 10px; border-radius:4px; color:white; }
.edit { background:#f39c12; }
.delete { background:#e74c3c; }
.add { background:#2ecc71; }

.export{

background:#8e44ad;

color:white;

padding:8px;

border-radius:5px;

text-decoration:none;

}
</style>
</head>

<body>
<%
String role = (String) session.getAttribute("userRole");
if (role == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<h2>Case List</h2>

<!-- LOAD DATA -->
<a href="CaseListServlet" class="btn add">Refresh</a>

<% if("ADMIN".equals(role)) { %>
<a href="addCase.jsp" class="btn add">+ Add Case</a>
<% } %>
<table>
<tr>
    <th>ID</th><th>Case Number</th><th>Filling Date</th><th>Title</th><th>Description</th>
<th>Status</th><th>Lawyer ID</th><th>Time Stamp</th><th>Actions</th>
</tr>

<%
  SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

List<Case> list = (List<Case>) request.getAttribute("caseList");

if(list != null && !list.isEmpty()){
for(Case c : list){
%>

<tr>
<td><%=c.getCaseID()%></td>
<td><%=c.getCaseNumber()%></td>
<td><%=sdf.format(c.getFilingDate())%></td>
<td><%=c.getTitle()%></td>
<td><%=c.getDescription()%></td>
<td><%=c.getStatus()%></td>
<td><%=c.getLawyerID()%></td>
<td><%=c.getCreatedAt()%></td>

<td>
<!-- EDIT -->
<% if("ADMIN".equals(role)) { %>
<a class="btn edit" href="EditCaseServlet?id=<%=c.getCaseID()%>">Edit</a>
<a class="btn delete" href="deleteCase.jsp?id=<%=c.getCaseID()%>">Delete</a>
<% } %>
</td>
</tr>

<% } } else { %>
<tr><td colspan="5">No data available</td></tr>
<% } %>

</table>



<a href="<%=request.getContextPath()%>/dashboard.jsp">Back</a>

</body>
</html>