package za.ac.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Font;
import com.itextpdf.text.Element;

import com.itextpdf.text.pdf.PdfWriter;



public class ExportPDFServlet
extends HttpServlet{


@Override

protected void doGet(

HttpServletRequest req,

HttpServletResponse res

)

throws ServletException,
IOException{


try{


res.setContentType(

"application/pdf"

);


res.setHeader(

"Content-Disposition",

"attachment; filename=CaseReport.pdf"

);



Document doc=

new Document();



PdfWriter.getInstance(

doc,

res.getOutputStream()

);



doc.open();



Font title=

new Font(

Font.FontFamily.HELVETICA,

20,

Font.BOLD

);



Paragraph heading=

new Paragraph(

"COURT CASE MANAGEMENT REPORT",

title

);



heading.setAlignment(

Element.ALIGN_CENTER

);



doc.add(

heading

);



doc.add(

new Paragraph(

" "

)

);




doc.add(

new Paragraph(

"Generated Successfully"

)

);



doc.add(

new Paragraph(

"--------------------------------"

)

);



doc.add(

new Paragraph(

"Report Date: "

+

new java.util.Date()

)

);




doc.add(

new Paragraph(

"System: Court Case Management System"

)

);




doc.add(

new Paragraph(

"Here is an **About the System** section you can use for your documentation, report, or add to your dashboard:\n" +
"\n" +
"About the System\n" +
"\n" +
"The **Court Case Management System (CCMS)** is a web-based application developed using **Java EE technologies**, including **JSP, Servlets, Enterprise Java Beans (EJB), and JPA**. The system is designed to improve the management of court cases by digitizing case records, tracking case progress, generating reports, and providing secure access based on user roles.\n" +
"\n" +
"The system allows authorized users to create, update, view, and manage court cases efficiently. It reduces manual paperwork, improves accessibility to case information, and enhances decision-making through dashboard analytics and reporting tools.\n" +
"\n" +
"Main Features\n" +
"\n" +
"* **User Authentication & Authorization**\n" +
"\n" +
"  * Secure login system\n" +
"  * Role-based access control (Admin/User)\n" +
"\n" +
"* **Case Management**\n" +
"\n" +
"  * Add new cases\n" +
"  * Update case information\n" +
"  * View and manage case records\n" +
"  * Track case status (Filed, Scheduled, Closed)\n" +
"\n" +
"* **Dashboard Analytics**\n" +
"\n" +
"  * Real-time case statistics\n" +
"  * Pie charts and bar charts\n" +
"  * Case summaries\n" +
"\n" +
"* **Reporting System**\n" +
"\n" +
"  * Summary reports\n" +
"  * Status reports\n" +
"  * Date-based reports\n" +
"  * Lawyer reports\n" +
"\n" +
"* **Email Notifications**\n" +
"\n" +
"  * Send notifications regarding case updates\n" +
"  * User-entered recipient email support\n" +
"\n" +
"* **PDF Export**\n" +
"\n" +
"  * Generate downloadable case reports in PDF format\n" +
"\n" +
"* **Data Storage**\n" +
"\n" +
"  * Uses a relational database (Derby/MySQL)\n" +
"  * Persistent storage through JPA entities\n" +
"\n" +
"### System Architecture\n" +
"\n" +
"The application follows a **3-tier architecture**:\n" +
"\n" +
"```text\n" +
"Presentation Layer\n" +
"(Browser + JSP Dashboard)\n" +
"          ↓\n" +
"Business Layer\n" +
"(Servlets + EJB + Business Logic)\n" +
"          ↓\n" +
"Data Layer\n" +
"(Database: Derby/MySQL)\n" +
"```\n" +
"\n" +
"### Technologies Used\n" +
"\n" +
"* Java EE\n" +
"* JSP\n" +
"* Servlets\n" +
"* EJB (Enterprise Java Beans)\n" +
"* JPA\n" +
"* GlassFish Server\n" +
"* HTML/CSS\n" +
"* Bootstrap\n" +
"* Chart.js\n" +
"* JavaMail API\n" +
"* iText PDF\n" +
"* Derby/MySQL Database\n" +
"\n" +
"### Purpose of the System\n" +
"\n" +
"The primary purpose of the Court Case Management System is to:\n" +
"\n" +
"* Improve efficiency in handling court cases\n" +
"* Reduce manual record keeping\n" +
"* Enhance reporting and analytics\n" +
"* Enable secure access to case information\n" +
"* Support digital transformation in legal administration\n" +
"\n" +
"This system provides a centralized platform for managing legal case information and improving operational workflows within court environments."

)

);





doc.close();



}catch(Exception e){


e.printStackTrace();

}


}


}