package controllers.teacher;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import dao.AnswerDAO;
import dao.ClassObjectDAO;
import dao.QuestionDAO;
import dao.TestDAO;
import dto.Account;
import dto.Answer;
import dto.ClassObject;
import dto.Question;
import dto.Test;
import helpers.TimestampDeserializer;
import helpers.TripleDeserializer;
import helpers.UUIDDeserializer;
import helpers.Util;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.lang.reflect.Type;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;
import java.util.stream.Collectors;
import org.apache.commons.lang3.tuple.Triple;
import org.apache.commons.text.StringEscapeUtils;

@WebServlet(name = "EditExerciseController", urlPatterns = {"/teacher/class/exercise/edit"})
public class EditExerciseController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Account account = (Account) req.getAttribute("account");
            ClassObject classObject = new ClassObjectDAO().getClassByCode(req.getParameter("code"));
            if (classObject == null || !account.getAccountId().equals(classObject.getAccountId())) {
                resp.sendRedirect(req.getContextPath() + "/teacher/class");
                return;
            }
            req.setAttribute("classObject", classObject);
            UUID testId = UUID.fromString(req.getParameter("testid"));
            Test test = new TestDAO().getTestWithAllData(testId);
            if (test.getStartAt().before(new Timestamp(System.currentTimeMillis()))) {
                resp.sendRedirect(req.getContextPath() + "/teacher/class/exercise?code=" + classObject.getCode());
                return;
            }
            Gson gson = new Gson();
            String json = StringEscapeUtils.escapeEcmaScript(gson.toJson(test));
            req.setAttribute("test", json);
            req.getRequestDispatcher("/teacher/edit-exercise.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String json = Util.getBodyString(req);
            Gson gson = new GsonBuilder()
                    .registerTypeAdapter(Timestamp.class, new TimestampDeserializer())
                    .registerTypeAdapter(UUID.class, new UUIDDeserializer())
                    .registerTypeAdapter(Triple.class, new TripleDeserializer())
                    .create();
            Type type = new TypeToken<Triple<Test, HashMap<String, ArrayList<Question>>, HashMap<String, ArrayList<Answer>>>>() {
            }.getType();
            Triple<Test, HashMap<String, ArrayList<Question>>, HashMap<String, ArrayList<Answer>>> triple = gson.fromJson(json, type);
            Test test = triple.getLeft();
            HashMap<String, ArrayList<Question>> questionsState = triple.getMiddle();
            HashMap<String, ArrayList<Answer>> answersState = triple.getRight();

            ArrayList<Question> questions = new ArrayList<>();
            ArrayList<Answer> answers = new ArrayList<>();
            QuestionDAO questionDAO = new QuestionDAO();
            AnswerDAO answerDAO = new AnswerDAO();
            
            new TestDAO().updateTest(test);

//            hanlde delete
            answerDAO.deleteMultipleAnswers(answersState.get("deleted").stream().map(Answer::getAnswerId).collect(Collectors.toList()));
            questionDAO.deleteMultipleQuestions(questionsState.get("deleted").stream().map(Question::getQuestionId).collect(Collectors.toList()));
            
//            hanlde edit
            questions.addAll(questionsState.get("edit"));
            for (Question question : questions) {
                questionDAO.updateQuestion(question);
            }
            questions.clear();
            answers.addAll(answersState.get("edit"));
            for (Answer answer : answers) {
                answerDAO.updateAnswer(answer);
            }
            answers.clear();
            
//            hanlde create new
            questions.addAll(questionsState.get("new"));
            for (Question question : questions) {
                question.setQuestionId(UUID.randomUUID());
                question.setTestId(test.getTestId());
                for (Answer answer : question.answers) {
                    answer.setQuestionId(question.getQuestionId());
                    answers.add(answer);
                }
            }
            answers.addAll(answersState.get("new"));
            for (Answer answer : answers) {
                answer.setAnswerId(UUID.randomUUID());
            }
            questionDAO.insertMultipleQuestions(questions);
            answerDAO.insertMultipleAnswers(answers);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

}
