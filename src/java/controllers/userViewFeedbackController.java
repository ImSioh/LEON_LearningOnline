package controllers;

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
import java.util.logging.Level;
import java.util.logging.Logger;
@WebServlet(name="userViewFeedbackController", urlPatterns={"/teacher/viewfeedback","/student/viewfeedback" })
public class userViewFeedbackController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Account account = (Account) request.getAttribute("account");
        try {
            ArrayList<Feedback> listFeedback = new FeedbackDAO().getFeedbackByAccountId(account.getAccountId());
            request.setAttribute("listFeedback", listFeedback);         
        } catch (Exception ex) {
            Logger.getLogger(userViewFeedbackController.class.getName()).log(Level.SEVERE, null, ex);
        }     
        request.getRequestDispatcher("/view-feedbackByUser.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       
    }

}
