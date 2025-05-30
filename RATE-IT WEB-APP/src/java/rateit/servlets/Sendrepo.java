/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package rateit.servlets;

import dbclasses.Report_database;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import rateit.entities.Message;
import rateit.helper.ConnectionProvider;

/**
 *
 * @author Dell
 */
@MultipartConfig
public class Sendrepo extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            Message msg = null;
            HttpSession session = request.getSession();
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Sendrepo</title>");
            out.println("</head>");
            out.println("<body>");
            
            
            int cmp1_id = Integer.parseInt(request.getParameter("c1"));
            int cmp2_id = Integer.parseInt(request.getParameter("c2"));

            int poll_id = Integer.parseInt(request.getParameter("poll_id"));
            Part report1 = request.getPart("report1");
            Part report2 = request.getPart("report2");
            Report_database rd = new Report_database(ConnectionProvider.getConnection());
//out.println(""+cmp1_id+""+cmp2_id+""+poll_id);
            if (rd.UploadReport(report1.getInputStream(), cmp1_id, poll_id) && rd.UploadReport(report2.getInputStream(), cmp2_id, poll_id)) {
 msg = new Message("Report is sent", "success");

                session.setAttribute("message", msg);
                                        response.sendRedirect("submitted.jsp");

            
            }
//            if (rd.UploadReport(report2.getInputStream(), cmp2_id, poll_id)) {
//                msg = new Message("Report is sent", "success");
//
//                session.setAttribute("message", msg);
//                                        response.sendRedirect("submitted.jsp");
//
//            }

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
