package dao;

import dto.Test;
import java.sql.ResultSet;
import java.util.UUID;

public class TestDAO extends AbstractDAO<Test> {

    @Override
    protected Test propMapping(ResultSet rs) throws Exception {
        return new Test(
                UUID.nameUUIDFromBytes(rs.getBytes("test_id")),
                rs.getNString("title"),
                rs.getNString("description")
        );
    }
    
}
