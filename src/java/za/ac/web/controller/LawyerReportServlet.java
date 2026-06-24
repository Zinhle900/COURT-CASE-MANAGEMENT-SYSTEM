package za.ac.web.controller;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import za.ac.web.Case;
import za.ac.web.bl.CaseFacadeLocal;

public class LawyerReportServlet
extends HttpServlet{


@EJB
private CaseFacadeLocal caseFacade;



@Override
protected void doGet(

HttpServletRequest request,

HttpServletResponse response)

throws ServletException,
IOException{


try{


String lawyerParam=

request.getParameter(
"lawyerID");


List<Case> list=null;


/* only search if lawyer entered */

if(

lawyerParam!=null

&&

!lawyerParam.isEmpty()

){

int lawyerID=

Integer.parseInt(

lawyerParam);


list=

caseFacade.findByLawyer(

lawyerID);

}


request.setAttribute(

"report",

list);


request.getRequestDispatcher(

"lawyerReport.jsp")

.forward(

request,

response);


}catch(Exception e){

e.printStackTrace();

}

}

}