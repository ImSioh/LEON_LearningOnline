package controllers.teacher;

import dao.AccountDAO;
import dao.ClassObjectDAO;
import dao.DoTestDAO;
import dto.Account;
import dto.ClassObject;
import dto.DoTest;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ExerciseResultController", urlPatterns = {"/teacher/class/exercise/detail"})
public class ExerciseResultController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String testId = request.getParameter("testid");
            Account account = (Account) request.getAttribute("account");
            String classCode = request.getParameter("code");
            ArrayList<Account> listStudent = new ArrayList<>();
            ClassObject classObject = new ClassObjectDAO().getClassByCode(classCode);
            listStudent = new AccountDAO().getListAllStudentByClassCode(classCode, "1");
            request.setAttribute("listStudent", listStudent);
            request.setAttribute("classObject", classObject);
            request.setAttribute("DoTestDAO", new DoTestDAO());
            request.setAttribute("activeEX", "active");
            request.setAttribute("teacher", account);
            request.setAttribute("testId", UUID.fromString(testId));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            request.setAttribute("sdf", sdf);

        } catch (Exception ex) {
            Logger.getLogger(ExerciseResultController.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.getRequestDispatcher("/teacher/ExerciseResult.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
