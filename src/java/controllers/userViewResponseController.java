package controllers;

import dao.AccountDAO;
import dao.FeedbackDAO;
import dto.Account;
import dto.Feedback;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "userViewResponseController", urlPatterns = {"/student/view-response", "/teacher/view-response"})
public class userViewResponseController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Account account = (Account) request.getAttribute("account");
            request.getParameter("feedbackResponse");
            String feedbackId = request.getParameter("Id");
            request.setAttribute("feedbackId", feedbackId);
            Feedback feedback = new FeedbackDAO().getFeedbackByFeedbackId(UUID.fromString(feedbackId));
            request.setAttribute("titleFeedback", feedback.getTitle());
            request.setAttribute("contentFeedback", feedback.getContent());
            request.setAttribute("responseFeedback", feedback.getResponse());
            request.getRequestDispatcher("/view-ResponseByUser.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(userViewResponseController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
