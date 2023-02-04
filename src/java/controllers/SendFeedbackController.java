/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.FeedbackDAO;
import dto.Account;
import dto.Feedback;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "SendFeedbackController", urlPatterns = {"/SendFeedback"})
public class SendFeedbackController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/send-feedback.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account account = (Account) request.getAttribute("account");
        String msg = "";
        String feedbackTitle = request.getParameter("feedbackTitle");
        String feedbackContent = request.getParameter("feedbackContent");
        if (feedbackTitle == "" || feedbackContent == "") {
            msg = "Please enter Title or Content";
        } else {
            try {
                new FeedbackDAO().insertFeedback(new Feedback(UUID.randomUUID(), account.getAccountId(), feedbackTitle, feedbackContent, ""));
                msg = "Send feedback successfully";
            } catch (Exception ex) {
                Logger.getLogger(SendFeedbackController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        request.setAttribute("feedbackTitle", feedbackTitle);
        request.setAttribute("feedbackContent", feedbackContent);
        request.setAttribute("msg", msg);
        request.getRequestDispatcher("send-feedback.jsp").forward(request, response);
    }

}
