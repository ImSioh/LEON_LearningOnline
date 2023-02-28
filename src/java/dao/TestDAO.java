package dao;

import dto.Test;
import helpers.Util;
import java.sql.ResultSet;

public class TestDAO extends AbstractDAO<Test> {

    @Override
    protected Test propMapping(ResultSet rs) throws Exception {
        return new Test(
                Util.ByteArrayToUUID(rs.getBytes("test_id")),
                Util.ByteArrayToUUID(rs.getBytes("class_id")),
                rs.getNString("title"),
                rs.getNString("description"),
                rs.getTimestamp("start_at"),
                rs.getTimestamp("end_at"),
                rs.getTime("duration "),
                rs.getTimestamp("create_time")
        );
    }
    
}
