/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.AccountDAO;
import dto.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leducphi
 */
@WebServlet(name = "EditProfileController", urlPatterns = {"/student/profile/edit", "/teacher/profile/edit"})
public class EditProfileController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProfileController at " + request.getContextPath() + "</h1>");
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
        String email = "";
        // Get an array of Cookies associated with this domain
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("cookEmail")) {
                    email = cookie.getValue();
                }
            }
        }
        try {
            Account account = new AccountDAO().getAccountByEmail(email);
            request.getSession().setAttribute("account", account);
        } catch (Exception ex) {
            Logger.getLogger(EditProfileController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("/edit-profile.jsp").forward(request, response);
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
        String txtName = request.getParameter("txtName");
        String txtPhone = request.getParameter("txtPhone");
        String txtBD = request.getParameter("txtBD");
        String txtAddress = request.getParameter("txtAddress");
        String txtUUID = request.getParameter("txtUUID");
        try {
            Account account = new AccountDAO().getAccountById(UUID.fromString(txtUUID));
            account.setName(txtName);
            account.setPhoneNumber(txtPhone);
            account.setBirthDate(Date.valueOf(txtBD));
            account.setAddress(txtAddress);
            int status = new AccountDAO().editAccount(account);

            request.setAttribute("status", status);
            response.sendRedirect(request.getContextPath() + "/profile");

        } catch (Exception ex) {
            Logger.getLogger(EditProfileController.class.getName()).log(Level.SEVERE, null, ex);
        }
//        request.getRequestDispatcher( request.getContextPath() + "profile").forward(request, response);
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
