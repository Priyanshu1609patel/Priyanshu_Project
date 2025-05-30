/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package rateit.servlets;

import dbclasses.Company_database;
import dbclasses.Company_services_database;
import dbclasses.Poll_database;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import rateit.entities.Company_services;
import rateit.entities.Message;
import rateit.entities.Poll;
import rateit.helper.ConnectionProvider;

/**
 *
 * @author Dell
 */
public class AddPoll extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Message msg = null;
            HttpSession session = request.getSession();
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddPoll</title>");            
            out.println("</head>");
            out.println("<body>");
        Company_services_database csd = new Company_services_database(ConnectionProvider.getConnection());
          int Company1_id = Integer.parseInt(request.getParameter("company1"));            
          int Company2_id = Integer.parseInt(request.getParameter("company2")); 
          int poll_id = Integer.parseInt(request.getParameter("poll_id")); 
          Company_services cs = csd.getCategory(Company1_id);
          String category = cs.getCATEGORY();
          Company_database cd = new Company_database(ConnectionProvider.getConnection());
          Poll p = new Poll(poll_id, Company1_id, Company2_id, category);
          
          Poll_database pd = new Poll_database(ConnectionProvider.getConnection());
            if(pd.addPoll(p)){
                if(cd.updatePollStatus0(Company1_id))
                {
            msg = new Message("Poll Added Successfully", "success");

                session.setAttribute("message", msg);
                response.sendRedirect("submitted.jsp");}
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
