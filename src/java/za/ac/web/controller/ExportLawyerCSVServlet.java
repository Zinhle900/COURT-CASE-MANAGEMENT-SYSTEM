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


public class ExportLawyerCSVServlet
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


String lawyerID=

request.getParameter(
"lawyerID"
);


String format=

request.getParameter(
"format"
);



List<Case> list;



if(

lawyerID!=null

&&

!lawyerID.isEmpty()

){


list=

caseFacade.findByLawyer(

Integer.parseInt(
lawyerID
)

);

}
else{


list=

caseFacade.findAll();

}



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

"attachment; filename=LawyerReport.pdf"

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

"LAWYER REPORT\n\n"

)

);



for(

Case c:list

){


doc.add(

new Paragraph(

"ID: "

+

c.getCaseID()

+

" | Title: "

+

c.getTitle()

+

" | Lawyer: "

+

c.getLawyerID()

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

"attachment; filename=LawyerReport.csv"

);



PrintWriter out=

response.getWriter();



out.println(

"ID,Title,Lawyer"

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

c.getLawyerID()

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

"attachment; filename=LawyerReport.txt"

);



PrintWriter out=

response.getWriter();



out.println(

"LAWYER REPORT"

);


out.println(

"==================="

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

"Lawyer: "

+

c.getLawyerID()

);


out.println(

"----------------"

);

}



out.close();

}



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