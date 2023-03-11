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
import java.util.ArrayList;
import java.util.UUID;

@WebServlet(name = "StatisticRankController", urlPatterns = {"/teacher/class/transcript", "/student/class/transcript"})
public class StatisticTranscriptController extends HttpServlet {

    //connect db
    AccountDAO AD = new AccountDAO();
    ClassObjectDAO COD = new ClassObjectDAO();
    TestDAO TD = new TestDAO();
    DoTestDAO DTD = new DoTestDAO();

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

            //get list of test
            ArrayList<Test> viewTest = new ArrayList<>();
            viewTest = TD.viewListTest(cid);

            //get list student in class
            ArrayList<Account> listStudent = new ArrayList<>();
            //if account is teacher, get info of all student
            if (account.getRole() == 1) {
                listStudent = AD.getListAllStudentByClassCode(classCode, "1");
            } 
            //if account is student, get info of student
            else {
                listStudent.add(account);
            }

            //set attribute
            request.setAttribute("classObject", classObject);
            request.setAttribute("activeTS", "active");
            request.setAttribute("listExercise", viewTest);
            request.setAttribute("listStudent", listStudent);
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

            request.getRequestDispatcher("/transcript.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }
}
