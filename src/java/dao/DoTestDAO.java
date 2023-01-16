package dao;

import dto.DoTest;
import java.sql.ResultSet;
import java.util.UUID;

public class DoTestDAO extends AbstractDAO<DoTest> {

    @Override
    protected DoTest propMapping(ResultSet rs) throws Exception {
        return new DoTest(
                UUID.nameUUIDFromBytes(rs.getBytes("assign_test_id")),
                UUID.nameUUIDFromBytes(rs.getBytes("account_id")),
                rs.getTimestamp("start_time"),
                rs.getTimestamp("finish_time")
        );
    }
    
}
