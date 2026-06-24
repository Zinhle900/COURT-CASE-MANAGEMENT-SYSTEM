package za.ac.web.controller;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import za.ac.web.Case;
import za.ac.web.bl.CaseFacadeLocal;

public class DeleteCaseServlet extends HttpServlet {

    @EJB
    private CaseFacadeLocal caseFacade;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

if (session == null || !"ADMIN".equals(session.getAttribute("userRole"))) {
    response.sendRedirect("login.jsp");
    return;
}

        Long id = Long.parseLong(request.getParameter("id"));
        Case c = caseFacade.find(id);

        caseFacade.remove(c);

        response.sendRedirect("CaseListServlet");
    }
}