/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

import dao.AccountDAO;
import dto.Account;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "LockAccountServlet", urlPatterns = {"/admin/student-list/lock", "/admin/teacher-list"})
public class LockAccountController extends HttpServlet {

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
            out.println("<title>Servlet LockAccountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LockAccountServlet at " + request.getContextPath() + "</h1>");
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
        try {
//            Account account = (Account) request.getAttribute("account");

            //get request param
            int role = Integer.parseInt(request.getParameter("role"));
            String id = request.getParameter("id");
            UUID uuid = UUID.fromString(id);
            String status = request.getParameter("status");
            boolean lock = false;
            if (status.equals("open")) {
                lock = false;
            } else {
                lock = true;
            }

            System.out.println("Information of param: ");
            System.out.println("role = " + role);
            System.out.println("id = " + id);
            System.out.println("status = " + status);
            System.out.println("lock = " + lock);

            //connect db
            AccountDAO accountDAO = new AccountDAO();
            Account account = accountDAO.getAccountById(UUID.fromString(id));
            int check = accountDAO.lockAccount(account, lock, uuid);

//            if (check > 0) {
            request.setAttribute("check", check);
            if (role == 1) {
//                    request.getRequestDispatcher("/admin/manageT.jsp").forward(request, response);
                response.sendRedirect(request.getContextPath() + "/admin/teacher-list");
            } else if (role == 2) {
//                    request.getRequestDispatcher("/admin/manageS.jsp").forward(request, response);
                response.sendRedirect(request.getContextPath() + "/admin/student-list");
            }
//            } else {
//                response.sendRedirect(request.getContextPath() + "/admin/student-list");
//            }
        } catch (Exception e) {
        }
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

        //lock acc
//            account.setLocked(lock);
//            if (role == 1) {
////                request.getRequestDispatcher("/admin/manageT.jsp").forward(request, response);
//                response.sendRedirect(request.getContextPath() + "/admin/teacher-list");
//            } else if (role == 2) {
////                request.getRequestDispatcher("/admin/manageS.jsp").forward(request, response);
//                response.sendRedirect(request.getContextPath() + "/admin/student-list");
//            }
//            int check = 0;
//            //student
//            if (request.getServletPath().contains("student-list")) {
//
//                check = accountDAO.lockAccount(account, status, id);
//                if (check > 0) {
//                    request.getRequestDispatcher("/admin/manageS.jsp").forward(request, response);
//                }
//            } //teacher
//            else if (request.getServletPath().contains("teacher-list")) {
//                Account account = accountDAO.getAccountById(UUID.fromString(id));
//
//                check = accountDAO.lockAccount(account, status, id);
//                if (check > 0) {
//                    request.getRequestDispatcher("/admin/manageS.jsp").forward(request, response);
//                }
//            }
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
