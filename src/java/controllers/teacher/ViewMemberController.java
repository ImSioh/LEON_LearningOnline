package controllers.teacher;

import dao.AccountDAO;
import dto.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ViewMemberController", urlPatterns = {"/teacher/class/member-list"})
public class ViewMemberController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String classCode = request.getParameter("code");
            ArrayList<Account> listStudent = new ArrayList<>();
            listStudent = new AccountDAO().getListAllStudentByClassCode(classCode,"1");
            request.setAttribute("listStudent", listStudent);
            request.getRequestDispatcher("/teacher/member.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ViewMemberController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
