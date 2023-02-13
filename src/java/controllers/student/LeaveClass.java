/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import dao.ClassObjectDAO;
import dao.EnrollmentDAO;
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
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "LeaveClass", urlPatterns = {"/student/class/leave"})
public class LeaveClass extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String classCode = req.getParameter("code");
        try {
            ClassObject classobj = new ClassObjectDAO().getClassByCode(classCode);
            int leaveClass = new EnrollmentDAO().leaveClass(classobj.getClassId());
            
            resp.sendRedirect(req.getContextPath() + "/student/class");
        } catch (Exception ex) {
            Logger.getLogger(LeaveClass.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

    }

}
