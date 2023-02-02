package controllers;

import dao.AccountDAO;
import dto.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "SearchAccountController", urlPatterns = {"/SearchAccount"})
public class SearchAccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        String optionSearch = request.getParameter("optionSearch");
        int role = 0;
        if (request.getParameter("searchFor") != null) {
            role = 1;
        } else {
            role = 2;
        }
        AccountDAO accountDAO = new AccountDAO();
        ArrayList<Account> accountList = new ArrayList();
        try {
            switch (optionSearch) {
                case "name":
                    accountList = accountDAO.getListAccountByName(keyword,role);
                    break;
                case "email":
                    accountList = accountDAO.getListAccountByEmail(keyword, role);
                    break;
                case "phoneNumber":
                    accountList = accountDAO.getListAccountByPhoneNumber(keyword,role);
                    break;
            }
            request.setAttribute("accountList", accountList);
            request.setAttribute("keyword", keyword);
            request.setAttribute("optionSearch", optionSearch);
            if (request.getParameter("searchFor") != null) {
                request.getRequestDispatcher("/admin/manageS.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("/admin/manageT.jsp").forward(request, response);

            }
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
