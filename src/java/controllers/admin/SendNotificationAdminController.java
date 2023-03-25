package controllers.admin;

import dao.NotificationDAO;
import dto.Account;
import dto.Notification;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.UUID;

@WebServlet(name = "SendNotificationAdminController", urlPatterns = {"/admin/send-notification"})
public class SendNotificationAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.getRequestDispatcher("/admin/send-notification.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //get admin account
            Account adminAccount = (Account) request.getAttribute("account");

            //get , set: title & content
            String title = request.getParameter("title").trim();
            String content = request.getParameter("content").trim();
            request.setAttribute("title", title);
            request.setAttribute("content", content);

            //set msg error: title & content
            String msgTitle, msgContent;
            msgTitle = msgContent = "";
            if (title.equals("")) {
                msgTitle = "Title is required.";
                request.setAttribute("msgTitle", msgTitle);
            }
            if (content.equals("")) {
                msgContent = "Content is required.";
                request.setAttribute("msgContent", msgContent);
            }

            //check not null: title & content
            if (!msgTitle.equals("") || !msgContent.equals("")) {
                request.getRequestDispatcher("/admin/send-notification.jsp").forward(request, response);
            } else {
                //create and insert notification
                Notification notification = new Notification(UUID.randomUUID(), adminAccount.getAccountId(), null, null, 2,
                        title, "", content, new Timestamp(System.currentTimeMillis()));
                int result = 0;
                result = new NotificationDAO().insertNotification(notification);
                
                //check result & send msg
                if (result > 0) {
                    request.setAttribute("status", true);
                    request.setAttribute("msg", "Send notification successfully!");
                } else {
                    request.setAttribute("status", false);
                    request.setAttribute("msg", "Fail to send notification!");
                }
                request.getRequestDispatcher("/admin/send-notification.jsp").forward(request, response);
//            response.sendRedirect(request.getContextPath() + "/admin/feedback-list");
            }

        } catch (Exception e) {
        }
    }
}
