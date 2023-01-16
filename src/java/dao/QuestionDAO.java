package dao;

import dto.Question;
import java.sql.ResultSet;
import java.util.UUID;

public class QuestionDAO extends AbstractDAO<Question> {

    @Override
    protected Question propMapping(ResultSet rs) throws Exception {
        return new Question(
                UUID.nameUUIDFromBytes(rs.getBytes("question_id")),
                rs.getNString("content")
        );
    }
    
}
