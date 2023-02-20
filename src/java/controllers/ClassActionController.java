package controllers;

import dao.ClassObjectDAO;
import dao.EnrollmentDAO;
import dto.ClassObject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "LeaveClass", urlPatterns = {"/teacher/class/accept-student", "/student/class/leave", "/teacher/class/remove-student", "/teacher/class/reject-student"})
public class ClassActionController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String classCode = req.getParameter("code");
        req.setAttribute("classCode", classCode);
        String AccountId = req.getParameter("accountId");
        if (req.getServletPath().contains("/teacher/class/accept-student")) {
            try {
                ClassObjectDAO co = new ClassObjectDAO();
                EnrollmentDAO ed = new EnrollmentDAO();
                ed.updateAccepted(1, UUID.fromString(AccountId), co.getClassByCode(classCode).getClassId());
                req.getRequestDispatcher("/teacher/class/member-request-list").forward(req, resp);
            } catch (Exception ex) {
                Logger.getLogger(ClassActionController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                ClassObject classobj = new ClassObjectDAO().getClassByCode(classCode);
                int leaveClass = new EnrollmentDAO().leaveClass(classobj.getClassId(), UUID.fromString(AccountId));
            } catch (Exception ex) {
                Logger.getLogger(ClassActionController.class.getName()).log(Level.SEVERE, null, ex);
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
    }

    

}
