package dao;

import dto.Feedback;
import java.sql.ResultSet;
import java.util.UUID;

public class FeedbackDAO extends AbstractDAO<Feedback> {

    @Override
    protected Feedback propMapping(ResultSet rs) throws Exception {
        return new Feedback(
                UUID.nameUUIDFromBytes(rs.getBytes("feedback_id")),
                UUID.nameUUIDFromBytes(rs.getBytes("account_id")),
                rs.getNString("content")
        );
    }
    
}
