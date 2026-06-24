package za.ac.web.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.web.Case;
import za.ac.web.bl.CaseFacadeLocal;


public class ExportReportCSVServlet
extends HttpServlet{


@EJB
CaseFacadeLocal caseFacade;


protected void doGet(

HttpServletRequest request,

HttpServletResponse response)

throws IOException{


List<Case> list=

caseFacade.findAll();



response.setContentType(
"text/csv");


response.setHeader(

"Content-Disposition",

"attachment; filename=report.csv");


PrintWriter out=

response.getWriter();



out.println(

"ID,"
+
"Title,"
+
"Status");



for(
Case c:list){

out.println(

c.getCaseID()

+","

+c.getTitle()

+","

+c.getStatus());

}


out.close();

}
}