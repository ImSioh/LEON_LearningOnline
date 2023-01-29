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
import java.sql.Date;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;

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
                if (account.getVerificationCode() != null) {
                    request.setAttribute("accountId", account.getAccountId().toString());
                    request.setAttribute("email", account.getEmail());
                    request.getRequestDispatcher("/signup-verify.jsp").forward(request, response);
                    return;
                }              
                Cookie cookEmail = new Cookie("cookEmail", email);
                Cookie cookPass = new Cookie("cookPass", password);
                cookEmail.setMaxAge(30);
                cookPass.setMaxAge(30);
                response.addCookie(cookEmail);
                response.addCookie(cookPass);
                if (account.getRole() == 1) { //Role admin is 1
                response.sendRedirect("admin.jsp"); 
                } else if (account.getRole() == 2) { //Role student is 2
                    response.sendRedirect("student/HomeS.jsp");
                } else { //Role teacher is 3
                    response.sendRedirect("/HomeT.jsp");
                }          
            }

        }
    }

}
