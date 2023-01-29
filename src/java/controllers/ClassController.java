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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ClassController", urlPatterns = {"/class"})
public class ClassController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Account a;
//        ArrayList<ClassObject> classObj = new ClassObjectDAO().getListClassByAccId(id);
        
        try {
            a = new AccountDAO().getAccountByEmail("leducphi1952002@gmail.com");
            if (a.getRole() == 1) {
//                req.setAttribute("classObjList", classObj);
                req.getRequestDispatcher("teacher/ClassT.jsp").forward(req, resp);
            } else if (a.getRole() == 2) {
//                req.setAttribute("classObjList", classObj);
                req.getRequestDispatcher("student/ClassS.jsp").forward(req, resp);
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
