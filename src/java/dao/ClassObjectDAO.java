package dao;

import dto.ClassObject;
import dto.Enrollment;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

public class ClassObjectDAO extends AbstractDAO<ClassObject> {

    public ArrayList<ClassObject> getClassByAccId(UUID id) throws Exception {
        String query = "SELECT * FROM class c WHERE c.account_id = ?";
        return selectMany(query, Util.UUIDToByteArray(id));
    }

    public ArrayList<ClassObject> getListClassTByNameID(String name, UUID id) throws Exception {
        String query = "SELECT * FROM class a WHERE a.name LIKE ? and a.account_id = ?";
        return selectMany(query, "%" + name + "%", Util.UUIDToByteArray(id));
    }

    public ArrayList<ClassObject> getListClassSByNameID(String name, UUID id) throws Exception {
        String query = "select * from class c \n"
                + " join enrollment e on c.class_id = e.class_id\n"
                + " join account a on e.account_id = a.account_id and c.name LIKE ? and a.account_id = ?";
        return selectMany(query, "%" + name + "%", Util.UUIDToByteArray(id));
    }

    public ArrayList<ClassObject> getClassNameCodeByAccId(UUID id) throws Exception {
        String query = "select * from class c \n"
                + " join enrollment e on c.class_id = e.class_id\n"
                + " join account a on e.account_id = a.account_id and a.account_id = ?";
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

    public ClassObject getClassByCode(String code) throws Exception {
        String query = "SELECT * FROM class c where c.code = ?;";
        return selectOne(query, code);
    }
    
    public ClassObject getClassById(UUID classId) throws Exception {
        String query = "SELECT * FROM class c WHERE c.class_id = ?";
        return selectOne(query, Util.UUIDToByteArray(classId));
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
    
    public int updateClass(ClassObject classObject) throws Exception {
        String query = "UPDATE class SET name = ?, enroll_approve = ?, hidden = ? WHERE class_id = ?";
        return update(
                query,
                classObject.getName(),
                classObject.isEnrollApprove(),
                classObject.isHidden(),
                Util.UUIDToByteArray(classObject.getClassId())
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

        ArrayList<ClassObject> classObj = new ClassObjectDAO().getListClassSByNameID("b", UUID.fromString("5010ed92-4af1-43c2-88eb-4a4e91999d89"));
//        ClassObject co = new ClassObjectDAO().getClassByAccIdN(UUID.fromString("46459f52-7d08-43b1-9e90-0d31d326f683"));
        for (ClassObject c : classObj) {
            System.out.println(c.getCode());
        }
    }
}
