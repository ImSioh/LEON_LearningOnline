package dao;

import dto.Test;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

public class TestDAO extends AbstractDAO<Test> {

    public ArrayList<Test> getListTitleTest(UUID classId) throws Exception {
        String query = "select * from online_learning.test\n"
                + "where class_id = ?";
        return selectMany(query, Util.UUIDToByteArray(classId));
    }
    
     public Test getTitleTest(UUID classId) throws Exception {
        String query = "select * from online_learning.test\n"
                + "where class_id = ?";
        return selectOne(query, Util.UUIDToByteArray(classId));
    }

    public int insertTest(Test test) throws Exception {
        String query = "INSERT INTO test (test_id, class_id, title, description, start_at, end_at, duration, allow_review, create_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return update(
                query,
                Util.UUIDToByteArray(test.getTestId()),
                Util.UUIDToByteArray(test.getClassId()),
                test.getTitle(),
                test.getDescription(),
                test.getStartAt(),
                test.getEndAt(),
                test.getDescription(),
                test.isAllowReview(),
                test.getCreateTime()
        );
    }

    @Override
    protected Test propMapping(ResultSet rs) throws Exception {
        return new Test(
                Util.ByteArrayToUUID(rs.getBytes("test_id")),
                Util.ByteArrayToUUID(rs.getBytes("class_id")),
                rs.getNString("title"),
                rs.getNString("description"),
                rs.getTimestamp("start_at"),
                rs.getTimestamp("end_at"),
                rs.getDouble("duration"),
                rs.getBoolean("allow_review"),
                rs.getTimestamp("create_time")
        );
    }

}
