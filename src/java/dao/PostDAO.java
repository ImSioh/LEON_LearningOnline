package dao;

import dto.Post;
import java.sql.ResultSet;
import java.util.UUID;

public class PostDAO extends AbstractDAO<Post> {

    @Override
    protected Post propMapping(ResultSet rs) throws Exception {
        return new Post(
                UUID.nameUUIDFromBytes(rs.getBytes("post_id")),
                UUID.nameUUIDFromBytes(rs.getBytes("account_id")),
                UUID.nameUUIDFromBytes(rs.getBytes("class_id")),
                rs.getBoolean("pin"),
                rs.getNString("content"),
                rs.getTimestamp("create_time")
        );
    }
    
}
