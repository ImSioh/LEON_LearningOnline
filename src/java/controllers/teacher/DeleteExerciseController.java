package controllers.teacher;

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
import java.util.ArrayList;
import java.util.UUID;

@WebServlet(name = "DeleteExerciseController", urlPatterns = {"/teacher/class/exercise/delete"})
public class DeleteExerciseController extends HttpServlet {

    TestDAO TD = new TestDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Account account = (Account) request.getAttribute("account");
            String classCode = request.getParameter("code");
            String testid = request.getParameter("testid");
            UUID tid = UUID.fromString(testid);
            Test test = TD.getTestByTestID(tid);
            test.setCreateTime(null);

            int check = 0;
            check = TD.editTest(test);

            response.sendRedirect(request.getContextPath() + "/teacher/class/exercise?code=" + classCode);
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
