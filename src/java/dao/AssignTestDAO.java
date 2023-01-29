package dao;

import dto.AssignTest;
import helpers.Util;
import java.sql.ResultSet;
import java.util.UUID;

public class AssignTestDAO extends AbstractDAO<AssignTest> {

     public AssignTest getAssignTestById(UUID id) throws Exception {
        String query = "SELECT * FROM assign_test at WHERE at.account_id = ?";
        return selectOne(query, Util.UUIDToByteArray(id));
    }
     
    @Override
    protected AssignTest propMapping(ResultSet rs) throws Exception {
        return new AssignTest(
                Util.ByteArrayToUUID(rs.getBytes("assign_test_id")),
                Util.ByteArrayToUUID(rs.getBytes("test_id")),
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                Util.ByteArrayToUUID(rs.getBytes("class_id")),
                rs.getTime("duration"),
                rs.getTimestamp("start_at"),
                rs.getTimestamp("end_at"),
                rs.getTimestamp("create_time")
        );
    }
    
}
