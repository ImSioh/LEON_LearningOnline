package controllers;

import dao.AccountDAO;
import dto.Account;
import helpers.FormValidator;
import helpers.Util;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.UUID;

@WebServlet(name = "SignupController", urlPatterns = {"/signup"})
public class SignupController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/signup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AccountDAO accountDAO = new AccountDAO();
        FormValidator formValidator = new FormValidator(req);
        formValidator.setCheckParam("name", true, String.class);
        formValidator.setCheckParam("dob", false, Date.class);
        formValidator.setCheckParam("address", false, String.class);
        formValidator.setCheckParam("role", true, Integer.class);
        formValidator.setCheckParam(
                "email",
                true,
                String.class,
                a -> ((String) a).matches("^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+"),
                "Email does not meet email structure"
        );
        formValidator.addCheckFunction(
                "email",
                a -> {
                    try {
                        return accountDAO.getAccountByEmail((String) a) == null;
                    } catch (Exception e) {
                    }
                    return false;
                },
                "Account with email %email% is existed"
        );
        formValidator.setCheckParam("password", true, String.class);
        formValidator.setCheckParam(
                "confirm-password",
                true,
                String.class,
                a -> ((String) a).equals(formValidator.get("password")),
                "Password and Confirm password does not match"
        );
        boolean validForm = formValidator.isValid();

        if (validForm) {
            try {
                String name = (String) formValidator.get("name");
                Date dob = (Date) formValidator.get("dob");
                String address = (String) formValidator.get("address");
                String email = (String) formValidator.get("email");
                String password = Util.hashingSHA256((String) formValidator.get("password"));
                int role = (int) formValidator.get("role");
                String verificationCode = Util.randomString(6).toUpperCase();
                Timestamp createTime = new Timestamp(System.currentTimeMillis());

                Account account = new Account(UUID.randomUUID(), name, dob, address, email, password, role, "", verificationCode, createTime, false);
                int result = accountDAO.insertAccount(account);
                req.setAttribute("accountId", account.getAccountId().toString());
                req.setAttribute("email", account.getEmail());
                Util.sendEmail(account.getEmail(), "LE.ON Email verification", "Your verification code at LE.ON - Learning Online is: " + account.getVerificationCode());
                req.getRequestDispatcher("/signup-verify.jsp").forward(req, resp);
            } catch (Exception e) {
                e.printStackTrace();
                validForm = false;
            }
        }
        if (!validForm) {
            for (String paramName : formValidator.getParamNameSet()) {
                req.setAttribute(paramName, formValidator.getRaw(paramName));
            }
            req.getRequestDispatcher("/signup.jsp").forward(req, resp);
        }
    }

}
