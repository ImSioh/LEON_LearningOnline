package controllers;

import dao.AccountDAO;
import dao.ClassObjectDAO;
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.UUID;

@WebServlet(name = "ViewListExerciseController", urlPatterns = {"/teacher/class/exercise", "/student/class/exercise"})
public class ViewListExerciseController extends HttpServlet {

    ClassObjectDAO COD = new ClassObjectDAO();
    TestDAO TD = new TestDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Account account = (Account) request.getAttribute("account");
            String classCode = request.getParameter("code");

            ClassObject classObject = COD.getClassByCode(classCode);
            UUID cid = classObject.getClassId();

            ArrayList<Test> viewTest = new ArrayList<>();
            viewTest = TD.viewListTest(cid);

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            request.setAttribute("sdf", sdf);
            request.setAttribute("classObject", classObject);
            request.setAttribute("activeEX", "active");
            request.setAttribute("listExercise", viewTest);

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
