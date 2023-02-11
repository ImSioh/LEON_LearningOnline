/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.student;

import dao.AccountDAO;
import dto.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Anh
 */
@WebServlet(name = "Overview_Student", urlPatterns = {"/student/overview"})
public class OverviewController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            // get data form cookie
            String email = "", pass = "";
            Cookie[] cookies = req.getCookies();
            for (Cookie c : cookies) {
                if (c.getName().equals("cookEmail")) {
                    email = c.getValue();
                }
                if (c.getName().equals("cookPass")) {
                    pass = c.getValue();
                }
            }
            // check valid url
            if (email.equals("") || pass.equals("")) {
                resp.sendRedirect(req.getContextPath() + "/");
            }
            // take data from database
            AccountDAO accountDAO = new AccountDAO();
            Account accL = accountDAO.getAccountByEmail(email);
            if (accL.getRole() == 2) {
                req.setAttribute("accL", accL);
                req.setAttribute("hglO", true);
                req.setAttribute("hglV", false);
                req.getRequestDispatcher("homeS.jsp").forward(req, resp);
            } else {
                resp.sendRedirect(req.getContextPath() + "/");
            }

        } catch (Exception ex) {
            Logger.getLogger(OverviewController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

    }

}
