package za.ac.web.controller;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import za.ac.web.User;
import za.ac.web.bl.UserFacadeLocal;

public class LoginServlet
extends HttpServlet{

@EJB
private UserFacadeLocal
userFacade;

protected void doPost(
HttpServletRequest request,
HttpServletResponse response)

throws ServletException,
IOException{

String username=request.getParameter("username");

String password=request.getParameter("password");

User user=userFacade.login(username,password);

if(user!=null){

HttpSession session=
request.getSession();

session.setAttribute(
"userRole",
user.getRole());

session.setAttribute(
"username",
user.getUsername());

if(
"ADMIN".equals(
user.getRole())
){

response.sendRedirect("dashboard.jsp");

}else{

response.sendRedirect("dashboard.jsp");

}

}else{

request.setAttribute("error","Invalid Login");

request.getRequestDispatcher(
"login.jsp")
.forward(
request,response);

}

}
}