/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package rateit.servlets;

import dbclasses.Company_database;
import dbclasses.Company_services_database;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import rateit.entities.Company;
import rateit.helper.ConnectionProvider;

@MultipartConfig
public class Company_Profile_Update extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Company_update_profile</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            
//            out.println("Profile updated");
            
            HttpSession session = request.getSession(false);
            Company cmp = (Company)session.getAttribute("Company");
//            out.println( "name = " +request.getParameter("name"));
//            out.println( "email = " +request.getParameter("email"));
//            out.println( "category = " +request.getParameter("category"));
            
            String val = request.getParameter("services");
            String aa[]=val.split(",");
            
            Company_services_database csd = new Company_services_database(ConnectionProvider.getConnection());
            Company_database cd = new Company_database(ConnectionProvider.getConnection());
            byte flag = 0;
            
            if(cd.UpdateCompanyProfile(request.getParameter("name"), request.getParameter("email"), cmp.getCOMPANY_ID())){
            flag = 1;
            }
            for(String x : aa ){
              
            if(csd.addCategory(x, cmp.getCATEGORY(), cmp.getCOMPANY_ID())){
            out.println("1");
            } 
            else{
            out.println("0");
            }
            }
           
//            out.println(flag);
 
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
