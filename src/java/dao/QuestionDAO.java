package dao;

import dto.Question;
import helpers.Util;
import java.sql.ResultSet;

public class QuestionDAO extends AbstractDAO<Question> {

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
