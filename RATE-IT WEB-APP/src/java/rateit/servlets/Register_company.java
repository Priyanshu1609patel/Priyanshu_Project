/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package rateit.servlets;

import dbclasses.Company_database;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import rateit.entities.Company;
import rateit.entities.Message;
import rateit.helper.ConnectionProvider;

@MultipartConfig
public class Register_company extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register_company</title>");
            out.println("</head>");
            out.println("<body>");

            String cmp_name = request.getParameter("name");
            String cmp_mail = request.getParameter("email");
            long phone = Long.parseLong(request.getParameter("phone"));
            String websiteURL = request.getParameter("websiteURL");
            String password = request.getParameter("password");
            String category = request.getParameter("category");
            Part image = request.getPart("image");
            Company cmp = new Company(cmp_name, cmp_mail, password, cmp_mail, phone, category);
            Company_database cd = new Company_database(ConnectionProvider.getConnection());
            HttpSession session = request.getSession();
            if (cd.RegisterCompany(cmp)) {

                Message msg = new Message("Authentication in Progress ! Your LogIn will be Provided through Mail", "success");
                session.setAttribute("Message", msg);
                Company cmp1 = cd.getCompanyByName(cmp_name);
                if (image != null) {
                    if (cd.UploadImage(image.getInputStream(), cmp1.getCOMPANY_ID())) {
                        out.println("1");
                    }

                    response.sendRedirect("comp_login.jsp");
                } else {
                    out.println("0");
                }

                out.println("</body>");
                out.println("</html>");
            }
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
