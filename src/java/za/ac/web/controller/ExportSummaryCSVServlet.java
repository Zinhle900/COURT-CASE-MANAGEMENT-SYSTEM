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

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;


public class ExportSummaryCSVServlet
extends HttpServlet{


@EJB
CaseFacadeLocal caseFacade;



@Override
protected void doGet(

HttpServletRequest request,

HttpServletResponse response

)

throws IOException{


try{


List<Case> list=

caseFacade.findAll();



String format=

request.getParameter(
"format"
);



/* ========= PDF ========= */

if(

"pdf".equalsIgnoreCase(
format
)

){


response.setContentType(

"application/pdf"

);


response.setHeader(

"Content-Disposition",

"attachment; filename=SummaryReport.pdf"

);



Document doc=

new Document();



PdfWriter.getInstance(

doc,

response.getOutputStream()

);



doc.open();



doc.add(

new Paragraph(

"COURT CASE SUMMARY REPORT\n\n"

)

);



for(

Case c:list

){


doc.add(

new Paragraph(

"Case ID: "

+

c.getCaseID()

+

" | Title: "

+

c.getTitle()

+

" | Status: "

+

c.getStatus()

)

);

}



doc.close();

}



/* ========= CSV ========= */

else if(

"csv".equalsIgnoreCase(
format
)

){


response.setContentType(

"text/csv"

);


response.setHeader(

"Content-Disposition",

"attachment; filename=SummaryReport.csv"

);



PrintWriter out=

response.getWriter();



out.println(

"ID,Title,Status"

);



for(

Case c:list

){


out.println(

c.getCaseID()

+

","

+

c.getTitle()

+

","

+

c.getStatus()

);

}



out.close();

}



/* ========= TXT ========= */

else if(

"txt".equalsIgnoreCase(
format
)

){


response.setContentType(

"text/plain"

);


response.setHeader(

"Content-Disposition",

"attachment; filename=SummaryReport.txt"

);



PrintWriter out=

response.getWriter();



out.println(

"COURT CASE SUMMARY REPORT"

);


out.println(

"=========================="

);



for(

Case c:list

){


out.println(

"Case ID: "

+

c.getCaseID()

);


out.println(

"Title: "

+

c.getTitle()

);


out.println(

"Status: "

+

c.getStatus()

);


out.println(

"----------------------"

);

}



out.close();

}



/* ========= Default ========= */

else{


response.getWriter().println(

"Use ?format=pdf or csv or txt"

);

}


}catch(Exception e){

e.printStackTrace();

}


}

}