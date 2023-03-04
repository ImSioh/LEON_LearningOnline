package dao;

import dto.Answer;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

public class AnswerDAO extends AbstractDAO<Answer> {

    public int insertMultipleAnswers(ArrayList<Answer> answers) throws Exception {
        ArrayList<String> queryParts = new ArrayList<>();
        ArrayList<Object> queryParams = new ArrayList<>();
        for (Answer answer : answers) {
            queryParts.add("(?, ?, ?, ?, ?, ?)");
            queryParams.add(Util.UUIDToByteArray(answer.getAnswerId()));
            queryParams.add(Util.UUIDToByteArray(answer.getQuestionId()));
            queryParams.add(Util.UUIDToByteArray(answer.getResourceId()));
            queryParams.add(answer.getAnswerOrder());
            queryParams.add(answer.getContent());
            queryParams.add(answer.isCorrect());
        }
        String query = "INSERT INTO answer (answer_id, question_id, resource_id, answer_order, content, correct) VALUES " + String.join(", ", queryParts);
        return update(query, queryParams.toArray());
    }

    public ArrayList<Answer> getAnswerByQuestionID(UUID id) throws Exception {
        String query = "select * from answer where question_id = ? order by answer_order";
        return selectMany(query, Util.UUIDToByteArray(id));
    }

    @Override
    protected Answer propMapping(ResultSet rs) throws Exception {
        return new Answer(
                Util.ByteArrayToUUID(rs.getBytes("answer_id")),
                Util.ByteArrayToUUID(rs.getBytes("question_id")),
                Util.ByteArrayToUUID(rs.getBytes("resource_id")),
                rs.getInt("answer_order"),
                rs.getNString("content"),
                rs.getBoolean("correct")
        );
    }
   

}
