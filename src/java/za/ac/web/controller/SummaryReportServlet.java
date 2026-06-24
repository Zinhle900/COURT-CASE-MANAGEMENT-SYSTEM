package za.ac.web.controller;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import za.ac.web.Case;
import za.ac.web.bl.CaseFacadeLocal;



public class SummaryReportServlet
extends HttpServlet{


@EJB
CaseFacadeLocal caseFacade;


protected void doGet(

HttpServletRequest request,

HttpServletResponse response)

throws ServletException,
IOException{


List<Case> list=

caseFacade.findAll();


int total=0;
int verified=0;

int filed=0;

int closed=0;

int scheduled=0;


for(
Case c:list){

total++;
if(
"Verified".equals(
c.getStatus()))

verified++;

if(
"Filed".equals(
c.getStatus()))

filed++;


if(
"Closed".equals(
c.getStatus()))

closed++;


if(
"Scheduled".equals(
c.getStatus()))

scheduled++;

}


request.setAttribute(
"total",
total);
request.setAttribute(
"verified",
verified);

request.setAttribute(
"filed",
filed);

request.setAttribute(
"closed",
closed);

request.setAttribute(
"scheduled",
scheduled);


request.getRequestDispatcher(

"summaryReport.jsp")

.forward(

request,
response);

}
}