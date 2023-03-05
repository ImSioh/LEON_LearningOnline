package controllers;

import com.google.gson.Gson;
import dao.AnswerDAO;
import dao.QuestionDAO;
import dao.StudentAnswerDAO;
import dao.TestDAO;
import dto.Question;
import dto.StudentAnswer;
import dto.Test;
import helpers.Util;
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
import org.apache.commons.text.StringEscapeUtils;

@WebServlet(name = "ViewTestDetailController", urlPatterns = {"/teacher/exercise/view-detail-test", "/student/exercise/view-detail-test"})
public class ViewTestDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String StudentId = request.getParameter("Sid");
            String Testid = request.getParameter("Tid");
            Test test = new TestDAO().getTestWithAllData(UUID.fromString(Testid));
            Gson gson = new Gson();
            String json = gson.toJson(test);
            json = StringEscapeUtils.escapeEcmaScript(json);
            ArrayList<UUID> studentAnswers = new StudentAnswerDAO().getStudentAnswerByQuestionID(UUID.fromString(Testid), UUID.fromString(StudentId));
            if (test.getResourceId() != null) {
                request.setAttribute("ResourceId", "has-paper");
            } else {
                request.setAttribute("ResourceId", "");
            }
            request.setAttribute("Util", new Util());
            request.setAttribute("json", json);
            request.setAttribute("test", test);
            request.setAttribute("Sid", StudentId);
            request.setAttribute("studentAnswers", studentAnswers);
        } catch (Exception ex) {
            Logger.getLogger(ViewTestDetailController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("/view-test-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
