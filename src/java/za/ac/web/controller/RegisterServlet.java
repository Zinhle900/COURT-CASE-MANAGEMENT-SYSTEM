package za.ac.web.controller;

import java.io.IOException;

import javax.ejb.EJB;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import za.ac.web.User;
import za.ac.web.bl.UserFacadeLocal;


public class RegisterServlet
extends HttpServlet{


@EJB
private UserFacadeLocal
userFacade;



protected void doPost(

HttpServletRequest request,

HttpServletResponse response)

throws ServletException,
IOException{


String username=

request.getParameter(
"username");


User existing=

userFacade.findByUsername(
username);



if(existing != null){

request.setAttribute(

"error",

"Username already exists");

request.getRequestDispatcher(

"duplicateUser.jsp")

.forward(

request,
response);

return;

}



User u=
new User();


u.setUsername(
username);


u.setPassword(

request.getParameter(
"password"));


u.setRole(

request.getParameter(
"role"));


userFacade.create(
u);



response.sendRedirect(
"login.jsp");


}

}