package dao;

import dto.Notification;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

public class NotificationDAO extends AbstractDAO<Notification> {
    
    public ArrayList<Notification> getTeacherNotifications(UUID accountId) throws Exception {
        String query = "SELECT n.* FROM notification n LEFT JOIN class c ON n.class_id = c.class_id WHERE c.account_id = ? OR n.target = ? OR n.type = 2 ORDER BY n.create_time";
        return selectMany(query, Util.UUIDToByteArray(accountId), Util.UUIDToByteArray(accountId));
    }
    
    public ArrayList<Notification> getStudentNotifications(UUID accountId) throws Exception {
        String query = "SELECT n.* FROM notification n WHERE n.target = ? OR n.type = 2 OR n.class_id IN (SELECT c.class_id FROM enrollment e LEFT JOIN class c ON e.class_id = c.class_id WHERE e.account_id = ? AND e.accepted = TRUE) ORDER BY n.create_time";
        return selectMany(query, Util.UUIDToByteArray(accountId), Util.UUIDToByteArray(accountId));
    }
    
    public ArrayList<Notification> getNotificationsByClassId(UUID classId) throws Exception {
        String query = "SELECT * FROM notification WHERE class_id = ? ORDER BY create_time DESC";
        return selectMany(query, Util.UUIDToByteArray(classId));
    }
    
    public int insertNotification(Notification notification) throws Exception {
        String query = "INSERT INTO notification (notification_id, account_id, class_id, target, type, title, redirect_url, content, create_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return update(
                query,
                Util.UUIDToByteArray(notification.getNotificationId()),
                Util.UUIDToByteArray(notification.getAccountId()),
                Util.UUIDToByteArray(notification.getClassId()),
                Util.UUIDToByteArray(notification.getTarget()),
                notification.getType(),
                notification.getTitle(),
                notification.getRedirectUrl(),
                notification.getContent(),
                notification.getCreateTime()
        );
    }

    @Override
    protected Notification propMapping(ResultSet rs) throws Exception {
        return new Notification(
                Util.ByteArrayToUUID(rs.getBytes("notification_id")),
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                Util.ByteArrayToUUID(rs.getBytes("class_id")),
                Util.ByteArrayToUUID(rs.getBytes("target")),
                rs.getInt("type"),
                rs.getNString("title"),
                rs.getString("redirect_url"),
                rs.getNString("content"),
                rs.getTimestamp("create_time")
        );
    }
    
}
