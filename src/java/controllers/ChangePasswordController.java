/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.AccountDAO;
import dto.Account;
import helpers.Util;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leducphi
 */
@WebServlet(name = "ChangePasswordController", urlPatterns = {"/student/profile/change-password", "/teacher/profile/change-password"})
public class ChangePasswordController extends HttpServlet {

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
            out.println("<title>Servlet ChangePasswordController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/change-password.jsp").forward(request, response);
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
        try {
            String txtUUID = request.getParameter("txtUUID");
            String txtOldPass = request.getParameter("txtOldPass");
            String txtNewPass = request.getParameter("txtNewPass");
            String txtReNewPass = request.getParameter("txtReNewPass");
            request.setAttribute("txtOldPass", txtOldPass);
            request.setAttribute("txtNewPass", txtNewPass);
            request.setAttribute("txtReNewPass", txtReNewPass);
            String msg = "";
            String hashOld = Util.hashingSHA256(txtOldPass);
            String hashNew = Util.hashingSHA256(txtReNewPass);
            System.out.println(Util.hashingSHA256(txtOldPass));
            Account acc = new AccountDAO().getAccountById(UUID.fromString(txtUUID));
            
            if ("".equals(txtOldPass) || "".equals(txtNewPass) || "".equals(txtReNewPass)) {
                msg = "You are missing some information";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("/change-password.jsp").forward(request, response);
            } else if (txtOldPass.length() < 8 || txtNewPass.length() < 8 || txtReNewPass.length() < 8) {
                msg = "Password need to contain at least 8 characters";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("/change-password.jsp").forward(request, response);
            } else if (!txtNewPass.equals(txtReNewPass)) {
                msg = "Confirm password doesn't match";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("/change-password.jsp").forward(request, response);
            } else if (!hashOld.equals(acc.getPassword())) {
                msg = "Your old password is not correct";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("/change-password.jsp").forward(request, response);
            } else {
                acc.setPassword(hashNew);
                int status = new AccountDAO().editAccount(acc);
                if (status == 1) {
                    if (acc.getRole() == 1) {
                        response.sendRedirect(request.getContextPath() + "/teacher/profile");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/student/profile");
                    }
                } else {
                    msg = "Something wrong please try again!";
                    request.setAttribute("msg", msg);
                    request.getRequestDispatcher("../change-password.jsp").forward(request, response);
                }
            }
            
            

        } catch (Exception ex) {
            Logger.getLogger(ChangePasswordController.class.getName()).log(Level.SEVERE, null, ex);
        }

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
