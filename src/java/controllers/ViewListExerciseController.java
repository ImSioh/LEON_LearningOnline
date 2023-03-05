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

    ClassObjectDAO COD = new ClassObjectDAO();
    TestDAO TD = new TestDAO();
    DoTestDAO DTD = new DoTestDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Account account = (Account) request.getAttribute("account");
            String classCode = request.getParameter("code");

            ClassObject classObject = COD.getClassByCode(classCode);
            UUID cid = classObject.getClassId();
            UUID aid = account.getAccountId();

            ArrayList<Test> listTest = new ArrayList<>();
            listTest = TD.viewListTest(cid);

            Timestamp now = Timestamp.from(Instant.now());
            request.setAttribute("now", now);
            SimpleDateFormat sdf = new SimpleDateFormat("MMM-dd HH:mm");
            request.setAttribute("sdf", sdf);

            request.setAttribute("activeEX", "active");
            request.setAttribute("classObject", classObject);
            request.setAttribute("aid", aid);
            request.setAttribute("listExercise", listTest);
            request.setAttribute("DoTestDAO", new DoTestDAO());

            if (account.getRole() == 1) {
                request.setAttribute("teacher", account);
            } else {
                request.setAttribute("teacher", new AccountDAO().getAccountById(classObject.getAccountId()));
            }

            request.getRequestDispatcher("/view-list-exercise.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
