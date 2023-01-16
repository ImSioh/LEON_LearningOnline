package dao;

import dto.Answer;
import java.sql.ResultSet;
import java.util.UUID;

public class AnswerDAO extends AbstractDAO<Answer> {

    @Override
    protected Answer propMapping(ResultSet rs) throws Exception {
        return new Answer(
                UUID.nameUUIDFromBytes(rs.getBytes("answer_id")),
                UUID.nameUUIDFromBytes(rs.getBytes("question_id")),
                rs.getNString("content"),
                rs.getBoolean("correct")
        );
    }
    
}
