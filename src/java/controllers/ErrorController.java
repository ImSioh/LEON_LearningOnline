package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name="ErrorController", urlPatterns={"/error"})
public class ErrorController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("statusCode", req.getAttribute("jakarta.servlet.error.status_code"));
        req.setAttribute("exceptionType", req.getAttribute("jakarta.servlet.error.exception_type"));
        req.setAttribute("errorMessage", req.getAttribute("jakarta.servlet.error.message"));
        req.getRequestDispatcher("/error.jsp").forward(req, resp);
    }
    
}
