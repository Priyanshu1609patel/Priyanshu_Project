package rateit.servlets;

import dbclasses.Customer_database;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import rateit.entities.Customer;
import rateit.entities.Message;
import rateit.helper.ConnectionProvider;

@MultipartConfig
public class Update_user_profile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             Message msg =null;
            //fetching 
            String user_name = request.getParameter("name");
            Part image = request.getPart("profile_image");
            
            
            HttpSession session = request.getSession();
            //creating obj
            Customer customer = (Customer) session.getAttribute("Customer");
            Customer_database cd = new Customer_database(ConnectionProvider.getConnection());

            
            if(image != null){
            if (cd.UploadPhoto(image.getInputStream(), customer.getUSER_ID())) {
                out.println("11");
            } else {
                out.println("00");
            }
            }
            
            if (cd.UpdateProfile(user_name , customer.getUSER_ID())) {


    
               

                Customer c = cd.getCustomerByEmail(customer.getEMAIL(), customer.getPASSWORD());
//                msg = new Message("Profile Updated Successfully", "success");
//                session.setAttribute("Customer", c);
//                session.setAttribute("Message", msg);
                response.sendRedirect("index.jsp");
            } else {
//                msg = new Message("Sorry ! Could not Update Your profile", "Error");
//                session.setAttribute("Message", msg);
                response.sendRedirect("index.jsp");
            }

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
