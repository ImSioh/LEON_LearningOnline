package dao;

import dto.Notification;
import helpers.Util;
import java.sql.ResultSet;
import java.util.UUID;

public class NotificationDAO extends AbstractDAO<Notification> {

    @Override
    protected Notification propMapping(ResultSet rs) throws Exception {
        return new Notification(
                Util.ByteArrayToUUID(rs.getBytes("notification_id")),
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                rs.getNString("title"),
                rs.getString("redirect_url"),
                rs.getNString("content")
        );
    }
    
}
