package controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import dao.AccountDAO;
import dao.ClassObjectDAO;
import dao.CommentDAO;
import dao.NotificationDAO;
import dao.PostDAO;
import dao.PostResourceDAO;
import dao.ResourceDAO;
import dto.Account;
import dto.ClassObject;
import dto.Notification;
import dto.Post;
import dto.PostResource;
import helpers.Constant;
import helpers.JsonWrapper;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.UUID;

@WebServlet(name = "CreatePostController", urlPatterns = {"/teacher/class/post", "/student/class/post"})
@MultipartConfig
public class PostController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UUID classId = UUID.fromString(req.getParameter("classId"));

            ArrayList<Post> posts = new PostDAO().getPostsInClass(classId);
            HashMap<UUID, Account> otherAccount = new HashMap<>();
            ResourceDAO resourceDAO = new ResourceDAO();
            AccountDAO accountDAO = new AccountDAO();
            CommentDAO commentDAO = new CommentDAO();
            for (Post post : posts) {
                post.resources = resourceDAO.getResourcesByPost(post.getPostId());
                Account postOwner = otherAccount.get(post.getAccountId());
                if (postOwner == null) {
                    postOwner = accountDAO.getAccountById(post.getAccountId());
                    otherAccount.put(postOwner.getAccountId(), postOwner);
                }
                post.account = postOwner;
                post.commentCount = commentDAO.countCommentInPost(post.getPostId());
            }

            Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().setDateFormat(Constant.FORMAT_DATETIME).create();
            resp.setContentType("application/json");
            resp.setCharacterEncoding("utf-8");
            resp.getWriter().print(gson.toJson(posts));
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Account account = (Account) req.getAttribute("account");
            UUID classId = UUID.fromString(req.getParameter("classId"));
            String content = req.getParameter("content");
            String resources = req.getParameter("resources");
            Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().setDateFormat(Constant.FORMAT_DATETIME).create();
            String[] resourceArr = gson.fromJson(resources, String[].class);

            Post post = new Post(UUID.randomUUID(), account.getAccountId(), classId, false, content, new Timestamp(System.currentTimeMillis()));
            int result = new PostDAO().insertPost(post);
            if (result > 0) {
                PostResourceDAO postResourceDAO = new PostResourceDAO();
                for (String str : resourceArr) {
                    PostResource postResource = new PostResource(UUID.fromString(str), post.getPostId());
                    postResourceDAO.insertPostResouce(postResource);
                }
                post.resources = new ResourceDAO().getResourcesByPost(post.getPostId());
                
                ClassObject classObject = new ClassObjectDAO().getClassById(classId);
                String title = account.getName() + " posted in class " + classObject.getName();
                String redirectUrl = "/class/newfeed?code=" + classObject.getCode() + "#" + post.getPostId();
                String subContent = content.substring(0, Math.min(200, content.length()));
                Notification notification = new Notification(UUID.randomUUID(), account.getAccountId(), classId, null, 1, title, redirectUrl, subContent, new Timestamp(System.currentTimeMillis()));
                result = new NotificationDAO().insertNotification(notification);
                if (result > 0) {
                    JsonWrapper<Notification> jsonWrapper = new JsonWrapper<>("notification", notification);
                    String json = gson.toJson(jsonWrapper);
                    WebSocketController.sendToClass(classId, json);
                }
            }
            post.account = account;
            JsonWrapper<Post> jsonWrapper = new JsonWrapper<>("new-post", post);
            WebSocketController.sendToClass(classId, gson.toJson(jsonWrapper));
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

}
