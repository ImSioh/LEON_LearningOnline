/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.AccountDAO;
import dao.ClassObjectDAO;
import dto.Account;
import dto.ClassObject;
import helpers.FormValidator;
import helpers.Util;
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
@WebServlet(name = "JoinClassController", urlPatterns = {"/join"})
public class JoinClassController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("verified", true);
        req.getRequestDispatcher("/student/Enter_ClassCode.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            String code = req.getParameter("classCode");
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
            if (email.equals("") || pass.equals("")) {
                resp.sendRedirect(req.getContextPath() + "/");
            }
            AccountDAO accountDAO = new AccountDAO();
            Account acc = accountDAO.getAccountByEmail(email);
            int count = 0;
            if (acc.getRole() == 2) {
                ArrayList<ClassObject> classObj = new ClassObjectDAO().getClassByAccId(acc.getAccountId());
                ArrayList<ClassObject> classObjAll = new ClassObjectDAO().getAllClass();
                for (ClassObject c : classObj) {
                    if (c.getCode().equalsIgnoreCase(code)) {
                        req.setAttribute("verified", false);
                        req.getRequestDispatcher("/student/Enter_ClassCode.jsp").forward(req, resp);
                    }
                }
                for (ClassObject CO : classObjAll) {
                    if (CO.getCode().equalsIgnoreCase(code)) {
                        req.setAttribute("verified", true);
                        count++;
                        req.getRequestDispatcher("/student/InsideClass_S.jsp").forward(req, resp);
                    }
                }
                if (count == 0) {
                    req.setAttribute("verified", false);
                    req.getRequestDispatcher("/student/Enter_ClassCode.jsp").forward(req, resp);
                }
            } else {
                resp.sendRedirect(req.getContextPath() + "/");
            }
        } catch (Exception ex) {
            Logger.getLogger(JoinClassController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
