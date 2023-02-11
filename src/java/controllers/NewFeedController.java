package controllers;

import dao.AccountDAO;
import dao.ClassObjectDAO;
import dao.NotificationDAO;
import dto.Account;
import dto.ClassObject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;

@WebServlet(name = "NewFeedController", urlPatterns = {"/teacher/class/newfeed", "/student/class/newfeed"})
public class NewFeedController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Account account = (Account) req.getAttribute("account");
            String classCode = req.getParameter("code");
            if (classCode == null) {
                resp.sendRedirect(req.getContextPath() + "/teacher/class");
                return;
            }
            if (classCode.isEmpty()) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Class with code " + classCode + " is not exist");
                return;
            }
            
            ClassObject classObject = new ClassObjectDAO().getClassByCode(classCode);
            if (classObject == null) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Class with code " + classCode + " is not exist");
                return;
            }
            
            req.setAttribute("notifications", new NotificationDAO().getNotificationsByClassId(classObject.getClassId()));
            req.setAttribute("classObject", classObject);
            req.setAttribute("formater", new SimpleDateFormat("hh:mm - E, MMM dd, yyyy"));
            if (account.getRole() == 1) {
                req.setAttribute("teacher", account);
            } else {
                req.setAttribute("teacher", new AccountDAO().getAccountById(classObject.getAccountId()));
            }
            req.getRequestDispatcher("/newfeed.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

}
