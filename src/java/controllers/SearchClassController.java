package controllers;

import com.google.gson.Gson;
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
            Account acc = (Account) req.getAttribute("account");
            if (acc.getRole() == 1) {
                String keyword = req.getParameter("keyword");
                boolean isApproved = "true".equalsIgnoreCase(req.getParameter("isApproved"));
                ArrayList<ClassObject> classOT = new ClassObjectDAO().getListClassTByNameID(keyword, acc.getAccountId(), !isApproved);
                Gson gson = new Gson();
                resp.setContentType("application/json");
                resp.getWriter().print(gson.toJson(classOT));
            } else if (acc.getRole() == 2) {
                req.setAttribute("hglO", false);
                req.setAttribute("hglV", true);
                String keyword = req.getParameter("keyword");
                boolean isApproved = "true".equalsIgnoreCase(req.getParameter("isApproved"));
                ArrayList<ClassObject> classOS = new ClassObjectDAO().getListClassAccepted(keyword, acc.getAccountId(), isApproved);
                Gson gson = new Gson();
                resp.setContentType("application/json");
                resp.getWriter().print(gson.toJson(classOS));
            }

        } catch (Exception ex) {
            Logger.getLogger(ClassController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
//        try {
//            //get parameter from jsp file
//            String searchName = req.getParameter("searchName");
//            req.setAttribute("searchName", searchName);
//            // get data from Cookie
//            String email = "", pass = "";
//            Cookie[] cookies = req.getCookies();
//            for (Cookie c : cookies) {
//                if (c.getName().equals("cookEmail")) {
//                    email = c.getValue();
//                }
//                if (c.getName().equals("cookPass")) {
//                    pass = c.getValue();
//                }
//            }
//            // check valid url
//            if (email.equals("") || pass.equals("")) {
//                resp.sendRedirect(req.getContextPath() + "/");
//            }
//
//            // get data from database by query statement
//            Account a = new AccountDAO().getAccountByEmail(email);
//            ArrayList<ClassObject> classOT = new ClassObjectDAO().getListClassTByNameID(searchName, a.getAccountId());
//            ArrayList<ClassObject> classOS = new ClassObjectDAO().getListClassSByNameID(searchName, a.getAccountId());
//
//            if (a.getRole() == 1) {
//                // check if don't have data from database
//                if (classOT.isEmpty() || searchName.trim().equals("")) {
//                    req.setAttribute("verified", false);
//                    req.getRequestDispatcher("classT.jsp").forward(req, resp);
//                }
//                req.setAttribute("verified", true);
//                req.setAttribute("classObjList", classOT);
//                req.getRequestDispatcher("classT.jsp").forward(req, resp);
//            } else if (a.getRole() == 2) {
//                // check if don't have data from database
//                if (classOS.isEmpty() || searchName.trim().equals("")) {
//                    req.setAttribute("hglO", false);
//                    req.setAttribute("hglV", true);
//                    req.setAttribute("verified", false);
//                    req.getRequestDispatcher("classS.jsp").forward(req, resp);
//                }
//                req.setAttribute("co", classOS);
//                req.setAttribute("hglO", false);
//                req.setAttribute("hglV", true);
//                req.setAttribute("verified", true);
//                req.getRequestDispatcher("classS.jsp").forward(req, resp);
//            }
//        } catch (Exception ex) {
//            Logger.getLogger(ClassController.class.getName()).log(Level.SEVERE, null, ex);
//        }

    }
}
