package dao;

import dto.Feedback;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

public class FeedbackDAO extends AbstractDAO<Feedback> {

    public int insertFeedback(Feedback feedback) throws Exception {
        String query = "Insert into feedback values(?,?,?,?,'',?)";
        return update(
                query, Util.UUIDToByteArray(feedback.getFeedbackId()),
                Util.UUIDToByteArray(feedback.getAccountId()),
                feedback.getTitle(),
                feedback.getContent(),
                feedback.getCreateTime()
        );
    }
    
     public int updateFeedback(String response, UUID feebackId) throws Exception {
        String query = "update feedback set response = ? where feedback_id = ?";
        return update(query, response , Util.UUIDToByteArray(feebackId));
    }

    public ArrayList<Feedback> getAllFeedbacks() throws Exception {
        String query = "SELECT fb.*, acc.role\n"
                + "FROM feedback as fb, account as acc\n"
                + "WHERE fb.account_id = acc.account_id;";
        return selectMany(query);
    }
    
     public Feedback getFeedbackByFeedbackId(UUID feedbackId) throws Exception {
         String query = "SELECT * FROM feedback f WHERE f.feedback_id = ?";
        return selectOne(query, Util.UUIDToByteArray(feedbackId));
    }
    

    public ArrayList<Feedback> getAllFeedbacksSort(String criteria, String sort) throws Exception {
        String query = "SELECT fb.*, acc.role\n"
                + "FROM feedback as fb, account as acc\n"
                + "WHERE fb.account_id = acc.account_id\n"
                + "ORDER BY " + criteria + " " + sort;
        return selectMany(query);
    }

    public ArrayList<Feedback> getAllFeedbacksAndPaging(int elements, int page) throws Exception {
        String query = "SELECT fb.*, acc.role\n"
                + "FROM feedback as fb, account as acc\n"
                + "WHERE fb.account_id = acc.account_id\n"
                + "limit ? offset ?;";
        return selectMany(query, elements, page);
    }

    public static void main(String[] args) throws Exception {
//        ArrayList<Feedback> feedbacks = new FeedbackDAO().getAllFeedbacksAndPaging(3, 0);
       
        System.out.println(new FeedbackDAO().getFeedbackByFeedbackId(UUID.fromString("31000000-0000-0000-0000-000000000000")));
    }

    @Override
    protected Feedback propMapping(ResultSet rs) throws Exception {
        return new Feedback(
                Util.ByteArrayToUUID(rs.getBytes("feedback_id")),
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                rs.getNString("title"),
                rs.getNString("content"),
                rs.getNString("response"),
                rs.getTimestamp("create_time")
        );
    }

}
