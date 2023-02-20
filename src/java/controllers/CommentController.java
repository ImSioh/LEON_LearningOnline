package controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import dao.AccountDAO;
import dao.CommentDAO;
import dao.ResourceDAO;
import dto.Account;
import dto.Comment;
import dto.Resource;
import helpers.Constant;
import helpers.JsonWrapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

@WebServlet(name = "CommentController", urlPatterns = {"/student/class/comment", "/teacher/class/comment"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1)
public class CommentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UUID postId = UUID.fromString(req.getParameter("postId"));

            CommentDAO commentDAO = new CommentDAO();
            AccountDAO accountDAO = new AccountDAO();
            ResourceDAO resourceDAO = new ResourceDAO();
            HashMap<UUID, Resource> resourceMap = new HashMap<>();
            HashMap<UUID, Account> otherAccount = new HashMap<>();

            ArrayList<Comment> comments = commentDAO.getCommentsByPost(postId);
            for (Comment comment : comments) {
                Account commentOwner = otherAccount.get(comment.getAccountId());
                if (commentOwner == null) {
                    commentOwner = accountDAO.getAccountById(comment.getAccountId());
                    otherAccount.put(commentOwner.getAccountId(), commentOwner);
                }
                comment.account = commentOwner;
                if (comment.getResourceId() != null) {
                    Resource commentResource = resourceMap.get(comment.getResourceId());
                    if (commentResource == null) {
                        commentResource = resourceDAO.getResourcesById(comment.getResourceId());
                        resourceMap.put(commentResource.getResourceId(), commentResource);
                    }
                    comment.resource = commentResource;
                }
            }

            Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().setDateFormat(Constant.FORMAT_DATETIME).create();
            resp.setContentType("application/json");
            resp.setCharacterEncoding("utf-8");
            resp.getWriter().print(gson.toJson(comments));
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Account account = (Account) req.getAttribute("account");
            UUID postId = UUID.fromString(req.getParameter("postId"));
            UUID classId = UUID.fromString(req.getParameter("classId"));
            String content = req.getParameter("content");
            Comment comment = new Comment(UUID.randomUUID(), account.getAccountId(), postId, null, content, new Timestamp(System.currentTimeMillis()));
            comment.account = account;
            String resourceIdRaw = req.getParameter("resourceId");
            if (resourceIdRaw != null) {
                UUID resourceId = UUID.fromString(resourceIdRaw);
                comment.setResourceId(resourceId);
                comment.resource = new ResourceDAO().getResourcesById(resourceId);
            }
            new CommentDAO().insertComment(comment);
            JsonWrapper<Comment> jsonWrapper = new JsonWrapper<Comment>("new-comment", comment);
            Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().setDateFormat(Constant.FORMAT_DATETIME).create();
            WebSocketController.sendToClass(classId, gson.toJson(jsonWrapper));
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

}
