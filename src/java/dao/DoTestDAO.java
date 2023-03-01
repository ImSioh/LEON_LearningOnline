package dao;

import dto.DoTest;
import helpers.Util;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.UUID;

public class DoTestDAO extends AbstractDAO<DoTest> {

    @Override
    protected DoTest propMapping(ResultSet rs) throws Exception {
        return new DoTest(
                Util.ByteArrayToUUID(rs.getBytes("test_id")),
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                rs.getTimestamp("start_time"),
                rs.getTimestamp("finish_time"),
                rs.getObject("score", Double.class)
        );
    }

    public DoTest getDoTestById(UUID accountId, UUID testId) throws Exception {
        String query = " select dt.* from do_test dt , test t , account a where a.account_id = dt.account_id and t.test_id = dt.test_id "
                + "and "
                + "a.account_id = ?"
                + "and dt.test_id = ?";
        return selectOne(query, Util.UUIDToByteArray(accountId), Util.UUIDToByteArray(testId));
    }

  
    

    

    

    public static void main(String[] args) throws Exception {

    }

}
