package controllers;

import dao.AccountDAO;
import dto.Account;
import helpers.FormValidator;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.quartz.DateBuilder;
import org.quartz.TriggerKey;
import helpers.Util;
import schedule.ForgetSchedule;
import schedule.WebScheduler;

@WebServlet(name = "ForgotController", urlPatterns = {"/forgot/*"})
public class ForgotController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String path = req.getPathInfo();
            if (path == null || path.equals("/")) {
                req.getRequestDispatcher("/forgot-password.jsp").forward(req, resp);
                return;
            }
            if (!path.matches("^\\/[\\w-]+\\/?$")) return;
            
            String token = path.replaceAll("\\/", "");
            String email = checkValidToken(token);
            if (email == null) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Link has expired or not available");
                return;
            }
            Account account = new AccountDAO().getAccountByEmail(email);
            if (account == null) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Account is not exist");
                return;
            }
            req.setAttribute("email", email);
            req.setAttribute("token", token);
            req.setAttribute("profilePicture", account.getProfilePicture());
            req.getRequestDispatcher("/reset-password.jsp").forward(req, resp);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            AccountDAO accountDAO = new AccountDAO();
            FormValidator formValidator = new FormValidator(req);
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
                            return accountDAO.getAccountByEmail((String) a) != null;
                        } catch (Exception e) {
                        }
                        return false;
                    },
                    "Account with this email is not existed"
            );
            
            if (req.getParameter("token") == null) {
                forgotPasswordHandler(req, resp, formValidator);
            } else {
                changePasswordHandler(req, resp, formValidator);
            }
        } catch (Exception e) {
        }
    }
    
    private void forgotPasswordHandler(HttpServletRequest req, HttpServletResponse resp, FormValidator formValidator) throws ServletException, IOException {
        boolean validEmail = formValidator.isValid();
        if (validEmail) {
            String email = (String) formValidator.get("email");
            TriggerKey triggerKey = ForgetSchedule.subscribeJob(DateBuilder.futureDate(5, DateBuilder.IntervalUnit.MINUTE), email);
            String url = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath() + "/forgot/" + triggerKey.getName();
            String emailContent = "<div style='background-color: #f2f2f2;width: 100%;'><div style='max-width: 400px; font-family: Arial,sans-serif!important; color: #6c6c6c!important; line-height: 22px; font-size: 16px; word-break: break-all; padding: 10px;'><div style='height: 40px;margin: 16px 0;'><img style='height: 100%;' src='https://cdn.discordapp.com/attachments/1063996423164657744/1064009854487904336/logo.png'></div><p>Hi There!<br>Looks like you requested an LE.ON account recovery for this email address.</p><p>Click this button to change your password:<br><a style='background-color: #4d59fc; color: white; font-size: 16px; height: 25px; line-height: 25px; padding: 10px 16px; display: inline-block; text-align: center; font-weight: bold; text-decoration: none;' href='" + url + "'>Change password</a><br><span style='color: red;'>This link valid in 5 minutes</span></p><p style='font-size: 12px;line-height: 16px;'>If that doesn't work, click this link to change your password:<br><a href='" + url + "' target='_blank'>" + url + "</a></p><p>Thanks for using LE.ON</p></div></div>";
            Util.sendEmail(email, "Forgot your LE.ON password?", emailContent);
            req.setAttribute("msg", "An email was sent to " + email + ", please check it.");
            req.setAttribute("email", email);
        }
        req.getRequestDispatcher("/forgot-password.jsp").forward(req, resp);
    }
    
    private void changePasswordHandler(HttpServletRequest req, HttpServletResponse resp, FormValidator formValidator) throws Exception {
        formValidator.setCheckParam("token", true, String.class);
        formValidator.setCheckParam("new-password", true, String.class);
        formValidator.setCheckParam(
                "confirm-password",
                true,
                String.class,
                a -> ((String) a).equals(formValidator.get("new-password")),
                "Password and Confirm password does not match"
        );
        boolean validForm = formValidator.isValid();
        
        String token = (String) formValidator.getRaw("token");
        String password = (String) formValidator.getRaw("new-password");
        String email = checkValidToken(token);
        if (validForm) {
            if (email == null) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Link has expired or not available");
                return;
            }
            new AccountDAO().setPassword(Util.hashingSHA256(password), email);
            TriggerKey triggerKey = new TriggerKey(token);
            ForgetSchedule.validTriggers.remove(triggerKey);
            WebScheduler.getScheduler().unscheduleJob(triggerKey);
            resp.sendRedirect(req.getContextPath() + "/signin");
        } else {
            req.setAttribute("token", token);
            req.setAttribute("email", email);
            req.getRequestDispatcher("/reset-password.jsp").forward(req, resp);
        }
    }
    
    private String checkValidToken(String token) {
        TriggerKey triggerKey = new TriggerKey(token);
        return ForgetSchedule.validTriggers.get(triggerKey);
    }

}
