package dao;

import dto.Question;
import dto.Test;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

public class TestDAO extends AbstractDAO<Test> {

    public int insertTest(Test test) throws Exception {
        String query = "INSERT INTO test (test_id, class_id, resource_id, title, description, start_at, end_at, duration, allow_review, create_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return update(
                query,
                Util.UUIDToByteArray(test.getTestId()),
                Util.UUIDToByteArray(test.getClassId()),
                Util.UUIDToByteArray(test.getResourceId()),
                test.getTitle(),
                test.getDescription(),
                test.getStartAt(),
                test.getEndAt(),
                test.getDuration(),
                test.isAllowReview(),
                test.getCreateTime()
        );
    }

    public int editTest(Test test) throws Exception {
        String query
                = "UPDATE online_learning.test\n"
                + "SET  title = ?, description = ?, start_at = ?, end_at = ?,"
                + "duration = ?, allow_review = ?, create_time = ?\n"
                + "WHERE test_id = ?;";
        return update(
                query,
                test.getTitle(),
                test.getDescription(),
                test.getStartAt(),
                test.getEndAt(),
                test.getDuration(),
                test.isAllowReview(),
                test.getCreateTime(),
                Util.UUIDToByteArray(test.getTestId())
        );
    }

    public Test getTestById(UUID testid) throws Exception {
        String query = "select * from test\n"
                + "where test_id = ?";
        return selectOne(query, Util.UUIDToByteArray(testid));
    }

    public ArrayList<Test> viewListTest(UUID classid) throws Exception {
        String query = "select * from test\n"
                + "where class_id = ?\n"
                + "order by create_time";
        return selectMany(query, Util.UUIDToByteArray(classid));
    }

    public Test getTestByTestID(UUID id) throws Exception {
        String query = "select * from test where test_id = ?";
        return selectOne(query, Util.UUIDToByteArray(id));
    }

    public Test getTestWithAllData(UUID testid) throws Exception {
        AnswerDAO adao = new AnswerDAO();
        Test test = getTestByTestID(testid);
        test.questions = new QuestionDAO().getQuestionByTestID(testid);
        for (Question q : test.questions) {
            q.answers = adao.getAnswerByQuestionID(q.getQuestionId());
        }
        return test;
    }

    public String convertToAlphabet(int n) {
        if (n < 1 || n > 26) {
            throw new IllegalArgumentException("Input value must be between 1 and 26 inclusive.");
        }
        char c = (char) (n + 64); // 65 is the ASCII code for 'A'
        return Character.toString(c);
    }

    public ArrayList<Test> getListTitleTest(UUID classId) throws Exception {
        String query = "select * from online_learning.test\n"
                + "where class_id = ?";
        return selectMany(query, Util.UUIDToByteArray(classId));
    }

    public Test getTitleTest(UUID classId) throws Exception {
        String query = "select * from online_learning.test\n"
                + "where class_id = ?";
        return selectOne(query, Util.UUIDToByteArray(classId));
    }

    @Override
    protected Test propMapping(ResultSet rs) throws Exception {
        return new Test(
                Util.ByteArrayToUUID(rs.getBytes("test_id")),
                Util.ByteArrayToUUID(rs.getBytes("class_id")),
                Util.ByteArrayToUUID(rs.getBytes("resource_id")),
                rs.getNString("title"),
                rs.getNString("description"),
                rs.getTimestamp("start_at"),
                rs.getTimestamp("end_at"),
                rs.getDouble("duration"),
                rs.getBoolean("allow_review"),
                rs.getTimestamp("create_time")
        );
    }

    public static void main(String[] args) throws Exception {
//        System.out.println(new TestDAO().getTestWithAllData(UUID.fromString("9f3fa1d9-a6c4-4682-b79e-4a73e1999711")).questions.get(0).getResourceId());
        System.out.println(new ResourceDAO().getResourcesById(new TestDAO().getTestWithAllData(UUID.fromString("fbb28035-34d0-49a3-b6d7-17462d08d2ab")).questions.get(0).getResourceId()).getUrl());
    }

}
