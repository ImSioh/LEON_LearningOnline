package dao;

import dto.Notification;
import helpers.Util;
import java.sql.ResultSet;

public class NotificationDAO extends AbstractDAO<Notification> {
    
    public int insertNotification(Notification notification) throws Exception {
        String query = "INSERT INTO notification (notification_id, account_id, class_id, title, content, create_time) VALUES (?, ?, ?, ?, ?, ?)";
        return update(
                query,
                Util.UUIDToByteArray(notification.getNotificationId()),
                Util.UUIDToByteArray(notification.getAccountId()),
                Util.UUIDToByteArray(notification.getClassId()),
                notification.getTitle(),
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
                rs.getNString("title"),
                rs.getString("redirect_url"),
                rs.getNString("content"),
                rs.getTimestamp("create_time")
        );
    }
    
}
