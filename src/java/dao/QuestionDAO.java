package dao;

import dto.Question;
import dto.StudentAnswer;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.UUID;

public class QuestionDAO extends AbstractDAO<Question> {
    
    public int updateQuestion(Question question) throws Exception {
        String query = "UPDATE question q SET test_id = ?, resource_id = ?, question_order = ?, content = ? WHERE question_id = ?";
        return update(
                query,
                Util.UUIDToByteArray(question.getTestId()),
                Util.UUIDToByteArray(question.getResourceId()),
                question.getQuestionOrder(),
                question.getContent(),
                Util.UUIDToByteArray(question.getQuestionId())
        );
    }
    
    public int deleteMultipleQuestions(Collection<UUID> questionIds) throws Exception {
        if (questionIds.isEmpty()) return 0;
        ArrayList<String> queryParts = new ArrayList<>();
        ArrayList<Object> queryParams = new ArrayList<>();
        for (UUID questionId : questionIds) {
            queryParts.add("?");
            queryParams.add(Util.UUIDToByteArray(questionId));
        }
        String query = "DELETE FROM question WHERE question_id in (" + String.join(", ", queryParts) + ")";
        return update(query, queryParams.toArray());
    }
    
    public int insertMultipleQuestions(ArrayList<Question> questions) throws Exception {
        if (questions.isEmpty()) return 0;
        ArrayList<String> queryParts = new ArrayList<>();
        ArrayList<Object> queryParams = new ArrayList<>();
        for (Question question : questions) {
            queryParts.add("(?, ?, ?, ?, ?)");
            queryParams.add(Util.UUIDToByteArray(question.getQuestionId()));
            queryParams.add(Util.UUIDToByteArray(question.getTestId()));
            queryParams.add(Util.UUIDToByteArray(question.getResourceId()));
            queryParams.add(question.getQuestionOrder());
            queryParams.add(question.getContent());
        }
        String query = "INSERT INTO question (question_id, test_id, resource_id, question_order, content) VALUES " + String.join(", ", queryParts);
        return update(query, queryParams.toArray());
    }

    public ArrayList<Question> getQuestionByTestID(UUID id) throws Exception {
        String query = "select * from question where test_id = ? order by question_order";
        return selectMany(query, Util.UUIDToByteArray(id));
    }

    public ArrayList<Question> getWrongQuestionFromStudentAnswer(UUID testid, ArrayList<StudentAnswer> sa) throws Exception {
        ArrayList<String> queryParts = new ArrayList<>();
        ArrayList<Object> queryParams = new ArrayList<>();
        queryParams.add(Util.UUIDToByteArray(testid));
        for (StudentAnswer x : sa) {
            queryParts.add("?");
            queryParams.add(Util.UUIDToByteArray(x.getAnswerId()));
        }
        String query = "select distinct q.* from question q left join answer a on q.question_id = a.question_id where a.correct = true and q.test_id = ? and a.answer_id not in (" + String.join(", ", queryParts) + ")";
        return selectMany(
                query,
                queryParams.toArray()
        );
    }

    @Override
    protected Question propMapping(ResultSet rs) throws Exception {
        return new Question(
                Util.ByteArrayToUUID(rs.getBytes("question_id")),
                Util.ByteArrayToUUID(rs.getBytes("test_id")),
                Util.ByteArrayToUUID(rs.getBytes("resource_id")),
                rs.getInt("question_order"),
                rs.getNString("content")
        );
    }

    public static void main(String[] args) throws Exception {
        System.out.println(new QuestionDAO().getQuestionByTestID(UUID.fromString("baaa5286-aad2-4df7-a66b-5564938fdbd6")).size());
    }

}
