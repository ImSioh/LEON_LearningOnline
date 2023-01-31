package dao;

import dto.ClassObject;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ClassObjectDAO extends AbstractDAO<ClassObject> {

    public ArrayList<ClassObject> getClassByAccId(UUID id) throws Exception {
        String query = "SELECT * FROM class c WHERE c.account_id = ?";
        return selectMany(query, Util.UUIDToByteArray(id));
    }
    
    public ArrayList<ClassObject> getAllClass() throws Exception {
        String query = "SELECT * FROM class c";
        return selectMany(query);
    }
    
    public ClassObject getClassByAccIdN(UUID id) throws Exception {
        String query = "SELECT * FROM class c where c.account_id = ?;";
        return selectOne(query, Util.UUIDToByteArray(id));
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
    
    public static void main(String[] args) throws Exception {
        ArrayList<ClassObject> classObj = new ClassObjectDAO().getAllClass();
//        ArrayList<ClassObject> classObj = new ClassObjectDAO().getClassByAccId(UUID.fromString("e6ef22cf-060b-4e16-91a0-359408178fb0"));
//        ClassObject co = new ClassObjectDAO().getClassByAccIdN(UUID.fromString("e6ef22cf-060b-4e16-91a0-359408178fb0"));
        for (ClassObject c : classObj) {
            System.out.println(c.getCode());
        }
    }

}
