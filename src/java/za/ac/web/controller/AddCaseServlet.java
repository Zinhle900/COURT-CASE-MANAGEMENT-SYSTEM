package za.ac.web.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import za.ac.web.Case;
import za.ac.web.bl.CaseFacadeLocal;
public class AddCaseServlet extends HttpServlet {

    @EJB
    private CaseFacadeLocal caseFacade;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    HttpSession session = request.getSession(false);

    if (session == null || !"ADMIN".equals(session.getAttribute("userRole"))) {
        response.sendRedirect("login.jsp");
        return;
    }

        try {
            Case c = new Case();

            c.setCaseNumber(request.getParameter("caseNumber"));
            c.setTitle(request.getParameter("title"));
            c.setDescription(request.getParameter("description"));
            c.setStatus(request.getParameter("status"));

            Date filingDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("filingDate"));

            c.setFilingDate(filingDate);
            try{

            int lawyerID=

            Integer.parseInt(

            request.getParameter(
            "lawyerID"));

            c.setLawyerID(
            lawyerID);

            }catch(
            NumberFormatException e){

            request.setAttribute(
            "error",

            "Invalid lawyer ID");

            request.getRequestDispatcher(
            "addCase.jsp")

            .forward(
            request,response);

            return;

            }
            c.setCreatedAt(new Date());

            caseFacade.create(c);

        } catch (Exception e) {
            e.printStackTrace();
        }

      request.getRequestDispatcher("add_outcome.jsp").forward(request, response);
    }
}