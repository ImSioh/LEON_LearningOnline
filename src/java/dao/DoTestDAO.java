package dao;

import dto.DoTest;
import helpers.Util;
import java.sql.ResultSet;

public class DoTestDAO extends AbstractDAO<DoTest> {

    @Override
    protected DoTest propMapping(ResultSet rs) throws Exception {
        return new DoTest(
                Util.ByteArrayToUUID(rs.getBytes("assign_test_id")),
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                rs.getTimestamp("start_time"),
                rs.getTimestamp("finish_time"),
                rs.getObject("score", Double.class)
        );
    }
    
}
