package dao;

import dto.Answer;
import dto.DoTest;
import dto.Question;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

public class DoTestDAO extends AbstractDAO<DoTest> {

    public DoTest getDoTest(UUID accId, UUID testId) throws Exception {
        String query = "select * from online_learning.do_test\n"
                + "where account_id = ? and test_id = ?";
        return selectOne(query, Util.UUIDToByteArray(accId), Util.UUIDToByteArray(testId));
    }

    public Double getScoreTest(UUID classId, UUID accId) throws Exception {
        String query = "SELECT AVG(dt.score) FROM do_test dt\n"
                + "LEFT JOIN test t ON dt.test_id = t.test_id\n"
                + "WHERE t.class_id = ? AND dt.account_id = ?";
        return selectScalar(query, Double.class, Util.UUIDToByteArray(classId), Util.UUIDToByteArray(accId));
    }

    public DoTest getDoTestById(UUID accountId, UUID testId) throws Exception {
        String query = " select dt.* from do_test dt , test t , account a where a.account_id = dt.account_id and t.test_id = dt.test_id "
                + "and "
                + "a.account_id = ?"
                + "and dt.test_id = ?";
        return selectOne(query, Util.UUIDToByteArray(accountId), Util.UUIDToByteArray(testId));
    }

    public int insertDoTest(DoTest dotest) throws Exception {
        String query = "insert into do_test(test_id, account_id, start_time, finish_time, score) values (?, ?, ?, ?, ?)";
        return update(
                query,
                Util.UUIDToByteArray(dotest.getTestId()),
                Util.UUIDToByteArray(dotest.getAccountId()),
                dotest.getStartTime(),
                dotest.getFinishTime(),
                dotest.getScore()
        );
    }

    public int updateDoTest(DoTest dotest) throws Exception {
        String query = "update online_learning.do_test\n"
                + "set\n"
                + "start_time = ?,\n"
                + "finish_time = ?,\n"
                + "score = ?\n"
                + "where test_id = ? and account_id = ?";
        return update(
                query,
                dotest.getStartTime(),
                dotest.getFinishTime(),
                dotest.getScore(),
                Util.UUIDToByteArray(dotest.getTestId()),
                Util.UUIDToByteArray(dotest.getAccountId())
        );
    }

    @Override
    protected DoTest propMapping(ResultSet rs) throws Exception {
        return new DoTest(
                Util.ByteArrayToUUID(rs.getBytes("test_id")),
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                rs.getTimestamp("start_time"),
                rs.getTimestamp("finish_time"),
                rs.getObject("score", Double.class)
        );
    }

    public static void main(String[] args) throws Exception {

        UUID tid = UUID.fromString("0246b559-40e9-4c13-9b69-bea737810991");
        ArrayList<Question> ques = new QuestionDAO().getQuestionByTestID(tid);
        
//        System.out.println(ques);
        for (Question q : ques) {
            ArrayList<Answer> anss = new AnswerDAO().getAnswerByQuestionID(q.getQuestionId());
            for (Answer ans : anss) {
                System.out.println(ans);
            }
            System.out.println("");
        }
        
        
        
    }
    
    public ArrayList<DoTest> getListDoTestByAIdAndCId(UUID accId, UUID testId) throws Exception {
        String query = "select * from online_learning.do_test\n"
                + "where account_id = ? and test_id = ?";
        return selectMany(query, Util.UUIDToByteArray(accId), Util.UUIDToByteArray(testId));
    }

}
