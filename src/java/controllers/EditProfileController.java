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
import java.sql.Date;
import java.sql.Timestamp;
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
        try {
            //        String txtName = request.getParameter("txtName");
//        String txtPhone = request.getParameter("txtPhone");
//        String txtBD = request.getParameter("txtBD");
//        String txtAddress = request.getParameter("txtAddress");
            String txtUUID = request.getParameter("txtUUID");
            AccountDAO accountDAO = new AccountDAO();
            FormValidator formValidator = new FormValidator(request);
            Account account = new AccountDAO().getAccountById(UUID.fromString(txtUUID));

            formValidator.setCheckParam(
                    "txtName",
                    true,
                    String.class,
                    a -> a.length() <= (100),
                    "Please enter no more than 100 characters"
            );

            formValidator.setCheckParam(
                    "txtBD",
                    false,
                    Date.class,
                    (a, b) -> ((Date) b).before(new Date(System.currentTimeMillis())),
                    "Birth of date must before present"
            );

            formValidator.setCheckParam("txtAddress", false, String.class);

            formValidator.setCheckParam(
                    "txtPhone",
                    false,
                    String.class,
                    a -> a.matches("^(84|0[3|5|7|8|9])+([0-9]{8})$"),
                    "Invalid phone number"
            );
            formValidator.addCheckFunction(
                    "txtPhone",
                    (a, b) -> {
                        try {
                            if (a.equals(account.getPhoneNumber())) {
                                return true;
                            } else {
                                return accountDAO.getAccountByPhone(a) == null;
                            }
                        } catch (Exception e) {
                        }
                        return false;
                    },
                    "Account with phone number %txtPhone% is existed"
            );

            boolean validForm = formValidator.isValid();

            if (validForm) {

                String name = (String) formValidator.get("txtName");
                Date dob = (Date) formValidator.get("txtBD");
                String address = (String) formValidator.get("txtAddress");
                String phoneNumber = (String) formValidator.get("txtPhone");

                account.setName(name);
                account.setPhoneNumber(phoneNumber);
                account.setBirthDate(dob);
                account.setAddress(address);

                int status = new AccountDAO().editAccount(account);

                if (status > 0) {
                    request.setAttribute("status", status);
                    if (account.getRole() == 1) {
                        response.sendRedirect(request.getContextPath() + "/teacher/profile");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/student/profile");
                    }

                } else {
                    validForm = false;
                }

            }
            if (!validForm) {
                request.getRequestDispatcher("/edit-profile.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(EditProfileController.class.getName()).log(Level.SEVERE, null, ex);
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
