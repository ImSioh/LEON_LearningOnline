package controllers;

import dao.AccountDAO;
import dao.ClassObjectDAO;
import dto.Account;
import dto.ClassObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "SearchClassController", urlPatterns = {"/student/search", "/teacher/search"})
public class SearchClassController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            // get data from Cookie
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
            // Check valid url
            if (email.equals("") || pass.equals("")) {
                resp.sendRedirect(req.getContextPath() + "/");
            }
            // get data from database
            Account a = new AccountDAO().getAccountByEmail(email);
            if (a.getRole() == 1) {
                resp.sendRedirect(req.getContextPath() + "/teacher/class");
            } else if (a.getRole() == 2) {
                req.setAttribute("hglO", false);
                req.setAttribute("hglV", true);
                resp.sendRedirect(req.getContextPath() + "/student/class");
            }
        } catch (Exception ex) {
            Logger.getLogger(ClassController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            //get parameter from jsp file
            String searchName = req.getParameter("searchName");
            
            // get data from Cookie
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

            // get data from database by query statement
            Account a = new AccountDAO().getAccountByEmail(email);
            ArrayList<ClassObject> classOT = new ClassObjectDAO().getListClassTByNameID(searchName, a.getAccountId());
            ArrayList<ClassObject> classOS = new ClassObjectDAO().getListClassSByNameID(searchName, a.getAccountId());

            if (a.getRole() == 1) {
                // check if don't have data from database
                if (classOT.isEmpty()) {
                    req.setAttribute("verified", false);
                    req.getRequestDispatcher("ClassT.jsp").forward(req, resp);
                }
                req.setAttribute("verified", true);
                req.setAttribute("classObjList", classOT);
                req.getRequestDispatcher("ClassT.jsp").forward(req, resp);
            } else if (a.getRole() == 2) {
                // check if don't have data from database
                if (classOS.isEmpty()) {
                    req.setAttribute("hglO", false);
                    req.setAttribute("hglV", true);
                    req.setAttribute("verified", false);
                    req.getRequestDispatcher("ClassS.jsp").forward(req, resp);
                }
                req.setAttribute("co", classOS);
                req.setAttribute("hglO", false);
                req.setAttribute("hglV", true);
                req.setAttribute("verified", true);
                req.getRequestDispatcher("ClassS.jsp").forward(req, resp);
            }
        } catch (Exception ex) {
            Logger.getLogger(ClassController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
