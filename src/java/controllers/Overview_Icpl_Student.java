/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.AccountDAO;
import dto.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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
@WebServlet(name = "Overview_Student", urlPatterns = {"/overview"})
public class Overview_Icpl_Student extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String accountId = (String) req.getAttribute("accountId");
        ArrayList<Account> accL;
        try {
            accL = new AccountDAO().getListAccountById(accountId);
            req.setAttribute("accList", accL);
            req.getRequestDispatcher("student/HomeS.jsp").forward(req, resp);
        } catch (Exception ex) {
            Logger.getLogger(Overview_Icpl_Student.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

    }

}
