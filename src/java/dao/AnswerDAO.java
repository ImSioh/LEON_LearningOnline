package dao;

import dto.Answer;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AnswerDAO extends AbstractDAO<Answer> {
    
    public int insertMultipleAnswers(ArrayList<Answer> answers) throws Exception {
        ArrayList<String> queryParts = new ArrayList<>();
        ArrayList<Object> queryParams = new ArrayList<>();
        for (Answer answer : answers) {
            queryParts.add("(?, ?, ?, ?, ?)");
            queryParams.add(Util.UUIDToByteArray(answer.getAnswerId()));
            queryParams.add(Util.UUIDToByteArray(answer.getQuestionId()));
            queryParams.add(Util.UUIDToByteArray(answer.getResourceId()));
            queryParams.add(answer.getContent());
            queryParams.add(answer.isCorrect());
        }
        String query = "INSERT INTO answer (answer_id, question_id, resource_id, content, correct) VALUES " + String.join(", ", queryParts);
        return update(query, queryParams.toArray());
    }

    @Override
    protected Answer propMapping(ResultSet rs) throws Exception {
        return new Answer(
                Util.ByteArrayToUUID(rs.getBytes("answer_id")),
                Util.ByteArrayToUUID(rs.getBytes("question_id")),
                Util.ByteArrayToUUID(rs.getBytes("resource_id")),
                rs.getNString("content"),
                rs.getBoolean("correct")
        );
    }
    
}
