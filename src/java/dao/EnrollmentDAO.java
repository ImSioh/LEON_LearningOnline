package dao;

import dto.Enrollment;
import java.sql.ResultSet;
import java.util.UUID;

public class EnrollmentDAO extends AbstractDAO<Enrollment> {

    @Override
    protected Enrollment propMapping(ResultSet rs) throws Exception {
        return new Enrollment(
                UUID.nameUUIDFromBytes(rs.getBytes("account_id")),
                UUID.nameUUIDFromBytes(rs.getBytes("class_id")),
                rs.getTimestamp("enroll_time")
        );
    }
    
}
