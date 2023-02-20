/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

import dao.AccountDAO;
import dao.FeedbackDAO;
import dto.Feedback;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ResponseFeedbackController", urlPatterns = {"/admin/response"})
public class ResponseFeedbackController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.getParameter("feedbackResponse");
            String feedbackId = request.getParameter("Id");
            request.setAttribute("feedbackId", feedbackId);
            Feedback feedback = new FeedbackDAO().getFeedbackByFeedbackId(UUID.fromString(feedbackId));
            request.setAttribute("emailResponse", new AccountDAO().getAccountById(feedback.getAccountId()).getEmail());
            request.setAttribute("titleFeedback", feedback.getTitle());
            request.setAttribute("contentFeedback", feedback.getContent());
            request.setAttribute("responseFeedback", feedback.getResponse());
            request.getRequestDispatcher("response.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ResponseFeedbackController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String responseFb = request.getParameter("feedbackResponse");
            String feedbackId = request.getParameter("Id");
            new FeedbackDAO().updateFeedback(responseFb, UUID.fromString(feedbackId));
            response.sendRedirect(request.getContextPath()+"/admin/feedback-list");
        } catch (Exception ex) {
            Logger.getLogger(ResponseFeedbackController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
