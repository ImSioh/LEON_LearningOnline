package controllers;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import controllers.student.*;
import dao.AccountDAO;
import dao.ClassObjectDAO;
import dao.EnrollmentDAO;
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
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "LeaveClass", urlPatterns = {"/student/class/leave", "/teacher/class/remove-student", "/teacher/class/reject-student"})
public class OutOfClassController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String classCode = req.getParameter("code");
        req.setAttribute("classCode", classCode);
        String AccountId = req.getParameter("accountId");
        try {
            ClassObject classobj = new ClassObjectDAO().getClassByCode(classCode);
            int leaveClass = new EnrollmentDAO().leaveClass(classobj.getClassId(), UUID.fromString(AccountId));
        } catch (Exception ex) {
            Logger.getLogger(OutOfClassController.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (req.getServletPath().contains("/student/class/leave")) {
            resp.sendRedirect(req.getContextPath() + "/student/class");
        }
        if (req.getServletPath().contains("/teacher/class/remove-student")) {
            req.getRequestDispatcher("/student/class/member-list").forward(req, resp);
        }
        if (req.getServletPath().contains("/teacher/class/reject-student")) {
            req.getRequestDispatcher("/teacher/class/member-request-list").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

    }

}
