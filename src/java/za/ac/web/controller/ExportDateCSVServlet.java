package za.ac.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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



public class ExportDateCSVServlet
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


String startDate=

request.getParameter(
"start"
);


String endDate=

request.getParameter(
"end"
);


String format=

request.getParameter(
"format"
);



List<Case> list;



if(

startDate!=null

&&

endDate!=null

&&

!startDate.isEmpty()

&&

!endDate.isEmpty()

){


Date start=

new SimpleDateFormat(
"yyyy-MM-dd"
)

.parse(
startDate
);



Date end=

new SimpleDateFormat(
"yyyy-MM-dd"
)

.parse(
endDate
);



list=

caseFacade.findByDate(

start,

end

);


}
else{


list=

caseFacade.findAll();

}



SimpleDateFormat df=

new SimpleDateFormat(

"yyyy-MM-dd"

);



/* ================= PDF ================= */

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

"attachment; filename=DateReport.pdf"

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

"COURT CASE DATE REPORT\n\n"

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

" | Status: "

+

c.getStatus()

+

" | Lawyer: "

+

c.getLawyerID()

+

" | Date: "

+

df.format(

c.getFilingDate()

)

)

);

}



doc.close();

}



/* ================= CSV ================= */

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

"attachment; filename=DateReport.csv"

);



PrintWriter out=

response.getWriter();



out.println(

"ID,Title,Status,Lawyer,Date"

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

+

","

+

c.getLawyerID()

+

","

+

df.format(

c.getFilingDate()

)

);

}



out.close();

}



/* ================= TXT ================= */

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

"attachment; filename=DateReport.txt"

);



PrintWriter out=

response.getWriter();



out.println(

"COURT CASE DATE REPORT"

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

"Lawyer: "

+

c.getLawyerID()

);


out.println(

"Date: "

+

df.format(

c.getFilingDate()

)

);


out.println(

"---------------------------"

);

}



out.close();

}



/* ===== Default ===== */

else{


response.getWriter().println(

"Use:\n"

+

"?format=pdf\n"

+

"?format=csv\n"

+

"?format=txt"

);

}



}catch(Exception e){


e.printStackTrace();


response.getWriter().println(

"Export Failed"

);


}


}

}