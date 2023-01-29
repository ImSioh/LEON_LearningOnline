package dao;

import dto.Post;
import helpers.Util;
import java.sql.ResultSet;

public class PostDAO extends AbstractDAO<Post> {

    @Override
    protected Post propMapping(ResultSet rs) throws Exception {
        return new Post(
                Util.ByteArrayToUUID(rs.getBytes("post_id")),
                Util.ByteArrayToUUID(rs.getBytes("account_id")),
                Util.ByteArrayToUUID(rs.getBytes("class_id")),
                rs.getBoolean("pin"),
                rs.getNString("content"),
                rs.getTimestamp("create_time")
        );
    }
    
}
