/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

import dao.AccountDAO;
import dto.Account;
import helpers.Util;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.UUID;

/**
 *
 * @author Asus
 */
@WebServlet(name = "LockAccountServlet", urlPatterns = {"/admin/lock"})
public class LockAccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String id = request.getParameter("id");

            AccountDAO accountDAO = new AccountDAO();
            Account account = accountDAO.getAccountById(UUID.fromString(id));

            boolean lock = account.isLocked();
            account.setLocked(!lock);

            int role = account.getRole();
            int check = accountDAO.editAccount(account);

            String to = account.getEmail();
            String title = "LE.ON " + (lock ? "Lock account!" : "Unlock account!");

            String content = "Your account at \"LE.ON - Learning Online\" has been " + (lock ? "locked!" : "unlocked!");
            Util.sendEmail(to, title, content);

            if (role == 1) {
                response.sendRedirect(request.getContextPath() + "/admin/teacher-account-list");
            } else if (role == 2) {
                response.sendRedirect(request.getContextPath() + "/admin/student-account-list");
            }

        } catch (Exception e) {
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @
     * } catch (Exception e) { }param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
