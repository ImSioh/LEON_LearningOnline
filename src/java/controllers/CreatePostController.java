package controllers;

import com.google.gson.Gson;
import dao.PostDAO;
import dao.PostResourceDAO;
import dao.ResourceDAO;
import dto.Account;
import dto.Post;
import dto.PostResource;
import helpers.JsonWrapper;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.UUID;

@WebServlet(name = "CreatePostController", urlPatterns = {"/teacher/class/post", "/student/class/post"})
@MultipartConfig
public class CreatePostController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Account account = (Account) req.getAttribute("account");
            UUID classId = UUID.fromString(req.getParameter("classId"));
            String content = req.getParameter("content");
            String resources = req.getParameter("resources");
            System.out.println(classId);
            System.out.println(content);
            Gson gson = new Gson();
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
            }
            JsonWrapper<Post> jsonWrapper = new JsonWrapper<>("new-post", post);
            WebSocketController.sendToClass(classId, gson.toJson(jsonWrapper));
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

}
