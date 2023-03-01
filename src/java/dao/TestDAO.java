package dao;

import dto.Test;
import helpers.Util;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

public class TestDAO extends AbstractDAO<Test> {

    public int insertTest(Test test) throws Exception {
        String query = "INSERT INTO test (test_id, class_id, title, description, start_at, end_at, duration, allow_review, create_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return update(
                query,
                Util.UUIDToByteArray(test.getTestId()),
                Util.UUIDToByteArray(test.getClassId()),
                test.getTitle(),
                test.getDescription(),
                test.getStartAt(),
                test.getEndAt(),
                test.getDescription(),
                test.isAllowReview(),
                test.getCreateTime()
        );
    }

    public ArrayList<Test> viewListTest(UUID classid, UUID accountid) throws Exception {
        String query = "select * from test t, class c, account a \n"
                + "where t.class_id = c.class_id\n"
                + "and c.account_id = a.account_id\n"
                + "and c.class_id = ?\n"
                + "and a.account_id = ?\n";
        return selectMany(query, Util.UUIDToByteArray(classid), Util.UUIDToByteArray(accountid));
    }

    public ArrayList<Test> viewListTest(UUID classid) throws Exception {
        String query = "select * from test t\n"
                + "where t.class_id = ?\n";
        return selectMany(query, Util.UUIDToByteArray(classid));
    }

    public static void main(String[] args) throws Exception {
        TestDAO tDAO = new TestDAO();
        ArrayList<Test> viewTest = new ArrayList<>();
        String cid = "";
        String aid = "agea";
        UUID classid = UUID.fromString(cid);
        UUID accountid = UUID.fromString(aid);
        viewTest = tDAO.viewListTest(classid, accountid);
        for (Test test : viewTest) {
            System.out.println(test);
        }
    }

    @Override
    protected Test propMapping(ResultSet rs) throws Exception {
        return new Test(
                Util.ByteArrayToUUID(rs.getBytes("test_id")),
                Util.ByteArrayToUUID(rs.getBytes("class_id")),
                rs.getNString("title"),
                rs.getNString("description"),
                rs.getTimestamp("start_at"),
                rs.getTimestamp("end_at"),
                rs.getDouble("duration"),
                rs.getBoolean("allow_review"),
                rs.getTimestamp("create_time")
        );
    }

}
