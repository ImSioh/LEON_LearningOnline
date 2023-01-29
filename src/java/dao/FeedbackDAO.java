package dao;

import dto.Feedback;
import helpers.Util;
import java.sql.ResultSet;

public class FeedbackDAO extends AbstractDAO<Feedback> {

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
