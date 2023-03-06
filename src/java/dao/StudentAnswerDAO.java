package dao;

import dto.StudentAnswer;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

public class StudentAnswerDAO extends AbstractDAO<StudentAnswer> {

    public int insertStudentAnswer(ArrayList<StudentAnswer> sa) throws Exception {
        if (sa.isEmpty()) {
            return 0;
        }
        ArrayList<String> queryParts = new ArrayList<>();
        ArrayList<Object> queryParams = new ArrayList<>();
        for (StudentAnswer x : sa) {
            queryParts.add("(?, ?, ?)");
            queryParams.add(Util.UUIDToByteArray(x.getAccountId()));
            queryParams.add(Util.UUIDToByteArray(x.getQuestionId()));
            queryParams.add(Util.UUIDToByteArray(x.getAnswerId()));
        }
        String query = "INSERT INTO student_answer (account_id, question_id, answer_id) VALUES " + String.join(", ", queryParts);
        return update(query, queryParams.toArray());
    }

    public ArrayList<StudentAnswer> getStudentAnswerByQuestionID(UUID id) throws Exception {
        String query = "select * from online_learning.student_answer where question_id = ?";
        return selectMany(query, Util.UUIDToByteArray(id));
    }

    public ArrayList<UUID> getStudentAnswerByQuestionID(UUID TestId, UUID accountID) throws Exception {
        String query = "SELECT * FROM test t, student_answer stan, question q, account acc\n"
                + "WHERE stan.question_id = q.question_id \n"
                + "AND q.test_id = t.test_id\n"
                + "AND acc.account_id = stan.account_id\n"
                +"and q.test_id = ? and acc.account_id = ?";
        ArrayList<StudentAnswer> studentAnswers =  selectMany(query, Util.UUIDToByteArray(TestId), Util.UUIDToByteArray(accountID));
        ArrayList<UUID> uuids = new ArrayList<>();
        for (StudentAnswer studentAnswer : studentAnswers) {
            uuids.add(studentAnswer.getAnswerId());
        }
        return uuids;
    }

    @Override
    protected StudentAnswer propMapping(ResultSet rs) throws Exception {
        return new StudentAnswer(
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                Util.ByteArrayToUUID(rs.getBytes("question_id")),
                Util.ByteArrayToUUID(rs.getBytes("answer_id"))
        );
    }
    
    
   

}
