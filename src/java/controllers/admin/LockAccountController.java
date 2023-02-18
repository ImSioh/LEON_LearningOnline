package controllers.admin;

import dao.AccountDAO;
import dto.Account;
import helpers.Util;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.UUID;

@WebServlet(name = "LockAccountServlet", urlPatterns = {"/admin/lock"})
public class LockAccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //get param
            String id = request.getParameter("id");

            //connect db
            AccountDAO accountDAO = new AccountDAO();
            Account account = accountDAO.getAccountById(UUID.fromString(id));

            //set acc user
            boolean lock = account.isLocked();
            account.setLocked(!lock);

            //set acc admin
            int role = account.getRole();

            //send mail
            String to = account.getEmail();
            String title = "LE.ON " + (lock ? "Lock account!" : "Unlock account!");
            String content = "Your account at \"LE.ON - Learning Online\" has been " + (lock ? "locked!" : "unlocked!");
            Util.sendEmail(to, title, content);

            //lock acc user
            int check = accountDAO.editAccount(account);

            if (role == 1) {
                response.sendRedirect(request.getContextPath() + "/admin/teacher-account-list");
            } else if (role == 2) {
                response.sendRedirect(request.getContextPath() + "/admin/student-account-list");
            }
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
