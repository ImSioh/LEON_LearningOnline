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

    @Override
    protected StudentAnswer propMapping(ResultSet rs) throws Exception {
        return new StudentAnswer(
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                Util.ByteArrayToUUID(rs.getBytes("question_id")),
                Util.ByteArrayToUUID(rs.getBytes("answer_id"))
        );
    }
    
    
   

}
