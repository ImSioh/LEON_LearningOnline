package controllers;

import dao.AccountDAO;
import dao.ClassObjectDAO;
import dao.DoTestDAO;
import dao.TestDAO;
import dto.Account;
import dto.ClassObject;
import dto.Test;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.ArrayList;
import java.util.UUID;

@WebServlet(name = "ViewListExerciseController", urlPatterns = {"/teacher/class/exercise", "/student/class/exercise"})
public class ViewListExerciseController extends HttpServlet {

    //connect db
    ClassObjectDAO COD = new ClassObjectDAO();
    TestDAO TD = new TestDAO();
    DoTestDAO DTD = new DoTestDAO();
    AccountDAO AD = new AccountDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //get param
            Account account = (Account) request.getAttribute("account");
            String classCode = request.getParameter("code");

            //convert - type casting param
            ClassObject classObject = COD.getClassByCode(classCode);
            UUID cid = classObject.getClassId();
            UUID aid = account.getAccountId();

            //get list of test
            ArrayList<Test> listTest = new ArrayList<>();
            listTest = TD.viewListTest(cid);

            //get current time
            Timestamp now = Timestamp.from(Instant.now());
            request.setAttribute("now", now);
            
            //format date: MMM-dd HH:mm
            //ex: Mar-08 12:00
            SimpleDateFormat sdf = new SimpleDateFormat("MMM-dd HH:mm");
            request.setAttribute("sdf", sdf);

            //set attribute
            request.setAttribute("activeEX", "active");
            request.setAttribute("classObject", classObject);
            request.setAttribute("aid", aid);
            request.setAttribute("listExercise", listTest);
            request.setAttribute("DoTestDAO", DTD);

            //set attribute for info of teacher to display on class
            //if account is teacher, set info of account for "teacher"
            if (account.getRole() == 1) {
                request.setAttribute("teacher", account);
            }
            //if account is student, set info of class's teacher for "teacher"
            else {
                request.setAttribute("teacher", AD.getAccountById(classObject.getAccountId()));
            }

            request.getRequestDispatcher("/view-list-exercise.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }
}
