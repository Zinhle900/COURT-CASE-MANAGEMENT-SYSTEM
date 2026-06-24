package za.ac.web.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import za.ac.web.Case;
import za.ac.web.bl.CaseFacadeLocal;



public class DateReportServlet
extends HttpServlet {


    @EJB
    private CaseFacadeLocal caseFacade;


    @Override
    protected void doGet(

            HttpServletRequest request,

            HttpServletResponse response)

            throws ServletException,
            IOException {


        try{


            String startDate =

                    request.getParameter(
                            "start");


            String endDate =

                    request.getParameter(
                            "end");



            List<Case> list = null;


            if(startDate != null &&
               endDate != null &&
               !startDate.isEmpty() &&
               !endDate.isEmpty()){


                Date start =

                        new SimpleDateFormat(
                                "yyyy-MM-dd")

                        .parse(
                                startDate);



                Date end =

                        new SimpleDateFormat(
                                "yyyy-MM-dd")

                        .parse(
                                endDate);



                list =

                        caseFacade.findByDate(

                                start,

                                end);

            }


            request.setAttribute(

                    "report",

                    list);



            request.getRequestDispatcher(

                    "dateReport.jsp")

                    .forward(

                            request,

                            response);



        }catch(Exception e){

            e.printStackTrace();

        }

    }

}