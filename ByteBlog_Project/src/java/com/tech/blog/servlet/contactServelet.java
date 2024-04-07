
package com.tech.blog.servlet;

import com.tech.blog.entities.contact;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class contactServelet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Read the JSON data sent from the client
        String jsonData = request.getReader().lines()
                .reduce("", (accumulator, actual) -> accumulator + actual);
        
             out.println("Request Method: " + jsonData);
            
            String name = request.getParameter("Cname");
            String email = request.getParameter("Cemail");
                                    out.println(email); out.println(name);

            
            String contactNo = request.getParameter("Ccontact");
            String message = request.getParameter("Cmessage");
            
           
            
            
            contact cont = new contact(name, email, contactNo, message);
            
            try{
                
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","MRAK#7899@yk");
                
                  String query = "INSERT INTO contactForm (name,email,contact,message) VALUES (?, ?, ?, ?)";
                  
                  PreparedStatement ps = con.prepareStatement(query);
                    ps.setString(1, cont.getName());
                    ps.setString(2, cont.getEmail());
                    ps.setString(3, cont.getContact());
                    ps.setString(4, cont.getMessage());
                    ps.executeUpdate();
                    
                  
                    con.close();
                    
                    
                 //  out.println("<h1>Successfully submitted!!!</h1>");
                
            }catch(Exception e)
            {
                
                out.println("<h1>Error occur!!!</h1>" + e);
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
