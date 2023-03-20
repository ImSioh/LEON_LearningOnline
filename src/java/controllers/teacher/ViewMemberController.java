package controllers.teacher;

import dao.AccountDAO;
import dao.ClassObjectDAO;
import dao.DoTestDAO;
import dao.TestDAO;
import dto.Account;
import dto.ClassObject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ViewMemberController", urlPatterns = {"/teacher/class/member-list", "/student/class/member-list", "/teacher/class/member-request-list"})
public class ViewMemberController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Account account = (Account) request.getAttribute("account");
            String classCode = request.getParameter("code");
            ArrayList<Account> listStudent = new ArrayList<>();
            ArrayList<Account> listRequest = new ArrayList<>();
            ClassObject classObject = new ClassObjectDAO().getClassByCode(classCode);
            if (account.getRole() == 1 && !account.getAccountId().equals(classObject.getAccountId())) {
                response.sendRedirect(request.getContextPath() );
                return;
            }
            int countOfEx = new TestDAO().getListTitle(classObject.getClassId()).size();
            listStudent = new AccountDAO().getListAllStudentByClassCode(classCode, "1");
            listRequest = new AccountDAO().getListAllStudentByClassCode(classCode, "0");
            request.setAttribute("listStudent", listStudent);
            request.setAttribute("listRequest", listRequest);
            request.setAttribute("classObject", classObject);
            request.setAttribute("countOfEx", countOfEx);
            request.setAttribute("DoTestDAO", new DoTestDAO());

            if (account.getRole() == 1) {
                request.setAttribute("teacher", account);
            } else {
                request.setAttribute("teacher", new AccountDAO().getAccountById(classObject.getAccountId()));
            }
            if (request.getServletPath().contains("/teacher/class/member-request-list")) {
                request.setAttribute("activeRQ", "active");
                request.getRequestDispatcher("/teacher/request.jsp").forward(request, response);
            } else {
                request.setAttribute("activeMB", "active");
                request.getRequestDispatcher("/teacher/member.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(ViewMemberController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Account account = (Account) request.getAttribute("account");
            String classCode = request.getParameter("code");
            String search = request.getParameter("search");
            ArrayList<Account> listStudent = new ArrayList<>();
            ArrayList<Account> listRequest = new ArrayList<>();
            if (search.isEmpty()) {
                doGet(request, response);
            }

            ClassObject classObject = new ClassObjectDAO().getClassByCode(classCode);

            listStudent = new AccountDAO().getStudentsByClassCodeAndStudentName(classCode, search);
            listRequest = new AccountDAO().getStudentsRequestByClassCodeAndStudentName(classCode, search);
            request.setAttribute("listStudent", listStudent);
            request.setAttribute("listRequest", listRequest);
            request.setAttribute("classObject", classObject);
            request.setAttribute("search", search);

            if (account.getRole() == 1) {
                if (!account.getAccountId().equals(classObject.getAccountId())) {
                    response.sendRedirect(request.getContextPath() + "/teacher/class");
                    return;
                }
                request.setAttribute("teacher", account);
            } else {
                request.setAttribute("teacher", new AccountDAO().getAccountById(classObject.getAccountId()));
            }
            if (request.getServletPath().contains("/teacher/class/member-request-list")) {
                request.setAttribute("activeRQ", "active");
                request.getRequestDispatcher("/teacher/request.jsp").forward(request, response);
            } else {
                request.setAttribute("activeMB", "active");
                request.getRequestDispatcher("/teacher/member.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(ViewMemberController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
