package controllers.student;

import dao.ResourceDAO;
import dao.TestDAO;
import dto.Test;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet(name="DoExerciseController", urlPatterns={"/student/class/exercise/do"})
public class DoExerciseController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
        try {
            TestDAO tdao = new TestDAO();
            String testid = req.getParameter("testid");
            Test test = tdao.getTestWithAllData(UUID.fromString(testid));
            req.setAttribute("tdao", tdao);
            req.setAttribute("rdao", new ResourceDAO());
            req.setAttribute("test", test); 
            req.getRequestDispatcher("/student/do-test.jsp").forward(req, resp);
        } catch (Exception ex) {
            Logger.getLogger(DoExerciseController.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
        
    }


}