package dao;

import dto.ClassObject;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

public class ClassObjectDAO extends AbstractDAO<ClassObject> {

    public ArrayList<ClassObject> getListClassByAccId(String id) throws Exception {
        String query = "SELECT * FROM class c WHERE BIN_TO_UUID(c.account_id) = ?";
        return selectMany(query, id);
    }

    @Override
    protected ClassObject propMapping(ResultSet rs) throws Exception {
        return new ClassObject(
                UUID.nameUUIDFromBytes(rs.getBytes("class_id")),
                UUID.nameUUIDFromBytes(rs.getBytes("account_id")),
                rs.getNString("name"),
                rs.getNString("code"),
                rs.getBoolean("enroll_approve"),
                rs.getString("class_picture"),
                rs.getBoolean("hidden"),
                rs.getTimestamp("create_time")
        );
    }

}
