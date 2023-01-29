package dao;

import dto.Answer;
import helpers.Util;
import java.sql.ResultSet;
import java.util.UUID;

public class AnswerDAO extends AbstractDAO<Answer> {

    @Override
    protected Answer propMapping(ResultSet rs) throws Exception {
        return new Answer(
                Util.ByteArrayToUUID(rs.getBytes("answer_id")),
                Util.ByteArrayToUUID(rs.getBytes("question_id")),
                rs.getNString("content"),
                rs.getBoolean("correct")
        );
    }
    
}
