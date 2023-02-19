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
import java.util.HashMap;
import java.util.UUID;

@WebServlet(name = "ResourceController", urlPatterns = {"/resource"})
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

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String[] resourceIdsRaw = req.getParameterValues("rId");
            ResourceDAO resourceDAO = new ResourceDAO();
            ArrayList<String> succeed = new ArrayList<>();
            ArrayList<String> failed = new ArrayList<>();
            for (String resourceIdRaw : resourceIdsRaw) {
                UUID resourceId = UUID.fromString(resourceIdRaw);
                int result = resourceDAO.deleteResource(resourceId);
                if (result > 0) {
                    succeed.add(resourceIdRaw);
                } else {
                    failed.add(resourceIdRaw);
                }
            }
            HashMap<String, ArrayList<String>> response = new HashMap<>();
            response.put("succeed", succeed);
            response.put("failed", failed);
            Gson gson = new Gson();
            resp.setContentType("application/json");
            resp.setCharacterEncoding("utf-8");
            resp.getWriter().print(gson.toJson(response));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
