/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlet;

import com.tech.blog.dao.userdao;
import com.tech.blog.entities.message;
import com.tech.blog.entities.user;
import com.tech.blog.helper.Helper;
import com.tech.blog.helper.connectionProvider;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author anuj
 */
@WebServlet(name = "EditServlet", urlPatterns = {"/EditServlet"})
@MultipartConfig
public class EditServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            //            fetch all data
            
            String userEmail = request.getParameter("user_email");
            String userContact = request.getParameter("user_contact");
            String userPassword = request.getParameter("user_password");
           String userGender = request.getParameter("user_gender");
            Part part = request.getPart("image");

            String imageName = part.getSubmittedFileName();
            
             //get the user from the session...
            HttpSession s = request.getSession();
            user user = (user)s.getAttribute("currentUser");
            user.setEmail(userEmail);
            user.setContact(userContact);
            user.setPassword(userPassword);
            user.setGender(userGender);
            String oldFile = user.getProfile();

            user.setProfile(imageName);
            
           // update database
           
           userdao userDao = new userdao(connectionProvider.getConnection());
           
           boolean ans = userDao.updateUser(user);
           if(ans)
           {
               
               String path  = request.getRealPath("/")+"pics"+File.separator+user.getProfile();
               
               // delete old file
               String pathOldFile  = request.getRealPath("/")+"pics"+File.separator+ oldFile;
               Helper.deleteFile(pathOldFile);

               
               if(Helper.saveFile(part.getInputStream(), path))
               {
                         out.println("Profile updated..");
                   message msg = new message("Profile Upadated..", "success", "alert-success");
                    s.setAttribute("msg", msg); 
                    
                      

               }else{
                   out.println("file not updated...");
                   message msg = new message("Something went wrong..", "error", "alert-danger");
                    s.setAttribute("msg", msg); 
               }
               
               
               
           }else
           {
               out.println("not updated..");
//               message msg = new message("Something went wrong..", "error", "alert-danger");
//                    s.setAttribute("msg", msg); 
           }
                   
                response.sendRedirect("profile.jsp");
                
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
