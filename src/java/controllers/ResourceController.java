package controllers;

import com.google.gson.Gson;
import dao.ResourceDAO;
import dto.Account;
import dto.Resource;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@WebServlet(name="ResourceController", urlPatterns={"/resource"})
public class ResourceController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Account account = (Account) req.getAttribute("account");
            if (account == null) {
                resp.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                return;
            }
            
            ArrayList<Resource> resources = new ResourceDAO().getResourcesByAccount(account.getAccountId());
            Gson gson = new Gson();
            resp.setContentType("application/json");
            resp.setCharacterEncoding("utf-8");
            resp.getWriter().print(gson.toJson(resources));
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
}
