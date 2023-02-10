package controllers;

import dao.AccountDAO;
import dao.ClassObjectDAO;
import dto.Account;
import dto.ClassObject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
            req.setAttribute("classObject", classObject);
            if (account.getRole() == 1) {
                req.setAttribute("teacher", account);
            } else {
                req.setAttribute("teacher", new AccountDAO().getAccountById(classObject.getAccountId()));
            }
            req.getRequestDispatcher("/newfeed.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

}
