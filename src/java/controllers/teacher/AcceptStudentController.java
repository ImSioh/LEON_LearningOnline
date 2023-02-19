package controllers.teacher;

import dao.AccountDAO;
import dao.ClassObjectDAO;
import dao.EnrollmentDAO;
import dto.Account;
import dto.ClassObject;
import helpers.Util;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "AcceptStudentController", urlPatterns = {"/teacher/class/accept-studentt"})
public class AcceptStudentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String AccountId = request.getParameter("accountId");
            String classCode = request.getParameter("code");
            request.setAttribute("classCode", classCode);
            ClassObjectDAO co = new ClassObjectDAO();
            EnrollmentDAO ed = new EnrollmentDAO();
            ed.updateAccepted(1, UUID.fromString(AccountId), co.getClassByCode(classCode).getClassId());
        } catch (Exception ex) {
            Logger.getLogger(AcceptStudentController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("/teacher/class/member-request-list").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
