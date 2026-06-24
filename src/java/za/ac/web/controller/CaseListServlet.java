package za.ac.web.controller;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import za.ac.web.Case;
import za.ac.web.bl.CaseFacadeLocal;

public class CaseListServlet extends HttpServlet {

    @EJB
    private CaseFacadeLocal caseFacade;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

     HttpSession session = request.getSession(false);

    if (session == null) {
        response.sendRedirect("login.jsp");
        return;
    }
        List<Case> list = caseFacade.findAll();
        request.setAttribute("caseList", list);
        request.getRequestDispatcher("caseList.jsp").forward(request, response);
    }
}