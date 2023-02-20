package controllers.teacher;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import controllers.WebSocketController;
import dao.NotificationDAO;
import dto.Notification;
import helpers.Constant;
import helpers.FormValidator;
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

@WebServlet(name = "NotificationClass", urlPatterns = {"/teacher/class/notification"})
@MultipartConfig
public class NotificationClassController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            FormValidator formValidator = new FormValidator(req);
            formValidator.setCheckParam("classId", true, String.class);
            formValidator.setCheckParam("classCode", true, String.class);
            formValidator.setCheckParam("teacherId", true, String.class);
            formValidator.setCheckParam("title", true, String.class);
            formValidator.setCheckParam("content", true, String.class);
            boolean validForm = formValidator.isValid();

            if (validForm) {
                UUID classId = UUID.fromString((String) formValidator.get("classId"));
                UUID teacherId = UUID.fromString((String) formValidator.get("teacherId"));
                String title = (String) formValidator.get("title");
                String redirectUrl = "/class/newfeed?code=" + (String) formValidator.get("classCode");
                String content = (String) formValidator.get("content");
                
                Notification notification = new Notification(UUID.randomUUID(), teacherId, classId, null, 0, title, redirectUrl, content, new Timestamp(System.currentTimeMillis()));
                int result = new NotificationDAO().insertNotification(notification);
                if (result <= 0) {
                    resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                } else {
                    Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().setDateFormat(Constant.FORMAT_DATETIME).create();
                    JsonWrapper<Notification> jsonWrapper = new JsonWrapper<>("notification", notification);
                    String json = gson.toJson(jsonWrapper);
                    WebSocketController.sendToClass(classId, json);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

}
