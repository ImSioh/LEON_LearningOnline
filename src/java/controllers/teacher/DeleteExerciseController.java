package controllers.teacher;

import dao.TestDAO;
import dto.Test;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.UUID;

@WebServlet(name = "DeleteExerciseController", urlPatterns = {"/teacher/class/exercise/delete"})
public class DeleteExerciseController extends HttpServlet {

    //connect db
    TestDAO TD = new TestDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //get param
            String classCode = request.getParameter("code");
            String testid = request.getParameter("testid");
            
            //convert param
            UUID tid = UUID.fromString(testid);
            
            //get test
            Test test = TD.getTestByTestID(tid);
            //delete test by setting create time of test = null
            //check if create time is not null, then display test
            //set by java
            test.setCreateTime(null);

            //set by mysql
            int check = 0;
            check = TD.editTest(test);

            //check status of edit test
            if (check == 1) {
                response.sendRedirect(request.getContextPath() + "/teacher/class/exercise?code=" + classCode);
            }
        } catch (Exception e) {
        }
    }
}
