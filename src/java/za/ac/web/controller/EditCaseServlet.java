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

public class EditCaseServlet extends HttpServlet {

    @EJB
    private CaseFacadeLocal caseFacade;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session=
        request.getSession(false);

        if(
        session==null ||

        !"ADMIN".equals(

        session.getAttribute(
        "userRole"))

        ){

        response.sendRedirect(
        "login.jsp");

        return;

        }
        Long id = Long.parseLong(request.getParameter("id"));
        Case c = caseFacade.find(id);

        request.setAttribute("case", c);
        request.getRequestDispatcher("editCase.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession(false);

    if (session == null || !"ADMIN".equals(session.getAttribute("userRole"))) {
        response.sendRedirect("login.jsp");
        return;
    }

        try {
            Long id = Long.parseLong(request.getParameter("caseID"));
            Case c = caseFacade.find(id);

            c.setCaseNumber(request.getParameter("caseNumber"));
            c.setTitle(request.getParameter("title"));
            c.setDescription(request.getParameter("description"));
            c.setStatus(request.getParameter("status"));

            Date filingDate = new SimpleDateFormat("yyyy-MM-dd")
                    .parse(request.getParameter("filingDate"));

            c.setFilingDate(filingDate);
            c.setLawyerID(Integer.parseInt(request.getParameter("lawyerID")));

            caseFacade.edit(c);

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("edit_outcome.jsp").forward(request, response);
    }
}