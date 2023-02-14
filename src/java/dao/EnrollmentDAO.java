package dao;

import dto.Enrollment;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

public class EnrollmentDAO extends AbstractDAO<Enrollment> {
    
    public boolean isJoined(UUID accountId, UUID classId) throws Exception {
        String query = "SELECT COUNT(*) FROM enrollment e WHERE e.account_id = ? AND e.class_id = ? AND e.accepted = TRUE";
        return selectScalar(query, Long.class, Util.UUIDToByteArray(accountId), Util.UUIDToByteArray(classId)) > 0;
    }

    public ArrayList<Enrollment> getListEnrollmentById(UUID id) throws Exception {
        String query = "SELECT * FROM enrollment e where e.account_id = ?";
        return selectMany(query, Util.UUIDToByteArray(id));
    }
    
    public Enrollment getEnrollmentByClassId(UUID id) throws Exception {
        String query = "SELECT * FROM enrollment e where e.class_id = ?";
        return selectOne(query, Util.UUIDToByteArray(id));
    }
    
    public int leaveClass(UUID id) throws Exception {
        String query = "delete from enrollment where class_id = ?";
        return update(
                query,
                Util.UUIDToByteArray(id)
        );
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
    
    public int updateEnrollment(UUID Cid) throws Exception {
        String query = "UPDATE enrollment SET accepted = true WHERE class_id = ?";
        return update(
                query,
                
                Util.UUIDToByteArray(Cid)
        );
    }
    
    public static void main(String[] args) throws Exception {
        System.out.println(new EnrollmentDAO().isJoined(
                UUID.fromString("7f44bf31-be32-4b20-800b-642cd0a551df"),
                UUID.fromString("19880897-a45a-41c2-8233-fd5be18253c1")
        ));
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
