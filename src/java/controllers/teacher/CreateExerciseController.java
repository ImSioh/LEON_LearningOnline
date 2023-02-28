package controllers.teacher;

import dao.ClassObjectDAO;
import dto.Account;
import dto.ClassObject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name="CreateExerciseController", urlPatterns={"/teacher/exercise/create"})
public class CreateExerciseController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Account account = (Account) req.getAttribute("account");
            ClassObject classObject = new ClassObjectDAO().getClassByCode(req.getParameter("code"));
            req.getRequestDispatcher("/teacher/create-exercise.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
    
}
