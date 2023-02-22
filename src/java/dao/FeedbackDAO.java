package dao;

import dto.Feedback;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;
import java.util.logging.Logger;

public class FeedbackDAO extends AbstractDAO<Feedback> {
private static final Logger logger = Logger.getLogger(FeedbackDAO.class.getName());

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
        return update(query, response, Util.UUIDToByteArray(feebackId));
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

    public ArrayList<Feedback> getFeedbackByAccountId(UUID accountId) throws Exception {
        String query = "SELECT * FROM feedback f WHERE f.account_id = ?";
        return selectMany(query, Util.UUIDToByteArray(accountId));
    }

    public ArrayList<Feedback> getAllFeedbacksSort(String criteria, String sort) throws Exception {
        String query = "SELECT fb.*, acc.role\n"
                + "FROM feedback as fb, account as acc\n"
                + "WHERE fb.account_id = acc.account_id\n"
                + "ORDER BY " + criteria + " " + sort;
        return selectMany(query);
    }

    public ArrayList<Feedback> getAllFeedbacksSearch(String criteria, String keyword) throws Exception {
        String query = "SELECT fb.*, acc.role\n"
                + "FROM feedback as fb, account as acc\n"
                + "WHERE fb.account_id = acc.account_id\n"
                + "AND " + criteria + " LIKE " + "\'%" + keyword + "%\';";
        return selectMany(query);
    }

    public ArrayList<Feedback> getAllFeedbacksAndPaging(int elements, int page) throws Exception {
        String query = "SELECT fb.*, acc.role\n"
                + "FROM feedback as fb, account as acc\n"
                + "WHERE fb.account_id = acc.account_id\n"
                + "LIMIT ? OFFSET ?;";
        return selectMany(query, elements, page);
    }

    public ArrayList<Feedback> getAllFeedbacksSortAndPaging(String criteria, String sort, int elements, int page) throws Exception {
        String query = "SELECT fb.*, acc.role\n"
                + "FROM feedback as fb, account as acc\n"
                + "WHERE fb.account_id = acc.account_id\n"
                + "ORDER BY " + criteria + " " + sort + "\n"
                + "LIMIT ? OFFSET ?;";
        return selectMany(query, elements, page);
    }

    public ArrayList<Feedback> getAllFeedbacksSearchAndPaging(String criteria, String keyword, int elements, int page) throws Exception {
        String query = "SELECT fb.*, acc.role\n"
                + "FROM feedback as fb, account as acc\n"
                + "WHERE fb.account_id = acc.account_id\n"
                + "AND " + criteria + " LIKE " + "\'%" + keyword + "%\'\n"
                + "LIMIT ? OFFSET ?;";
        return selectMany(query);
    }

    public ArrayList<Feedback> getAllFeedbacksSearchSortAndPaging(String criteriaSearch, String keyword,
            String criteriaSort, String sort, int elements, int page) throws Exception {
        String query = "SELECT fb.*, acc.role\n"
                + "FROM feedback as fb, account as acc\n"
                + "WHERE fb.account_id = acc.account_id\n"
                + "AND " + criteriaSearch + " LIKE " + "\'%" + keyword + "%\'\n"
                + "ORDER BY " + criteriaSort + " " + sort + "\n"
                + "LIMIT ? OFFSET ?;";
        return selectMany(query, elements, page);
    }

    public static void main(String[] args) throws Exception {
        ArrayList<Feedback> feedbacks = new ArrayList<>();
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        String criteriaSearch = "email";
        String keyword = "p";
        String criteriaSort = "";
        String sort = "desc";
        int element = 5;
        int page = 1;
        feedbacks = feedbackDAO.getAllFeedbacksSearchSortAndPaging(criteriaSearch, keyword, criteriaSort, sort, element, page);
//        feedbacks = feedbackDAO.getAllFeedbacksSearchAndPaging(criteriaSearch, keyword, element, page);
        for (Feedback feedback : feedbacks) {
            System.out.println(feedback);
        }
//        int element = 10;
//        int page = 1;
//        int size = feedbackDAO.getAllFeedbacks().size();
//        int numberOfPage;
//        feedbacks = feedbackDAO.getAllFeedbacksSearchAndPaging(criteriaSearch, keyword, element, page);
//        numberOfPage = (int) Math.ceil(feedbackDAO.getAllFeedbacksSearch(criteriaSearch, keyword).size() / (float) element);
//
//        System.out.println("size=" + size);
//        System.out.println("numberofpage=" + numberOfPage);
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
