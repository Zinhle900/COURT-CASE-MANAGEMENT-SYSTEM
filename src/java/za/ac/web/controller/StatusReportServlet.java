package za.ac.web.controller;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import za.ac.web.Case;
import za.ac.web.bl.CaseFacadeLocal;


public class StatusReportServlet
extends HttpServlet {

    @EJB
    private CaseFacadeLocal caseFacade;


    @Override
    protected void doGet(

            HttpServletRequest request,

            HttpServletResponse response)

            throws ServletException,
            IOException {


        String status =

                request.getParameter(
                        "status");


        if(status == null){

            status =
                    "Filed";

        }


        List<Case> list =

                caseFacade.findByStatus(
                        status);


        request.setAttribute(

                "report",

                list);


        request.getRequestDispatcher(

                "statusReport.jsp")

                .forward(

                        request,

                        response);

    }

}