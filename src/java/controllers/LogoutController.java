package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LogoutController", urlPatterns = {"/logout"})
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie cookEmail = new Cookie("cookEmail", "");
        Cookie cookPass = new Cookie("cookPass", "");
        cookEmail.setMaxAge(0);
        cookPass.setMaxAge(0);
        response.addCookie(cookEmail);
        response.addCookie(cookPass);
        response.setHeader("Refresh", "1; " + request.getContextPath());
        response.sendRedirect(request.getContextPath());

    }

}
