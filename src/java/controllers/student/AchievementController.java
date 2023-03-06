package controllers.student;

import dao.AccountDAO;
import dao.ClassObjectDAO;
import dao.DoTestDAO;
import dao.EnrollmentDAO;
import dao.TestDAO;
import dto.Account;
import dto.ClassObject;
import dto.DoTest;
import dto.Enrollment;
import dto.Test;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "Overview_Acvm_Student", urlPatterns = {"/student/achievement"})
public class AchievementController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            // get data form Cookie
            String email = "", pass = "";
            Cookie[] cookies = req.getCookies();
            for (Cookie c : cookies) {
                if (c.getName().equals("cookEmail")) {
                    email = c.getValue();
                }
                if (c.getName().equals("cookPass")) {
                    pass = c.getValue();
                }
            }
            //check valid of url
            if (email.equals("") || pass.equals("")) {
                resp.sendRedirect(req.getContextPath() + "/");
            }
            // get data from database
            AccountDAO accountDAO = new AccountDAO();
            ArrayList<ClassObject> co = new ArrayList<>();
            Account accL = accountDAO.getAccountByEmail(email);
            ArrayList<Enrollment> enrollment = new EnrollmentDAO().getListEnrollmentById(accL.getAccountId());
            DecimalFormat formatter = new DecimalFormat("#0.0");
            for (Enrollment e : enrollment) {
                ClassObject clobj = new ClassObjectDAO().getClassById(e.getClassId());
                co.add(clobj);
            }

            if (accL.getRole() == 2) {
                req.setAttribute("accL", accL);
                req.setAttribute("formatter", formatter);
                req.setAttribute("accID", accL.getAccountId());
                req.setAttribute("testDAO", new TestDAO());
                req.setAttribute("DoTestDAO", new DoTestDAO());
                req.setAttribute("hglO", true);
                req.setAttribute("co", co);
                req.setAttribute("hglV", false);
                req.getRequestDispatcher("achievementS.jsp").forward(req, resp);
            } else {
                resp.sendRedirect(req.getContextPath() + "/");
            }

        } catch (Exception ex) {
            Logger.getLogger(OverviewController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

    }

 

}
