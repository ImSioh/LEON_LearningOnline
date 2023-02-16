/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

import dao.AccountDAO;
import dao.FeedbackDAO;
import dto.Account;
import dto.Feedback;
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

/**
 *
 * @author Asus
 */
@WebServlet(name = "ViewListAdminController", urlPatterns = {"/admin/feedback-list", "/admin/student-account-list", "/admin/teacher-account-list"})
public class ViewListAdminController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViewListAdminController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewListAdminController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    AccountDAO accountDAO = new AccountDAO();
    FeedbackDAO feedbackDAO = new FeedbackDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
//            Account account = (Account) request.getAttribute("account");

            int element;
            try {
                element = Integer.parseInt(request.getParameter("element"));
            } catch (Exception e) {
                element = 10;
            }
            request.setAttribute("element", element);
            int[] elementOption = {1, 2, 5, 10, 25};
            request.setAttribute("elementOption", elementOption);

            String criteria;
            try {
                criteria = request.getParameter("criteria");
            } catch (Exception e) {
                criteria = "name";
            }
            request.setAttribute("criteria", criteria);

            boolean orderBy;
            try {
                orderBy = Boolean.valueOf(request.getParameter("orderBy"));
            } catch (Exception e) {
                orderBy = true;
            }
            request.setAttribute("orderBy", orderBy);

            String sort = orderBy ? "" : "desc";
            //feedback
            if (request.getServletPath().contains("feedback-list")) {
                try {
                    ArrayList<Feedback> feedbacks = feedbackDAO.getAllFeedbacks();
                    feedbackDAO.setItemList(feedbacks);
                    feedbackDAO.setMaxPageItem(element);
                    feedbackDAO.setMaxTotalPage(10);

                    ArrayList<Account> accounts = accountDAO.getListAllAccounts();

                    request.setAttribute("feedbackDAO", feedbackDAO);
                    request.setAttribute("feedbacks", feedbacks);
                    request.setAttribute("accounts", accounts);
                } catch (Exception ex) {
                    Logger.getLogger(ViewListAdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
            } //student
            else if (request.getServletPath().contains("student-account-list")) {
                try {
//                    ArrayList<Account> students = accountDAO.getListAccountByRole(2);
                    ArrayList<Account> students = accountDAO.getListAccountByRoleAndSort(2, criteria, sort);
                    accountDAO.setItemList(students);
                    accountDAO.setMaxPageItem(element);
                    accountDAO.setMaxTotalPage(10);

                    request.setAttribute("accountDAO", accountDAO);
                    request.setAttribute("accountList", students);
                } catch (Exception ex) {
                    Logger.getLogger(ViewListAdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/admin/manageS.jsp").forward(request, response);
            } //teacher
            else if (request.getServletPath().contains("teacher-account-list")) {
                try {
                    ArrayList<Account> teachers = accountDAO.getListAccountByRoleAndSort(1, criteria, sort);
                    accountDAO.setItemList(teachers);
                    accountDAO.setMaxPageItem(element);
                    accountDAO.setMaxTotalPage(10);

                    request.setAttribute("accountDAO", accountDAO);
                    request.setAttribute("accountList", teachers);
                } catch (Exception ex) {
                    Logger.getLogger(ViewListAdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/admin/manageT.jsp").forward(request, response);
            }
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
//            Account account = (Account) request.getAttribute("account");

            int element;
            try {
                element = Integer.parseInt(request.getParameter("element"));
            } catch (Exception e) {
                element = 10;
            }
            request.setAttribute("element", element);
            int[] elementOption = {3, 5, 7, 10, 15};
            request.setAttribute("elementOption", elementOption);

            String criteria;
            try {
                criteria = request.getParameter("criteria");
            } catch (Exception e) {
                criteria = "name";
            }
            request.setAttribute("criteria", criteria);

            boolean orderBy;
            try {
                orderBy = Boolean.valueOf(request.getParameter("orderBy"));
            } catch (Exception e) {
                orderBy = true;
            }
            request.setAttribute("orderBy", orderBy);

            String sort = orderBy ? "" : "desc";
            //feedback
            if (request.getServletPath().contains("feedback-list")) {
                try {
                    ArrayList<Feedback> feedbacks = feedbackDAO.getAllFeedbacksSort(criteria, sort);
                    feedbackDAO.setItemList(feedbacks);
                    feedbackDAO.setMaxPageItem(element);
                    feedbackDAO.setMaxTotalPage(10);

                    ArrayList<Account> accounts = accountDAO.getListAllAccounts();

                    request.setAttribute("feedbackDAO", feedbackDAO);
                    request.setAttribute("feedbacks", feedbacks);
                    request.setAttribute("accounts", accounts);
                } catch (Exception ex) {
                    Logger.getLogger(ViewListAdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
            } //student
            else if (request.getServletPath().contains("student-account-list")) {
                try {
                    ArrayList<Account> students = accountDAO.getListAccountByRoleAndSort(2, criteria, sort);
                    accountDAO.setItemList(students);
                    accountDAO.setMaxPageItem(element);
                    accountDAO.setMaxTotalPage(10);

                    request.setAttribute("accountDAO", accountDAO);
                    request.setAttribute("accountList", students);
                } catch (Exception ex) {
                    Logger.getLogger(ViewListAdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/admin/manageS.jsp").forward(request, response);
            } //teacher
            else if (request.getServletPath().contains("teacher-account-list")) {
                try {
                    ArrayList<Account> teachers = accountDAO.getListAccountByRoleAndSort(1, criteria, sort);
                    accountDAO.setItemList(teachers);
                    accountDAO.setMaxPageItem(element);
                    accountDAO.setMaxTotalPage(10);

                    request.setAttribute("accountDAO", accountDAO);
                    request.setAttribute("accountList", teachers);
                } catch (Exception ex) {
                    Logger.getLogger(ViewListAdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/admin/manageT.jsp").forward(request, response);
            }
        } catch (Exception e) {
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
