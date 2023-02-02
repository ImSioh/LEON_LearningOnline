package dao;

import dto.Feedback;
import helpers.Util;
import java.sql.ResultSet;
import java.util.UUID;

public class FeedbackDAO extends AbstractDAO<Feedback> {

    public int insertFeedback(Feedback feedback) throws Exception {
        String query = "Insert into feedback values(?,?,?,?,'')";
        return update(query, Util.UUIDToByteArray(feedback.getFeedbackId()),
                Util.UUIDToByteArray(feedback.getAccountId()),
                feedback.getTitle(),
                feedback.getContent()
        );
    }

    @Override
    protected Feedback propMapping(ResultSet rs) throws Exception {
        return new Feedback(
                Util.ByteArrayToUUID(rs.getBytes("feedback_id")),
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                rs.getNString("title"),
                rs.getNString("content"),
                rs.getNString("response")
        );
    }
    
    
}
