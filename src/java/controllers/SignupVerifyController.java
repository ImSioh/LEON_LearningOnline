package controllers;

import dao.AccountDAO;
import dto.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "SignupVerifyController", urlPatterns = {"/signup-verify"})
public class SignupVerifyController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/signup-verify.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String accountId = req.getParameter("id");
            String code = req.getParameter("verify-code");
            String email = req.getParameter("email");
            System.out.println(accountId);
            System.out.println(code);
            AccountDAO accountDAO = new AccountDAO();
            Account account = accountDAO.getAccountById(accountId);
            System.out.println(account);
            System.out.println(code);
            if (account != null && account.getVerificationCode() != null && account.getVerificationCode().equalsIgnoreCase(code)) {
                System.out.println(account.getRole());
                accountDAO.setVerifyCodeNull(accountId);
                if (account.getRole() == 2) {
                    resp.sendRedirect(req.getContextPath() + "/overview");
                } else if (account.getRole() == 1) {
                    resp.sendRedirect(req.getContextPath() + "/class");
                }
                
            } else {
                req.setAttribute("accountId", accountId);
                req.setAttribute("email", email);
                req.setAttribute("message", "Wrong code please enter again!");
                req.getRequestDispatcher("/signup-verify.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
