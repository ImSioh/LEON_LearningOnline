package controllers.admin;

import dao.AccountDAO;
import dto.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ViewUserProfileController", urlPatterns = {"/admin/user-account-profile"})
public class ViewUserProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //get param
            String id;
            id = request.getParameter("id");

            //connect db
            AccountDAO accountDAO = new AccountDAO();
            Account account = null;
            try {
                account = accountDAO.getAccountById(UUID.fromString(id));
            } catch (Exception ex) {
                Logger.getLogger(ViewUserProfileController.class.getName()).log(Level.SEVERE, null, ex);
            }

            //set acc
            account.setRole(3);
            request.setAttribute("account", account);
            request.getRequestDispatcher("/profile.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
