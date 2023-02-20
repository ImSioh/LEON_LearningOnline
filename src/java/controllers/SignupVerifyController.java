package controllers;

import dao.AccountDAO;
import dto.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.UUID;

@WebServlet(name = "SignupVerifyController", urlPatterns = {"/signup-verify"})
public class SignupVerifyController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String accountId = req.getParameter("id");
            String code = req.getParameter("verify-code");
            String email = req.getParameter("email");
            AccountDAO accountDAO = new AccountDAO();
            Account account = accountDAO.getAccountById(UUID.fromString(accountId));
            if (account == null) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Account is not exist");
                return;
            }
            req.setAttribute("verified", false);
            if (account.getVerificationCode() == null) {
                req.setAttribute("verified", true);
                req.getRequestDispatcher("/signup-verify.jsp").forward(req, resp);
                return;
            }
            if (account.getVerificationCode().equalsIgnoreCase(code)) {
                accountDAO.setVerifyCodeNull(UUID.fromString(accountId));
                resp.sendRedirect(req.getContextPath() + "/signin");

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
