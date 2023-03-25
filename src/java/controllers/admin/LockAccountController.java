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

            //set msg lock
            boolean lock = account.isLocked();
            String msgLock = lock ? "Unlock account" : "Lock account";

            //set attribute
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

            //set attribute email & reason
            request.setAttribute("email", email);
            request.setAttribute("reason", reason);

            //set msg error: reason
            String msgReason = "";
            if (reason.equals("")) {
                msgReason = "Reason is required.";
                request.setAttribute("msgReason", msgReason);
            }

            //connect db
            AccountDAO accountDAO = new AccountDAO();
            Account account = accountDAO.getAccountByEmail(email);

            //set msg lock
            boolean lock = account.isLocked();
            String msgLock = lock ? "Unlock account" : "Lock account";

            //set attribute
            request.setAttribute("headerLock", msgLock);

            //check not null: reason
            if (!msgReason.equals("")) {
                request.getRequestDispatcher("lock.jsp").forward(request, response);
            } else {
                //connect db
                ClassObjectDAO coDAO = new ClassObjectDAO();
                UUID uuid = account.getAccountId();

                //lock acc user
                account.setLocked(!lock);
                int checkLock = 0;
                checkLock = accountDAO.editAccount(account);

                //set acc admin
                int role = account.getRole();

                //send mail
                String to = account.getEmail();
                String title = "LE.ON " + (lock ? "Lock account!" : "Unlock account!");
                String content = "Your account at \"LE.ON - Learning Online\" has been "
                        + (lock ? "locked!" : "unlocked!") + "\n"
                        + "\nReason: " + reason;
                Util.sendEmail(email, title, content);

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

                request.getRequestDispatcher("lock.jsp").forward(request, response);
            }
        } catch (Exception e) {
        }
    }
}
