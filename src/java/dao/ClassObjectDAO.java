package dao;

import dto.ClassObject;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ClassObjectDAO extends AbstractDAO<ClassObject> {

    public ArrayList<ClassObject> getListClassByAccId(String id) throws Exception {
        String query = "SELECT * FROM class c WHERE BIN_TO_UUID(c.account_id) = ?";
        return selectMany(query, id);
    }
    
    public boolean isCodeExist(String code) throws Exception {
        String query = "SELECT COUNT(*) FROM class c WHERE c.code = ?";
        return selectScalar(query, Long.class, code) > 0;
    }
    
    public int insertClass(ClassObject classObject) throws Exception {
        String query = "INSERT INTO class VALUES (?, ?, ?, ?, ?, ?, FALSE, ?);";
        return update(
                query,
                Util.UUIDToByteArray(classObject.getClassId()),
                Util.UUIDToByteArray(classObject.getAccountId()),
                classObject.getName(),
                classObject.getCode(),
                classObject.isEnrollApprove(),
                classObject.getClassPicture(),
                classObject.getCreateTime()
        );
    }

    @Override
    protected ClassObject propMapping(ResultSet rs) throws Exception {
        return new ClassObject(
                Util.ByteArrayToUUID(rs.getBytes("class_id")),
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                rs.getNString("name"),
                rs.getNString("code"),
                rs.getBoolean("enroll_approve"),
                rs.getString("class_picture"),
                rs.getBoolean("hidden"),
                rs.getTimestamp("create_time")
        );
    }

}
