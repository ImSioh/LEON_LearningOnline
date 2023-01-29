package dao;

import dto.Enrollment;
import helpers.Util;
import java.sql.ResultSet;

public class EnrollmentDAO extends AbstractDAO<Enrollment> {

    @Override
    protected Enrollment propMapping(ResultSet rs) throws Exception {
        return new Enrollment(
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                Util.ByteArrayToUUID(rs.getBytes("class_id")),
                rs.getTimestamp("enroll_time")
        );
    }
    
}
