package controllers;

import dao.AccountDAO;
import dao.ClassObjectDAO;
import dao.EnrollmentDAO;
import dto.Account;
import dto.ClassObject;
import dto.Enrollment;
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

@WebServlet(name = "ClassController", urlPatterns = {"/student/class", "/teacher/class"})
public class ClassController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
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
            Account a = new AccountDAO().getAccountByEmail(email);
            
            ArrayList<ClassObject> CO = new ClassObjectDAO().getClassNameCodeByAccId(a.getAccountId());
            
            ArrayList<ClassObject> classObj = new ClassObjectDAO().getClassByAccId(a.getAccountId());
            if (a.getRole() == 1) {
                req.setAttribute("verified", true);
                req.setAttribute("classObjList", classObj);
                req.getRequestDispatcher("classT.jsp").forward(req, resp);
            } else if (a.getRole() == 2) {
                req.setAttribute("hglO", false);
                req.setAttribute("hglV", true);
                req.setAttribute("co", CO);
                req.setAttribute("verified", true);
                req.getRequestDispatcher("classS.jsp").forward(req, resp);
            }
        } catch (Exception ex) {
            Logger.getLogger(ClassController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

    }

}
