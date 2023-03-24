package controllers.admin;

import dao.AccountDAO;
import dao.ClassObjectDAO;
import dto.Account;
import dto.ClassObject;
import helpers.Util;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.UUID;

@WebServlet(name = "LockAccountServlet", urlPatterns = {"/admin/lock"})
public class LockAccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //get param
            String email = request.getParameter("email");

            //connect db
            AccountDAO accountDAO = new AccountDAO();
            Account account = accountDAO.getAccountByEmail(email);

            boolean lock = account.isLocked();
            String msgLock = lock ? "Unlock account" : "Lock account";

            request.setAttribute("headerLock", msgLock);
            request.setAttribute("email", email);

            request.getRequestDispatcher("lock.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //get param
            String email = request.getParameter("email");
            String reason = request.getParameter("reason");

            //connect db
            AccountDAO accountDAO = new AccountDAO();
            ClassObjectDAO coDAO = new ClassObjectDAO();

            Account account = accountDAO.getAccountByEmail(email);
            UUID uuid = account.getAccountId();

            //set acc user
            boolean lock = account.isLocked();
            account.setLocked(!lock);

            //set acc admin
            int role = account.getRole();

            //send mail
            String to = account.getEmail();
            String title = "LE.ON " + (lock ? "Lock account!" : "Unlock account!");
            String content = "Your account at \"LE.ON - Learning Online\" has been "
                    + (lock ? "locked!" : "unlocked!") + "\n"
                    + "\nReason: " + reason;
            Util.sendEmail(email, title, content);

            //lock acc user
            int checkLock = 0;
            checkLock = accountDAO.editAccount(account);

            //set message
            String msgLock = lock ? "Unlock account" : "Lock account";

            request.setAttribute("headerLock", msgLock);

            int checkHidden = 0;
            if (checkLock != 0) {
                if (role == 1) {
                    ArrayList<ClassObject> clazz = new ArrayList<>();
                    clazz = coDAO.getClassByAccId(uuid);
                    for (ClassObject classObject : clazz) {
                        classObject.setHidden(!lock);
                        checkHidden = coDAO.updateClass(classObject);
                    }
//                response.sendRedirect(request.getContextPath() + "/admin/teacher-account-list");
                } else if (role == 2) {
//                response.sendRedirect(request.getContextPath() + "/admin/student-account-list");
                }

                //set attribute status & msg
                request.setAttribute("status", true);
                request.setAttribute("msg", msgLock + " successfully!");
            } else if (checkLock == 0) {
                //set status & msg
                request.setAttribute("status", false);
                request.setAttribute("msg", msgLock + " fail!");
            }

            //set attribute email & reason
            request.setAttribute("email", email);
            request.setAttribute("reason", reason);
            request.getRequestDispatcher("lock.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }
}
