package dao;

import dto.Notification;
import java.sql.ResultSet;
import java.util.UUID;

public class NotificationDAO extends AbstractDAO<Notification> {

    @Override
    protected Notification propMapping(ResultSet rs) throws Exception {
        return new Notification(
                UUID.nameUUIDFromBytes(rs.getBytes("notification_id")),
                UUID.nameUUIDFromBytes(rs.getBytes("account_id")),
                rs.getNString("title"),
                rs.getString("redirect_url"),
                rs.getNString("content")
        );
    }
    
}
