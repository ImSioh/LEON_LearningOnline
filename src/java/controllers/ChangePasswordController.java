/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.AccountDAO;
import dto.Account;
import helpers.FormValidator;
import helpers.Util;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

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
        Account acc = (Account) request.getAttribute("account");
        FormValidator formValidator = new FormValidator(request);

        formValidator.setCheckParam("txtOldPass", true, String.class, a -> Util.hashingSHA256(a).equals(acc.getPassword()), "Password not corect!");
        formValidator.setCheckParam("txtNewPass", true, String.class);
        formValidator.setCheckParam("txtReNewPass", true, String.class, a -> !a.equals((String) formValidator.get("txtOldPass")) && a.equals((String) formValidator.get("txtNewPass")), "Confirm password do not match");

        boolean validForm = formValidator.isValid();

        if (validForm) {

            try {
                String txtReNewPass = (String) formValidator.get("txtReNewPass");

                acc.setPassword(Util.hashingSHA256(txtReNewPass));

                int status = new AccountDAO().editAccount(acc);
                Cookie cookPass = new Cookie("cookPass", acc.getPassword());
                cookPass.setPath(request.getContextPath());
                response.addCookie(cookPass);
                if (status > 0) {

                    request.setAttribute("status", status);
                    if (acc.getRole() == 1) {
                        response.sendRedirect(request.getContextPath() + "/teacher/profile");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/student/profile");
                    }
                } else {
                    validForm = false;
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        }
        if (!validForm) {
            request.getRequestDispatcher("/change-password.jsp").forward(request, response);
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
