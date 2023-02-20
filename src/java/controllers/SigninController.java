package controllers;

import dao.AccountDAO;
import dto.Account;
import helpers.Util;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "SigninController", urlPatterns = {"/signin"})
public class SigninController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("./signin.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String msg = "";
        request.setAttribute("email", email);
        request.setAttribute("password", password);
        if (email == "" || password == "") {
            msg = "Please enter full information";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("signin.jsp").forward(request, response);
        } else {
            Account account = null;
            try {
                account = new AccountDAO().getAccount(email, Util.hashingSHA256(password));
            } catch (Exception ex) {
                System.out.println("Exception " + ex);
            }
            if (account == null) {
                msg = "Login information is incorrect";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("signin.jsp").forward(request, response);
            } else {
                if (account.isLocked()) {
                    msg = "Account have been locked by admin.Contact admin to unlock";
                    request.setAttribute("msg", msg);
                    request.getRequestDispatcher("signin.jsp").forward(request, response);
                    return ;
                }
                if (account.getVerificationCode() != null) {
                    request.setAttribute("accountId", account.getAccountId().toString());
                    request.setAttribute("email", account.getEmail());
                    request.getRequestDispatcher("/signup-verify.jsp").forward(request, response);
                    return;
                }
                Cookie cookEmail = new Cookie("cookEmail", account.getEmail());
                Cookie cookPass = new Cookie("cookPass", account.getPassword());
                cookEmail.setMaxAge(86400);
                cookPass.setMaxAge(86400);
                response.addCookie(cookEmail);
                response.addCookie(cookPass);

                //Role:
                //1 - Teacher
                //2- Student
                //3- Admin
                switch (account.getRole()) {
                    case 1:
                        response.sendRedirect(request.getContextPath() + "/teacher/class");
                        break;
                    case 2:
                        response.sendRedirect(request.getContextPath() + "/student/overview");
                        break;
                    case 3:
                        response.sendRedirect(request.getContextPath() + "/admin/feedback-list");
                        break;
                }
            }

        }
    }

}
