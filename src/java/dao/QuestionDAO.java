package dao;

import dto.Question;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;

public class QuestionDAO extends AbstractDAO<Question> {
    
    public int insertMultipleQuestions(ArrayList<Question> questions) throws Exception {
        ArrayList<String> queryParts = new ArrayList<>();
        ArrayList<Object> queryParams = new ArrayList<>();
        for (Question question : questions) {
            queryParts.add("(?, ?, ?, ?, ?)");
            queryParams.add(Util.UUIDToByteArray(question.getQuestionId()));
            queryParams.add(Util.UUIDToByteArray(question.getTestId()));
            queryParams.add(Util.UUIDToByteArray(question.getResourceId()));
            queryParams.add(question.getTitle());
            queryParams.add(question.getContent());
        }
        String query = "INSERT INTO question (question_id, test_id, resource_id, title, content) VALUES " + String.join(", ", queryParts);
        return update(query, queryParams.toArray());
    }

    @Override
    protected Question propMapping(ResultSet rs) throws Exception {
        return new Question(
                Util.ByteArrayToUUID(rs.getBytes("question_id")),
                Util.ByteArrayToUUID(rs.getBytes("test_id")),
                Util.ByteArrayToUUID(rs.getBytes("resource_id")),
                rs.getNString("title"),
                rs.getNString("content")
        );
    }
    
}
