package dao;

import dto.Test;
import helpers.Util;
import java.sql.ResultSet;

public class TestDAO extends AbstractDAO<Test> {

    @Override
    protected Test propMapping(ResultSet rs) throws Exception {
        return new Test(
                Util.ByteArrayToUUID(rs.getBytes("test_id")),
                rs.getNString("title"),
                rs.getNString("description")
        );
    }
    
}
