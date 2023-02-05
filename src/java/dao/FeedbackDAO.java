package dao;

import dto.Feedback;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FeedbackDAO extends AbstractDAO<Feedback> {

    public int insertFeedback(Feedback feedback) throws Exception {
        String query = "Insert into feedback values(?,?,?,?,'')";
        return update(query, Util.UUIDToByteArray(feedback.getFeedbackId()),
                Util.UUIDToByteArray(feedback.getAccountId()),
                feedback.getTitle(),
                feedback.getContent()
        );
    }

    public ArrayList<Feedback> getAllFeedbacks() throws Exception {
        String query = "SELECT fb.*, acc.role\n"
                + "FROM feedback as fb, account as acc\n"
                + "WHERE fb.account_id = acc.account_id;";
        return selectMany(query);
    }

    public ArrayList<Feedback> getAllFeedbacksSort() throws Exception {
        String query = "SELECT fb.*, acc.role\n"
                + "FROM feedback as fb, account as acc\n"
                + "WHERE fb.account_id = acc.account_id\n"
                + "ORDER BY ? ?";
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
        ArrayList<Feedback> feedbacks = new FeedbackDAO().getAllFeedbacksSort();
        for (Feedback feedback : feedbacks) {
            System.out.println(feedback);
        }
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
