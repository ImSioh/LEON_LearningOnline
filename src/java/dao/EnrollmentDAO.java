package dao;

import dto.Enrollment;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

public class EnrollmentDAO extends AbstractDAO<Enrollment> {

    public ArrayList<Enrollment> getListEnrollmentById(UUID id) throws Exception {
        String query = "SELECT * FROM enrollment e where e.account_id = ?";
        return selectMany(query, Util.UUIDToByteArray(id));
    }
    
    public int insertEnrollment(Enrollment enrollment) throws Exception {
        String query = "INSERT INTO enrollment VALUES (?, ?, ?, ?)";
        return update(
                query,
                Util.UUIDToByteArray(enrollment.getAccountId()),
                Util.UUIDToByteArray(enrollment.getClassId()),
                enrollment.isAccepted(),
                enrollment.getEnrollTime()
        );
    }
    
    @Override
    protected Enrollment propMapping(ResultSet rs) throws Exception {
        return new Enrollment(
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                Util.ByteArrayToUUID(rs.getBytes("class_id")),
                rs.getBoolean("accepted"),
                rs.getTimestamp("enroll_time")
        );
    }
    
}
