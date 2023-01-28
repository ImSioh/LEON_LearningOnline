package dao;

import dto.AssignTest;
import java.sql.ResultSet;
import java.util.UUID;

public class AssignTestDAO extends AbstractDAO<AssignTest> {

     public AssignTest getAssignTestById(String id) throws Exception {
        String query = "SELECT * FROM assign_test at WHERE BIN_TO_UUID(at.account_id) = ?";
        return selectOne(query, id);
    }
     
    @Override
    protected AssignTest propMapping(ResultSet rs) throws Exception {
        return new AssignTest(
                UUID.nameUUIDFromBytes(rs.getBytes("assign_test_id")),
                UUID.nameUUIDFromBytes(rs.getBytes("test_id")),
                UUID.nameUUIDFromBytes(rs.getBytes("account_id")),
                UUID.nameUUIDFromBytes(rs.getBytes("class_id")),
                rs.getTime("duration"),
                rs.getTimestamp("start_at"),
                rs.getTimestamp("end_at"),
                rs.getTimestamp("create_time")
        );
    }
    
}
