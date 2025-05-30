/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package rateit.servlets;

import dbclasses.Customer_database;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import rateit.entities.Customer;
import rateit.entities.Message;
import rateit.helper.ConnectionProvider;

/**
 *
 * @author Dell
 */
public class Forgot extends HttpServlet {

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
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Forgot</title>");            
//            out.println("</head>");
//            out.println("<body>");
            Customer_database c = new Customer_database(ConnectionProvider.getConnection());
            String email = request.getParameter("email");
            HttpSession session = request.getSession();
//           if(c.validateCustomerByEmail(email) == false){
//               
//               Message msg = new Message("done","success");
//               session.setAttribute("Message", msg);
////               response.sendRedirect("forgot_page.jsp");
//out.println("done");
//out.println(email);
//
//           }
//           else if(c.validateCustomerByEmail(email) == ture){
//
//               Message msg = new Message("email does not exists","error");
//               session.setAttribute("Message", msg);
////               response.sendRedirect("forgot_page.jsp");    
//out.println("not done");
//           }
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
            String password = null;
            Customer customer = c.getCustomerByEmail(email);
            if (customer != null) {

                out.println("1");

            } else {

                out.println("0");

            }
            password = request.getParameter("password");

            if (password != null) {

                if (c.UpdatePassword(email, password)) {

                    Message msg = new Message("password changed Successfully", "success");
                    session.setAttribute("Message", msg);
                    response.sendRedirect("LogIn&SignUp.jsp");

                }

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
