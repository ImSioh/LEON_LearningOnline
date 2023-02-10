package controllers.teacher;

import dao.NotificationDAO;
import dto.Notification;
import helpers.FormValidator;
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
public class NotificationClass extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            FormValidator formValidator = new FormValidator(req);
            formValidator.setCheckParam("classId", true, String.class);
            formValidator.setCheckParam("teacherId", true, String.class);
            formValidator.setCheckParam("title", true, String.class);
            formValidator.setCheckParam("content", true, String.class);
            boolean validForm = formValidator.isValid();

            if (validForm) {
                UUID classId = UUID.fromString((String) formValidator.get("classId"));
                UUID teacherId = UUID.fromString((String) formValidator.get("teacherId"));
                String title = (String) formValidator.get("title");
                String content = (String) formValidator.get("content");
                
                Notification notification = new Notification(UUID.randomUUID(), teacherId, classId, title, null, content, new Timestamp(System.currentTimeMillis()));
                int result = new NotificationDAO().insertNotification(notification);
                if (result <= 0) {
                    resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

}
